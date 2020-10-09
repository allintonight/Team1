<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.sql.Timestamp" %>   
<%@ page import="java.text.SimpleDateFormat" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/style.css"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> <!-- 드롭다운 사용시 필수 -->
	<title>Insert title here</title>
<style>
	nav{
		margin:20px;
	}
	.pagination{
		justify-content: center;
	}
	input[type=button] {
     margin-top:0;
}
</style>
</head>
<body>
<div><jsp:include page="../main/header.jsp"/></div>
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-link"  href="admin_reservation.jsp">예약현황</a>
    <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-item nav-link active" href="admin_reservation2.jsp">결제대기</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="admin_reservation3.jsp">결제완료</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">예약취소</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="admin_resCancleMoney.jsp">현금결제</a>
      <a class="dropdown-item" href="admin_resCancleCard.jsp">카드결제</a>
       <a class="dropdown-item" href="admin_resCancleOk.jsp">취소완료건</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">MENU</a>
  </li>
</ul>
  </div>
</nav>
<div class="main">
<%
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	ReservationBean rb = new ReservationBean();
	Tool tool = Tool.getinstance();
	String payment = null;
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
	String tempPage = request.getParameter("page");
	int cPage;
	int totalPages;
	int pageLength=5;
	int totalRows = tool.getPage2();
	
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
	
	ArrayList<ReservationBean> rbean= rdb.selectListNo(start);
	
%>	
	<div class="right">
		<div class="container-fluid">	
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
      			<th scope="col">결제금액</th>
      			<th scope="col">결제방식</th>
      			<th scope="col">결제처리</th>
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
					<td>
					<a href="admin_resInfo.jsp?rsno=<%= rbean.get(i).getRsno() %>">
						<%= rbean.get(i).getRsno() %>
					</a>
					</td>
					<td><%= rbean.get(i).getRno() %></td>
					<td><%= rbean.get(i).getCheck_in() %></td>
					<td><%= rbean.get(i).getCheck_out() %></td>
					<td><%= format.format(rbean.get(i).getRes_date()) %></td>
					<td><%= rbean.get(i).getRname() %></td>
					<td><%= rbean.get(i).getPrice() %></td>
					<td><%= rbean.get(i).getPay_ment() %></td>
					<td><input type="button" class="checkBtn btn btn-outline-secondary btn-sm" value="결제완료" /></td>
				</tr>	
<%
			}
%>			
			</tbody>
			</table>
			</div>
			</div>	
				<div>
					<ul class="pagination" style="margin:20px;padding:0">
<%
					if(startPage==1){
%>
					<li class="page-item disabled">
					<a class="page-link" href="#" aria-label="Previous">
       				<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>	
     			 	</a>
     			 	</li>
<% 						
					}else{
%>
					<li class="page-item disabled">
					<a class="page-link"href="admin_reservation2.jsp?page=<%=startPage-1 %>"  aria-label="Previous">
       				<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>	
     			 	</a>
     			 	</li>		
		
<% 						
					}
%>
<% 
					for(int i=startPage;i<=endPage;i++){
%>
					<li class="page-item">
					<a class="page-link" href="admin_reservation2.jsp?page=<%=i %>">
					<%= i %></a></li>
					
<% 	
					}
%>					
<%
					if(totalPages==endPage){
%>
						<li class="page-item disabled">
						<a class="page-link" href="#" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
      					</a>
						</li>
<% 		
						}else{
%>
						<li class="page-item disabled">
						<a class="page-link"  href="admin_reservation2.jsp?page=<%= endPage+1 %>" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
      					</a>
						</li>
					</ul>		
<% 		
						}
%>
				</div>
			</div>
</body>
<script>
$(".checkBtn").click(function(){ 
    
    var str = ""
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