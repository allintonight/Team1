<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	#top{
		postion:relative;
		width:100%;
	}
	#top img{
		width:100%;
		height:400px;
	}
	#nav{
		background-image:url('https://raw.githubusercontent.com/allintonight/Team1/master/WebContent/img/main_img/index%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg');
		height:400px;
	}
	ul{
		list-style:none;
	}
	a{text-decoration: none;}
	.menu{
		margin-top:-20px;
		position:relative;
		margin:0 auto;
	}
	.menu > li{
		float:left;
		text-align:center;
	}
	.menu > li > a {
		display:block;
		padding:8px 16px;
		text-align:center;
	}
	.sub{
		visibility:hidden;
		background:white;
		border:1px solid black;
	}
	.sub li{
		text-align:center;
		padding:8px 16px;
	}
	.menu > li:hover .sub{
		visibility:visible;
	}
</style>
</head>
<body>
	<div id="top">
		<%@ include file ="../main/header.jsp" %> 
		<div id="nav">
		<%@ include file ="../main/header_2.jsp" %> 
		</div>
	</div>
	<div id="main">
		
		<%@ include file ="../main/res_intro_main.jsp" %>
	</div>

</body>
</html>