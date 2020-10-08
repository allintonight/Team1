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
</body>
</html>