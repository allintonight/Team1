<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.reservationNumber{
		position:relative;
		width:40%;
		border:1px solid #ccc;
		border-radius:10px;
		padding:100px;
		margin:0 auto;
		text-align:center;
		margin-top:100px;
	}
</style>
</head>
<body>
	<%
		String rsno = request.getParameter("rsno");
	%>
	<div class="reservationNumber">
		예약해 주셔서 감사합니다 !<br>
		고객님의 예약 번호는 <%= rsno %>입니다.
	</div>
</body>
</html>