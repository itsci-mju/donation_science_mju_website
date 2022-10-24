<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*,util.*,java.sql.Blob" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.Format"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String projectID = (String) request.getParameter("projectID");
	String year = (String) request.getParameter("year");
	String project_detailID = (String) request.getParameter("project_detailID");
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
	input[type=text], input[type=password],input[type=email] {
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
<div>
	<h1>แบบฟอร์มแสดงความจำนงร่วมบริจาคทุนการศึกษา คณะวิทยาศาสตร์ มหาวิทยาลัยแม่โจ้</h1>
</div>
<form action="AddDonationServlet" name="frm" method="post" id="frm" enctype="multipart/form-data">
<input type="hidden" name="projectID" value="<%= projectID%>">
<input type="hidden" name="year" value="<%= year%>">
<input type="hidden" name="project_detailID" value="<%= project_detailID%>">
<script type="text/javascript">
	function showIMG(){
		var file = document.getElementById("inputIMG");
		var img = document.getElementById("img");
		var reader = new FileReader();
		reader.onloadend = function() {
		     img.src = reader.result;
		}
		reader.readAsDataURL(file.files[0]);
	}
</script>
<div>
    <table width="100%">
        <tr>
            <td style="padding-left:10%;padding-right:10%;">
            	<div>
            		<img src="img/ex.jpg" id="img" style="width:auto;height:700px">
            	</div>
            	<div>
                    <label>หลักฐานการโอนเงิน</label>
                    <input type="file" name="donationIMG" onChange="showIMG()" id="inputIMG">
                </div>
            </td>
            <td width="70%" style="padding-left:10%;padding-right:5%;">
            	<div>
                    <label>Email</label>
                    <input type="email" name="donator_email" value="kepler142593@gmail.com">
                </div>
                <div>
                    <label>ชื่อ-นามสกุล</label>
                    <input type="text" name="donatorName" value="พุฒิพงศ์">
                </div>
                <div>
                    <label>หมายเลขโทรศัพท์</label>
                    <input type="text" name="donator_mobileNo" value="0958805467">
                </div>
                <div>
                    <label>ออกใบเสร็จในนาม (ชื่อบุคคล/ชื่อบริษัท)</label>
                    <input type="text" name="donation_name" value="พุฒิพงศ์">
                </div>
                <div>
                    <label>เลขที่บัตรประชาชน/เลขที่ผู้เสียภาษี</label>
                    <input type="text" name="taxpayerNo" value="1234567890123">
                </div>
                <div>
                    <label>ที่อยู่ในใบเสร็จ</label>
                    <input type="text" name="donator_address" value="90/1">
                </div>
                <div>
                    <label>ที่อยู่ในการจัดส่งใบเสร็จ</label><br>
                    <input type="radio" checked name="address_donation" value="รับเองที่ สำนักงานคณบดี คณะวิทยาศาสตร์">รับเองที่ สำนักงานคณบดี คณะวิทยาศาสตร์<br>
                    <input type="radio" name="address_donation" value="ส่งไปรษณีย์ตามที่อยู่ในใบเสร็จ">ส่งไปรษณีย์ตามที่อยู่ในใบเสร็จ<br>
                    <input type="radio" name="address_donation" value="other">Other :<input type="text" name="address_other" disabled>
                </div>
                <div>
                    <label>วัตถุประสงค์การโอนเงิน</label><br>
                    <input type="radio" checked name="donation_objective" value="ทุนการศึกษาสำหรับนักศึกษา">ทุนการศึกษาสำหรับนักศึกษา<br>
                    <input type="radio" name="donation_objective" value="ทุนเพื่อทำกิจกรรมของนักศึกษา">ทุนเพื่อทำกิจกรรมของนักศึกษา<br>
                    <input type="radio" name="donation_objective" value="ตามที่คณะวิทยาศาสตร์เห็นสมควร">ตามที่คณะวิทยาศาสตร์เห็นสมควร
                </div>
                <div>
                    <label>จำนวนเงิน</label>
                    <input type="text" name="amount" value="1000">
                </div>
                <div>
                	<input type="checkbox" id="myCheckbox">
                    <label>ไม่เปิดเผยข้อมูลส่วนตัว</label>
                    <input type="hidden" name="show_donation" value="false" id="show_donation">
                    
                    <script type="text/javascript">
                    const checkbox = document.getElementById('myCheckbox');
                    const e = document.getElementById("show_donation");
                    checkbox.addEventListener('change', (event) => {
                      if (event.currentTarget.checked) {
                   	  	  e.value = 'true';
                   	  	
                      } else {
                    	e.value = 'false';
                      }
                    })
                    </script>
                </div>
            </td>
        </tr>
    </table>
</div>
<input type="submit" value="Submit">
</form>
<script type='text/javascript'>
	var frm = document.getElementById("frm");
	frm.addEventListener("click", function() {
		for(var i = 0;i < frm.length;i++){
			if(frm[i].type == "radio" && frm[i].name == "address_donation" && frm[i].value == "other" && frm[i].checked == true){
				frm[i+1].disabled = false;
			}else if(frm[i].type == "radio" && frm[i].name == "address_donation" && frm[i].value == "other" && frm[i].checked == false){
				frm[i+1].disabled = true;
				frm[i+1].value = "";
			}
		}
	});
</script>
</body>
</html>