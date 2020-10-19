<%@ page import="Community.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="EUC-KR">
   <title>Insert title here</title>
   <script type="text/javascript" src="function.js" charset="utf-8"></script>
</head>
<body>
   <center>
      <h1>
        	 답 변 올 리 기
      </h1>
      <form name="form" method="post" action="qna_comment_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
         <table>
            <tr height="30">
               <td width="80">
                                   답변
               </td>
               <td width="200" colspan="3">
						<textarea rows="10" cols="60" name="comment"></textarea>
					</td>
        
            <tr height="50" align="center">
               <td colspan="4" width="480">
                  <input type="submit" value="입력"
                  >&nbsp;
                  <input type="reset" value="다시작성">
                  <input type="button" value="글목록"
                     onclick="location.href='qna_list.jsp?pageNUM=<%=pageNUM%>'">&nbsp;
               </td>
            </tr>
         </table>
      </form>
   </center>
</body>
</html>