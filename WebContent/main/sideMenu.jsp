<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- main에 속해있는 사이드 메뉴라서 ../ 붙여줬습니다 ! -->	
</head>
<body >
	<div class="main">
	<div class="left">
	<img src="img/main_img/team1_logo_black.jpg">
<%
		
		out.println(session.getAttribute("userid")); //확인 용도 ㅠㅠ 나중에 지울게요 ...~
		if(session.getAttribute("userid") != null){
			if(session.getAttribute("userid").equals("admin")){
%>				
				<ul class="menu">
		          <li><a class="menulist" href="admin/admin_room.jsp">룸 관리</a></li>
		          <li><a class="menulist" href="admin/admin_reservation.jsp">예약 관리</a></li>
		          <li><a class="menulist" href="admin/admin_board/bord_list.jsp">커뮤니티 관리</a></li>
		        </ul>
<%		        
			}else{
%>
			  <ul class="menu">
         		<li><a class="menulist" href="space/room.html">공간소개</a>
         			<ul class="sub">
          				<li><a class="room" href="space/roomdetail_1.html">혼자방</a></li>
          				<li><a class="room" href="space/roomdetail_2.html">같이방</a></li>
          				<li><a class="room" href="space/roomdetail_3.html">가족방</a></li>
          				<li><a class="room" href="space/roomdetail_4.html">서브펜션</a></li>
          			</ul>
         		</li>
          		<li><a class="menulist" href="#">예약</a>
          			<ul class="sub">
          				<li><a class="room" href="../reservation/reservation_intro.jsp">실시간예약</a></li>
          				<li><a class="room" href="../reservation/searchReservation.jsp">예약조회</a></li>
          			</ul>
          		</li>
          		<li><a class="menulist" href="#">공지사항</a></li>
          		   <li><a class="menulist" href="community/post_list_link.jsp">커뮤니티</a>
          			<ul class="sub">
          				<li><a class="community" href="community/post_list_link.jsp">후 기</a></li>
          				<li><a class="community" href="community/qna_list_link.jsp">Q&A</a></li>
          			</ul>
          			</li>
       		  </ul>
<% 			
			}
		}else{
%>
		<ul class="menu">
          <li><a class="menulist" href="space/room.html">공간소개</a>
          	<ul class="sub">
          		<li><a class="room" href="space/roomdetail_1.html">혼자방</a></li>
          				<li><a class="room" href="space/roomdetail_2.html">같이방</a></li>
          				<li><a class="room" href="space/roomdetail_3.html">가족방</a></li>
          				<li><a class="room" href="space/roomdetail_4.html">서브펜션</a></li>
          	</ul>
          </li>
          <li><a class="menulist" href="#">예약</a>
          		<ul class="sub">
				<!-- 추가 -->
          				<li><a class="room" href="../reservation/reservation_intro.jsp">실시간예약</a></li>
          				<li><a class="room" href="../reservation/searchReservation.jsp">예약조회</a></li>
          		</ul>
          </li>
          <li><a class="menulist" href="#">공지사항</a></li>
          <li><a class="menulist" href="community/post_list_link.jsp">커뮤니티</a>
          			<ul class="sub">
          				<li><a class="community" href="community/post_list_link.jsp">후 기</a></li>
          				<li><a class="community" href="community/qna_list_link.jsp">Q&A</a></li>
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