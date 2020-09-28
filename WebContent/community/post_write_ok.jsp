<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="java.sql.Timestamp" %>
<%@ page import="community.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	    pageEncoding="EUC-KR"%>
	
<%	
	ServletContext context = getServletContext(); //어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. 
	String path = context.getRealPath("post_img");
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