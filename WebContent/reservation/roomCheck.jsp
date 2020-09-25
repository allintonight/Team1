<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="Reservation.*" %>
<%@ page import="java.sql.Date" %>   
<%
	String scheckin = request.getParameter("checkin");
	Date checkin = Date.valueOf(scheckin);
	
	String scheckout = request.getParameter("checkout");
	Date checkout = Date.valueOf(scheckout);
	
	ReservationDBBean resdb = ReservationDBBean.getinstance();
	int result = resdb.check(checkin, checkout);
		if(result == 1){
%>
		<script>
			alert("다른날짜를 검색해 주세요");
			history.back();
		</script>
<%			
		}else{
%>			
		<script>
			alert("예약가능!");
			history.back();
		</script>			
<%			
		}
%>