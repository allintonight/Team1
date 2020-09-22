<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Room.*" %>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		RoomDBBean rdb = RoomDBBean.getinstance();
		String rname = request.getParameter("rname");
		int men = Integer.parseInt(request.getParameter("men"));
		int weekday = Integer.parseInt(request.getParameter("weekday"));
		int weekend = Integer.parseInt(request.getParameter("weekend"));
		int sweekday = Integer.parseInt(request.getParameter("sweekday"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		int re = rdb.updateRoom(rname, men, weekday, weekend, sweekday, rno);
		
		if(re == 1){
%>
		<script>
			alert("수정 성공");
			window.location = "admin_room.jsp"
		</script>
<% 			
			
		}else{
%>
		<script>
			alert("다시 시도 해 주세요.");
			window.location = "admin_room.jsp"
		</script>
<% 		
		}
		
	%>
</body>
</html>