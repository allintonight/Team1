<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Main.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<script type ="text/javascript" src="../js/javascript.js" defer> </script>
	<link rel="stylesheet" href="../css/reservation_pro.css"/>
</head>
<body>
<%
	UserDBBean udb = UserDBBean.getinstance();
	String id = request.getParameter("id");
	UserBean ub = udb.memberInfo(id);
	String name=ub.getName();
	
%>
	<div id="form">
			<div id="left">
				<img src="https://raw.githubusercontent.com/allintonight/Team1/master/WebContent/img/main_img/TEAM1%EB%A1%9C%EA%B3%A0%EC%83%88%EB%A1%9C.jpg">
			</div>
			<div id="right">
				<div id="container-fluid">
				<form method="post" name="fm" action="accountOk.jsp?id=<%= id %>">
					<div class="form-group">
    				<label for="name">이 름&nbsp;&nbsp;<i class="fas fa-user"></i></label>
    				<input type="text" class="form-control" id="name" name="name" value="<%= name %>" readonly>
    				
  					<label for="phone">휴대폰 번호&nbsp;&nbsp;<i class="fas fa-mobile-alt"></i></label>
    				<input type="text" class="form-control phone" placeholder="휴대폰 번호" name="phone" value="<%= ub.getPhone() %>" required maxlength="13">
    				
    				<label for="email">Email address&nbsp;&nbsp;<i class="far fa-envelope"></i></label>
    				<input type="email" class="form-control" id="email" placeholder="name@example.com" value="<%= ub.getEmail() %>" name="email" required>
 					</div>
 					<div class="form-group">
    				
    				<label for="roomname">아이디&nbsp;&nbsp;<i class="fas fa-id-card"></i></label>
    				<input type="text" class="form-control" id="id" value="<%= id %>" readonly>
    				
    				<label for="roomname">비밀번호&nbsp;&nbsp;<i class="fas fa-lock"></i></label>
    				<input type="password" class="form-control" id="pwd1" name="password" >
    				
    				<label for="roomname">비밀번호 확인&nbsp;&nbsp;<i class="far fa-check-square"></i></label>
    				<input type="password" class="form-control" id="pwd2" name="passowrd2" >
    				<br>
    				<div class="alert alert-success" role="alert" id="alert-success">
  					A simple success alert—check it out!
					</div>			
    				<div class="alert alert-danger" role="alert" id="alert-danger">
  					A simple warning alert—check it out!
					</div>
    				</div>
 					<div class="form-row">
 					<input type="submit" value="예약하기" class="btn btn-dark res" id="btn">
 					<input type="button" value="뒤로가기" class="btn btn-secondary res" id="btn" onClick="history.back()">	
 						
 					</div>
				</form>
			</div>
			</div>
		</div>	
</body>

</html>