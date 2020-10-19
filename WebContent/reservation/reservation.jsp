<%@page import="Reservation.ReservationDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList "%>
<%@ page import="Room.*" %>
<%@ page import="Reservation.*" %>
<!-- 방 이름 넣기위한 부분 -->
<%
	RoomDBBean rdb = RoomDBBean.getinstance();
	ArrayList<RoomBean> rb = rdb.getAll();
//수정1. ****** 예약목록위해 추가하였습니다.(위쪽 Reservaion도 import 입니당)*******

//결제 부분에서 뒤로가기로 달력페이지까지 올 시에 새로고침 한번 되도록 하고
//결제 방식이 널인 값은삭제 하도록 했습니다
//한번은 자동 새로 고침, 그리고 새로고침 버튼을 추가하여 사용자가 새로고침 할 수 있도록 하였습니다
	ReservationDBBean reDB = ReservationDBBean.getinstance(); 
	ArrayList<ReservationBean> reb =reDB.getAll();
	reDB.deleteReservation();
%>

<!-- 달력 시작 -->
<% 
Calendar cal = Calendar.getInstance();
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);
if(strYear != null)
{
   year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth); 
  
}else{
}
//년도/월 셋팅
cal.set(year, month, 1);
int startDay = cal.getMinimum(java.util.Calendar.DATE); //이번달의 첫째 날
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이번달 마지막 날
int start = cal.get(java.util.Calendar.DAY_OF_WEEK); //1~7 요일
int newLine = 0;
//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>
<jsp:include page="../main/pre.jsp"></jsp:include>
<HEAD>
	<TITLE>캘린더</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<style TYPE="text/css">
		body {
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}
		td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}
		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}
.reser_a:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
.reser_a:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
.reser_a:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
.reser_a:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
	</style>
</HEAD>
<BODY>
<form name="calendarFrm" id="calendarFrm" action="" method="post">
<DIV id="content" style="width:712px;">

<table width="100%" border="0" cellspacing="1" cellpadding="1">
<tr>
	<td align ="right">
		<input type="button" onclick="javascript:location.href='calendar.jsp'" value="오늘"/>
		<a href="javascript:location.reload();" class="reser_a">새로고침</a>
	</td>

</tr>
</table>
<!--날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">

<tr>
<td height="60">

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="10">
		</td>
	</tr>
	
	<tr>
		<td align="center" >
			<a href="reservation.jsp?year=<%=year-1%>&amp;month=<%=month%>" target="_self" class="reser_a">
				<b>&lt;&lt;</b><!-- 이전해 -->
			</a>
			<%if(month > 0 ){ %>
			<a href="reservation.jsp?year=<%=year%>&amp;month=<%=month-1%>" target="_self" class="reser_a">
				<b>&lt;</b><!-- 이전달 -->
			</a>
			<%} else {%>
				<b>&lt;</b>
			<%} %>
			&nbsp;&nbsp;
			<%=year%>년
			
			<%=month+1%>월
			&nbsp;&nbsp;
			<%if(month < 11 ){ %>
			<a href="reservation.jsp?year=<%=year%>&amp;month=<%=month+1%>" target="_self" class="reser_a">
				<!-- 다음달 --><b>&gt;</b>
			</a>
			<%}else{%>
				<b>&gt;</b>
			<%} %>
			<a href="reservation.jsp?year=<%=year+1%>&amp;month=<%=month%>" target="_self" class="reser_a">
				<!-- 다음해 --><b>&gt;&gt;</b>
			</a>
		</td>
	</tr>
	</table>

</td>
</tr>
</table>
<br>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
<THEAD>
<TR bgcolor="#CECECE">
	<TD width='100px'>
	<DIV align="center"><font color="red">일</font></DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">월</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">화</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">수</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">목</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">금</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center"><font color="#529dbc">토</font></DIV>
	</TD>
