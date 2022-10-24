<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*,util.*,java.sql.Blob" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.Format"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	DonationManager dm = new DonationManager();
	try{
		Login login = (Login) session.getAttribute("login");
		
		if(!dm.isFinancial_Officer(login.getUsername(), login.getUpassword())&&!dm.isAdmin(login.getUsername(), login.getUpassword())){
			response.sendRedirect("loadOfficer");
		}
	}catch(Exception e){
		
	}
	
	String projectID = (String) request.getParameter("projectID");
	String year = (String) request.getParameter("year");
	String project_detailID = (String) request.getParameter("project_detailID");
	try{
		if(projectID != null&&
				year != null&&
				project_detailID != null){
			session.setAttribute("projectID", projectID);
			session.setAttribute("year", year);
			session.setAttribute("project_detailID", project_detailID);
		}else{
			projectID = (String) session.getAttribute("projectID");
			year = (String) session.getAttribute("year");
			project_detailID = (String) session.getAttribute("project_detailID");
		}
	}catch(Exception e){
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
	
	@media (min-width: 1200px)
	.container {
	    width: 1170px;
	}

	@media (min-width: 992px)
	.container {
	    width: 970px;
	}
	@media (min-width: 768px)
	.container {
	    width: 750px;
	}
	
	.container {
	    padding-right: 15px;
	    padding-left: 15px;
	    margin-right: 15% ;
	    margin-left: 15%;
	}
	img{
		object-fit: fill;
	}
	.mySlides {display:none}
	.w3-left, .w3-right, .w3-badge {cursor:pointer}
	.w3-badge {height:13px;width:13px;padding:0}

	body{
	  margin: 0;
	  padding: 0;
	}
	.sidebar-navigation{
	border-bottom: 1px solid #bcbcbc;
    box-shadow: 0 2px 2px rgb(0 0 0 / 18%);
    z-index: 9999;
    position: relative;
	}
	.sidebar-navigation nav{
	}
	.sidebar-navigation ul {
	  width: 100%;
	  list-style-type: none;
	  margin: 0;
	  padding: 0;
	  overflow: hidden;
	  background-color: #ebebeb;
	  overflow-y: auto;
	 }
	 .sidebar-navigation li{
	  display: inline;
	  float: left;
	 }
	 .sidebar-navigation li a ,p{
	  font-size: 20px;
	  display: block;
	  color: black;
	  padding: 15px 16px;
	  text-decoration: none;
	  margin: 0;
	 }
	
	 .sidebar-navigation li a:hover {
	  /*background-color: #219f5f;*/
	  color: orange;
	 }
	.zoom-200{
		zoom : 200%;
	}
	#page-center {
	    position:absolute;
	    text-align:center;
	    top:50%;
	    width:100%;
	    margin-top:-20px;
	}
	pre.ex1 {
	  max-height: 60px;
	  overflow: auto;
	}
	p.ex1 {
	  max-height: 60px;
	  overflow: auto;
	}
	hr.orange{
	  border: 6px solid orange;
	  margin-top: 0em;
   	  margin-bottom: 0em;
	}
	.sidebar-navigation a{
		font-family: "Times New Roman", Times, serif;
	}
	.center{
		display: flex;
  		align-items: center;
  		border: 6px solid orange;
	}
	input[type=submit] {
	  background-color: grey;
	  color: white;
	  padding: 14px 20px;
	  margin: 8px 0;
	  border: none;
	  cursor: pointer;
	  width: 40%;
	}
	input[type=text], input[type=password] {
	  width: 100%;
	  padding: 12px 20px;
	  margin: 8px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  box-sizing: border-box;
	}
	form{
		width: 100%;
	}
</style>
<body>
<hr class="orange">
<%
Login login = new Login();
try{
	login = (Login) request.getSession().getAttribute("login");
}catch(Exception e){
	
}
%>
<div id="navbar" class="sidebar-navigation">
	<nav>
		<ul>
			<li style="border-right: 1px solid #d2d0d0;">
				<a href="loadListProject">หน้าหลัก</a>
			</li>
			<li style="border-right: 1px solid #d2d0d0;">
				<a>สนับสนุนโครงการ	</a>
			</li>
			<%if(login == null){%>
			<li>
				<a href="loadDonator">เข้าสู่ระบบ</a>
			</li>
			<%}%>
			<%if(login != null){%>
			<li>
				<a href="LogoutServlet">ออกจากระบบ</a>
			</li>
			<%}%>
		</ul>
	</nav>
</div>
<table>
        <tr>
            <th>หลักฐานการโอน</th>
            <th>จำนวนเงิน</th>
            <th>ชื่อ</th>
            <th>เบอร์โทรติดต่อ</th>
            <th>email</th>
            <th>สถานะ</th>
            <th>Upload File</th>
        </tr>
        <%
        List<Donation> listDonation= dm.listDonation(projectID,year,project_detailID);
        List<Donator> listDonator = dm.listDonator();
        List<Receipt> listReceipt = dm.listReceipt();
        for(Donation donation: listDonation){
        	for(Donator donator : listDonator){
        		if(donation.getTaxpayerno().equals(donator.getTaxpayerno())){
        %>
        <tr>
			<th><%= donation.getDonationIMG()%></th>
            <th><%= donation.getAmount()%></th>
            <th><%= donator.getDonatorname()%></th>
            <th><%= donator.getDonator_mobileno()%></th>
            <th><%= donator.getDonator_email()%></th>
            <th><a href="loadDonationDetail?donationID=<%= donation.getDonationID()%>&projectID=<%= donation.getProjectID()%>&year=<%= donation.getProjectID_Year()%>&project_detailID=<%= donation.getProjectDetailID()%>&taxpayerno=<%= donation.getDonator().getTaxpayerno()%>"><%= donation.getStatus_donation()%></a></th>
        	<th>
	        	<a href="loadReceipt?donationID=<%= donation.getDonationID()%>&projectID=<%= donation.getProjectID()%>&year=<%= donation.getProjectID_Year()%>&project_detailID=<%= donation.getProjectDetailID()%>&taxpayerno=<%= donation.getDonator().getTaxpayerno()%>">
	        		<% if(dm.isReceipt(donation,listReceipt)){%>ส่งสำเนาใบเสร็จรับเงินแล้ว<% }else{%>อัพโหลดไฟล์สำเนาใบเสร็จรับเงิน<% }%>
	        	</a>
        	</th>
        </tr>
        <%}}} %>
        <tr>
        	<th colspan="5">
        		รวมเป็นเงิน
        	</th>
        	<th>
        		<% 
	        		double sum = 0;
        			for(Donation list : listDonation){
        				sum += list.getAmount();
        			}
	        	%>
        		<%= sum%>
        	</th>
        </tr>
</table>
</body>
</html>