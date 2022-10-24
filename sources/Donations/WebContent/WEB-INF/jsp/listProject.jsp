<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="bean.*,util.*,java.sql.Blob" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.Format"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	DonationManager dm = new DonationManager();
	try{
		String username = "";
		Login login = (Login) session.getAttribute("login");
		String welcome = (String) session.getAttribute("welcome");
		if(!dm.isFinancial_Officer(login.getUsername(), login.getUpassword())&&!dm.isAdmin(login.getUsername(), login.getUpassword())){
			response.sendRedirect("loadOfficer");
		}else if(dm.isFinancial_Officer(login.getUsername(), login.getUpassword())){
			username = dm.getFinancial_Officer(login).getFinancial_officername();
		}else if(dm.isAdmin(login.getUsername(), login.getUpassword())){
			username = dm.getAdmin(login).getAdmin_name();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
	
	#welcome{
	  font-weight: bold;
	  position: relative;
	  animation: welcomShow 1.5s;
	  animation-timing-function: ease;
	  color: black;
	  font-size: 1.5vw;
	}
	
	@keyframes welcomShow {
	  0%{
	  color: rgba(255, 200, 200, 0);
	  background-color: rgba(255, 200, 200, 0.5);
	  padding-top: 30px;
	  width: 20%;
	  height: 20%;
	  bottom: 50%;
	  left: 40%;
	  }
	
	  100% {
	  color: black;
	  background-color: rgba(255, 200, 200);
	  padding-top: 30px;
	  width: 30%;
	  height: 20%;
	  bottom: 50%;
	  left: 35%;
	  }
	}
	
	#search {/*
	  font-size: 18px;
	  padding: 5px;
	  height: 35px;
	  width: 350px;
	  border: 1px solid blue;
	  outline: none;
	  border-radius: 5px;
	  color: blue;
	   border-bottom: none;*/
	}
	
	#browsers {
	  position: absolute;
	  background-color: white;
	  border: 1px solid blue;
	  border-radius: 0 0 5px 5px;
	  border-top: none;
	  font-family: sans-serif;
	  padding: 5px;
	  max-height: 10rem;
	  overflow-y: auto;
	}
	
	option {
	  background-color: white;
	  padding: 4px;
	  color: blue;
	  margin-bottom: 1px;
	  font-size: 18px;
	  cursor: pointer;
	}
	
	option:hover, .active{
	  background-color: lightblue;
	}
	div .shelf{
        float: left;
        background-color: whitesmoke;
        width: 45.8%;
    }
</style>
<body>
<hr class="orange">
<div id="navbar" class="sidebar-navigation">
	<nav>
		<ul>
			<li style="border-right: 1px solid #d2d0d0;">
				<a href="loadListProject">หน้าหลัก</a>
			</li>
			<li style="border-right: 1px solid #d2d0d0;">
				<a>สนับสนุนโครงการ	</a>
			</li>
			<%if(login != null){%>
			<%if(login.getUsertype().equals("admin")){ %>
			<li>
				<a href="loadAddProject" style="border-right: 1px solid #d2d0d0;">เพิ่มโครงการ</a>
			</li>
			<%}%>
			<li>
				<a href="LogoutServlet">ออกจากระบบ</a>
			</li>
			<%}%>
		</ul>
	</nav>
</div>
<div style="width: 50%;float:right;margin-right: 3%;right:3%;"><label>ค้นหา : </label><br>
<input autocomplete="off" role="combobox" list="" id="search" name="search" placeholder="Select your fav browser" type="text" style="width: 90%;"/>
<datalist id="browsers" role="listbox" style="width: 45%;">
<%
List<Project> project = dm.listProject();
List<ProjectDetail> detail = dm.listProjectDetail();
for(int i = 0;i < project.size();i++ ){ 
	for(ProjectDetail pd : detail){
		if(project.get(i).getProjectID() == pd.getProjectID()&&
				project.get(i).getProjectYear().equals(pd.getProjectYear())){ %>
  <option value="<%= pd.getIDtoString()%>"><%= project.get(i).getTitle()%></option>
<%}}} %>
</datalist>
</div>
<script>
search.onfocus = function () {
  browsers.style.display = 'block';
  search.style.borderRadius = "5px 5px 0 0";  
};

