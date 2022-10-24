<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*,util.*,java.sql.Blob" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.Format"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
Login login = new Login();
try{
	login = (Login) request.getSession().getAttribute("login");
DonationManager dm = new DonationManager();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Donator donator = dm.getDonator(login); %>
<%= donator.getDonatorname() %>
<%= donator.getTaxpayerno() %>
<%= donator.getDonator_mobileno() %>
<%= donator.getDonator_address() %>
<%= login.getUsername() %>
<%= login.getUpassword() %>
</body>
</html>
<%}catch(Exception e){
	response.sendRedirect("loadindex");
}%>