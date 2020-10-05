<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Room.*" %>
<%@ page import="java.util.ArrayList" %>     
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판 관리</title>
    <link rel="stylesheet" href="../../bootstrap/bootstrap.min.css" />
    <style>
 .table{
 	width:800px;
 }
 .btn{
 	position:relative;
 	left:35%;
 	top:40px;
 }
 .text{
 	position:relative;
 	left:15%;
 	top:40px;
 }
 th, td{
 	text-align:center;
 }
</style>
  </head>
  <body>
 <%
	RoomDBBean rdb = RoomDBBean.getinstance();
	ArrayList<RoomBean> roombean = rdb.getAll();
%>
<table class="table table-borderless" align="center">
<tr>
<th class="text text-secondary">*현재 생성하여 사용중인 게시판의 내역을 확인하고 관리할 수 있는 페이지 입니다.*</th>
</tr>
<tr><td><td></td></tr>
</table>

    <table class="table table-hover" align="center">
      <form name="board" method="post">
      <thead class="thead-dark">
        <tr class="table table-hover" align="center">
          <th scope="col">게시판 타이틀</td>
          <th scope="col">게시물</td>
          <th scope="col">사용정보</td>
        </tr>
        </thead>
      <tbody>      
        <tr align="center" height="28">
          <td>공지사항</td>
          <td><%/*bbs의 자료갯수*/%></td>
          <td>
            <input
              type="button"
              value=" 게시물 관리 "
              onClick="void(window.open('../../community/post_list.jsp', 'mpl', 'width=1200,height=500,resizable=yes'))"
            />
            <input
              type="button"
              value=" 백업 "
              onClick="location.href='/admin/component/menu.php?component=board&file=bbs_backup&board_code=1'"
            />
          </td>
        </tr>
        <tr align="center" height="28">
          <td>Q&A</td>
          <td><%/*Q&A의 자료갯수*/%></td>
          <td>
            <input
              type="button"
              value=" 게시물 관리 "
              onClick="void(window.open('../../community/qna_list.jsp', 'mpl','width=1200,height=500,resizable=yes'))"
            />
            <input
              type="button"
              value=" 백업 "
              onClick="location.href='/admin/component/menu.php?component=board&file=bbs_backup&board_code=1'"
            />
          </td>
        </tr>
        <tr align="center" height="28">
          <td>여행후기</td>
          <td><%/*post의 자료갯수*/%></td>
          <td>
            <input
              type="button"
              value=" 게시물 관리 "
              onClick="void(window.open('../../community/post_list.jsp', 'mpl', 'width=1200,height=500,resizable=yes'))"
            />
            <input
              type="button"
              value=" 백업 "
              onClick="location.href='/admin/component/menu.php?component=board&file=bbs_backup&board_code=1'"
            />
          </td>
        </tr>
      </form>
    </table>
  </body>
</html>
