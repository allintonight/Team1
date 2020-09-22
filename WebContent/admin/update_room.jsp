<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Room.*" %> 
<%@ page import="java.sql.ResultSet" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.form{
		width:100%;
		position:relative;
		margin-top:10%;
	}
	table{
		width:600px;
		border: 1px solid #444444;
    	border-collapse: collapse;
	}
	td{
		text-align:center;
		height:30px;
		border: 1px solid #444444;
    	border-collapse: collapse;
	}
	input{
	 	width:480px;
	 	height:30px;
	 	font-size:15px;
	}
	.buttonOk,.buttonD{
		border-radius:5px;
		width:80px;
	}
	.buttonOk{
		background-color: #505050;
		color:white;
		font-size:15px;
	}
	.buttonD{
		background-color:#B9062F;
		color:white;
		font-size:15px;
	}
</style>
</head>
<body>
	<%
	String roomno = request.getParameter("rno");
	int rno = Integer.parseInt(roomno);
	RoomDBBean rdb = RoomDBBean.getinstance();
	ResultSet roombean = rdb.selectRoom(rno);
	while(roombean.next()){
	%>
		<div class="form">
			<form method="post" action="update_roomOk.jsp?rno=<%= rno %>">
			<table align="center">
				<tr>
					<td width="200px">방 번호</td>
					<td><input type="text" name="rno" value="<%= roombean.getInt(1) %>" readonly></td>
				</tr>
				<tr>
					<td width="200px">방 이름</td>
					<td><input type="text" name="rname" value="<%= roombean.getString(2) %>"></td>
				</tr>
				<tr>
					<td width="200px">인원수</td>
					<td><input type="text" name="men" value="<%= roombean.getInt(3) %>"></td>
				</tr>
				<tr>
					<td width="200px">평일가격</td>
					<td><input type="text" name="weekday" value="<%= roombean.getInt(4) %>"></td>
				</tr>
				<tr>
					<td width="200px">주말가격</td>
					<td><input type="text" name="weekend" value="<%= roombean.getInt(5) %>"></td>
				</tr>
				<tr>
					<td width="200px">성수기가격</td>
					<td><input type="text" name="sweekday" value="<%= roombean.getInt(6) %>"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="수정완료" class="buttonOk">
					<input type="button" value="방 삭제하기" class="buttonD"
							onclick="window.location.href='delete_room.jsp?rno=<%=rno %>'">
					</td>
				</tr>
			</table>
			</form>
			
		</div>
	<%
	}
	%>	
</body>
</html>