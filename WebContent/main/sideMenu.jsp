<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<div class="main">
	<div class="left">
	<img src="https://github.com/allintonight/TEAM1-PJ/blob/66daa1ed69b3261ec3c25bd5129763b63cc639f1/TEAM1%EB%A1%9C%EA%B3%A0%EC%83%88%EB%A1%9C.jpg?raw=true">
<%
		
		out.println(session.getAttribute("userid")); //확인 용도 ㅠㅠ 나중에 지울게요 ...~
		if(session.getAttribute("userid") != null){
			if(session.getAttribute("userid").equals("admin")){
%>				
				<ul class="menu">
		          <li><a class="menulist" href="#">예약 관리</a></li>
		          <li><a class="menulist" href="#">공지사항 관리</a></li>
		          <li><a class="menulist" href="#">커뮤니티 관리</a></li>
		        </ul>
<%		        
			}else{
%>
			  <ul class="menu">
         		<li><a class="menulist" href="#">공간소개</a></li>
          		<li><a class="menulist" href="#">예약</a></li>
          		<li><a class="menulist" href="#">공지사항</a></li>
          		<li><a class="menulist" href="#">커뮤니티</a>
          			<ul class="sub">
          				<li><a class="room" href="#">Room1</a></li>
          				<li><a class="room" href="#">Room2</a></li>
          				<li><a class="room" href="#">Room3</a></li>
          				<li><a class="room" href="#">Room4</a></li>
          			</ul>
          		</li>
       		  </ul>
<% 			
			}
		}else{
%>
		<ul class="menu">
          <li><a class="menulist" href="#">공간소개</a>
          	<ul class="sub">
          		<li><a class="room" href="#">Room1</a></li>
          		<li><a class="room" href="#">Room2</a></li>
          		<li><a class="room" href="#">Room3</a></li>
        		<li><a class="room" href="#">Room4</a></li>
          	</ul>
          </li>
          <li><a class="menulist" href="#">예약</a></li>
          <li><a class="menulist" href="#">공지사항</a></li>
          <li><a class="menulist" href="#">커뮤니티</a>
          	<ul class="sub">
          		<li><a class="community" href="#">후 기</a></li>
          		<li><a class="community" href="#">Q&A</a></li>
          	</ul>
          </li>
        </ul>
<% 			
		}
%>
	</div>
	</div>
</body>
</html>