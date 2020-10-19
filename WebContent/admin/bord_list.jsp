<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Community.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
    <%
    QnaBean qna = new QnaBean();
    QnaDBBean db =QnaDBBean.getInstance();

    Connection con =db.getConnection();
    Statement stmt = null;
    ResultSet rs=null;
    int qna_cnt=0;
    int post_cnt=0;
    try{
    	String sql ="select * from qna where comment is null";	
    	stmt =con.createStatement();
    	rs=stmt.executeQuery(sql);
    	if(rs.next()){
    		while(true){
    			qna_cnt++;
    			if(rs.isLast())break;
    			else rs.next();
    		}	
    	}
    	Date day = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	day.setDate(day.getDate()-1);
    	sql ="select * from post where date >= '" + sdf.format(day) + "'";
    	stmt =con.createStatement();
    	rs=stmt.executeQuery(sql);
    	if(rs.next()){
    		while(true){
    			post_cnt++;
    			if(rs.isLast())break;
    			else rs.next();
    		}	
    	}   	
    	
    	
    }catch(SQLException ex){
    	out.println("테이블을 불러오지 못했습니다.");
    	out.println("SQLException : " + ex.getMessage());
    	
    }finally{
    	if(rs != null) 
    		rs.close();
    	if(stmt !=null)
    		stmt.close();
    	if(con != null)
    		con.close();
    }
    
    %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판 관리</title>
    <link rel="stylesheet" href="../../bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <style>
 .table{
 	width:800px;
 }

 .text{
 	margin:0 auto;
 	top:40px;
 }
 .th_center, td{
 	text-align:center;
 }
 .fa-plus-square{
	color:red;
 }
</style>
  </head>
  <body>

<jsp:include page="../main/header.jsp"/>
<jsp:include page="../main/header2.jsp"/>

<table class="table table-borderless" align="center">
<tr>
<th class="text text-secondary th_center">*현재 생성하여 사용중인 게시판의 내역을 확인하고 관리할 수 있는 페이지 입니다.*</th>
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
          <td>1</td>
          <td>
            <input
              type="button"
              value=" 게시물 관리 "
              onClick="void(window.open('../main/information.jsp', 'mpl', 'width=1200,height=500,resizable=yes'))"
            />
          </td>
        </tr>
        <tr align="center" height="28">
          <td>Q&A <%if (qna_cnt!=0) { %><i class="far fa-plus-square"></i><%} %></td>
          <td><%=qna_cnt%></td>
          <td>
            <input
              type="button"
              value=" 게시물 관리 "
              onClick="window.location.href='../admin/admin_qna_list.jsp'"
            />
          </td>
        </tr>
        <tr align="center" height="28">
          <td>여행후기 <%if (post_cnt!=0) { %><i class="far fa-plus-square"></i><%} %></td>
          <td><%=post_cnt%></td>
          <td>
            <input
              type="button"
              value=" 게시물 관리 "
              onClick="void(window.open('../community/post_list.jsp', 'mpl', 'width=1200,height=500,resizable=yes'))"
            />

          </td>
        </tr>
      </form>
    </table>
  </body>
</html>
