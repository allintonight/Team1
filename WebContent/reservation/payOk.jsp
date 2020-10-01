<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>Insert title here</title>
<style>
.reservationNumber{
		position:relative;
		width:50%;
		border:1px solid #ccc;
		border-radius:10px;
		padding:100px;
		margin:0 auto;
		text-align:center;
		margin-top:100px;
		}
		
	a{
		margin-top:10%;
}		
</style>
</head>
<body>
	<%
		String rsno = request.getParameter("rsno");
	%>
	<div><jsp:include page="../main/header.jsp"/></div>
	<div class="main">
<div class="left">
	<jsp:include page="../main/sideMenu.jsp"/>
</div>
<div class="rigth">
	 <div class="reservationNumber">
		예약해 주셔서 감사합니다 !<br>
		고객님의 예약 번호는 <%= rsno %>입니다.<br>
	<a href="searchReservation.jsp" class="btn btn-dark">예약조회</a>
</div> 
</div>	
	</div>
</body>
</html>
