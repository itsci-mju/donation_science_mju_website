package util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.Project;
import bean.ProjectDetail;
import bean.ProjectPicture;

/**
 * Servlet implementation class AddProjectServlet
 */
@WebServlet("/AddProjectServlet")
@MultipartConfig
public class AddProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//HttpSession session = request.getSession();
		//String projectID = request.getParameter("projectID");
		String part_length = request.getParameter("part_length");
		int size = Integer.parseInt(part_length);

		String title = request.getParameter("title");
		String detail = request.getParameter("project_detail");
		String start_project = request.getParameter("startDate")+" "+request.getParameter("startTime");
		String end_project = request.getParameter("endDate")+" "+request.getParameter("endTime");
		//Time
		
		Calendar startDate = Calendar.getInstance();
		Calendar endDate = Calendar.getInstance();
		
	    try {
			startDate.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(start_project));
			endDate.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(end_project));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    //AddProject
	    DonationManager dm = new DonationManager();
		
		//Project
		Project p = new Project(1,title);
		p.getProjectPK().setProjectID(dm.newProjectID());
		
		//Detail
		ProjectDetail pd = new ProjectDetail(detail,startDate,endDate);
		pd.getProject_detailPK().setProject_detail_id(dm.newProject_DetailID());
		p.getProject_detail().add(pd);
		pd.getProject_detailPK().setProject(p);
		
		//Picture
		for(int i = 1;i <= size;i++) {
			Part filePart = request.getPart("file"+i);
		    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			pd.getProject_picture().add(new ProjectPicture(fileName,pd));
		}
		
		
		dm.addProject(p);
	    
		/*
		
		ProjectPicture pt = new ProjectPicture();
		pt.setProject_picture(fileName);
		project_detail.getProject_picture().add(pt);
		*/
		
		//Image
		/*
				Part filePart = request.getPart("transferIMG");
			    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			    InputStream fileContent = filePart.getInputStream();
			    String path = request.getSession().getServletContext().getRealPath("/") + "//images//";
			    File file = new File(path + File.separator + fileName);
				FileOutputStream output = new FileOutputStream(file);
				
				byte[] buffer = new byte[fileContent.available()];
				int i = 0,j=0;
				
				while((i = fileContent.read(buffer)) > 0) {
					output.write(buffer);//dowload
					if(i != -1) {
						j += i;
					}
				}
		session.setAttribute("buffer", buffer);
		*/
		//END Image
		/*
		if(projectID != null) {
			session.setAttribute("project", new Project(Integer.parseInt(projectID),title,1,detail));
			session.setAttribute("action", "updateProjectConfirm");
		}else {
			session.setAttribute("project", new Project(title,1,detail));
			session.setAttribute("action", "projectConfirm");
		}*/
		response.sendRedirect("loadListProject");
	}

}
