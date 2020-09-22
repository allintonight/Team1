<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	
	QnaDBBean db = QnaDBBean.getInstance();
	QnaBean qna=db.getQna(no); 
	String pwd = db.secretQna(qna);
	
	if(password.equals(pwd)){
		response.sendRedirect("qna_show.jsp?no="+no);
	}else{
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}
%>