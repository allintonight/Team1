<%@ page import="community.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	PostDBBean db = PostDBBean.getInstance();
	PostBean post = db.getPost(no);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	String name = "";
	String email = "";
	String title = "";
	String content = "";
	String upload_file = "";
	Timestamp date = null;

	if (post != null) {
		no = post.getNo();
		name = post.getName();
		title = post.getTitle();
		content = post.getContent();
		upload_file = post.getUpload_file();
		date = post.getDate();
	}
%>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<body>
	<center>
		<h1>글 내 용 보 기</h1>
		<table border="2" width="800">
			<tr height="30" align="center">
				<td width="100">글번호</td>
				<td width="200"><%=no%></td>
				<td width="100">작성일</td>
				<td width="200"><%=date%></td>
			</tr>
			<tr height="30" align="center">
				<td width="100">글제목</td>
				<td width="200"><%=title%></td>
				<td width="100">작성자</td>
				<td width="200"><%=name%></td>

			</tr>

			<tr height="30" align="center">
				<td width="100">글내용</td>
				<td width="200" colspan="3"><img
					src="../post_img/<%=upload_file%>"<textarea rows="10" cols="60"
						readonly><%=content%></textarea></td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right"><input type="button" value="글수정"
					onclick="location.href='post_edit.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">
					<input type="button" value="글삭제"
					onclick="location.href='post_delete.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">
					<input type="button" value="글목록"
					onclick="location.href='post_list.jsp?pageNUM=<%=pageNUM%>'">
				</td>
			</tr>
		</table>
	</center>

	<br>

	<!--답 변 달 기  -->
	<center>
		<h1>답 글 쓰 기</h1>
		<form method="post" name="form" action="post_comment_ok.jsp">
			<table border="2" width="800">

				<tr height="30" align="center">
					<td width="100">답글작성자</td>
					<td width="200"><input type="text" name="name" size="10"></td>

					<td width="100">답글비밀번호</td>
					<td width="200"><input type="text" name="password" size="10"></td>
				</tr>


				<tr height="30" align="center" colspan="4">
					<td width="100" align="center">답글내용</td>
					<td colspan="3"><textarea name="cmt" rows="4" cols="65"></textarea>
					</td>
				</tr>


				<tr height="30">
					<td colspan="4" align="right"><input type="button"
						value="답글쓰기"
						onclick="location.href='post_comment_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">
						<input type="button" value="답글수정"
						onclick="location.href='post_comment_edit.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">
						<input type="button" value="답글삭제"
						onclick="location.href='post_comment_delete.jsp?pageNUM=<%=pageNUM%>'">
					</td>
				</tr>
			</table>
	</center>

</body>
</html>