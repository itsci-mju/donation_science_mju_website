package util;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.Donation;
import bean.Donator;
import bean.Login;

/**
 * Servlet implementation class AddDonationServlet
 */
@WebServlet("/AddDonationServlet")
@MultipartConfig
public class AddDonationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDonationServlet() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String projectID = (String) request.getParameter("projectID");
		String year = (String) request.getParameter("year");
		String project_detailID = (String) request.getParameter("project_detailID");
		
		String taxpayerNo = request.getParameter("taxpayerNo");
		String donatorName = request.getParameter("donatorName");
		String donator_mobileNo = request.getParameter("donator_mobileNo");
		String donator_email = request.getParameter("donator_email");
		String donator_address = request.getParameter("donator_address");
		
		String objective = request.getParameter("donation_objective");
		int amount = Integer.parseInt(request.getParameter("amount"));
		Part filePart = request.getPart("donationIMG");
	    String donationIMG = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		String donation_name = request.getParameter("donation_name");
		String address_donation = request.getParameter("address_donation");
		if(address_donation.equals("other")) {
			address_donation = request.getParameter("address_other");
		}
		String show_donation = request.getParameter("show_donation");
		
		DonationManager dm = new DonationManager();
		//รอตรวจสอบ Attribute
		Donation d = new Donation(objective, amount, donationIMG, donation_name,address_donation, "รอการตรวจสอบ",Boolean.parseBoolean(show_donation), Calendar.getInstance());
		d.getDonationPK().setDonationid(dm.newDonationID());
		d.getDonationPK().setProject_detail(dm.getProjectDetail(project_detailID, projectID, year));
		
		Donator dt = dm.getDonator(taxpayerNo);
		if(dt.getTaxpayerno().equals("")) {
			dt = new Donator(taxpayerNo, donatorName, donator_mobileNo, donator_email,donator_address);
		}
		d.setDonator(dt);
		
		//Login
		Login login = null;
		login = (Login) request.getSession().getAttribute("login");
		String key = dm.Key_Random();
		
		if(!donator_email.equals("")&&
				login == null||dm.isDonatorEmail(donator_email)) {
			login = new Login(donator_email,key,"donator");
			request.setAttribute("login", login);
		}
		if(login != null) {
			dt.setLogin(login);
		}else {
		}

		dm.addDonation(d);
		
		response.sendRedirect("loadindex");
	}

}
