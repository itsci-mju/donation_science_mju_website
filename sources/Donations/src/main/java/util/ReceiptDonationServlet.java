package util;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.Donation;

/**
 * Servlet implementation class ReceiptDonationServlet
 */
@WebServlet("/ReceiptDonationServlet")
@MultipartConfig
public class ReceiptDonationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiptDonationServlet() {
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
		String donationID = (String) request.getParameter("donationID");
		String projectID = (String) request.getParameter("projectID");
		String year = (String) request.getParameter("year");
		String project_detailID = (String) request.getParameter("project_detailID");
		
		Part filePart = request.getPart("receipt");
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	    
		DonationManager dm = new DonationManager();
		Donation donation = dm.getDonation(donationID, projectID, project_detailID, year);
		
		if(dm.receiptDonation(donation, fileName)) {
			response.sendRedirect("loadListDonation");
		}
	}

}
