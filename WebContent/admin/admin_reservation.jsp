<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/style.css"/>
<style>
	.main {
	display:flex
}
.left{
	flex:1;
}
.right{
	flex:2;
	width:70%;
	margin-left:35%;
	margin-right:5%;
	margin-top:5%;
}
input[type=button]{
     margin-top: 0px;
     margin-bottom: 0px;
}
li{
	width:100%; 
	text-align:center
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
<div class="left"><jsp:include page="../main/sideMenu.jsp"/></div>
	<%
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	ReservationBean rb = new ReservationBean();
	Tool tool = Tool.getinstance();
		
	String tempPage = request.getParameter("page");
	int cPage;
	int totalPages;
	int pageLength=5;
	int totalRows = tool.getPage();
	
	if(tempPage==null||tempPage.length()==0){
		cPage=1;
	}try{
		cPage=Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage=1;
	}
	int currentBlock = cPage%pageLength==0?cPage/pageLength:(cPage/pageLength)+1;
	int startPage = (currentBlock-1)*pageLength+1;
	int endPage = startPage+pageLength-1;
	
	totalPages = totalRows%5==0?totalRows/5:(totalRows/5)+1;
	if(totalPages==0){
		totalPages=1;
	}if(endPage>totalPages){
		endPage=totalPages;
	}
	int start = (cPage -1)*5;
	
	ArrayList<ReservationBean> rbean= rdb.selectList(start);
	
%>	
		<div class="right">
			<table class="table table-sm">
			<thead class="thead-dark">
			<tr align="center">
				<th scope="col">#</th>
				<th scope="col">예약번호</th>
				<th scope="col">방번호</th>
      			<th scope="col">체크인</th>
      			<th scope="col">체크아웃</th>
      			<th scope="col">예약날짜</th>
      			<th scope="col">예약자</th>
      			<th scope="col">결제현황</th>
			</tr>
			</thead>
<%		
			for(int i=0;i<rbean.size();i++){
				rb.setRn(1, i);
				//page 1(1-5까지 출력)
				if(cPage>1){ //페이지 1이상일 경우 6부터 일씩 증가하도록 해줌
					rb.setRn((cPage-1)*5+1, i);
				}
%>
			<tbody>	
				<tr align="center"> 
					<th scope="row"><%= rb.getRn() %></th>
					<td><%= rbean.get(i).getRsno() %></td>
					<td><%= rbean.get(i).getRno() %></td>
					<td><%= rbean.get(i).getCheck_in() %></td>
					<td><%= rbean.get(i).getCheck_out() %></td>
					<td><%= rbean.get(i).getRes_date() %></td>
					<td><%= rbean.get(i).getRname() %></td>
					<td><input type="button" class="checkBtn btn btn-outline-secondary btn-sm" value="결제완료" /></td>
				</tr>	
<%
			}

%>			
	
			<tr align="center"> 
			<td colspan="8">
					<ul class="pagination" style="margin:20px;padding:0">
<%
					if(startPage==1){
%>
					<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">Previous</a></li>
<% 						
					}else{
%>
					<li class="page-item"><a class="page-link" href="admin_reservation.jsp?page=<%=startPage-1 %>" 
							tabindex="-1" aria-disabled="true">Previous</a></li>
		
<% 						
					}
%>
<% 
					for(int i=startPage;i<=endPage;i++){
%>
					<li class="page-item">
					<a class="page-link" href="admin_reservation.jsp?page=<%=i %>">
					<%= i %></a></li>
<% 	
					}
%>					
<%
					if(totalPages==endPage){
%>
						<li class="page-item disabled">
						<a class="page-link" href="#">Next</a></li>
<% 		
						}else{
%>
						<li class="page-item">
						<a class="page-link" href="admin_reservation.jsp?page=<%= endPage+1 %>">Next</a></li>
<% 		
						}
%>
				</ul>
				</td>
				</tr>
				</tbody>
			</table>
			</div>
			</div>
<!-- <div class="footer"><jsp:include page="../main/footer.jsp"/></div>	 -->		
</body>
<script>
$(".checkBtn").click(function(){ 
    
    var str = ""
    var tdArr = new Array();    // 배열 선언
    var checkBtn = $(this);
    
    // checkBtn.parent() : checkBtn의 부모는 <td>이다.
    // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
    var tr = checkBtn.parent().parent();
    var td = tr.children();
    
    var rsno = td.eq(1).text();  
    var con = confirm("결제완료 처리하시겠습니까?");
    if(con==true){
    	location.href="admin_reservationOk.jsp?rsno="+rsno;	
    }
});

</script>
</html>
