<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
         글 올 리 기
      </h1>
      <form name="form" method="post" action="qna_write_ok.jsp">
         <table>
            <tr height="30">
               <td width="80">
                  작성자
               </td>
               <td width="140">
                  <input type="text" name="name" size="10">
               </td>
               <td width="80">
                  이메일
               </td>
               <td width="200">
                  <input type="text" name="email" size="15">
               </td>
            </tr>
            <tr height="30">
               <td width="80">
                  글제목
               </td>
               <td colspan="3" width="460">
                  <input type="text" name="title" size="55">
               </td>
            </tr>
            <tr>
               <td colspan="4">
                  <textarea name="content" rows="10" cols="65"></textarea>
               </td>
            </tr>
            <tr>
               <td width="80">
                  	암&nbsp;&nbsp;호
               </td>
               <td width="200">
                  <input type="password" name="password" maxlength="12" size="12">
               </td>
               <td width="80">
                  	비&nbsp;밀&nbsp;글
               </td>
               <td>
               		<input type="checkbox" name="secret" value="1">
               </td>
               
            </tr>
            <tr height="50" align="center">
               <td colspan="4" width="480">
                  <input type="button" value="글쓰기"
                     onclick="check_ok()">&nbsp;
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

















