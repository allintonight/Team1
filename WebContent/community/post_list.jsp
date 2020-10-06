<%@ page import="Community.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
	request.setCharacterEncoding("UTF-8");
	String pageNUM = request.getParameter("pageNUM");
	if (pageNUM == null) {
		pageNUM = "1";
	}

	String subject = request.getParameter("subject");
	String word = request.getParameter("word");
	PostDBBean db = PostDBBean.getInstance();
	ArrayList<PostBean> PostList = db.listPost(pageNUM, subject, word);
	String name, email, title, content, password, upload_file;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int no = 0;
	Timestamp date;
	out.println(pageNUM);
	out.println(subject);
	out.println(word);
%>
<html>

<head>
<title></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
</head>

<body>
	<center>
		<h1>
			<div>
				POST
				<svg width="1em" height="1em" viewBox="0 0 16 16"
					class="bi bi-chat-text" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
						d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
  <path fill-rule="evenodd"
						d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z" />
</svg>
			</div>
		</h1>
	</center>


	<table width="500" align="right">
		<tr>
			<td align="center"><select name="subject">
					<option value="1">제목 또는 내용</option>
					<option value="2">작성자</option>
			</select>&nbsp;&nbsp;<input placeholder="search" type="text" name="word">&nbsp;&nbsp;<input
				type="submit" value="검색"></td>
		</tr>
	</table>



	<br>
	<br>
	<div class="table-responsive">
		<table class="table">
			<tr>
				<th scope="col" class="text-muted">번호</th>
				<th scope="col" class="text-muted">글제목</th>
				<th scope="col" class="text-muted">작성자</th>
				<th scope="col" class="text-muted">작성일자</th>
			</tr>
			</thead>

			<tbody>
				<%
					for (int i = 0; i < PostList.size(); i++) {
						PostBean post = PostList.get(i);

						no = post.getNo();
						title = post.getTitle();
						name = post.getName();
						email = post.getEmail();
						date = post.getDate();
				%>


				<td col="scope" class="text-muted" align="center"><%=no%></td>
				<td col="scope" class="text-muted" align="center"><a
					href="post_show.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>"> <%=title%>
				</a></td>
				<td col="scope" class="text-muted" align="center"><a
					href="mailto:<%=email%>"> <%=name%>
				</a></td>
				<td col="scope" class="text-muted" align="center"><%=sdf.format(date)%>
				</td>
				</tr>
				<%
					}
				%>
			</tbody>
			</thead>
		</table>
		<br>
		<br>
		<form name="form" align="right">
			<td><a href="post_write.jsp?pageNUM=<%=pageNUM%>">글 쓰 기<svg
						width="1em" height="1em" viewBox="0 0 16 16"
						class="bi bi-pencil-square" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path
							d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
							d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg></a></td>
		</form>
		<form name="form" align="center" method="post" action="post_list.jsp">
			<td><%=PostBean.pageNumber(2)%></td>
		</form>
</body>

</html>