<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*,util.*,java.sql.Blob" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.Format"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	DonationManager dm = new DonationManager();
try{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<style>
	td,th,p,pre,h1,h2,h3,h4,h5,h6{
        font-size: clamp(16px,2.5vw,22px);
        font-family: 'Kanit', sans-serif;
    }
    a button div text body{
    font-family: 'Kanit', sans-serif;
    }
    .box-td td{
        vertical-align: top;
        padding-top: 16px;
        padding-left: 0.5%;
        padding-bottom: 16px;
    }
    .dbox-td td{
        vertical-align: top;
        padding: 0;
    }
    i{
    	width: 56px;
    	margin-bottom: 12px;
    }
    table{
        width: 100%;
    }
    a:link {
    text-decoration: none;
    color: red;
    }

    a:hover {
    text-decoration: underline;
    color: hotpink;
    }

    a:active {
    text-decoration: underline;
    color: blue;
    }
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
      position: relative;
      min-height: 100vh;
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
</style>
<body>
<hr class="orange">
<%
Login login = new Login();
Donator donator = new Donator();
String welcome = "off";
try{
login = (Login) request.getSession().getAttribute("login");
donator = dm.getDonator(login);
welcome = (String) request.getSession().getAttribute("welcome");
}catch(Exception e){
	
}
%>
<div class="topnav">
  <a href="loadindex">หน้าหลัก</a>
  <a>สนับสนุนโครงการ	</a>
  <%if(login == null){%>
  <a href="loadDonator">เข้าสู่ระบบ</a>
  <%}%>
  <%if(login != null){%>
  <%if(login.getUsertype().equals("donator")){%>
  <%}%>
  <div class="dropdown">
    <button class="dropbtn"><%= donator.getDonatorname() %>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="loadDonatorProfile" style="border-right: 1px solid #d2d0d0;">ข้อมูลส่วนตัว</a>
      <a href="loadDonationDonator" style="border-right: 1px solid #d2d0d0;">ตรวจสอบรายการบริจาค</a>
      <a href="LogoutServlet">ออกจากระบบ</a>
    </div>
  </div>
  <%}%>
</div>
<div class="container">
<%
List<Project> listProject = dm.listProject();
List<ProjectDetail> listDetail = dm.listProjectDetail();
List<ProjectPicture> listPicture = dm.listProjectPicture();
for(Project project: listProject){
	for(ProjectDetail pd : listDetail){
		if(project.getProjectID() == pd.getProjectID()&&
				project.getProjectYear().equals(pd.getProjectYear())){
%>
	<h1 style="color:rgb(255,100,0);"><%= project.getTitle() %></h1>
	<br>
	<%
	int index_picture = 1;
	String letDetail = project.getProjectID()+"_"+project.getProjectYear()+"_"+pd.getProject_DetailID();
	List<ProjectPicture> picture = dm.listPictureJoinProjectDetail(pd,listPicture);
	if(picture.size() > 1){ %>
	<div class="w3-content w3-display-container">
	<%} %>
	<a href="loadProjectDetail?projectID=<%=project.getProjectID()%>&year=<%= String.valueOf(project.getProjectYear())%>&project_detailID=<%= pd.getProject_DetailID()%>">
	<%
	for(ProjectPicture pp : picture){%>
		<img class="mySlides<%=letDetail%>" src="img/<%= pp.getProject_picture()%>" style="width:100%;max-height:500px;height: 500px">
	<%index_picture++;} %>
	</a>
	<%if(picture.size() > 1){ %>
	<button class="w3-button w3-black w3-display-left" onclick="plusDivs<%=letDetail%>(-1)">&#10094;</button>
  	<button class="w3-button w3-black w3-display-right" onclick="plusDivs<%=letDetail%>(1)">&#10095;</button>
  	
	</div>
	
	<script>
		var slideIndex<%=letDetail%> = 1;
		showDivs<%=letDetail%>(slideIndex<%=letDetail%>);
		function plusDivs<%=letDetail%>(n) {
		  showDivs<%=letDetail%>(slideIndex<%=letDetail%> += n);
		}
		
		function showDivs<%=letDetail%>(n) {
		  var i;
		  var x<%=letDetail%> = document.getElementsByClassName("mySlides<%=letDetail%>");
		  if (n > x<%=letDetail%>.length) {slideIndex<%=letDetail%> = 1}
		  if (n < 1) {slideIndex<%=letDetail%> = x.length}
		  for (i = 0; i < x<%=letDetail%>.length; i++) {
		    x<%=letDetail%>[i].style.display = "none";  
		  }
		  x<%=letDetail%>[slideIndex<%=letDetail%>-1].style.display = "block";
		}
	</script>
	<%} %>
	<p><%= pd.getProject_detail()%></p>
<hr>
<%}}} %>
<div style="padding-bottom: 40vh;"></div>
</div>
	<div style="background-color: #313131;width:100%;color: #d9d9d9;position:absolute;bottom: 0;">
        <footer>
            <div>
                <table>
                <tr class="box-td">
                    <td>
                    เกี่ยวกับ<br>
                        <hr style="border: 6px solid orange;margin-top: 0em;margin-bottom: 0em;">
                    </td>
                    <td>ช่องทางติดต่อ<br><hr style="border: 6px solid orange;margin-top: 0em;margin-bottom: 0em;"></td>
                    <td>
                        สอบถาม<br>
                        <hr style="border: 6px solid orange;margin-top: 0em;margin-bottom: 0em;">
                    </td>
                </tr>
                <tr class="dbox-td">
                    <td>
                        <img alt="" src="img/logo_sci.png"><br>
                    </td>
                    <td>
                        <a href="https://goo.gl/maps/KgZHwnB4sP9pc4qb7" target="_blank">
                        <table>
                            <tr class="dbox-td">
                                <td style="padding-left: 0%;padding-right: 0%;">
                                    <i class="fa fa-map-marker" style="font-size:36px;color:ghostwhite;border-radius: 50%;border: 2px solid #525252;
                                    padding: 10px;background-color: #5B5A5A;aspect-ratio : 1 / 1;text-align: center;"></i>
                                </td>
                                <td style="width:100%">
                                    &nbsp;คณะวิทยาศาสตร์ มหาวิทยาลัยแม่โจ้ <br>&nbsp;63 หมู่ 4 ต.หนองหาร อ.สันทราย จ.เชียงใหม่ 50290
                                </td>
                            </tr>
                        </table></a>
						<div>
                        <i class="fa fa-phone" style="font-size:36px;color:ghostwhite;border-radius: 50%;border: 2px solid #525252;
                            padding: 10px;background-color: #5B5A5A;aspect-ratio : 1 / 1;text-align: center;"></i> โทรศัพท์ 053-878802 , 053873803
                        </div>
                        <div>
                        <i class="fa fa-fax" style="font-size:36px;color:ghostwhite;border-radius: 50%;border: 2px solid #525252;
                        padding: 10px;background-color: #5B5A5A;"></i> แฟกซ์ 053-873827
                        </div>
                    </td>
                    <td>
                        <a href="https://www.facebook.com/groups/999648090074595/" target="_blank"><i class="fa fa-facebook" style="font-size:36px;color:ghostwhite;border-radius: 15%;border: 2px solid #525252;
                            padding: 10px;background-color: #5B5A5A;aspect-ratio : 1 / 1;text-align: center;"></i>
                            ศิษย์เก่าคณะวิทยาศาสตร์ มหาวิทยาลัยแม่โจ้</a>
                    </td>
                </tr>
                </table>
            </div>
            <div style="text-align: center;height: 50px;background-color: #414141;padding-top: 16px;">
                Copyright &copy; 2015 <span style="color: #fe9805;">Science Maejo University</span> Alumni Club. All rights reserved
            </div>
        </footer>
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
<p>ยินดีตอนรับเข้าสู่ระบบ</p>
<p>คุณ <%= donator.getDonatorname() %></p>
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
		System.out.print(e);
	}
%>