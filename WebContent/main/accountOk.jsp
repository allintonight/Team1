<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Main.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserDBBean udb = UserDBBean.getinstance();
	UserBean ub = new UserBean();
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	int re = udb.updateAccount(password, email, phone, id);
	
	if(re==1){
%>
		<script>
			alert("회원정보 변경 완료");
			location.href="../main.html"
		</script>
<% 		
	}else{
%>
		<script>
			alert("다시 시도 해 주세요");
			history.back();
		</script>
<%		
	}
	

%>

</head>
<body>

</body>
</html>