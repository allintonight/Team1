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
@media (max-width: 600px) {
  .sideMenu {
   	display:none;
  }
  .navbar_respon{
  	 margin-top:0;
  	 display:block;
  }
}  
@media (min-width: 600px){
	.navbar_respon{
	 display:none;
	}
}
</style>
</head>
<body>
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
<nav class="navbar navbar_respon navbar-expand-lg navbar-light" style="background-color:#585858;">
  <a class="navbar-brand" href="#" style="color: #fff;">TEAM1</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav text-center">
    	<li class="nav-item active">
        <a class="nav-link" href="#" style="color: #fff;">Menu<span class="sr-only">(current)</span></a>
      	</li>
 <%
   	if(session.getAttribute("userid")!=null){
   		if(session.getAttribute("userid").equals("admin")){
%>   
	  <li class="nav-item">
        <a class="nav-link" href="#" style="color: #fff;">룸 관리</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="#" style="color: #fff;">예약 관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" style="color: #fff;">커뮤니티 관리</a>
      </li>
<% 
   		}else{
%>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #fff;">
          		공간소개
        		</a>
       		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="margin:0;">
          		<a class="dropdown-item" href="../room/roomdetail_1.html">혼자방</a>
          		<a class="dropdown-item" href="../room/roomdetail_2.html">같이방</a>
          		<a class="dropdown-item" href="../room/roomdetail_3.html">가족방</a>
          		<a class="dropdown-item" href="../room/roomdetail_4.html">서브펜션</a>
        	</div>
      		</li>
      		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #fff;">
          		예약
        		</a>
        		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          		<a class="dropdown-item" href="../reservation/reservation_intro">실시간 예약</a>
          		<a class="dropdown-item" href="../reservation/searchReservation">예약 조회</a>
        		</div>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="../main/information.jsp" style="color: #fff;">공지사항</a>
      		</li>
      		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="../community/post_list.jsp" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #fff;">
          		커뮤니티
        		</a>
        		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          		<a class="dropdown-item" href="../community/post_list.jsp">후기</a>
          		<a class="dropdown-item" href="../community/qna_list.jsp">Q&A</a>
       		</div>
       		</li>      
<%    			
   			
   		}
   	}else{
%>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #fff;">
          		공간소개
        	</a>
       		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          		<a class="dropdown-item" href="../room/roomdetail_1.html">혼자방</a>
          		<a class="dropdown-item" href="../room/roomdetail_2.html">같이방</a>
          		<a class="dropdown-item" href="../room/roomdetail_3.html">가족방</a>
          		<a class="dropdown-item" href="../room/roomdetail_4.html">서브펜션</a>
        	</div>
      		</li>
      		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #fff;">
          		예약
        		</a>
        	<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          		<a class="dropdown-item" href="../reservation/reservation_intro">실시간 예약</a>
          		<a class="dropdown-item" href="../reservation/searchReservation">예약 조회</a>
        	</div>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="../main/information.jsp" style="color: #fff;">공지사항</a>
      		</li>
      		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #fff;">
          		커뮤니티
        		</a>
        	<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          		<a class="dropdown-item" href="../community/post_list.jsp">후기</a>
          		<a class="dropdown-item" href="../community/qna_list.jsp">Q&A</a>
       		</div>
       		</li>    
<%    			
   		}
%>         
    </ul>
  </div>
</nav>
</body>
</html>