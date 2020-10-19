<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Community.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="qna" class="Community.QnaBean">
	<jsp:setProperty name="qna" property="*" />
</jsp:useBean>

<%	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	qna.setNo(no);
	
	QnaDBBean db = QnaDBBean.getInstance();
	int re = db.editQna(qna);
	
	if(re == 1){
		response.sendRedirect("qna_list.jsp?pageNUM="+pageNUM);
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