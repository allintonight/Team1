<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>Insert title here</title>
<style>
.reservationNumber{
		position:relative;
		width:50%;
		border:1px solid #ccc;
		border-radius:10px;
		padding:100px;
		margin:0 auto;
		text-align:center;
		margin-top:100px;
		}
		
	a{
		margin-top:10%;
}		
</style>
</head>
<body>
	<%
		ReservationDBBean rdb = ReservationDBBean.getinstance();
		PayDBBean pdb = PayDBBean.getinstance();
		PayBean paybean = new PayBean();
	
		String card = rdb.checkNull(request.getParameter("card"));
		String imp_uid=null;
		int paid_amount=0;
		String apply_num = null;
		String[] sArray = card.split(";");
		 for( int i = 0; i < sArray.length; i++ ){
			    imp_uid = sArray[0];
			    paid_amount = Integer.parseInt(sArray[1]);
			    apply_num = sArray[2]; 
			  } 
		String rsno = rdb.checkNull(request.getParameter("rsno"));
		int irsno = Integer.parseInt(rsno);
		rdb.updateCard(irsno);
		paybean.setRsno(irsno);
		paybean.setPay_method("c");
		paybean.setImp_uid(imp_uid);
		paybean.setPaid_amout(paid_amount);
		paybean.setApply_num(apply_num);
		pdb.pay(paybean);
	%>
	<div><jsp:include page="../main/header.jsp"/></div>
	<div class="main">
<div class="left">
	<jsp:include page="../main/sideMenu.jsp"/>
</div>
<div class="rigth">
	 <div class="reservationNumber">
		예약해 주셔서 감사합니다 !<br>
		고객님의 예약 번호는 <%= rsno %>입니다.<br>
	<a href="searchReservation.jsp" class="btn btn-dark">예약조회</a>
</div> 
</div>	
	</div>
</body>
</html>