<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="Reservation.*" %>
<%@ page import="java.sql.Date" %>   
<%
	String scheckin = request.getParameter("check_in");
	Date checkin = Date.valueOf(scheckin);
	
	String srno = request.getParameter("rno");
	int rno = Integer.parseInt(srno);
	
	ReservationDBBean resdb = ReservationDBBean.getinstance();
	int result = resdb.check(rno,checkin);
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
