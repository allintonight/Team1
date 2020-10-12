<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.*" %>
<%request.setCharacterEncoding("UTF-8");%>


<%	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	String comment = request.getParameter("comment");	
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	Timestamp date = new Timestamp(System.currentTimeMillis());
	PostDBBean db = PostDBBean.getInstance();
	PostCmt postcmt = new PostCmt();
	postcmt.setNo(no);
	postcmt.setName(name);
	postcmt.setPassword(password);
	postcmt.setComment(comment);
	postcmt.setDate(date);
	
	int re = db.insertPostCmt(no, postcmt);
	if(re == 1){
		response.sendRedirect("post_show.jsp?no="+no+"&pageNUM="+pageNUM);
	}else{
		response.sendRedirect("post_list.jsp");
	}
%>
	
