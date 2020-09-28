<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="java.sql.Timestamp" %>
<%@ page import="community.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

		
<%		ServletContext context = getServletContext(); //어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. 
		String pageNUM = request.getParameter("pageNUM");
		int no = Integer.parseInt(request.getParameter("no"));
		String path = context.getRealPath("post_img");
		MultipartRequest multi =new MultipartRequest(request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
	

		
		String upload_file = multi.getFilesystemName(name);
		String original = multi.getOriginalFileName(name);
		
		PostDBBean db=PostDBBean.getInstance();
		PostBean post = new PostBean();
		post = db.getPost(no);

		post.setUpload_file(upload_file);
		post.setDate(new Timestamp(System.currentTimeMillis()));
		post.setPassword(multi.getParameter("password"));
		post.setTitle(multi.getParameter("title"));
		post.setContent(multi.getParameter("content"));
		
		
		int re = db.editPost(post);
		if(re == 1){		
%>
		<script>
				alert("글이 수정되었습니다");		
		</script>
<%
			response.sendRedirect("post_list.jsp?pageNUM="+pageNUM);
		}else if(re == 0){
%>
			<script>
				alert("비밀번호가 맞지 않습니다");
				history.go(-1);
			</script>
<%
		}else{
			%>
				<script>
				alert("수정에 실패했습니다");
				history.go(-1);
			</script>
<%
	}
%>	