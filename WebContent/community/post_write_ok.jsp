<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="java.sql.Timestamp" %>
<%@ page import="Community.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	
<%	
	ServletContext context = getServletContext();
	String path = context.getRealPath("/post_img");
	MultipartRequest multi =new MultipartRequest(request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String name = (String) files.nextElement();
	
	String upload_file = multi.getFilesystemName(name);
	String original = multi.getOriginalFileName(name);
	PostBean post = new PostBean();
	post.setUpload_file(upload_file);
	post.setDate(new Timestamp(System.currentTimeMillis()));
	post.setName(multi.getParameter("name"));
	post.setPassword(multi.getParameter("password"));
	post.setEmail(multi.getParameter("email"));
	post.setTitle(multi.getParameter("title"));
	post.setContent(multi.getParameter("content"));
	
	
	
	PostDBBean db=PostDBBean.getInstance();
	if(db.insertPost(post) == 1){
		response.sendRedirect("post_list.jsp");
	}else{
		response.sendRedirect("post_write.jsp");
	}
		
%>