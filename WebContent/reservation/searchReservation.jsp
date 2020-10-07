<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/style.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/reservation_pro.css"/>
<style>
<!-- 우선 스타일 적용 되는데로 했는데 같이 보면서 고치도록할게요 ㅠㅠ -->
	input{
		border:1px solid #bbb;
		border-radius:4px;
	}
	table{
		width:60%;
		margin:10px 10px;
	}
	.left{
		position:relative;
		float:left;
		width:30%;
	}
	.right{
		position:relative;
		float:left;
		width:70%;
		margin-top:10%;
	}
	.form{
		position:relative;
		padding-left:30%;
	}
	 .form .btn{
		position:relative;
		margin-top:0;
	}
	.footer{
		clear: both
	}
</style>
</head>
<body>
<div><jsp:include page="../main/header.jsp"/></div>
<div class="left"><jsp:include page="../main/sideMenu.jsp"/></div>
<%
	String id = null;
	int rsno = 0;
	String remail=null;
	String kind=null;
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	ArrayList<ReservationBean> rbean= null; 
	if(session.getAttribute("userid")!=null){
		id = (String)session.getAttribute("userid");
			rbean = rdb.search(rsno, id, remail);
	
		%>	
		<div class="right">
			<table class="table table-striped">
			<thead class="thead-dark">
			<tr align="center">
				<th scope="col">#</th>
				<th scope="col">예약번호</th>
      			<th scope="col">객실</th>
      			<th scope="col">체크인</th>
      			<th scope="col">체크아웃</th>
      			<th scope="col">예약자</th>
			</tr>
			</thead>
		<%			
			for(int i=0;i<rbean.size();i++){
%>
			<tbody>	
				<tr align="center"> 
					<th scope="row"><%= i+1 %></th>
					<td><a href="reservationCancle.jsp?rsno=<%= rbean.get(i).getRsno()%>">
					<%= rbean.get(i).getRsno() %></a></td>
					<td><%= rbean.get(i).getRoomname() %></td>
					<td><%= rbean.get(i).getCheck_in() %></td>
					<td><%= rbean.get(i).getCheck_out() %></td>
					<td><%= rbean.get(i).getRname() %></td>
				</tr>
			</tbody>	
<% 					
			}
%>
			</table>
			</div>
<% 		
	}else{
%>			
			<div class="right">
			<form method='GET' action='./searchReservation.jsp'>
			<div class="form-row form">
			<div class="form-group col-sm-1.5 form">
      		<select name="kind" id="kind" class="form-control" onchange=select_onchange(this)>
        		<option value="1" selected>아이디</option>
				<option value="2">예약번호</option>
				<option value="3">이메일</option>
      		</select>
   		 	</div>
    		<div class="form-group col-sm-3 form">
    			<input name="kind" type="hidden" id="kind">
    			<input name="id" placeholder="아이디 입력" type="text" id="id" style="display:inline-block" class="form-control">
				<input name="rsno" placeholder="예약번호 입력" type="text" id="rsno" style="display:none" class="form-control">
				<input name="remail" placeholder="이메일 입력" type="email" id="email" style="display:none" class="form-control">
			</div>
    		<div class="form-group col-sm-2 form">
    			<input type="submit" value="검색하기"  class="btn btn-outline-secondary">
    		</div>
   		 	</div>
   		 	</form>	
<%
		 	
			
%>	
			<table class="table table-sm table-striped" id="refund">
			<thead class="thead-dark">
			<tr align="center">
				<th scope="col">#</th>
				<th scope="col">예약번호</th>
      			<th scope="col">객실</th>
      			<th scope="col">체크인</th>
      			<th scope="col">체크아웃</th>
      			<th scope="col">예약자</th>
			</tr>
			</thead>
<%				
		kind = rdb.checkNull(request.getParameter("kind"));
		if(kind != null){
			int ikind = Integer.parseInt(kind);
		switch(ikind){
		case 1:
			id=rdb.checkNull(request.getParameter("id"));
			rbean = rdb.search(rsno, id, remail);
		break;
		case 2:
			String no=request.getParameter("rsno");
			rsno=Integer.parseInt(no);
			rbean = rdb.search(rsno, id, remail);
		break;
		default:
			remail=rdb.checkNull(request.getParameter("remail"));
			rbean = rdb.search(rsno, id, remail);
		break;	
		}
		if(rbean.size()==0){
%>
		<script>
			alert("검색결과 없음");
		</script>
<% 			
		}
				for(int i=0;i<rbean.size();i++){
					rsno=rbean.get(i).getRsno();
%>					
				<tbody>		
					<tr align="center">
						<th scope="row"><%= i+1 %></th>
						<td><a href="reservationCancle.jsp?rsno=<%= rsno %>">
							<%= rsno %></a></td>
						<td><%= rbean.get(i).getRoomname() %></td>
						<td><%= rbean.get(i).getCheck_in() %></td>
						<td><%= rbean.get(i).getCheck_out() %></td>
						<td><%= rbean.get(i).getRname() %></td>
					</tr>
				</tbody>	
<% 				
		}
			}
%>
			</table>
			</div>
<% 
	}
%>						
<div class="footer"><jsp:include page="../main/footer.jsp"/></div>
</body>
<script>
function select_onchange(obj) {
	  switch (obj.value) {
	    case "1" :
	      id.style.display = "inline-block";
	      rsno.style.display = "none";
	      email.style.display = "none";
	      break;
	    case "2" :
	      id.style.display = "none";
	      rsno.style.display = "inline-block";
	      email.style.display = "none";
	      break;
	    default  :
	      id.style.display = "none";
	      rsno.style.display = "none";
	      email.style.display = "inline-block";
	      break;
	  }
	  document.getElementById('#kind').value = obj.value;
	}

	
</script>
</html>