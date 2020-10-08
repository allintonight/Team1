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
		margin:5%;
	}
	.card3{
		position:relative;
		width:40%;
		height:350px;
		background-color:white;
		margin:5%;
		padding:20px;
	}
	.card3f{
		color:#a6a6a6;
	}
	#date{
		position:relative;
		float:left;
		margin-right:5px;
		padding-top:30px;
		padding-left:60px;
		padding-bottom:30px;
	}
	#date2{
		position:relative;
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
		reservationbean = rdb.price(rsno);
		int price = reservationbean.getPrice();
%>
	<div class="main">
	<center><h2>결제하기</h2></center>
	<div class="card1">
		<p>결제 예정 금액</p>
		<hr>
		<%
			String rname = null;
			rname = reservationbean.getRname();
		%>
			<div id="date"><span id="day"></span><%= reservationbean.getCheck_in() %></div>
			<div id="date2"><%= reservationbean.getCheck_out() %></div>
			<hr>
			<p>합계금액 </p>
			<div id="price"><%= reservationbean.getPrice()+"  원" %></div>
		<%		
			
		%>
	</div>
	<div class="card2">
	</div>
	<div class="card3" id="card3">
		<p>결제 수단</p>
		<hr>
		<form method="post" name="fm" action="payment.jsp?rsno=<%= rsno %>&price=<%= price %>">
			<p><input type="radio" name="pay_ment" value="c" id="c" onchange="setDisplay()">&nbsp&nbsp카드결제</p>
			<p><input type="radio" name="pay_ment" value="m" id="m" onchange="setDisplay()">&nbsp&nbsp계좌이체</p>
			<div class="paycash" id="paycash">
			<p><input type="text" name="pay_name" placeholder="입금자 명" style="width:350px;"></p>
			<p><input type="text" name="bank_num" placeholder="계좌번호" style="width:350px;"></p>
			<p><select name="bank_name">
                        <option value="">은행명을 선택하세요</option>
                        <option value="35">경남은행</option>
                        <option value="29">광주은행</option>
                        <option value="7">국민은행</option>
                        <option value="5">기업은행</option>
                        <option value="15">농협중앙회</option>
                        <option value="25">대구은행</option>
                        <option value="27">부산은행</option>
                        <option value="37">새마을금고</option>
                        <option value="11">수협중앙회</option>
                        <option value="60">신한은행</option>
                        <option value="9">외환은행</option>
                        <option value="19">우리은행</option>
                        <option value="56">우체국</option>
                        <option value="33">전북은행</option>
                        <option value="31">제주은행</option>
                        <option value="68">카카오뱅크</option>
                        <option value="67">케이뱅크</option>
                        <option value="59">하나은행</option>
                        <option value="23">한국씨티은행</option>
                        <option value="45">HSBC은행</option>
                        <option value="21">SC제일은행</option>
						</select></p>
			<p><input type="hidden" name="rname" value="<%= rname %>"></p>
			<div class="card3f">예약 취소 시 결제하신 계좌번호로 환불 처리 됩니다.</div>
			<div class="card3f">24시간 이내 미입금시 자동으로 취소됩니다.</div>
			</div>
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

	$('#paycash').hide();
	function setDisplay(){
	    if($('input:radio[id=c]').is(':checked')){
	        $('#paycash').hide();
	    }else{
	        $('#paycash').show();
	        $('#card3').css('height');
	        $('#card3').css({ height: 400 });
	    }
	}

</script>
</html>