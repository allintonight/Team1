<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>    
<%@ page import="java.text.SimpleDateFormat" %>  
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> <!-- 드롭다운 사용시 필수 -->
<style>
	nav{
		margin:20px;
	}
	.pagination{
		justify-content: center;
	}
</style>
</head>
<body>

<!-- 예약번호 클릭시 상세 예약 조회 및 환불버튼 추가 할 얘정입니다!! -->

<div><jsp:include page="../main/header.jsp"/></div>
<div class="main">
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-link"  href="admin_reservation.jsp">예약현황</a>
    <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="admin_reservation2.jsp">결제대기</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="admin_reservation3.jsp">결제완료</a>
  </li>
  <li class="nav-item dropdown event-dropdown">
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
 </div>
	<%
	PayDBBean pdb = new PayDBBean();
	PayBean pb = new PayBean();
	Tool tool = Tool.getinstance();
	String pay_method="m";

	
	String tempPage = request.getParameter("page");
	int cPage;
	int totalPages;
	int pageLength=5;
	int totalRows = tool.getPage4();
	
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
	
	ArrayList<PayBean> pbean= pdb.adminCancle(pay_method);
	
%>	
	<div class="rightMoney">
		<div class="container-fluid">
			<p class="text-center" style="color:#767676;">
				예약변호 클릭 시 상세 조회가 가능합니다
			</p>
			<table class="table table-sm">
			<thead class="thead-dark">
			<tr align="center">
				<th scope="col">#</th>
				<th scope="col">예약번호</th>
				<th scope="col">결제금액</th>
				<th scope="col">예약자성명</th>
      			<th scope="col">결제자성명</th>
	   			<th scope="col">은행</th>
      			<th scope="col">계좌번호</th>
      			<th scope="col">환불금액</th>
			</tr>
			</thead>
<%		
			for(int i=0;i<pbean.size();i++){
					pb.setRn(1, i);
				//page 1(1-5까지 출력)
				if(cPage>1){ //페이지 1이상일 경우 6부터 일씩 증가하도록 해줌
					pb.setRn((cPage-1)*5+1, i);
				}
%>
			<tbody>	
				<tr align="center"> 
					<th scope="row"><%= pb.getRn() %></th>
					<td><a href="admin_resInfo.jsp?rsno=<%= pbean.get(i).getRsno() %>">
						<%= pbean.get(i).getRsno() %>
						</a>
					</td>
					<td><%= pbean.get(i).getPaid_amout() %></td>
					<td><%= pbean.get(i).getRname() %></td>
					<td><%= pbean.get(i).getPay_name() %></td>
					<td><%= pbean.get(i).getBank_name() %></td>
					<td><%= pbean.get(i).getBank_num() %></td>
					<td><%= pbean.get(i).getRefund_price() %></td>
				</tr>	
<%		
			}
%>			
			</tbody>
			</table>
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
					<a class="page-link" href="admin_resCancleMoney.jsp?page=<%=startPage-1 %>" aria-label="Previous">
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
					<a class="page-link" href="admin_resCancleMoney.jsp?page=<%=i %>">
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
						<a class="page-link" href="admin_resCancleMoney.jsp?page=<%= endPage+1 %>" aria-label="Next">
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
</script>
</html>			