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
	out.println(subject);
	out.println(word);
	QnaDBBean db = QnaDBBean.getInstance();
	ArrayList<QnaBean> QnaList = db.listQna(pageNUM, subject, word);
	String name, password, title, content, comment;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int no = 0;
	Timestamp date;
	int secret;
	out.println(pageNUM);
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
		<h1>Q&A</h1>
	</center>
<table width="500" align="right">
		<tr>
			<td align="center"><select name="subject">
					<option value="1">제목 또는 내용</option>
					<option value="2">작성자</option>
			</select>&nbsp;&nbsp;<input placeholder="search" type="text" name="word">&nbsp;&nbsp;<input
				type="submit" value="검색"></td>
		</tr>
	</table> <br><br>


	<table class="table-responsive">
		<table class="table">
			<tr>
				<th scope="col" class="text-muted">번호</th>
				<th scope="col" class="text-muted">글제목</th>
				<th scope="col" class="text-muted">작성자</th>
				<th scope="col" class="text-muted">작성일자</th>
			</tr>
			
		<tbody>
			<%
				for (int i = 0; i < QnaList.size(); i++) {
					QnaBean qna = QnaList.get(i);
					no = qna.getNo();
					title = qna.getTitle();
					name = qna.getName();
					date = qna.getDate();
					secret = qna.getSecret();
					comment = qna.getComment();
			%>


			<td col="scope" class="text-muted" align="center"><%=no%></td>
			<%
				if (secret == 1) {
			%><td col="scope" class="text-muted" align="center"><a
				href="qna_secret.jsp?no=<%=no%>&no=<%=no%>&pageNUM=<%=pageNUM%>">
					<svg width="1em" height="1em" viewBox="0 0 16 16"
						class="bi bi-file-lock2-fill" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
							d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM7 6a1 1 0 0 1 2 0v1H7V6zm3 0v1.076c.54.166 1 .597 1 1.224v2.4c0 .816-.781 1.3-1.5 1.3h-3c-.719 0-1.5-.484-1.5-1.3V8.3c0-.627.46-1.058 1-1.224V6a2 2 0 1 1 4 0z" />
</svg><%=title%>
					<%
						if (comment != null)
									out.print("[답변완료]");
					%>
			</a></td>
			<%
				} else {
			%>
			<td col="scope" class="text-muted" align="center"><a
				href="qna_show.jsp?no=<%=no%>&no=<%=no%>&pageNUM=<%=pageNUM%>">
					<%=title%>
					<%
						if (comment != null)
									out.print("[답변완료]");
					%>
			</a></td scope="scope" class="text-muted" align="center">
			<%
				}
			%>
			<td col="scope" class="text-muted" align="center"><%=name%></td>
			<td col="scope" class="text-muted" align="center"><%=sdf.format(date)%>
			</td>
			</tr>
			<%
				}
			%>
		</tbody>
		</thead>
	</table>
	<br><br>
		<form name="form" align="right">
			<td><a href="qna_write.jsp?pageNUM=<%=pageNUM%>">글 쓰 기<svg
						width="1em" height="1em" viewBox="0 0 16 16"
						class="bi bi-pencil-square" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path
							d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
							d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg></a></td>
		</form>
		<form name="form" align="center" method="post" action="qna_list.jsp">
			<td><%=QnaBean.pageNumber(2)%></td>
		</form>
</body>
</html>