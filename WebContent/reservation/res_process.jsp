<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Room.*" %> 
<%@ page import="Main.*" %> 
<%@ page import="java.sql.ResultSet" %>   
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file ="../main/header.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/reservation_pro.css"/>
<style>
</style>
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
		
		java.util.Date dDate = new java.util.Date();

		
		String choday = str.substring(0, 4)+"-"+str.substring(4, 6)+"-"+str.substring(6, 8);
		Date reday = fm.parse(choday); //선택한날짜
		long fday = reday.getTime(); //선택한날짜에서 다음날 구하기 위해 캐스팅
		
		 dDate = new java.util.Date(fday+(1000*60*60*24*+1)); //다음날

		 String nextday = fm.format(dDate);
		  
		int result = reday.compareTo(from); // 선택 날짜와 성수기시작 날짜 비교 -값 : 성수기 전, +값 : 성수기
		int result2 = reday.compareTo(end); // 선택 날짜와 성수기 마지막 날짜 비교 +값 : 성수기 후 -값 : 성수기
		
		String selected=null;
		while(roombean.next()){
		if(rno == roombean.getInt(1)){
			selected = roombean.getString(2);
		}
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
		String name = null;
		String phone = null;
		String email = null;
		int mno = 0 ;
		UserDBBean udb = UserDBBean.getinstance();
		String id = (String)session.getAttribute("userid");
		UserBean ub = udb.memberInfo(id);
		if(session.getAttribute("userid")!= null){
			name = ub.getName();
			phone = ub.getPhone();
			email = ub.getEmail();
			mno = ub.getMno();
		}
%>

		<div id="form">
			<div id="left"></div>
			<div id="right">
				<form action="roomCheck.jsp" method="post" name="fm" onSubmit="submit_value();">
					<div class="form-group">
					<input type="hidden" id="mno" value="<%= mno %>" name="mno">
    				<label for="name">이 름</label>
    				<input type="text" class="form-control" id="name" placeholder="예약자 성명" value="<%= name %>" name="rname">
  					<label for="phone">휴대폰 번호</label>
    				<input type="text" class="form-control" id="phone" placeholder="휴대폰 번호" value="<%= phone %>" name="rphone">
    				<label for="email">Email address</label>
    				<input type="email" class="form-control" id="email" placeholder="name@example.com" value="<%= email %>" name="remail">
 					</div>
 					<div class="form-group">
    				
    				<label for="roomname">방 이름</label>
    				<select class="form-control" id="roomname" name="rno">
    				<option value="<%= rno %>"><%= selected %></option>
    				<option value="1">혼자방</option>
      				<option value="2">같이방</option>
      				<option value="3">가족방</option>
      				<option value="4">서브펜션</option>  
    				</select>
    				</div>
    				
 					<div class="form-row">
 					<label for="testDatepicker" class="check">체크인 날짜</label>
 					<input type="Date" class="form-control" id="testDatepicker" value="<%= choday %>" name="check_in">
 					<label for="testDatepicker2">체크아웃 날짜</label>
					<input type="Date" class="form-control" id="testDatepicker2" value="<%= nextday %>" name="check_out">
  					</div>
  					
  					<div class="form-group">
    				<label for="men">기본 인원</label>
    				<select class="form-control" id="men" name="usemen">
     				<option value="1">1</option>
      				<option value="2">2</option> 
    				</select>
 					<label for="addmen">추가 인원</label>
    				<select class="form-control" id="addmen" name="addmen">
    				<option value="0">0</option>
     				<option value="1">1</option>
      				<option value="2">2</option> 
    				</select>
 					</div>
 					<input value="<%= price %>" id="price" type="hidden">
 					
 					<span id="total"><b>총 금액 : <%= price %></b></span>
 					<input value="<%= price %>"   id="total2" name="price" type="hidden">
 					<div class="form-row">
 					<input type="button" value="예약하기" class="btn btn-dark res" id="btn" >
 					<input type="button" value="가능확인" onClick="location.href='roomCheck.jsp?checkin=<%= choday %>&&checkout=<%= nextday %>'"
 							class="btn btn-info" id="submit">
 					</div>
				</form>
			</div>
		</div>	
<script>
$(function () {
    $( "#testDatepicker" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	minDate: 0,
    	//체크아웃 날짜가 체크인 날짜 이전으로 선택 안되기 위해
    	onSelect: function (date) {
			var endDate = $('#testDatepicker2');
			var startDate = $(this).datepicker('getDate');
			var minDate = $(this).datepicker('getDate');
			endDate.datepicker('setDate', minDate);
			startDate.setDate(startDate.getDate() + 30);
			endDate.datepicker('option', 'maxDate', startDate);
			endDate.datepicker('option', 'minDate', minDate);
		}
	});
    
    $( "#testDatepicker2" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	minDate: 0
    });
    
});

var UserId = '<%= (String)session.getAttribute("userid") %>';

if(UserId=="null"){
	document.getElementById("name").value=null;
	document.getElementById("email").value=null;
	document.getElementById("phone").value=null;
}

$(document).ready(function(){
	$("#addmen").change(function(){
		var addmen=$('#addmen').val();
		var price = $('#price').val();
		if(addmen==1||addmen==2){
			addmen=Number(addmen);
		}
		var total = (addmen*5000)+Number(price);
		$("#total").html("<b>"+"총 금액 : "+total+"</b>");
		document.getElementById("total2").value=total;
	});
});

window.onload = function(){
	document.getElementById('btn').onclick=function(){
		document.getElementId('fm').submit();
		return false;
	}
}
</script>			
</body>
</html>