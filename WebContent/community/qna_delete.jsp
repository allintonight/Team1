<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Community.*"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNUM = request.getParameter("pageNUM");
%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.alert button {
	width: 350px;
	border-radius: 10px; 
	background-color: #585858;
	height: 50px;
}
.alert button a {
	text-decoration: none;
	color: azure;
}
.badge button {
	border-radius: 70px;
	background-color: #585858;
	height: 27px;
}
.badge button a {
	text-decoration: none;
	color: azure;
}
</style>
<script type="text/javascript" src="function.js" charset="utf-8"></script>
</head>

<body>

	<table align="center">
		<tr height="50">
			<td colspan="2" align="center"><br>
				<div class="alert" align="center">
					&nbsp;&nbsp;
					<button>
						<a href="post_delete.jsp" class="alert-link" color="#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<<
							암호를 입력하세요
							>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</button>
				</div></td>
		</tr>
		<tr align="center">
			<form method="post" name="form"
				action="qna_delete_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
				<td width="-20"><br> <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;암&nbsp;&nbsp;&nbsp;호
					&nbsp;&nbsp;<svg width="1em" height="1em" viewBox="0 0 16 16"
						class="bi bi-lock-fill" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
<path
							d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z" />
<path fill-rule="evenodd"
							d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z" />
</svg>
			<td><br> <br> <input type="password" name="password"
				maxlength="12" size="-20"></td>
		</tr>
		<tr height="30">
			<br>
			<br>
			<br>
			<br>
			<td colspan="4" align="center"><br><br>
				<div class="badge">
					<button onclick="delete_ok()">
						<a>글삭제</a>
					</button>
					<button type="reset">
						<a>다시작성</a>
					</button>
					</form>
					<button
						onclick="location.href='qna_show.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">
						<a>취소</a>
					</button>
				</div></td>
		</tr>
		<tr height="50" align="center">
			<td colspan="4" width="480"><br>
	</table>
	
</body>
</html>