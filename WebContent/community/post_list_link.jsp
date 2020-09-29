<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>
.main {
	display:flex
}
.left{
	flex:1;
	background-color: antiquewhite;
}
.right{
	flex:2;
	background-color: azure;
}

@media (max-width: 600px) {
  .main {
    flex-direction: column;
  }
</style>
</head>
<body>
<div><jsp:include page="../main/header.jsp"/></div>
<div class="main">
<div class="left">
	<jsp:include page="sideMenu.jsp"/>
</div>
<div class="right">
	<jsp:include page="post_list.jsp"/>
</div>
</div>
<div>
	<jsp:include page="../main/footer.jsp"/>
</div>
</body>
</html>