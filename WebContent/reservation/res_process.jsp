<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Room.*" %> 
<%@ page import="java.sql.ResultSet" %>   
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		int newLine = Integer.parseInt(request.getParameter("newLine"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		String iUseDate = request.getParameter("iUseDate");
		String str = new String(request.getParameter("iUseDate"));
		
		RoomDBBean rdb = RoomDBBean.getinstance();
		ResultSet roombean = rdb.selectRoom(rno);
		
		//관리자가 성수기 날짜 지정 가능하게할지 안할지 물어보기 ㅠㅠ...
		String fromday = str.substring(0, 4)+"-"+"07-15";
		Date from = fm.parse(fromday);
		
		String endday = str.substring(0, 4)+"-"+"08-20";
		Date end = fm.parse(endday);
		
		Date reday = fm.parse(iUseDate);
		
		int result = reday.compareTo(from); // 선택 날짜와 성수기시작 날짜 비교 -값 : 성수기 전, +값 : 성수기
		int result2 = reday.compareTo(end); // 선택 날짜와 성수기 마지막 날짜 비교 +값 : 성수기 후 -값 : 성수기
		
		while(roombean.next()){
		if(result < 0 || result2 > 0){ //성수기 시작 날짜보다 작거나 성수기 마지막 날짜보다 클 때 => 성수기 아님
			if(newLine == 0 || newLine == 6){
				out.println("비수기 주말 "+roombean.getInt(5));
			}else{
				out.println("비수기 평일 "+roombean.getInt(4));
			}
		}else{
				out.println("성수기 "+roombean.getInt(6));
		}	
	}
%>
</body>
</html>