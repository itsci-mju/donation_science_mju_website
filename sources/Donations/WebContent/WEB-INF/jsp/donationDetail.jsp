<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*,util.*,java.sql.Blob" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.Format"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String donationID = (String) request.getParameter("donationID");
	String projectID = (String) request.getParameter("projectID");
	String year = (String) request.getParameter("year");
	String project_detailID = (String) request.getParameter("project_detailID");
	String taxpayerno = (String) request.getParameter("taxpayerno");
	DonationManager dm = new DonationManager();
	Donation donation = new Donation();
	Donator donator = new Donator();
	try{
		donation = dm.getDonation(donationID, projectID, project_detailID, year);
		donator = dm.getDonator(taxpayerno);
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
	td div{
		padding-left:3%
	}
</style>
<body style="font-size: 24px;">
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
				<a href="loadindex">หน้าหลัก</a>
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
			<%if(login.getUsertype().equals("donator")){%>
			<li>
				<a href="loadDonationDonator" style="border-right: 1px solid #d2d0d0;">ตรวจสอบรายการบริจาค</a>
			</li>
			<%}%>
			<li>
				<a href="LogoutServlet">ออกจากระบบ</a>
			</li>
			<%}%>
		</ul>
	</nav>
</div>
<table border="1" width="100%">
	<tr>
		<td>
			<div style="margin-left:40%">หลักฐานการโอน</div>
			<hr>
			<div>
				<img src="img/<%= donation.getDonationIMG()%>" style="width:100%;max-height:500px;height: 500px">
			</div>
			<div>จำนวนเงิน : <%= donation.getAmount()%></div>
			<div>เลขที่บัตรประชาชน/เลขที่ผู้เสียภาษี : <%= donator.getTaxpayerno()%></div>
			<div>ออกใบเสร็จในนาม : <%= donation.getDonation_name()%></div>
			<div>วัตถุประสงค์การโอนเงิน : <%= donation.getObjective()%></div>
			<div>ที่อยู่ในการจัดส่งใบเสร็จ : <%= donation.getAddress_donation()%></div>
		</td>
		<td>
			<div>ชื่อ-นามสกุล : <%= donator.getDonatorname()%></div>
			<div>เบอร์โทรติดต่อ : <%= donator.getDonator_mobileno()%></div>
			<div>Email : <%= donator.getDonator_email()%></div>
			<div>ที่อยู่ : <%= donator.getDonator_address()%></div>
		</td>
	</tr>
	<tr>
		<td></td>
		<td style ="float: right;margin-right:20%;">
			<a href="AcceptDoantionServlet?donationID=<%= donationID%>&projectID=<%= projectID%>&year=<%= year%>&project_detailID=<%= project_detailID%>" onclick="return confirm('กรุณากดอีกครั้งเพื่อยืนยันข้อมูล ? ');"><button>ยอมรับข้อมูล</button></a>
			<a href="RejectDonationServlet?donationID=<%= donationID%>&projectID=<%= projectID%>&year=<%= year%>&project_detailID=<%= project_detailID%>" onclick="return confirm('กรุณากดอีกครั้งเพื่อการยืนยัน ? ');"><button>ปฏิเสธข้อมูล</button></a>
		</td>
	</tr>
</table>
</body>
</html>