</TR>
</THEAD>
<TBODY>
<TR>
<%
//처음 빈공란 표시 --> 첫째날이 어느 요일인지 1~7==일~토
//==> ex) 인덱스 1(일요일), 9월 1일은 화요일(3)이므로 
//newLine++ == 달력 한칸씩 화요일이 될때까지 공백으로 띄움 
for(int index = 1; index < start ; index++ ) 
{
  out.println("<TD >&nbsp;</TD>");
  newLine++;
}
//첫째날부터 전체 날짜 출력하면서 달력칸 생성
for(int index = 1; index <= endDay; index++)
{
	String color = "";
	if(newLine == 0){			color = "RED"; //일요일
	}else if(newLine == 6){ 	color = "#529dbc";//토요일
	}else{						color = "BLACK"; };//평일
%>
<% 	
	//방이름 뽑도록 하기//////////////////////////////////
	String sUseDate = Integer.toString(year);
	sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
	sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
	 int iUseDate = Integer.parseInt(sUseDate); 
	
	String backColor = "#EFEFEF";
	if(iUseDate == intToday ) {
		backColor = "#c9c9c9";
	} 
	out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
	//방이름 뽑도록 하기 END//////////////////////////////////
	%>
	<font color='<%=color%>'>
		<%=index %> <!-- 1일부터 마지막날까지 -->
	</font>
		<br>

<%
	int check_in=0;
	int check_out=0;
	for(int i=0;i<rb.size();i++){
		
		if(iUseDate<=intToday){
	%>
		<div id="font">
		<%= rb.get(i).getRname() %><i class="fas fa-times"></i>
		</div>
	<% 			
		}else{ 
			
//수정2.****** 출력처리위해  추가하였습니다.*******
			boolean flag=false;//방별로 달력의 날짜가 reservation TABLE에 check_in~check_out에 걸리는지 검사 (true:있는경우, false:없는 경우)
			int flag_icon=1;//예약 상황 검사(1.예약가능, 2.예약대기, 3.예약완료)
			for(int j=0; j<reb.size();j++){	
				check_in=reDB.DateToStringToint(reb.get(j).getCheck_in());
				check_out=reDB.DateToStringToint(reb.get(j).getCheck_out());
					//달력의날짜가 reservation TABLE의 예약날짜 사이에 있으면, 예약 상황 추가 검사
					if(iUseDate>=check_in && iUseDate<=(check_out)-1&& reb.get(j).getRno()==i+1){
						flag=true;
						if(reb.get(j).getPaid().equals("y")){ flag_icon=3;
						}
						else {flag_icon=2;
						;
						}
				}
			}//검사완료.
			
			//방이름 출력::true이면 그냥 방이름 출력, false이면 링크 걸린 방이름 출력 
			if (flag==true) {
			%><div id="font"><%= rb.get(i).getRname() %><%		
			}else {%><div id="font"><a href="res_process.jsp?newLine=<%= newLine %>&&rno=<%= rb.get(i).getRno() %>&&iUseDate=<%= iUseDate %> class="reser_a""><%= rb.get(i).getRname() %></a><%
			}
			
			//예약상황에 맞는 아이콘 표시
			if(flag_icon==1){%><i class="far fa-circle"></i></div><%
			}else if(flag_icon==2){%><i class="fas fa-exclamation-triangle"></i></div><%
			}else if(flag_icon==3){%><i class="fas fa-times"></i></div><%
			}
		}
	}
		
		%>
			</br>
<%  
	//기능 제거	
	out.println("</TD>");
	newLine++;
	if(newLine == 7)
	{
	  out.println("</TR>");
	  if(index <= endDay)
	  {
	    out.println("<TR>");
	  }
	  newLine=0;
	}
}
//마지막 공란 LOOP
while(newLine > 0 && newLine < 7)
{
  out.println("<TD>&nbsp;</TD>");
  newLine++;
}
%>

</TR>
</TBODY>
</TABLE>
</DIV>
</form>
<jsp:include page="../main/after.jsp"></jsp:include>
</BODY>
<script>
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    	location.reload(true);
    }
}
</script>
</HTML>