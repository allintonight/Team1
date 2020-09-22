<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Room.*" %>
<%@ page import="java.util.ArrayList" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type ="text/javascript" src="../js/javascript.js" defer> </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
<style>
 .table{
 	width:1000px;
 }
 .btn{
 	position:relative;
 	left:35%;
 	top:40px;
 }
 .text{
 	position:relative;
 	left:15%;
 	top:40px;
 }
 th, td{
 	text-align:center;
 }
</style>
</head>

<body>
<%
	RoomDBBean rdb = RoomDBBean.getinstance();
	ArrayList<RoomBean> roombean = rdb.getAll();
%>
<div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog cascading-modal" role="document">
    <!--Content-->
    <div class="modal-content">
     <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">방 추가</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
          <div class="tab-pane fade in show active">
           <div class="modal-body mb-1">
              <div class="md-form mb-5">
              	<form method="post" action="add_room.jsp">
              	
              	<label data-error="wrong" data-success="right" for="modalLRInput10">방 번호</label><br>
                <input type="text" class="form-control form-control-sm validate" 
                			name="rno" placeholder="방 번호">
              	
                <label data-error="wrong" data-success="right" for="modalLRInput10">방 이름</label><br>
                <input type="text" class="form-control form-control-sm validate" 
                			name="rname" placeholder="방 이름">
              
                <label data-error="wrong" data-success="right" for="modalLRInput11">인원수</label><br>
                <input type="text" class="form-control form-control-sm validate" 
                			name="men" placeholder="기본 인원수">
                			
                <label data-error="wrong" data-success="right" for="modalLRInput11">평일가격</label><br>
                <input type="text" class="form-control form-control-sm validate" 
                			name="weekday" placeholder="평일 가격">
                			
                <label data-error="wrong" data-success="right" for="modalLRInput11">주말가격</label><br>
                <input type="text" class="form-control form-control-sm validate" 
                			name="weekend" placeholder="주말 가격">
                
                <label data-error="wrong" data-success="right" for="modalLRInput11">성수기가격</label><br>
                <input type="text" class="form-control form-control-sm validate" 
                			name="sweekday" placeholder="성수기 가격">	
                											
                <input type="submit"  class="btn btn-dark" value="추가완료" ><i class="fas fa-sign-in ml-1"></i>
                </form>
              </div>
            </div>
          </div>
        </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<table class="table table-borderless" align="center">
<tr>
<th class="text text-secondary">
*방이름 클릭시 수정페이지로 넘어갑니다*</th>
<th>
<a href="" class="btn btn-secondary btn-rounded mb-4 navbtn" data-toggle="modal" data-target="#modalLRForm">추가하기</a>
</th><tr>
</table>
<table class="table table-hover" align="center">
<thead class="thead-dark">
    <tr>
      <th scope="col">Room No</th>
      <th scope="col">방이름</th>
      <th scope="col">인원수</th>
      <th scope="col">평일가격</th>
      <th scope="col">주말가격</th>
      <th scope="col">성수기가격</th>
    </tr>
    <tbody>
<%
	for(int i=0;i<roombean.size();i++){
%>		
		<tr>
	      <td><%= roombean.get(i).getRno() %></td>
	      <td><a href="update_room.jsp?rno=<%= roombean.get(i).getRno() %>"
	       class="text-body"><%= roombean.get(i).getRname() %></a></td>
	      <td><%= roombean.get(i).getMen() %></td>
	      <td><%= roombean.get(i).getWeekday() %></td>
	      <td><%= roombean.get(i).getWeekend() %></td>
	      <td><%= roombean.get(i).getSweekday() %></td>
	    </tr>
	</tbody>    
<% 	    
	}
%>
    
  </thead>
</table>  
</body>
</html>