<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	PayDBBean pdb = PayDBBean.getinstance();
	PayBean paybean = new PayBean();
	String pay_ment = request.getParameter("pay_ment");
	String pay_name = request.getParameter("pay_name");
	String rname = request.getParameter("rname");
	int rsno = Integer.parseInt(request.getParameter("rsno"));
	int price = Integer.parseInt(request.getParameter("price"));
	String no = request.getParameter("bank_name");
	String bank_name = pdb.bankName(no);
	String bank_num = request.getParameter("bank_num");
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	int re = rdb.update(pay_ment, pay_name, rsno, rname);
	
	if(pay_ment.equals("m")){
		paybean.setRsno(rsno);
		paybean.setPay_name(pay_name);
		paybean.setBank_name(bank_name);
		paybean.setBank_num(bank_num);
		paybean.setPaid_amout(price);
		paybean.setPay_method(pay_ment);
		pdb.pay(paybean);
	}
	
	if(re == 1){
		if(pay_ment.equals("c")){
			response.sendRedirect("pay_card.jsp?rsno="+rsno);
		}else{
			response.sendRedirect("pay_money.jsp");
		}
	}else{
%>
	<script>
		alert("다시시도해 주세요");
		history.back();
	</script>
<% 				
	}
%>
</body>
</html>