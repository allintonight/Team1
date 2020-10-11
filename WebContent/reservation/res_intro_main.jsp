<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script type ="text/javascript" src="../js/javascript.js" defer> </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	
</head>
<style>
	.accordion{
		margin-bottom: 5%;
		margin-top: 10%;
	}
</style>
<body>

<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog cascading-modal" role="document">
    <!--Content-->
    <div class="modal-content">
     <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">실시간 예약</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
          <div class="tab-pane fade in show active">
			<!-- ******************************** 비회원 예약 안내 *************************************** -->
            <!--Body-->
            <div class="modal-body mb-1">
              <div class="options text-center text-md mt-1">
                <p>Not a member? <a href="" class="btn btn-dark waves-effect ml-autot" 
                data-toggle="modal" data-target="#modalRegisterForm" data-dismiss="modal">Sign Up</a></p>
                <p>Reservation? <a href="../reservation/reservationLink.jsp" class="btn btn-secondary waves-effect ml-auto">비회원 예약</a></p>
              </div>
              
            </div>
            <!--Footer-->
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-dark waves-effect ml-auto" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<div class="container text-center">
<div class="accordion" id="accordionExample">
  <div class="card" >
    <div class="card-header" id="headingOne" style="background-color:#585858;">
      <h5 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="color:#fff;">
         룸 가격 안내
        </button>
      </h5>
    </div>
    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
        <div class="container table-responsive">
        	<table class="table">
  				<thead>
   					<tr>
      				<th scope="col">#</th>
      				<th scope="col">방 이름</th>
      				<th scope="col">인원</th>
      				<th scope="col">평일</th>
      				<th scope="col">주말</th>
      				<th scope="col">성수기</th>
    				</tr>
  				</thead>
  				<tbody>
    				<tr>
      				<th scope="row">1</th>
      				<td>혼자방</td>
      				<td>1명</td>
      				<td>100,000원</td>
      				<td>150,000원</td>
      				<td>200,0000원</td>
    				</tr>
    				<tr>
     		 		<th scope="row">2</th>
      				<td>같이방</td>
      				<td>2명</td>
      				<td>100,000원</td>
      				<td>150,000원</td>
      				<td>200,0000원</td>
    				</tr>
    				<tr>
     			 	<th scope="row">3</th>
      				<td>가족방</td>
      				<td>4명</td>
      				<td>20,0000원</td>
      				<td>250,000원</td>
      				<td>300,0000원</td>
    				</tr>
    				<tr>
     			 	<th scope="row">4</th>
      				<td>서브펜션</td>
      				<td>4명</td>
      				<td>20,0000원</td>
      				<td>250,000원</td>
      				<td>300,0000원</td>
    				</tr>
  				</tbody>
			</table>
			<p class="text-sm-left" style="color:#616161;">인원 추가는 1인당 20,000원씩 추가 됩니다.<br>
									성수가는 7월 15일부터 8월 20일에 해당 됩니다.
			</p>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo"  style="background-color:#585858;">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="color:#fff;">
          예약 취소 안내
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
      	<div class="container table-responsive">
        	<table class="table">
  				<thead>
   					<tr>
      				<th scope="col">기준</th>
      				<th scope="col">환불규정</th>
      				</tr>
  				</thead>
  				<tbody>
    				<tr>
      				<th scope="row">2주~1주일 전</th>
      				<td>결제 금액의 50% 환불</td>
      				</tr>
  				</tbody>
  				<tbody>
    				<tr>
      				<th scope="row">6일~4일 전</th>
      				<td>결제 금액의 30% 환불</td>
      				</tr>
  				</tbody>
  				<tbody>
    				<tr>
      				<th scope="row">3일~하루 전</th>
      				<td>결제 금액의 10% 환불</td>
      				</tr>
  				</tbody>
  				<tbody>
    				<tr>
      				<th scope="row">당일</th>
      				<td>환불 불가</td>
      				</tr>
  				</tbody>
			</table>
			<p class="text-sm-left" style="color:#616161;">예약 전 꼭 확인 부탁 드립니다.<br>
									계좌 이체의 경우 입금 계좌로 환불 됩니다.
			</p>
        </div>	
      </div>
    </div>
  </div>
</div>

	<% 
		if(session.getAttribute("userid")!=null){
	%>
		<a href="../reservation/reservation.jsp" class="btn  btn-outline-dark btn-rounded mb-4 navbtn">
   		 실시간 예약하기</a>
	<% 
		}else{
	%>
	<a href="../reservation/reservation.jsp" class="btn  btn-outline-dark btn-rounded mb-4 navbtn" data-toggle="modal" data-target="#modalForm">
    실시간 예약하기</a>
    <% 
    }
	%>
</div>	
</body>
<script>

</script>
</html>