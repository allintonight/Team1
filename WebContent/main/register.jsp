<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Login.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="userbean" class="Login.UserBean"/>
<jsp:setProperty property="*" name="userbean"/>    


<%
		
		UserDBBean udb = UserDBBean.getinstance();
		
		int re = udb.checkid(userbean.getId());
		if(re==-1){
			int regi = udb.insertMember(userbean);
			if(regi==1){
%>
		<script>
			alert("회원가입 성공");
			location.href="main.jsp"
		</script>
<%
			}else{
%>
		<script>
			alert("다시 시도해 주세요");
			location.href="main.jsp"
		</script>
<%				
			}
			
		}else{
%>
			<script>
				alert("이미 존재하는 아이디입니다");
				history.back();
			</script>
<%			
		}
%>