	<%@ page language="java" contentType="text/html; charset=EUC-KR"
	    pageEncoding="EUC-KR"%>
	<%@ page import="community.*" %>
	
	<jsp:useBean id="post" class="community.PostBean">
	<jsp:setProperty property="*" name="post"/>
	</jsp:useBean>
	
	<%	String pageNUM = request.getParameter("pageNUM");
		int no = Integer.parseInt(request.getParameter("no"));
		post.setNo(no);
		PostDBBean db = PostDBBean.getInstance();		
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
