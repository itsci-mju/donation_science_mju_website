package util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Donation;

/**
 * Servlet implementation class AcceptDoantionServlet
 */
@WebServlet("/AcceptDoantionServlet")
public class AcceptDoantionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptDoantionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String donationID = (String) request.getParameter("donationID");
		String projectID = (String) request.getParameter("projectID");
		String year = (String) request.getParameter("year");
		String project_detailID = (String) request.getParameter("project_detailID");
		
		DonationManager dm = new DonationManager();
		Donation donation = dm.getDonation(donationID, projectID, project_detailID, year);
		if(dm.acceptDonation(donation)) {
			response.sendRedirect("loadListDonation");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
