<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
	table{
		width:80%;
		position:relative;
	}
	.container{
		margin-top:5%;
	}
</style>
</head>
<body>
<div><jsp:include page="../main/header.jsp"/></div>
<%

	int rsno = Integer.parseInt(request.getParameter("rsno"));
	ReservationBean rb = new ReservationBean();
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	rb = rdb.reservationpay(rsno);
	
	PayDBBean pdb = PayDBBean.getinstance();
	PayBean pb = new PayBean();
	pb = pdb.selectPay(rsno);
	
	String roomname=null, rname=null, remail=null, rphone=null, pay_name=null;
	Date check_in=null, check_out=null;
	String pay_ment=null, apply_num=null, bank_name=null, bank_num=null;
	int refund_price=0, price=0;
	Date cancle_date=null, pay_date=null;
	
	if(rb!=null && pb!=null){
		roomname=rb.getRoomname();
		rname=rb.getRname();
		remail=rb.getRemail();
		rphone=rb.getRphone();
		check_in=rb.getCheck_in();
		check_out=rb.getCheck_out();
		pay_ment=rb.getPay_ment();
		price=rb.getPrice();
		pay_name=rb.getPay_name();
		apply_num=pb.getApply_num();
		refund_price=pb.getRefund_price();
		bank_name=pb.getBank_name();
		bank_num=pb.getBank_num();
		cancle_date=pb.getCancle_date();
		pay_date=pb.getPay_date();
	}
	
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	int itoday = Integer.parseInt(sf.format(nowTime));
	int icheck_in = Integer.parseInt(sf.format(check_in));
	


	
%>
<div class="container">
	<table class="table table-bordered">
		<thead class="thead-dark text-center">
			<tr>
			<th colspan="7">예약상세정보</th>
			</tr>	
		</thead>
		<tbody>
			<tr>
				<th>예약번호</th>
				<td colspan="2">
					<%= rsno %>
				</td>
				<th>방이름</th>
				<td colspan="3">
					<%= roomname %>
				</td>
			</tr>
			<tr>
				<th >체크인</th>
				<td colspan="2">
					<%= check_in %>
				</td>
				<th>체크아웃</th>
				<td colspan="3">
					<%= check_out %>
				</td>
			</tr>
			<tr>
				<th >예약자 성함</th>
				<td colspan="2">
					<%= rname %>
				</td>
				<th >결제자 성함</th>
				<td colspan="2">
					<%= pay_name %>
				</td>
			</tr>
			<tr>
				<th >예약자 이메일</th>
				<td colspan="2">
					<%= remail %>
				</td>
				<th >예약자 연락처</th>
				<td colspan="3">
					<%= rphone %>
				</td>
			</tr>
			<tr>
				<th>취소요청일</th>
				<td >
				<%
					if(cancle_date==null){
						%>&nbsp;<% 
					}else{
				%>		
						<%= cancle_date %>
				<% 		
					}
				%>
				</td>
				<th>결제금액</th>
				<td >
					<%= price %>
				</td>
				<th>취소금액</th>
				<td colspan="2">
				<%
					if(refund_price==0){
						%>&nbsp;<% 
					}else{
				%>		
						<%= refund_price %>
				<% 		
					}
				%>
				</td>
			</tr>
			<tr>
				<th>결제수단</th>
				<td>
			<%
				if(pay_ment.equals("m")){
					out.print("계좌이체</td>");
					
			%>
				<th>은행</th>
				<td>
					<%= bank_name %>
				</td>
				<th>계좌번호</th>
				<td colspan="2">
					<%= bank_num %>
				</td>
			<% 		
				}else{
					out.print("카드결제</td>");
					if(apply_num==null){
						apply_num="미납";
					}
			%>
				<th>승인번호</th>
				<td>
					<%= apply_num %>
				</td>
				<th>승인날짜</th>
				<td colspan="2">
					<%= pay_date %>
				</td>
			<% 		
				}
			%>
				
			</tr>
			<tr>
				<td colspan="6" class="text-center">
				<% 
						if(icheck_in>itoday){
				%>
						<a href="reservationCancle.jsp?rsno=<%= rsno %>" class="btn btn-dark">예약취소</a>
				<% 			
						}
				%>
					<a href="searchReservation.jsp" class="btn btn-secondary">목록으로</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>	
</body>
</html>