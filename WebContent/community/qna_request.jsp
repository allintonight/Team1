<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="community.*"%>
<%
	QnaDBBean db = QnaDBBean.getInstance();
	int no = Integer.parseInt(request.getParameter("no"));
	QnaBean qna = db.getQna(no);
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
      <form name="form" method="post" action="qna_request_ok.jsp?no=<%=no%>">
         <table>
            <tr height="30">
               <td width="80">
                                   답변
               </td>
               <td width="140">
                  <input type="text" name="comment" size="20">
               </td>
        
            <tr height="50" align="center">
               <td colspan="4" width="480">
                  <input type="submit" value="입력"
                  >&nbsp;
                  <input type="reset" value="다시작성">
                  <input type="button" value="글목록"
                     onclick="location.href='qna_list.jsp'">&nbsp;
               </td>
            </tr>
         </table>
      </form>
   </center>
</body>
</html>
