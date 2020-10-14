<%@ page import="Community.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String pageNUM = request.getParameter("pageNUM");
%>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<script type="text/javascript" src="function.js" charset="utf-8"></script>
<body>
	<center>
		<h1>글 올 리 기</h1>
		<form method="post" name="form" enctype="multipart/form-data" accept-charset="UTF-8" action="post_write_ok.jsp">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140"><input type="text" name="name" size="10">
					</td>
					<td width="80">이메일</td>
					<td width="200"><input type="text" name="email" size="15">
					</td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3" width="460"><input type="text" name="title"
						size="55"></td>
				</tr>
				<tr height="30">
					<td width="80">파일 업로드&nbsp;<svg width="1em" height="1em"
							viewBox="0 0 16 16" class="bi bi-card-image" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
								d="M14.5 3h-13a.5.5 0 0 0-.5.5v9c0 .013 0 .027.002.04V12l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094L15 9.499V3.5a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm4.502 3.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" />
</svg></td>
					<td colspan="3" width="460"><input type="file" value="파일"
						name="upload_file" size="55"></td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="content" rows="10" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">암&nbsp;&nbsp;호&nbsp;<svg width="1em"
							height="1em" viewBox="0 0 16 16" class="bi bi-lock-fill"
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path
								d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z" />
  <path fill-rule="evenodd"
								d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z" />
</svg></td>
					<td width="460" colspan="3"><input type="password"
						name="password" maxlength="12" size="12"></td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4" width="480"><br>
					<br>
					<input class="btn btn-secondary" type="button" value="글쓰기"
						onclick="check_ok()">&nbsp;&nbsp; <input
						class="btn btn-secondary" type="reset" value="다시작성">&nbsp;&nbsp;
						<input type="button" class="btn btn-secondary" value="글목록"
						onclick="location.href='post_list.jsp'">&nbsp;</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>










