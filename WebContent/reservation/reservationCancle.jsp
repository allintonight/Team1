<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>   
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<style>
.reservationNumber{
		position:relative;
		width:50%;
		border:1px solid #ccc;
		border-radius:10px;
		padding:50px;
		margin:0 auto;
		text-align:center;
		margin-top:100px;
}
.btn{
	margin-top:10px;
}	
</style>
</head>
<body>
<%
	
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	int rsno = Integer.parseInt(request.getParameter("rsno"));
	ReservationBean rb = rdb.cancleDate(rsno);
	
	PayDBBean pdb = PayDBBean.getinstance();
	int re = pdb.selectCantcle(rsno);
	
	
	int result=0;
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyMMdd");
	DecimalFormat df = new DecimalFormat("0.##");
	int today = Integer.parseInt(sf.format(nowTime));
	Calendar cal = Calendar.getInstance();
	Date check_in = null;
	double price =0;
	int icheck_in = 0;
	
	if(re==1){
%>
		<script>
			alert("이미 취소된 예약건 입니다.");
		</script>
<% 				
	}else{
			if(rb !=null){
				check_in = rb.getCheck_in();
				price = rb.getPrice();	
				icheck_in = Integer.parseInt(sf.format(check_in));
				int day=icheck_in-today;
		
				if(day<14&&day>=7){
					price = price*0.5;
				}else if(day<7&&day>=5){
					price = price*0.3;
				}else if(day<5&&day>=3){
					price = price*0.1;
		
				}else if(day<3){
					price = 0;
				}
				
			}else{
%>
				<script>
					alert("다시시도 해 주세요");
					history.back();
				</script>
<% 		
			}
%>
				<div class="rigth">
				 <div class="reservationNumber">
<%

				if(price==0){
%>
					체크인 기준 3일전부터는 예약취소 및 환불이 불가능 합니다.
<% 			
				}else{
%>
					고객님이 환불 받으실 수 있는 금액은 <%= df.format(price) %>원 입니다.<br>
					예약 취소를 원하시면 버튼을 눌러 주세요.<br>
<% 
		
				String userid = (String)session.getAttribute("userid");
				if(session.getAttribute("userid")==null){
%>
					<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#modalForm">예약취소</button>
<%	
					}else{
%>
					<a class="btn btn-dark btn-sm" href="reservationCancleOk.jsp?rsno=<%= rsno %>&refund_price="<%=df.format(price)%>>예약취소</a>
<% 	
					}
				}
			} 	
	
%>
</div>
</div>
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog cascading-modal" role="document">
    <!--Content-->
    <div class="modal-content">
     <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">예약 취소</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
          <div class="tab-pane fade in show active">
            <!--Body-->
            <div class="modal-body mb-1">
              <div class="md-form mb-5">
              	<form method="post" action="reservationCancleOk.jsp?rsno=<%= rsno %>&refund_price=<%=df.format(price)%>" name="fm">
                <i class="fas fa-user-circle"></i>
                <label data-error="wrong" data-success="right" for="modalLRInput10" class="text-left">예약자 성함</label><br>
                <input type="text" class="form-control form-control-sm " 
                			name="rname" placeholder="예약자 성함" id="rname" required>
               
                <i class="fas fa-lock prefix"></i>
                <label data-error="wrong" data-success="right" for="modalLRInput11" class="text-left">예약자 전화번호</label><br>
                <input type="text" class="form-control form-control-sm" 
                			name="rphone" placeholder="예약자 전화번호" id="rphone" maxlength="13" required>
                
                <input type="submit" onclick="cancle()" class="btn btn-dark" value="예약취소" ><i class="fas fa-sign-in ml-1"></i>
                </form>
              </div>
            </div>
            <!--Footer-->
          </div>
        </div>
    </div>
    <!--/.Content-->
  </div>
</div>
</body>
<script>

$('#rphone').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
 
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});
</script>
</html>