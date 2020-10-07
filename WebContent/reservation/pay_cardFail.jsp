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
		int rsno = Integer.parseInt(request.getParameter("rsno"));
		ReservationDBBean rdb = ReservationDBBean.getinstance();
		int re = rdb.ReservationBean(rsno);
		if(re==1){
	%>
		<script>
			alert("결제 실패! 메인화면으로 돌아갑니다");
			location.href="../index.jsp";
		</script>
	<% 		
		}
	%>

</body>
</html>