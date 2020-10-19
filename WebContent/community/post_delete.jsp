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
						<a text align="center" href="post_delete.jsp" class="alert-link"
							color="#333"> 암호를 입력하세요 <svg width="1em" height="1em"
								viewBox="0 0 16 16" class="bi bi-key" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
									d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z" />
  <path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
</svg>
						</a>
					</button>
				</div></td>
		</tr>
		<tr align="center">
			<form method="post" name="form"
				action="post_delete_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
				<br>
				<br>
				<td><input type="password" name="password" maxlength="12"
					size="-20"></td>
		</tr>
		<tr height="30">
			<br>
			<td colspan="6" align="center">
				<div class="badge">
					<button onclick="delete_ok()">
						<a>글&nbsp;삭&nbsp;제</a>
					</button>&nbsp;&nbsp;
					<button type="reset">
						<a>다시작성</a>
					</button>&nbsp;&nbsp;
					</form>
					<button
						onclick="location.href='post_show.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">
						<a>&nbsp;취&nbsp;&nbsp;소&nbsp;</a>
					</button>
				</div>
			</td>
		</tr>
		<tr height="50" align="center">
			<td colspan="4" width="480"><br>
	</table>

</body>
</html>