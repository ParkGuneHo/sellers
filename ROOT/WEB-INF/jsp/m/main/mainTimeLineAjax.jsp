<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
	<c:when test="${fn:length(list) > 0}">
		<c:forEach items="${list}" var="list">
			<li class=""> 
				<a href="/calendar/viewCalendar.do?notice_event_id=${list.EVENT_ID}">
					<span class="time">
						<span class="va_m">${list.START_DATETIME} ~ ${list.END_DATETIME}</span>
					</span>
					<span class="icon lg icon_sch_${list.EVENT_CODE}"></span> <!-- icon_sch_1~7 : 고객컨택, 컨택준비, 내부회의, 교육, 기타, 휴가, 이동시간 -->
					<span class="subject">${list.EVENT_SUBJECT}</span>					
				</a>					
			</li>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<li style="text-align: center; padding:5px 0 5px 0;">
			<strong>일정이 없습니다.</strong>
		</li>
	</c:otherwise>
 </c:choose>
 
	
