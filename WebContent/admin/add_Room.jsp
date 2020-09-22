<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Room.*" %>
  
<%
	request.setCharacterEncoding("utf-8");
	RoomDBBean rdb = RoomDBBean.getinstance();
	RoomBean roombean = new RoomBean();
	roombean.setRno(Integer.parseInt(request.getParameter("rno")));
	roombean.setRname(request.getParameter("rname"));
	roombean.setMen(Integer.parseInt(request.getParameter("men")));
	roombean.setWeekday(Integer.parseInt(request.getParameter("weekday")));
	roombean.setWeekend(Integer.parseInt(request.getParameter("weekend")));
	roombean.setSweekday(Integer.parseInt(request.getParameter("sweekday")));
	
	int re = rdb.addRoom(roombean);
	
	if(re==1){
%>
	<script>
		alert("추가 성공")
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