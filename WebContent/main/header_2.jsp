<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body, html{
		display:relative;
	}
	ul{
		list-style:none;
	}
	a{text-decoration: none;}
	.menu{
		position:relative;
		margin-left:35%;
	}
	.menu > li{
		float:left;
	}
	.menu > li > a {
		display:block;
		padding:8px 16px;
		text-align:center;
	}
	.sub{
		visibility:hidden;
	}
	.menu > li:hover .sub{
		visibility:visible;
	}
</style>
</head>
<body>
<% 
    
		if(session.getAttribute("userid") != null){
		if(session.getAttribute("userid").equals("admin")){
 %>
<nav>
 	<ul class="menu">
		<li><a class="menulist" href="#">예약 관리</a></li>
		<li><a class="menulist" href="../admin/admin_room.jsp">객실 관리</a></li>
		<li><a class="menulist" href="#">공지사항 관리</a></li>
		<li><a class="menulist" href="#">커뮤니티 관리</a></li>
	</ul>
	<div class="under"></div>
</nav>
 <%   			
   		}else{
 %>
<nav>
   	 	<ul class="menu">
   			<li><a>공간소개</a>
   				<ul class="sub">
          				<li><a class="room" href="#">혼자방</a></li>
          				<li><a class="room" href="#">같이방</a></li>
          				<li><a class="room" href="#">가족방</a></li>
          				<li><a class="room" href="#">서브펜션</a></li>
          			</ul>
   			<li><a>예약</a></li>
   			<li><a>공지사항</a></li>
   			<li><a>커뮤니티</a></li>
   		</ul>
   		<div class="under"></div>
</nav>
<%		
   			}
		}else{
			 %>
			<nav>
			 	<ul class="menu">
					<li><a>공간소개</a>
						<ul class="sub">
          				<li><a class="room" href="#">혼자방</a></li>
          				<li><a class="room" href="#">같이방</a></li>
          				<li><a class="room" href="#">가족방</a></li>
          				<li><a class="room" href="#">서브펜션</a></li>
          			</ul>
					<li><a>예약</a></li>
					<li><a>공지사항</a></li>
					<li><a>커뮤니티</a></li>
				</ul>
				<div class="under"></div>
</nav>
			 <%
		}
   	
%>
</body>
</html>