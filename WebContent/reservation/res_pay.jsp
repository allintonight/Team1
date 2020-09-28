<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file ="../main/header.jsp" %> 
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/reservation_pro.css"/>
<style>
	h2{
		padding-top:50px;
	}
	.main{
		position:relative;	
		background-color:#eaeaea;
		height:1200px;
	}
	.card1, .card2{
		position:relative;
		width:40%;
		height:280px;
		background-color:white;
	}
	.card1{
		padding:20px;
		float:right;
		display:inline-block;
		margin:50px;
	}
	.card2{
		
		display:inline-block;
		margin:50px;
	}
	.card3{
		position:relative;
		width:40%;
		height:350px;
		background-color:white;
		margin:50px;
		padding:20px;
	}
	.card3f{
		color:#a6a6a6;
	}
	#date{
		float:left;
		margin-right:5px;
		padding-top:30px;
		padding-left:60px;
		padding-bottom:30px;
	}
	#date2{
		padding-top:30px;
		padding-left:60px;
		padding-bottom:30px;
	}
	#date::after{
		content:"  ~";
	}
	#date2::after{
		content:")";
	}
	#day::after{
		content:"박(";
	}
	#price{
		position:relative;
		text-align:right;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		ReservationDBBean rdb = ReservationDBBean.getinstance();
		ReservationBean reservationbean = new ReservationBean();
		int rsno = Integer.parseInt(request.getParameter("rsno"));
		ResultSet rs = rdb.price(rsno);
%>
	<div class="main">
	<center><h2>결제하기</h2></center>
	<div class="card1">
		<p>결제 예정 금액</p>
		<hr>
		<%
			if(rs.next()){
		%>
			<div id="date"><span id="day"></span><%= rs.getDate(7) %></div>
			<div id="date2"><%= rs.getDate(8) %></div>
			<hr>
			<p>합계금액 </p>
			<div id="price"><%= rs.getInt(10)+"  원" %></div>
		<%		
			}
		%>
	</div>
	<div class="card2">
	</div>
	<div class="card3">
		<p>결제 수단</p>
		<hr>
		<form method="post" name="fm" action="payment.jsp">
			<p><input type="radio" name="payment" value="c">&nbsp&nbsp카드결제</p>
			<p><input type="radio" name="payment" value="m">&nbsp&nbsp계좌이체</p>
			<p><input type="text" name="pname" placeholder="입금자 명" style="width:350px;"></p>
			<div class="card3f">입금자명 미입력시 주문자 명</div>
			<div class="card3f">2시간 이내 미입금시 자동으로 취소됩니다.</div>
			<p><input type="submit" value="결제하기" class="btn btn-dark res btn-block"></p>
		</form>
	</div>
	</div>

</body>
<script>
	var checkin = document.getElementById("date").innerText;
	var checkout = document.getElementById("date2").innerText;
	
	var scheckin = checkin.split("-");
	var scheckout = checkout.split("-");
	
	var checkin_date = new Date(scheckin[0],Number(scheckin[1])-1,scheckin[2]);
	var checkout_date = new Date(scheckout[0],Number(scheckout[1])-1,scheckout[2]);
	
	var day = (checkout_date.getTime()-checkin_date.getTime())/(1000*60*60*24);
	
	$("#day").html(day);

</script>
</html>