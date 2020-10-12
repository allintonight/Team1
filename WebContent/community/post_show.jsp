a<%@ page import="community.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	PostDBBean db=PostDBBean.getInstance();
	PostBean post = db.getPost(no);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	ArrayList<PostCmt> PostCmtList = db.listPostCmt(no);
	
	String name="";
	String email="";
	String title="";
	String content="";
	String upload_file="";
	Timestamp date=null;
	
	if(post != null){
		no = post.getNo();
		name = post.getName();
		title = post.getTitle();
		content = post.getContent();
		upload_file = post.getUpload_file();
		date = post.getDate();
	}
	out.print(upload_file);
%>
<html>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<body>
		<center>
			<h1>
				글 내 용 보 기
			</h1>
			<table border="1" width="600">
				<tr height="30" align="center">
					<td width="100">
						글번호
					</td>
					<td width="200">
						<%= no %>
					</td>
					<td width="100">
						작성일
					</td>
					<td width="200">
						<%= date %>
					</td>
			    </tr>
				<tr height="30" align="center">
					<td width="100">
						글제목
					</td>
					<td width="200">
						<%= title %>
					</td>
					<td width="100">
						작성자
					</td>
					<td width="200">
						<%= name %>
					</td>
					
				</tr>
			
				<tr height="30" align="center">
					<td width="100">
						사진
					</td>
					<td width="200" colspan="3">
						<img src="../post_img/<%=upload_file%>" width="300" height="210">
					</td>
				</tr>
				<tr height="30" align="center">
					<td width="100">
						글내용
					</td>
					<td width="200" colspan="3">
						<textarea rows="10" cols="60" readonly><%=content%></textarea>
					</td>
				</tr>
				<tr height="30">
					<td colspan="4" align="right">
						<input type="button" value="글수정"
						onclick="location.href='post_edit.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">
						<input type="button" value="글삭제"
						onclick="location.href='post_delete.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">
						<input type="button" value="글목록"
						onclick="location.href='post_list.jsp?pageNUM=<%=pageNUM%>'">
					</td>
				</tr>
			</table>
		</center>
	</body>
	<footer>
	<center>
<table class="table table-hover" align="center">
			<tbody>
			<%
				for(int i=0; i<PostCmtList.size(); i++){
					PostCmt postcmt = PostCmtList.get(i);
					
					int cno = postcmt.getCno();
					String cname = postcmt.getName();
					String cpassword = postcmt.getPassword();
					String ccomment = postcmt.getComment();
					Timestamp cdate = postcmt.getDate();
					
			%>
				<tr height="25" bgcolor="#f7f7f7"
					onmouseover="this.style.backgroundColor='#88888'"
					onmouseout="this.style.backgroundColor='#f7f7f7'">
					

					<td col="scope">
						<%= cname %>
						</a>
					</td>
					<td col="scope">
							<%=ccomment%>
						</a>
						</td>
						<td col="scope">
						<%= sdf.format(cdate)%>
					</td>
					<td><input type="button" value="댓글삭제"
						onclick="location.href='post_comment_delete.jsp?no=<%=no%>&password=<%=cpassword%>&pageNUM=<%=pageNUM%>&cno=<%=cno%>'">
					</td>
				</tr>
			<%
				}
			%>
			</tbody>
			</thead>
		</table>
		<form name="form" method="post" action="post_comment_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
			<table align="center">
			<tr height="30" align="center">
					<td width="60">작성자</td>
					<td width="120"><input type="text" name="name" size="12">
					</td>
					<td width="60">비밀번호</td>
					<td width="120"><input type="password" name="password" size="12">
					</td>
					<td>
						<input type="submit" value="댓글달기">
					</td>
			</tr>
			<tr height="30" align="center">
					<td width="200" colspan="5">
					<textarea name="comment" rows="3" cols="65"></textarea>
					</td>
			</tr>
			</table>	
	</form>	
	</center>
	</footer>
</html>