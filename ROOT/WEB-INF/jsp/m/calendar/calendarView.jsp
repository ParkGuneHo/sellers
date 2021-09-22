<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>캘린더</title>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>
<%
Calendar cal = Calendar.getInstance();
 
String strYear = request.getAttribute("cYear").toString();
String strMonth = request.getAttribute("cMonth").toString();
 
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);
 
if(strYear != null)
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth) - 1;
 
}else{
 
}
//년도/월 셋팅
cal.set(year, month, 1);
 
int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;
 
//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
 
 
%>

	<article class="topControl primary_bg">
		<div class="func_left fl_l">
			<a href="" class="btn_prev va_m" onclick="fncMoveToDate('${prevMonth}'); return false;">이전</a>
			<span class="current_date va_m">${cYear}년 ${cMonth}월</span>
			<a href="" class="btn_next va_m" onclick="fncMoveToDate('${nextMonth}'); return false;">다음</a>
		</div>
		<div class="func_right fl_r">
			<a href="" onClick="fncAddSchedule('${curDate}'); return false;"><span class="va_t icon_add">일정추가</span></a>
		</div>
	</article>
	
	<article class="schedule_cont">
		<table class="schedule_table">
			<thead>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
<%

String weekstr[] = {"sun","mon","tue","wed","thu","fri","sat"};
int weekday = 0; 

//처음 빈공란 표시
for(int index = 1; index < start ; index++ ) {
	out.println("<td class='"+weekstr[weekday]+"'>&nbsp;</td>");
	newLine++;
	weekday = (weekday + 1) % 7;
}

for(int index = 1; index <= endDay; index++) {
	String color = "";
	
	if(newLine == 0){          color = "RED";
	}else if(newLine == 6){    color = "#529dbc";
	}else{                     color = "BLACK"; };
	
	String sUseDate = Integer.toString(year); 
	sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
	sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
	
	int iUseDate = Integer.parseInt(sUseDate);
	
	String td_class = "";
	if(iUseDate == intToday ) {
		td_class = " current_day";
	}
	out.println("<td class='"+weekstr[weekday]+td_class+"' title='"+iUseDate+"'>");
%>
	<a href="javascript:void(0);" id='a_<%=iUseDate%>'>
	<span class="day_count"><%=index %></span>
	</a>
<%
	//기능 제거 
	out.println("</td>");
	newLine++;
	
	if(newLine == 7) {
		out.println("</TR>");
		if(index <= endDay) {
			out.println("<TR>");
		}
		newLine=0;
	}
	weekday = (weekday + 1) % 7;
}

//마지막 공란 LOOP
while(newLine > 0 && newLine < 7) {
	out.println("<td>&nbsp;</td>");
	newLine++;
	weekday = (weekday + 1) % 7;
}
%>
				</tr>
			</tbody>
		</table>
	</article>

<jsp:include page="/WEB-INF/jsp/m/common/calendar_footer.jsp"/>
<!-- 
	<article class="fix_func">
		<ul>
			<li>
				<a href="/calendar/calendar.do">일</a>
			</li>
			<li>
				<a href="/calendar/viewCalendar.do" class="active">월</a>
			</li>
			<li>
				<a href="/calendar/calendarEvent.do">일정목록</a>
			</li>
			<li>
				<a href="">오늘</a>
			</li>
		</ul>
	</article>
-->
</div>

<div class="daysch_list_pop off">
    <div class="pop_header">
        <p class="day_title" id="modal_day_title"></p>
        <div class="func_area">
            <a href="#" class="btn_add" id="modal_btn_add" onClick="">일정추가</a>
            <a href="#" class="btn_modal_close">닫기</a>
        </div>
    </div>
    <div class="pop_cont">
        <div class="schedule_all_list">
            <ul id="modal_result_list">
            </ul>            
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/moment/moment.js"></script>

