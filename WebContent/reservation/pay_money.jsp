<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div><jsp:include page="../main/header.jsp"/></div>
<div class="left">
	<jsp:include page="../main/sideMenu.jsp"/>
</div>
	<%
		String rsno = request.getParameter("rsno");
	%>
	<div class="reservationNumber">
		24시간 이내로 입금 부탁드립니다!
		미 입금시 자동 취소됩니다.
	</div>
<div class="left">
	<jsp:include page="../main/footer.jsp"/>
</div>	
</body>