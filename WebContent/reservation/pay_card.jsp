<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>
<%@ page import="java.sql.ResultSet" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
<style>
	form{
		display:none;
	}
</style>
</head>
<body>
	<%
		int rsno = Integer.parseInt(request.getParameter("rsno"));
		ReservationDBBean rdb = ReservationDBBean.getinstance();
		ResultSet reservation = rdb.reservationpay(rsno);
		
		String rname = null;
		int irsno = 0;
		int price=0;
		String remail=null;
		String rphone=null;
		String pay_name= null;
		if(reservation.next()){
			rname = reservation.getString(1);
			irsno = reservation.getInt(2);
			remail = reservation.getString(6);
			rphone = reservation.getString(7);
			price = reservation.getInt(11);
			pay_name = reservation.getString(14);
		}
	%>
	<form>
		<input value="<%= rname %>" name="rname" id="rname"><!-- 방이름 -->
		<input value="<%= irsno %>" name="rsno" id="rsno">
		<input value="<%= remail %>" name="remail" id="remail">
		<input value="<%= rphone %>" name="rphone" id="rphone">
		<input value="<%= price %>" name="price" id="price">
		<input value="<%= pay_name %>" name="pay_name" id="pay_name">
	</form>
	
</body>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp27615485');

var rname = $('#rname').val();
var rsno = $('#rsno').val();
var remail = $('#remail').val();
var rphone = $('#rphone').val();
var price = $('#price').val();
var pay_name = $('#pay_name').val();

IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : rname,
    amount : 100,
    buyer_email : remail,
    buyer_name : pay_name,
    buyer_tel : rphone,
   // m_redirect_url : 'payOk.jsp?rsno='+rsno
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        location.href='payOk.jsp?rsno='+rsno;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        location.href='pay_cardFail.jsp?rsno='+rsno;
    }
    alert(msg);
});
</script>
</html>