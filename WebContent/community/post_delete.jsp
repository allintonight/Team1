<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNUM = request.getParameter("pageNUM");
%>

<html>
	<head>
		<script type="text/javascript" src="function.js" charset="utf-8"></script>
	</head>
	<body>
		<center>
			<form method="post" name="form" action="post_delete_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
				  <table>
				  	<tr height="50">
				  		<td colspan="2" align="left">
				  			<b><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-lock-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z"/>
  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z"/>
</svg> 암호를 입력하세요.</b>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td width="80">
				  			암&nbsp;&nbsp;호
				  		</td>
				  		<td>
				  			<input type="password" name="password" maxlength="12" size="12">
				  		</td>
				  	</tr>
				  	<tr height="50" align="center">
				  		<td colspan="2">
				  			<input type="button" value="글삭제" 
				  				onclick="delete_ok()">&nbsp;&nbsp;
				  			<input type="reset" value="다시작성">&nbsp;&nbsp;
				  			<input type="button" value="글목록" 
				  			onclick="location.href='post_list.jsp?pageNUM=<%=pageNUM%>'">
				  		</td>
				  	</tr>
				  </table>
			</form>
		</center>
	</body>
</html>