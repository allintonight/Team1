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
		String paid="y";
		ReservationDBBean rdb = ReservationDBBean.getinstance(); 
		PayDBBean pdb = PayDBBean.getinstance();
		int re = rdb.updateRoom(rsno, paid);
		int pre = pdb.updatePayDate(rsno);
		if(re==1&&pre==1){
	%>
		<script>
			alert("완료");
			location.href="admin_reservation.jsp"
		</script>
	<% 		
		}else{
	%>
		<script>
			alert("다시시도");
			history.back();
		</script>
	<% 	
		}
			
	%>
</body>
</html>