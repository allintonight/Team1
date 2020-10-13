<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.sideMenu{
    background-color: #585858 ;
    font-weight: bold;
    margin: 0;
    height:100%;
}
.title{
    margin: 10px auto 1px;
    font-size: 16px;
}
.sub{
    margin: 0 auto;
    font-size: 15px;
}
.nav-link{
    color:white;
}
.nav-link:hover{
    color:#808080; 
}
.sideMenu_Logo{
    margin-left:auto; margin-right:auto;display:block;
}
</style>
</head>
<div class="sideMenu">
<a  href="../main/index.jsp"><img src="../img/main_img/team1_logo_black.jpg" class="sideMenu_Logo"></a>
<%
		out.println(session.getAttribute("userid")); //확인 용도 ㅠㅠ 나중에 지울게요 ...~
		if(session.getAttribute("userid") != null){
			if(session.getAttribute("userid").equals("admin")){
%>				
				<ul class="nav flex-column">
		          <li class="nav-item title"><a class="nav-link active" href="../admin/admin_room.jsp">룸 관리</a></li>
		          <li class="nav-item title"><a class="nav-link active" href="../admin/admin_reservation.jsp">예약 관리</a></li>
		          <li class="nav-item title"><a class="nav-link active" href="../admin/admin_board/bord_list.jsp">커뮤니티 관리</a></li>
		        </ul>
		        
<%		        
			}else{
%>
<ul class="nav flex-column">
    <li class="nav-item title">
      <a class="nav-link" href="../room/room.html">공간소개</a>
      	<ul class="nav flex-column">
		    <li class="nav-item sub">
		      <a class="nav-link active" href="../room/roomdetail_1.html">혼자방</a>
		    </li>
		    <li class="nav-item sub">
		      <a class="nav-link active" href="../room/roomdetail_2.html">같이방</a>
		    </li>
		    <li class="nav-item sub">
		      <a class="nav-link active" href="../room/roomdetail_3.html">가족방</a>
		    </li>
		    <li class="nav-item sub">
		      <a class="nav-link active" href="../room/roomdetail_4.html">서브펜션</a>
		    </li>
		    	
		   </ul>
    	</li>
    <li class="nav-item title">
      <a class="nav-link" href="#">예약</a>
      <ul class="nav flex-column">      
	    <li class="nav-item sub">
	        <a class="nav-link active" href="../reservation/reservation_intro.jsp">실시간예약</a>
	    </li>
	    <li class="nav-item sub">
	        <a class="nav-link active" href="../reservation/searchReservation.jsp">예약조회</a>
	    </li> 
	    </ul>   
    </li>
    <li class="nav-item title">
        <a class="nav-link" href="#">공지사항</a>
    </li>
    <li class="nav-item title">
      <a class="nav-link" href="../community/post_list.jsp">커뮤니티</a>
      <ul class="nav flex-column">
	    <li class="nav-item sub">
	        <a class="nav-link active" href="../community/post_list.jsp">후기</a>
	    </li>
	    <li class="nav-item sub">
	        <a class="nav-link active" href="../community/qna_list.jsp">Q&A</a>
	    </li>    
 	  </ul>
    </li>
</ul>			  
<% 			
			}
		}else{
%>
<ul class="nav flex-column">
    <li class="nav-item title">
      <a class="nav-link" href="../room/room.html">공간소개</a>
    </li>
    <li class="nav-item sub">
      <a class="nav-link active" href="../room/roomdetail_1.html">혼자방</a>
    </li>
    <li class="nav-item sub">
      <a class="nav-link active" href="../room/roomdetail_2.html">같이방</a>
    </li>
    <li class="nav-item sub">
      <a class="nav-link active" href="../room/roomdetail_3.html">가족방</a>
    </li>
    <li class="nav-item sub">
      <a class="nav-link active" href="../room/roomdetail_4.html">서브펜션</a>
    </li>
    <li class="nav-item title">
      <a class="nav-link" href="#">예약</a>
    </li>
    <li class="nav-item sub">
        <a class="nav-link active" href="../reservation/reservation_intro.jsp">실시간예약</a>
    </li>
    <li class="nav-item sub">
        <a class="nav-link active" href="../reservation/searchReservation.jsp">예약조회</a>
    </li>    
    <li class="nav-item title">
        <a class="nav-link" href="#">공지사항</a>
    </li>
    <li class="nav-item title">
      <a class="nav-link" href="../community/post_list.jsp">커뮤니티</a>
    </li>
    <li class="nav-item sub">
        <a class="nav-link active" href="../community/post_list.jsp">후기</a>
    </li>
    <li class="nav-item sub">
        <a class="nav-link active" href="../community/qna_list.jsp">Q&A</a>
    </li>    
</ul>
<% 			
		}
%>
</div>