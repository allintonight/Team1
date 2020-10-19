<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page import="Community.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="qna" class="Community.QnaBean">
	<jsp:setProperty name="qna" property="*" />
</jsp:useBean>
<%	
    qna.setDate(new Timestamp(System.currentTimeMillis()));
	qna.setComment(null);
    QnaDBBean db = QnaDBBean.getInstance();
   
	if (db.insertQna(qna) == 1) {
	response.sendRedirect("qna_list.jsp");
	} else {
	response.sendRedirect("qna_write.jsp");
	}
    
	
%>