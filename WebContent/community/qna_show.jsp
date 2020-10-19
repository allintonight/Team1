<%@ page import="Community.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	QnaDBBean db=QnaDBBean.getInstance();
	QnaBean qna = db.getQna(no);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String userid = (String)session.getAttribute("userid");
	if(userid==null){
		userid="guest";
	}
	
	String name="";
	String email="";
	String title="";
	String content="";
	String comment="";
	Timestamp date=null;
	
	if(qna != null){
		no = qna.getNo();
		name = qna.getName();
		email= qna.getEmail();
		title = qna.getTitle();
		content = qna.getContent();		
		date = qna.getDate();
		comment = qna.getComment();
	}
%>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
	<body>
		<center>
			<h1>
				글 내 용 보 기
			</h1>
			<form name="form" method="post"
				action="qna_comment_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
			<table border="2" width="800" align="center">
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
						작성자
					</td>
					<td width="200"><svg width="1em" height="1em"
						viewBox="0 0 16 16" class="bi bi-person" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
							d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
</svg>
						<%= name %>
					</td>
					<td width="100">
						이메일
					</td>
					<td width="200">
						<%= email %>
					</td>					
					
				</tr>
				<tr height="30" align="center">
					<td width="100">
						글제목
					</td>
					<td width="200" colspan="3">
						<%= title %>
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
				<tr height="30" align="center">
					<td width="100">
						답변
					</td>
					<td width="200" colspan="3">
						 <%if(userid.equals("admin")){ %>
						 <textarea rows="10" cols="60" name="comment"/><%}else{ %>
						<textarea rows="10" cols="60" readonly><%if(comment!=null)%><%=comment%></textarea><%} %>
					</td>
				</tr>
				
				<tr height="30">
					<td colspan="4" align="right">
					
			<!--  관리자만 답변  -->
				 <%if(userid.equals("admin")){ %>
                  			<a href="#"
							class="badge badge-pill badge-dark" role="button"
							aria-pressed="true" onclick="check_cmt()">답변</a><%} %>
					<a href="#"
					class="badge badge-pill badge-dark" role="button"
					aria-pressed="true"
					onclick="location.href='qna_edit.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">글수정</a>

					<a href="#" class="badge badge-pill badge-dark" role="button"
					aria-pressed="true"
					onclick="location.href='qna_delete.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">글삭제</a>

					<a href="#" class="badge badge-pill badge-dark" role="button"
					aria-pressed="true"
					onclick="location.href='qna_list.jsp?pageNUM=<%=pageNUM%>'">글목록</a>
				
					</td>
				</tr>
			</table>
			</form>
		</center>
	</body>
</html>