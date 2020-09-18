	<%@ page language="java" contentType="text/html; charset=EUC-KR"
	    pageEncoding="EUC-KR"%>
	<%@ page import="community.*"%>
	
	<jsp:useBean id="post" class="community.PostBean">
		<jsp:setProperty name="post" property="*"/>
	</jsp:useBean>
	
	<%
		PostDBBean pb=PostDBBean.getInstance();
		if(pb.insertPost(post) == 1){
			response.sendRedirect("post_list.jsp");
		}else{
			response.sendRedirect("post_write.jsp");
		}
%>