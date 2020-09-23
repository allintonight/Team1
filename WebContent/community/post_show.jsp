<%@ page import="community.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	PostDBBean db=PostDBBean.getInstance();
	PostBean post = db.getPost(no);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
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
%>
<html>
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
						사진업로드
					</td>
					<td width="200" colspan="3">
						<%=upload_file %>
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
						onclick="location.href='post_edit.jsp?no=<%=no%>'">
						<input type="button" value="글삭제"
						onclick="location.href='post_delete.jsp?no=<%=no%>'">
						<input type="button" value="글목록"
						onclick="location.href='post_list.jsp'">
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>