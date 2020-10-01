  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>

.main {
	display:flex;
	postion:relative;
	width:100%;
}
.left{
	flex:1;
	background-color: antiquewhite;
}
.right{
	postion:relative;
	width:70%;
	margin-left:35%;
	margin-top:5%;
	text-align: center;
	flex:2;
}
.footer{
	postion:absolute;
	margin-top:750px;
	clear: both;
  	width:100%;
}
@media (max-width: 600px) {
  .main {
    flex-direction: column;
  }  
</style>
</head>
<body>
<!-- 디자인 다 깨지는데 왜그런지 모르겠어요 ,, ㅠ 일단 디자인은 같이 해 봐야할꺼같아요/.......... -->
<div class="header"><jsp:include page="../main/header.jsp"/></div>
<div class="main">
<div class="left">
	<jsp:include page="../main/sideMenu.jsp"/>
</div>
<div class="right">
	<jsp:include page="reservation.jsp"/>
</div>
</div>
	<div class="footer"><jsp:include page="../main/footer.jsp"/></div>
</body>
</html>