<script type="text/javascript">

	function fncAddSchedule(_date) {
		location.href="/calendar/modalCalendarForm.do?mode=I&curDate="+_date+"&pos=viewCalendar";
	}
	
	function fncGetItemHtml(_item, start_date, sdOneDay){
		var sd2 = _item.START_DAY;
		
		var sdYear2 = sd2.substr(0,4);
		var sdMonth2 = sd2.substr(4,2);
		var sdDay2 = sd2.substr(6,2);
		
		sdYear2 = parseInt(sdYear2);
		sdMonth2 = parseInt(sdMonth2);
		sdDay2 = parseInt(sdDay2);
		
		
 		var tsd = sdYear2 + '-' + sdMonth2 + '-' + sdDay2;
		if(sdDay2 < 10){
			sdDay3 = "0" + sdDay2;
			var tsd2 = sdYear2 + '-' + sdMonth2 + '-' + sdDay3;
		}else{
			var item_html = '';
			item_html += '<li><a href="/calendar/modalCalendarForm.do?mode=M&eventId='+_item.EVENT_ID+'&pos=viewCalendar&start_date='+tsd+'"><span class="time">'+_item.START_TIME+'</span>';
			item_html += '<span class="icon lg icon_sch_'+_item.EVENT_CODE+'"></span><span class="subject">'+_item.title+'</span></a></li>';
		}
		
		if(sdDay2 < 10){
			var item_html = '';
			item_html += '<li><a href="/calendar/modalCalendarForm.do?mode=M&eventId='+_item.EVENT_ID+'&pos=viewCalendar&start_date='+tsd2+'"><span class="time">'+_item.START_TIME+'</span>';
			item_html += '<span class="icon lg icon_sch_'+_item.EVENT_CODE+'"></span><span class="subject">'+_item.title+'</span></a></li>';
		}
			
				
		
		return item_html;
	}
	
	function fncMoveToDate(_date){
		//location.href="/calendar/calendarMonth.do?curDate="+_date;
		window.location.href="/calendar/viewCalendar.do?curDate="+_date;
	}
	
	function fncShowCalendar() {
		
		var calendarCheck_id = [];
		<c:choose>
			<c:when test="${fn:length(calendarList) > 0}">
				<c:forEach items="${calendarList}" var="calendar">
				calendarCheck_id.push('${calendar.CALENDAR_ID}');
				</c:forEach>
			</c:when>
			<c:otherwise>
				addCalendar();
			</c:otherwise>
		</c:choose>
	
		$.ajax({
			type : "POST",
			/*
			data : {
				"hiddenModalCreatorId" : '${userInfo.MEMBER_ID_NUM}',
				"calendarCheck_id" : calendarCheck_id.toString(),
				"thisMonthHoliday_id" : "2016%",
				"hiddenUserId" : '${userInfo.MEMBER_ID_NUM}',
				"outlook" : 'N',
				"office365" : 'N'
			},
			*/
			data : {
				"hiddenModalCreatorId" : '${userInfo.MEMBER_ID_NUM}',
				"startRange" : '${startRange}',
				"endRange" : '${endRange}',
				"calendarCheck_id" : calendarCheck_id.toString(),
				
				"datatype" : 'json',
				"hiddenUserId" : '${userInfo.MEMBER_ID_NUM}',
				"selectYear" : '${cYear}',
				"selectMonth" : '${cMonth}',
				"outlook" : 'N',
				"office365" : 'N',
				"google" : '',
				"thisMonthHoliday_id" : '${cYear}%'
			},
			async: false,
			url: "/calendar/calendarEventList.do",
			success:function(data){
				var daily_event_cnt = 0;
				var current_day = '';
				var daily_time_date = null;
				var holidays = data.holidays;
				for (var i = 0; i < holidays.length; i++){
					var _html = '<span class="annual">'+holidays[i].title+'</span>';
					$('#a_'+holidays[i].start).append(_html);
				}
				
				var events = data.events;
				for (var i = 0; i < events.length; i++){
					
						if(events[i].EVENT_CODE == '5'){
							continue;
						}
					
						//날짜 변경이 있었는지 비교
						if (current_day != events[i].START_DAY){
							//console.log("커렌트 일" + current_day + "스타트 일" + events[i].START_DAY);
							
							if (current_day == '' || daily_event_cnt == 0){
								//비교할 날짜가 없거나 이벤트쌓인게 없으면 아무것도 안함
							} else if (daily_event_cnt > 4) {
								//전일 이벤트가 4개보다 많으면 얼마만큼 더 많다고 표시해주기
								var over_cnt = daily_event_cnt - 4;
								$('#a_'+current_day).append('<span class="over_count">+'+over_cnt+'</span>');
							}
							//날짜인덱스 변경
							current_day = events[i].START_DAY;
							//alert("ajknsdjnajsd = " + typeof current_day);
							//일별 이벤트 카운터 리셋
							daily_event_cnt = 0;
						}

						daily_event_cnt ++;
						//하루 4개의 이벤트만 표시
						
						if (daily_event_cnt <= 4){
							//var _html = '<li><span class="icon lg icon_sch_'+events[i].EVENT_CODE+'"></span><span class="va_m">'+events[i].START_TIME+'~'+events[i].END_TIME+'<span class="sch_list">'+events[i].title+'</span></span><li>';
							var _html = '<li>';
							_html += '<span class="sch_list">'+events[i].title+'</span>';
							_html += '<span class="sch_event_id_'+events[i].START_DAY+'" style="display:none">'+events[i].EVENT_ID+'</span>';
							_html += '<span class="sch_day_diff_'+events[i].START_DAY+'" style="display:none">'+events[i].DAY_DIFF+'</span>';
							_html += '<li>';
							$('#a_'+events[i].START_DAY).append(_html);
							
							//일정 격차
 							daily_time_date = events[i].END_DAY - events[i].START_DAY;
							//alert(events[i].END_DAY + "끝" + events[i].START_DAY + "시작");
							//alert(daily_time_date);
							//alert("시작일 : " + events[i].START_DAY +  "   ||| 종료일 : " +  events[i].END_DAY);
							
							var sd = events[i].START_DAY;
							
							var sdYear = sd.substr(0,4);
							var sdMonth = sd.substr(4,2);
							var sdDay = sd.substr(6,2);
														
							sdYear = parseInt(sdYear);
							sdMonth = String(sdMonth);
							sdDay = parseInt(sdDay);
							var sdOneDay = sdDay + 1;
							
							if(events[i].END_DAY != events[i].START_DAY){
								for(var d = 0; d < daily_time_date; ++d){
									// 캘일더 일수가 한자리 일 경우
									if(sdOneDay < 10){
										var sdOneDay2 = "0" + sdOneDay;
										var _html = '<li>'
											_html += '<span class="sch_list" style="color:blue;">'+events[i].title+'</span>';
											_html += '<span class="sch_event_id_'+ sdYear + sdMonth + sdOneDay2 +'" style="display:none">'+events[i].EVENT_ID +'</span>';
											_html += '<span class="sch_day_diff_'+ events[i].START_DAY +'" style="display:none">'+events[i].DAY_DIFF+'</span>';
											_html += '<li>';
										$('#a_'+sdYear + sdMonth + sdOneDay2).append(_html);
									}
									// 캘일더 일수가 두자리 일 경우
									var _html = '<li>'
									_html += '<span class="sch_list" style="color:blue;">'+events[i].title+'</span>';
									_html += '<span class="sch_event_id_'+ sdYear + sdMonth + sdOneDay +'" style="display:none">'+events[i].EVENT_ID +'</span>';
									_html += '<span class="sch_day_diff_'+ events[i].START_DAY +'" style="display:none">'+events[i].DAY_DIFF+'</span>';
									_html += '<li>';
									$('#a_'+sdYear + sdMonth + sdOneDay++).append(_html);
								}
							}
						}
				}
				
				//월별 캘린더화면에서 일별 일정 팝업
				$('.schedule_table td').click(function(){
					var selected_date = $(this).attr('title');
					var day_title = selected_date.substring(0,4) +'년 '+ parseInt(selected_date.substring(4,6)) +'월 '+ parseInt(selected_date.substring(6,8)) + '일';
					var start_date = selected_date.substring(0,4) +'-'+ parseInt(selected_date.substring(4,6)) +'-'+ parseInt(selected_date.substring(6,8));
					$('#modal_day_title').html(day_title);
					$('#modal_btn_add').attr('onClick', 'fncAddSchedule("'+selected_date+'")');
					
					//var v_event_id_len = $(this).find(".sch_event_id_"+selected_date);
					//alert(v_envet_id_len);
					
					var elements = $(this).find(".sch_event_id_"+selected_date);
					var v_event_id_list = '';
					elements.each(function(){
						//alert('find() :' + $(this).text());
						v_event_id_list += $(this).text() + ',';
					});
					
					if(v_event_id_list != '') {
						var v_len = v_event_id_list.length - 1;
						
						v_event_id_list = v_event_id_list.substring(0, v_len);
					}
					
					$.ajax({
						type : "POST",
						data : {
							"hiddenModalCreatorId" : '${userInfo.MEMBER_ID_NUM}',
							//"startRange" : '${startRange}',
							//"endRange" : '${endRange}',
							"calendarCheck_id" : calendarCheck_id.toString(),
							"event_id_pos" : 'Y',
							"event_id_list" : v_event_id_list
						},
						async: false,
						url: "/calendar/calendarEventListMobile.do",
						success:function(data){							
							var list = data.events;
							var list_html = '';
							$('#modal_result_list').html('');
							
							if(list.length > 0) {
								for (var i = 0; i < list.length; i++){
									list_html += fncGetItemHtml(list[i], start_date, sdOneDay);
								}
							}
							else {
								list_html = '<li>';
								list_html += '<span class="subject">스케쥴이 없습니다.</span></a></li>';
							}
							$('#modal_result_list').append(list_html);
							
							$('.daysch_list_pop').show();
							$('.modal_screen').show();
						}
					});//end of ajax
				});
			}
		});
	} 

	function addCalendar(){
		var params = $.param({
			hiddenModalCreatorId : '${userInfo.MEMBER_ID_NUM}',
			textCalendarName : '나의 캘린더',
			datatype : 'json'
		});
		
		$.ajax({
			url : "/calendar/addCalendar.do",
			datatype : 'json',
			data :params,
			async : false,
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data){
				alert("나의 캘린더가 생성되었습니다.");
				window.location.reload();
			},
			complete : function(){
				//$.ajaxLoadingHide();
			}
		});
	}
	
	$(document).ready(function() {
		fncShowCalendar();
		if('${notice_event_id}' != '' ){
			location.href = '/calendar/modalCalendarForm.do?mode=M&eventId=${notice_event_id}';
		}

	});
	
</script>

<div>

<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>