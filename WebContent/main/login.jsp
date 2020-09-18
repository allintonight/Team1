<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="Login.*" %>

<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserDBBean udb = UserDBBean.getinstance();
		int re = udb.login(id, password);
		String userid = null;
		if(re == 1){
			session.setAttribute("userid", id);
%>

			<script>
				alert("관리자님 안녕하세요");
				location.href="main.jsp"
			</script>
			
<%			
		}else if(re == 0){
			session.setAttribute("userid", id);
%>
			<script>
				alert("로그인 성공");
				location.href="main.jsp"
			</script>
<%				
		}else{
%>		
		<script>
			alert("로그인 실패");
			history.back();
		</script>
<%			
		}
%>