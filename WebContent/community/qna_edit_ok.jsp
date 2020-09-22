<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.*" %>

<jsp:useBean id="qna" class="community.QnaBean">
	<jsp:setProperty property="*" name="qna"/>
</jsp:useBean>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	qna.setNo(no);
	
	QnaDBBean db = QnaDBBean.getInstance();
	int re = db.editQna(qna);
	
	if(re == 1){
		response.sendRedirect("qna_list.jsp");
	}else if(re == 0){
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script>
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>