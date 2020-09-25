<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.*" %>



<%	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	String comment = request.getParameter("comment");	
	QnaDBBean db = QnaDBBean.getInstance();
	int re = db.requestQna(comment, no);
	
	if(re == 1){
		response.sendRedirect("qna_show.jsp?no="+no+"&pageNUM="+pageNUM);
	}else {
%>
		<script>
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>