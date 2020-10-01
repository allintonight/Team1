<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String pay_ment = request.getParameter("pay_ment");
	String pay_name = request.getParameter("pay_name");
	String rname = request.getParameter("rname");
	int rsno = Integer.parseInt(request.getParameter("rsno"));
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	int re = rdb.update(pay_ment, pay_name, rsno, rname);
	
	if(re == 1){
		if(pay_ment.equals("c")){
			response.sendRedirect("pay_card.jsp?rsno="+rsno);
		}else{
			response.sendRedirect("pay_money.jsp");
		}
	}else{
%>
	<script>
		alert("다시시도해 주세요");
		history.back();
	</script>
<% 				
	}
%>
</body>
</html>
