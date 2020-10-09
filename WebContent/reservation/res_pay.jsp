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
	.card{
		margin:0 auto;
		margin-top:5%;
		width: 25rem;
		height: 25rem;
		padding:2%;
	}
	.card-title{
		margin-bottom:10%;
	}
	.card-text{
		padding-top:10%;
		padding-bottom:10%;
	}
	#price{
		position:relative;
		text-align:right;
	}
	h2{
		padding-top:5%;
		padding-bottom:5%;
	}
	.none{
		border:none;
		background-color:#eee;
	}
	.backGround{
		background-color:#eee;
		padding-bottom:9%;
	}
	#date, #date2{
		display:none;
	}
	.textarea{
		margin:0 auto;
	}
	textarea{
		border:1px solid #ccc;
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
<div class="backGround">
<div class="text-center"><h2>결제페이지</h2></div> 
<div class="row">
    <div class="col">
    	<div class="card" >
 		<div class="card-header text-white bg-dark mb-3 text-center">payment</div>
 		 <div class="card-body">
    		<h6 class="card-subtitle mb-2 text-muted">개인정보 수집 및 이용 동의</h6>
    		<hr>
    		<p class="textarea text-center">
    			<textarea rows="8" cols="30" readonly style="text-align:left" wrap="hard"> 1. 개인정보 수집 및 이용 목적
(1) 비회원 구매 서비스 제공 비회원 구매에 따른 본인 확인, 물품배송, 서비스 제공, 계약서․청구서 발송, 본인인증, 연령인증, 요금결제 및 정산, 채권추심, 서비스 부정이용 방지, 각종 고지.통지 등의 목적 

(2) 고충처리 민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등 

2. 수집하는 개인정보 항목 성명, 주소, 휴대폰번호, 이메일, 결제 정보 

3. 개인정보 보유 및 이용기간 전자상거래법 등 관계 법령에 의거 구매 후 5년간 보관 ※ 동의를 거부할 수 있으나 거부시 비회원 구매 서비스 이용이 불가합니다.
    			</textarea>
    		</p>
    		<form method="post" name="fm" action="payment.jsp?rsno=<%= rsno %>&price=<%= price %>">
    		<div class="form-group form-check">	
    		<input type="checkbox" class="form-check-input" id="exampleCheck1" required>
   		 	<label class="form-check-label" for="exampleCheck1">동의합니다.</label>
   		 	</div>
  		</div>
  		</div>
    </div>
    <div class="col">
    	<div class="card" >
    	<div class="card-header text-white bg-dark mb-3 text-center">payment</div>
 		 <div class="card-body">
    		<h6 class="card-subtitle mb-2 text-muted">결제 예정 금액</h6>
    		<hr>
    		<%
			String rname = null;
			//rname = reservationbean.getRname();//
			%>
			<p class="card-text">
			<span id="day"></span>박(<%= reservationbean.getCheck_in()%>
			~&nbsp;<%= reservationbean.getCheck_out() %>)
			<hr>
			<p>합계금액 </p>
			<p class="text-right"><%= reservationbean.getPrice()+"  원" %></p>
			<div id="date"><%= reservationbean.getCheck_in()%></div>
			<div id="date2"><%= reservationbean.getCheck_out() %></div>
  		</div>
  		</div>
    </div>
    </div>
    <div class="row">
    <div class="col">
    	<div class="card" id="card3">
    	<div class="card-header text-white bg-dark mb-3 text-center">payment</div>
 		 <div class="card-body">
    		<h6 class="card-subtitle mb-2 text-muted">결제 수단</h6>
    		<hr>
			<p id="date" class="card-text2">
			<p><input type="radio" name="pay_ment" value="c" id="c" onchange="setDisplay()" selected>&nbsp&nbsp카드결제</p>
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
			<p><input type="submit" value="결제하기" class="btn btn-secondary res btn-block"></p>
		</form>
  		</div>
  		</div>
  	</div>
  	<div class="col">
    	<div class="card none" >
 		 <div class="card-body">
  		</div>
  		</div>
    </div>
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
	        $('#card3').css('height');
	        $('#card3').css({ height: 400 });
	    }else{
	        $('#paycash').show();
	        $('#card3').css('height');
	        $('#card3').css({ height: 500 });
	    }
	}

</script>
</html>