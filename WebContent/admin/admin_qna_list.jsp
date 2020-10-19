<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Community.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%
Date day = new java.util.Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
day.setDate(day.getDate()-5);

QnaBean qna = new QnaBean();
QnaDBBean db =QnaDBBean.getInstance();
ArrayList<QnaBean> qnaList=new ArrayList<QnaBean>();

Connection con =db.getConnection();
Statement stmt = null;
ResultSet rs=null;

%>

<html>
<style>
.th_center, td {text-align:center;}
</style>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="../main/header2.jsp"/>
		<center>
			<h1>미답변 QnA 목록</h1>
		</center>
<table class="table table-hover" align="center">
<thead class="thead-dark">
			<tr height="25">
				<th scope="col" class="th_center">번호
				</th>
				<th scope="col" class="th_center">글제목
				</th>
				<th scope="col" class="th_center">작성자
				</th>
				<th scope="col" class="th_center">작성일자
				</th>
			</tr>
			<tbody>
<%
try{
	String sql ="select * from qna where comment is null";	
	stmt =con.createStatement();
	rs=stmt.executeQuery(sql);
	if(rs.next()){
		while(true){
			%>
			<tr>
			<td><%= rs.getInt("no") %></td>
			<td>
			<% if(rs.getInt("secret")==1){%>
				<i class="fas fa-lock"></i>
			<%}
				%>
			<a href ="../community/qna_show.jsp?no=<%=rs.getInt("no")%>"><%= rs.getString("title") %></a>
			</td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("content") %></td>
			</tr>
			
			
			<%
	       	
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
