<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String payment = request.getParameter("payment");
	
	if(payment.equals("c")){
		response.sendRedirect("pay_card.jsp");
	}else{
		response.sendRedirect("pay_money.jsp");
	}
%>
</body>
</html>
