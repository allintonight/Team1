<%@ page import="Community.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String pageNUM = request.getParameter("pageNUM");
	PostDBBean db = PostDBBean.getInstance();
	int no = Integer.parseInt(request.getParameter("no"));
	PostBean post = db.getPost(no);
	String email = post.getEmail();
	String name = post.getName();
	String upload_file = post.getUpload_file();
	
	
	
	if (upload_file != null) {
	out.print(upload_file);}
%>

<html>
<head>
</head>
<body>
	<script type="text/javascript" src="function.js" charset="utf-8"></script>

	<center>
		<h1>글 수 정 하 기</h1>
		<form method="post" name="form" enctype="multipart/form-data"
			accept-charset="UTF-8"
			action="post_edit_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140"><input type="text" value="<%=name%>" size="10"
						readonly></td>
					<td width="80">이메일</td>
					<td width="200"><input type="text" value="<%=email%>"
						size="15" readonly></td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3" width="460"><input type="text" name="title"
						size="55" value="<%=post.getTitle()%>"></td>
				</tr>
				<tr height="30">
					<td width="80">파일 업로드</td>
					<td colspan="3" width="460">
					
					<input type="file" value="../post_img/<%=post.getUpload_file()%>" 
						name="upload_file" size="55">이전파일 : <%=post.getUpload_file()%></td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="content" rows="10" cols="65"><%=post.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">암&nbsp;&nbsp;호</td>
					<td width="460" colspan="3"><input type="password"
						name="password" maxlength="12" size="12"></td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4" width="480"><input type="submit"
						onclick="check_ok()" value="글수정"> <input type="reset"
						value="다시작성"> <input type="button" value="글목록"
						onclick="location.href='post_list.jsp?pageNUM=<%=pageNUM%>'">&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>