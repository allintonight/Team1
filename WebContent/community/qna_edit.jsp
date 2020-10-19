<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Community.*"%>
<%
	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	QnaDBBean db = QnaDBBean.getInstance();
	QnaBean qna = db.getQna(no);
%>
<html>
<head>
<title></title>
</head>
<body>
<script language="JavaScript" src="fucntion.js" charset="utf-8"></script>
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="form" method="post" action="qna_edit_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140"><input type="text" name="name" size="10"
						value="<%=qna.getName()%>"></td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3"><input type="text" name="title" size="55"
						value="<%=qna.getTitle()%>"></td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="content" rows="10" cols="65">
								<%=qna.getContent()%>
							</textarea></td>
				</tr>
				<tr>
					<td width="80">암&nbsp;&nbsp;호</td>
					<td>
					<input type="password" name="password"size="12"></td>
					<td width="80">
                  		비&nbsp;밀&nbsp;글
                    </td>
               		<td>
               			<input type="checkbox" name="secret" value="1">
               		</td>
				</tr>

				<tr height="50" align="center">
					<td colspan="4"><input type="submit" value="글수정"
						>&nbsp;&nbsp;&nbsp; <input
						type="reset" value="다시작성">&nbsp; <input type="button"
						value="글목록" onclick="location.href='qna_list.jsp?pageNUM=<%=pageNUM%>'"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>