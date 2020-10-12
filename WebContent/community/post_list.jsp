<%@ page import="community.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	request.setCharacterEncoding("UTF-8");	
	String pageNUM = request.getParameter("pageNUM");
	if(pageNUM==null){
		pageNUM="1";
	}
	
	String subject = request.getParameter("subject");
	String word = request.getParameter("word");	
	PostDBBean db=PostDBBean.getInstance();
	ArrayList<PostBean> PostList = db.listPost(pageNUM, subject, word);	
	String name,email,title,content,password,upload_file;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int no=0;
	Timestamp date;
	out.println(pageNUM);
	out.println(subject);
	out.println(word);
	
%>
<html>

	<head>
		<title>
		</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	</head>
	
	<body>
		<center>
			<h1>후 기</h1>
		</center>

	<table class="table table-hover" align="center">
	<thead class="thead-dark">
				<th col="scope">번호
				</th>
				<th col="scope">글제목
				</td>
				<th col="scope">작성자
				</th>
				<th col="scope">작성일자
				</th>
			</tr>
			<tbody>
			<%
				for(int i=0; i<PostList.size(); i++){
					PostBean post = PostList.get(i);
					
					no = post.getNo();
					title = post.getTitle();
					name = post.getName();
					email = post.getEmail();
					date = post.getDate();
					
			%>
				<tr height="25" bgcolor="#f7f7f7"
					onmouseover="this.style.backgroundColor='#88888'"
					onmouseout="this.style.backgroundColor='#f7f7f7'">
					
				<td col="scope">
						<%= no %>
				</td>
					<td col="scope"><a href="post_show.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
						<%= title %>
						</a>
					</td>
					<td col="scope">
						<a href="mailto:<%=email%>">
							<%=name%>
						</a>
						</td>
						<td col="scope">
						<%= sdf.format(date)%>
					</td>
				</tr>
			<%
				}
			%>
			</tbody>
			</thead>
		</table>
		<form name="form" method="post" action="post_list.jsp">
		<table width="600" aling="center" class="table table-borderless">
			<tr>
			<td align="left">
			<%= PostBean.pageNumber(2) %>
			</td>
			<td align="center">
			<select name="subject">
			<option value="1">제목 또는 내용</option>
			<option value="2">작성자</option>
		</select>&nbsp;&nbsp;<input type="text" name="word">&nbsp;&nbsp;<input type="submit" value="검색">
			</td>
				<td>
					<a href="post_write.jsp?pageNUM=<%=pageNUM%>" align="right" >글 쓰 기</a><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
				</td>
			</tr>
		</table>
		
	</body>
	
</html>