<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Room.*"%>
<%
	int rno = Integer.parseInt(request.getParameter("rno"));
	RoomDBBean rdb = RoomDBBean.getinstance();
	int re = rdb.deleteRoom(rno);
	if(re == 1){
%>
	<script>
		alert("삭제 성공")
		window.location = "admin_room.jsp"
	</script>
<%		
	}else{
%>		
	<script>
		alert("다시 시도해 주세요")
		window.location = "admin_room.jsp"
	</script>
<%	
	}
%>		