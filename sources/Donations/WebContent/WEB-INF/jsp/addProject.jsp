<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*,util.*" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.Format"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd",new Locale("th", "TH"));
	SimpleDateFormat t = new SimpleDateFormat("HH:mm",new Locale("th", "TH"));
	//Project project = (Project) session.getAttribute("project");
	Date date = new Date();
	String title = "";
	String detail = "";
	String startDate = d.format(date);
	String startTime = "00:00";
	String endDate = d.format(date);
	String endTime = "23:59";
	/*
	if(project != null){
		title = project.getTitle();
		detail = project.getDetail();
		startDate = d.format(project.getStartDate());
		startTime = t.format(project.getStartDate());
		endDate = d.format(project.getEndDate());
		endTime = t.format(project.getEndDate());
	}*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap" rel="stylesheet">
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
<form action="AddProjectServlet" name="frm" method="post" id="frm" enctype="multipart/form-data">
<div class="container">
	<div>ชื่อโครงการ<br>
	<input type="text" name="title">
	</div>
		<div id="listIMG" class="w3-content w3-display-container">
			<img class="mySlides" style="width:100%;max-height:500px;height: 500px">
			<img class="mySlides" style="width:100%;max-height:500px;height: 500px">
			<button type="button" class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  			<button type="button" class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
		</div>
		<script>
			var slideIndex = 1;
			showDivs(slideIndex);
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
		<div>รูปภาพประกอบ<br>
			<input type="hidden" name="part_length" value="0">
			<input type="file" name="file1" accept="image/png, image/jpeg" onChange="addPicture(this.id)" id="file1"><br>
			<input type="file" name="file2" accept="image/png, image/jpeg" onChange="addPicture(this.id)" id="file2"><br>
			<div id="container"></div>
		</div>
	<div>รายละเอียดโครงการ
	<textarea oninput="auto_grow(this)" name="project_detail" style="font-size: clamp(16px,2.5vw,22px);font-family: 'Kanit', sans-serif;width:100%;resize: none;overflow: hidden;"></textarea>
		<script type="text/javascript">
		function auto_grow(element) {
		    element.style.height = "5px";
		    element.style.height = (element.scrollHeight)+"px";
		    this.pos = 0;
		    this.element = element;
		}
		</script>
	</div>
	<div>
	Start Date : <input type="date" name="startDate" value="<%= startDate%>"><input type="time" name="startTime" value="<%=startTime%>"><br>
	End Date &nbsp;: <input type="date" name="endDate" value="<%= endDate%>"><input type="time" name="endTime" value="<%=endTime%>"><br>
	</div>
	<div>
		<input type="submit" value="ยืนยัน">
		<input type="button" value="ยกเลิก">
	</div>
</div>
</form>
<div id="log"></div>
<script type='text/javascript'>
	var container = document.getElementById("container");
	var file = document.getElementById("file");
	var list = document.getElementById("listIMG");
	
	function addPicture(evt) {
		var frm = document.getElementById("frm");
		var e = true;
		var n = 0,sum = 0;
		for(var i = 0;i < frm.length;i++){
			if(frm[i].type == "file"){
				n++;
				if(frm[i].value ==""){
					e = false;
					break;
				}else{
					
					sum++;
					frm.part_length.value = sum;
				}
			}
		}
		
		//Show Image
		var reader = new FileReader();
		var img;
		if(evt.substring(4) > list.childElementCount - 2){
			img = document.createElement("img");
			img.className = "mySlides";
			img.style = "width:100%;max-height:500px;height: 500px";
		    list.appendChild(img);
		}else{
			img = list.children[evt.substring(4) - 1];
		}
		reader.onloadend = function() {
			img.src = reader.result;
		}
		try{
			reader.readAsDataURL(document.getElementById(evt).files[0]);
		}
		catch(err){
			img.src = "";
		}
		
		if(e){
			//Add File
	        var input = document.createElement("input");
	        input.type = "file";
	        input.name = "file"+(n+1);
	        input.id = "file"+(n+1);
	        input.accept = "image/png, image/jpeg";
	        input.addEventListener('change', function () { addPicture("file"+(n+1)); },false);
	        container.appendChild(input);
	        container.appendChild(document.createElement("br"));
		}
	}
	(function () {
	    var old = console.log;
	    var logger = document.getElementById('log');
	    console.log = function (message) {
	        if (typeof message == 'object') {
	            logger.innerHTML += (JSON && JSON.stringify ? JSON.stringify(message) : message) + '<br />';
	        } else {
	            logger.innerHTML += message + '<br />';
	        }
	    }
	})();
</script>
</body>
</html>