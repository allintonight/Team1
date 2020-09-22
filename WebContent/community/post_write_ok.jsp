<%@page import="java.awt.print.Printable"%>
<%@page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	    pageEncoding="EUC-KR"%>
<%@ page import="community.*"%>

	<jsp:useBean id="post" class="community.PostBean">
		<jsp:setProperty name="post" property="*"/>
	</jsp:useBean>
	

	
<%
		post.setUpload_file("no-file");
		post.setDate(new Timestamp(System.currentTimeMillis()));
		
		PostDBBean db=PostDBBean.getInstance();
		if(db.insertPost(post) == 1){
			response.sendRedirect("post_list.jsp");
		}else{
			response.sendRedirect("post_write.jsp");
		}
%>