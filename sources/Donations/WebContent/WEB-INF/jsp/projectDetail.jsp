<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="bean.*,util.*,java.sql.Blob" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.Format"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%  String projectID = (String) request.getParameter("projectID");
	String year = (String) request.getParameter("year");
	String project_detailID = (String) request.getParameter("project_detailID");
	DonationManager dm = new DonationManager();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
	
	.mySlides {display:none}
	.w3-left, .w3-right, .w3-badge {cursor:pointer}
	.w3-badge {height:13px;width:13px;padding:0}
</style>
<script>
		var slideIndex = 1;
		
		function plusDivs(n) {
		  showDivs(slideIndex += n);
		}
		
		function showDivs(n) {
		  var i;
		  var x = document.getElementsByClassName("mySlides");
		  if (n > x.length) {slideIndex = 1}
		  if (n < 1) {slideIndex = x.length}
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";  
		  }
		  x[slideIndex-1].style.display = "block";  
		}
</script>
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
			<li>
				<a href="LogoutServlet">ออกจากระบบ</a>
			</li>
			<%}%>
		</ul>
	</nav>
</div>
<div>
<% 	Project project = dm.getProject(projectID,year);
	ProjectDetail pd = dm.getProjectDetail(project_detailID, projectID, year);
%>
	<div>
		<h1 style="color:rgb(255,100,0);">
			<%= project.getTitle()%> ครั้งที่ <%= project.getTime()%> ประจำปีการศึกษา <%= project.getProjectPK().getYear()%>
		</h1>
	</div>
	<%if(dm.listProjectPicture(pd).size() > 1){ %>
		<div class="w3-content w3-display-container">
		<%} %>
		<a href="loadProjectDetail?projectID=<%=project.getProjectID()%>&year=<%= String.valueOf(project.getProjectYear())%>&project_detailID=<%= pd.getProject_DetailID()%>">
		<% int index_picture = 1;
		List<ProjectPicture> picture = dm.listProjectPicture(project_detailID,projectID,year);
		for(ProjectPicture pt : picture){%>
			<img class="mySlides" src="img/<%= pt.getProject_picture()%>" style="width:100%;max-height:500px;height: 500px">
		<%index_picture++;} %>
		</a>
		<%if(dm.listProjectPicture(pd).size() > 1){ %>
		<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
	  	<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
		</div>
	<%} %>
	<% ProjectDetail detail = dm.getProjectDetail(project_detailID,projectID,year);%>
	<div><%= detail.getProject_detail()%><br>
	ตรวจสอบรายชื่อการบริจาค <a href="loadListDonator?projectID=<%= projectID%>&year=<%= year%>&project_detailID=<%= project_detailID%>">คลิกที่นี่</a>
	</div>
	<hr>
	<h1>ร่วมบริจาคได้ที่</h1>
	<img alt="" src="img/BBankMJU.png">
	<a href="loadDonation?projectID=<%= projectID%>&year=<%= year%>&project_detailID=<%= project_detailID%>"><button>ส่งหลักฐานการโอนเงิน</button></a>
</div>
<footer style="background-color: #5B5A5A;">
<table class="container">
<tr>
	<td>
		<img alt="" src="img/logo_sci.png">
	</td>
	<td>
		คณะวิทยาศาสตร์ มหาวิทยาลัยแม่โจ้ 63 หมู่ 4 ต.หนองหาร อ.สันทราย จ.เชียงใหม่ 50290<br>
		โทรศัพท์ 053-878802 , 053873803 แฟกซ์ 053-873827<br>
		Copyright © 2015 Science Maejo University Alumni Club. All rights reserved
	</td>
</tr>
</table>
</footer>
<script>
showDivs(slideIndex);
</script>
</body>
</html>