for (let option of browsers.options) {
  option.onclick = function () {
    search.value = option.innerText;
    browsers.style.display = 'none';
    search.style.borderRadius = "5px";
  }
};
search.onblur = function() {
  setTimeout(function() {
    browsers.style.display = 'none';
    removeActive(browsers.options);
  }, 100);
};

search.oninput = function() {
  browsers.style.display = 'block';
  if(currentFocus != -1){
    removeActive(browsers.options);
  }
  currentFocus = -1;
  var text = search.value.toUpperCase();
  for (let option of browsers.options) {
    if(option.innerText.toUpperCase().replace(/ /g, "").trim().indexOf(text.toUpperCase().replace(/ /g, "").trim()) > -1){
      document.getElementById(option.value).style.display = "block";
      option.style.display = "block";
  }else{
	document.getElementById(option.value).style.display = "none";
    option.style.display = "none";
    }
  };
}
var currentFocus = -1;
search.onkeydown = function(e) {
  if(e.keyCode == 40){
    addActive(browsers.options,40);
  }
  else if(e.keyCode == 38){
   addActive(browsers.options,38);
  }
  else if(e.keyCode == 13){
    e.preventDefault();
        if (currentFocus > -1) {
          if (browsers.options) {browsers.options[currentFocus].click();search.blur();}
        }
  }
}

function addActive(x,code) {
    if (!x) return false;
    removeActive(x);
    if(code == 40){
      currentFocus++;
    }else if(code == 38){
      currentFocus--;
    }
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    if (x[currentFocus].style.display === 'none') {
      addActive(x,code);
    }
    x[currentFocus].classList.add("active");
  }
  function removeActive(x) {
    for (let i = 0; i < x.length; i++) {
      x[i].classList.remove("active");
    }
  }
</script>
<div style="margin-top: 100px;margin-left: 5%;">
<%
List<ProjectPicture> listPicture = dm.listProjectPicture();
for(int i = 0;i < project.size();i++ ){ 
	for(ProjectDetail pd : detail){
		if(project.get(i).getProjectID() == pd.getProjectID()&&
				project.get(i).getProjectYear().equals(pd.getProjectYear())){
%>
	<div class="shelf" id="<%= pd.getIDtoString()%>">
		<div><%= project.get(i).getTitle()%></div>
		<div>
		<%
		List<ProjectPicture> picture = dm.listPictureJoinProjectDetail(pd,listPicture);
		for(ProjectPicture pp : picture){%>
			<img src="img/<%= pp.getProject_picture()%>" width="100%">
		<%break;} %>
		</div>
		<div>
			<%if(login.getUsertype().equals("admin")){ %>
			<a href="DeleteProjectServlet?projectID=<%=pd.getProjectID()%>&year=<%= String.valueOf(pd.getProjectYear())%>&project_detailID=<%= pd.getProject_DetailID()%>" onclick="return confirm('แน่ใจหรือว่าต้องการลบข้อมูลนี้ ? ');"><button>ลบ	</button></a>
			<button>แก้ไข</button>
			<%} %>
			<a href="loadListDonation?projectID=<%=pd.getProjectID()%>&year=<%= String.valueOf(pd.getProjectYear())%>&project_detailID=<%= pd.getProject_DetailID()%>"><button>รายการบริจาค	</button></a>
		</div>
	</div>
<% }}}%>
</div>
<%
if(login != null && welcome!= null && welcome.equals("on")){ 
//String welcome = (String) request.getAttribute("welcome");
%>
<div style="position: fixed;
  border: 5px solid orangered;
  box-shadow: 10px 10px 5px #d3a997;
  background-color: rgba(255, 200, 200);  
  padding-top: 30px;
  width: 30%;
  height: 20%;
  bottom: 50%;
  left: 35%;
  text-align: center;" id="welcome">
<p>ยินดีตอนรับคุณ <%= username %></p>
<p>เข้าสู่ระบบ</p>
<a id="offWelcome"><i class="fa fa-close" style="position: absolute;top:3px;right: 6px;"></i></a>
</div>
<script type="text/javascript">
	var offWelcome = document.getElementById("offWelcome");
	offWelcome.addEventListener('click', function() {
		document.getElementById("welcome").style.display = "none";
	});
</script>
<%} %>
</body>
</html>
<%
	}catch(Exception e){
		response.sendRedirect("loadindex");
	}
%>