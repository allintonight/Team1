<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn=null; 
		try{
			String url="jdbc:mysql://localhost:3306/mydb";
			String user="root";
			String password="1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, user, password);
			out.print("데이타베이스 연결에 성공하였습니다.<br>");
		}catch(SQLException ex){
			out.print("데이터베이스 연결이 실패했습니다.<br>");
			out.print("SQLException: "+ex.getMessage());
		}finally{
			if(conn!=null){
				conn.close();
			}
		}
	%>

</body>
</html>