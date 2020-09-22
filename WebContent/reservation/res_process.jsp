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
		int price = 0;
		
		RoomDBBean rdb = RoomDBBean.getinstance();
		ResultSet roombean = rdb.selectRoom(rno);
		
		//성수기 날짜 지정 가능하게 할지 안하게할지 물어보기 ㅠㅠ
		String fromday = str.substring(0, 4)+"-"+"07-15";
		Date from = fm.parse(fromday);
		
		String endday = str.substring(0, 4)+"-"+"08-20";
		Date end = fm.parse(endday);
		
		String choday = str.substring(0, 4)+"-"+str.substring(4, 6)+"-"+str.substring(6, 8);
		Date reday = fm.parse(choday);
		
		int result = reday.compareTo(from); // 선택 날짜와 성수기시작 날짜 비교 -값 : 성수기 전, +값 : 성수기
		int result2 = reday.compareTo(end); // 선택 날짜와 성수기 마지막 날짜 비교 +값 : 성수기 후 -값 : 성수기
		
		while(roombean.next()){
		if(result < 0 && result2 > 0){ //성수기 시작 날짜보다 작거나 성수기 마지막 날짜보다 클 때 => 성수기 아님
			if(newLine == 0 || newLine == 6){
				price = roombean.getInt(4);
			}else{
				price = roombean.getInt(5);
			}
		}else{
				price = roombean.getInt(6);
		}
		
	}
%>

<form role="form" > 
	<p class="text-center col-sm-3">예약 하기</p>
	<div class="form-group"> 
	<label for="exampleInputEmail1">방 이름</label>
 	<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
  </div>
   <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
     <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
      </div> 
      <div class="form-group"> 
      <label for="exampleInputFile">File input</label> 
      <input type="file" id="exampleInputFile"> 
      <p class="help-block">Example block-level help text here.</p> 
      </div> <div class="checkbox"> <label>
       <input type="checkbox"> Check me out </label> </div> 
<button type="submit" class="btn btn-default">Submit</button> 
</form>

</body>
</html>