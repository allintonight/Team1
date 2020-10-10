<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>  
<%@ page import="java.sql.ResultSet" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 예약 취소 완료 시 예약 파트에서 예약 부분 삭제 후 
	 관리자가 확인해야 하므로 취소 내역 테이블을 하나 더 만들거나 
	 컬럼하나 더 생성해야할것 같아요 ! 
	 내일 상의하고 해야할것 같아서 아직 만들지는 않았습니다 :)  --> 
<% 

	if(session.getAttribute("userid")==null){	
		request.setCharacterEncoding("utf-8");
		ReservationDBBean rdb = ReservationDBBean.getinstance();
		ReservationBean rb = new ReservationBean();
		PayDBBean pdb = PayDBBean.getinstance();
		PayBean paybean = new PayBean();
		ResultSet rs = null;
		String pay_name=null;
		
		int rsno = Integer.parseInt(request.getParameter("rsno"));
		String rname = request.getParameter("rname"); 
		String rphone = request.getParameter("rphone");
		
		rdb.reservationpay(rsno);
		
		
		int refund_price = Integer.parseInt(request.getParameter("refund_price"));
		int result = rdb.NoneMembercancle(rname, rphone, rsno);
		
		if(result==1){
			if(paybean!=null){
				pay_name=paybean.getPay_name();
			}
			paybean.setRsno(rsno);
			paybean.setRefund_price(refund_price);
			paybean.setPay_name(pay_name);
			paybean.setRname(rname);
			paybean.setRphone(rphone);
			pdb.payCancle(paybean);
		
%>
		<script>
			var con = confirm("예약 취소 하시겠습니까?")
			if(con==true){
				alert("예약취소완료! 환불까지는 시간이 소요될 수 있습니다.");
				location.href=indext.jsp;
			}
		</script>
<% 
		}else if(result==0){
%>
		<script>			
			alert("예약자 번호가 틀립니다!");
			history.back();
		</script>
<%			
		}else if(result==-1){
%>
		<script>			
			alert("예약자가 존재하지 않습니다");
			history.back();
		</script>
<%				
		}
	}else{
		int rsno = Integer.parseInt(request.getParameter("rsno"));
%>
		<script>
			var con = confirm("예약 취소 하시겠습니까?")
			if(con==true){
				alert("예약취소완료. 환불까지는 시간이 소요될 수 있습니다.");
				location.href=indext.jsp;
			}
		</script>
<% 		
	}	
%>		

</body>
</html>