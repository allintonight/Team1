<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="Reservation.*" %>
<%@ page import="java.sql.Date" %>   
<%
	request.setCharacterEncoding("utf-8");	

	ReservationDBBean resdb = ReservationDBBean.getinstance();
	
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	ReservationBean reservationbean = new ReservationBean();
	//빈 사용시 날짜 받을때 오류가 나서 빈 말고 request로 넘겨 주겠습니다 !
	
	int irsno = Integer.parseInt(request.getParameter("rsno"));	
	reservationbean.setRsno(irsno);
	Integer mno = Integer.parseInt(request.getParameter("mno"));
	reservationbean.setMno(mno);
	int rno = Integer.parseInt(request.getParameter("rno"));
	reservationbean.setRno(rno);
	String rname = request.getParameter("rname");
	reservationbean.setRname(rname);
	String remail = request.getParameter("remail");
	reservationbean.setRemail(remail);
	String rphone = request.getParameter("rphone");
	reservationbean.setRphone(rphone);
	Date check_in = Date.valueOf(request.getParameter("check_in"));
	reservationbean.setCheck_in(check_in);
	Date check_out = Date.valueOf(request.getParameter("check_out"));
	reservationbean.setCheck_out(check_out);
	int usemen = Integer.parseInt(request.getParameter("usemen"));
	reservationbean.setUsemen(usemen);
	int price = Integer.parseInt(request.getParameter("price"));
	reservationbean.setPrice(price);
	reservationbean.setPaid("N");
%>
	<div id="rsno"><%= irsno %></div>//나중에 안보이도록 처리 하겠습니다 
<% 	
	
	int result = resdb.check(reservationbean);
		if(result == -1){
%>
		<script>
			alert("다른날짜를 검색해 주세요");
			history.back();
		</script>
<%			
		}else{
			int re = resdb.addReservation(reservationbean);
			if(re==1){
%>			
		<script>
			var rsno = document.getElementById("rsno").innerText;
			var con = confirm("예약가능!　예약하시겠습니까?");
			if(con == true){
				location.href="res_pay.jsp?rsno="+rsno
			}else{
				alert("다시시도 해 주세요");
				history.back();
			}
		</script>			
<%			
			}
		}
%>
