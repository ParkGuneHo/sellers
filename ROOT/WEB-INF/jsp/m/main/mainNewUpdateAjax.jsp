<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box_head">
	<h3 class="ta_c">고객이슈 <span class="fs14 fc_gray_light">(총 ${fn:length(list)}개)</span></h3>
</div>

<c:choose>
	<c:when test="${fn:length(list) > 0}">
<ul class="my_act_list">
	<c:forEach items="${list}" var="list">
		<li>
	     	<a href="/clientSatisfaction/selectClientIssueDetail.do?pkNo=${list.PK}">
				<span class="statusColor statusColor_green">고객이슈</span> 
				<span class="subject">${list.SUBJECT}
					<c:if test="${list.COACHING_TALK_COUNT > 0}">
	             			<span style="color: orange;">(${list.COACHING_TALK_COUNT})</span> 
			  		</c:if>
				</span>
				<span class="info">해결책임자 : ${list.SOLVE_OWNER_NAME} / 고객 : ${CUSTOMER_NAME[0]}
		              		<c:if test="${fn:length(CUSTOMER_NAME) > 1}">
		              			외 ${fn:length(CUSTOMER_NAME)-1}명
		              		</c:if>  / ${list.SYS_UPDATE_DATE}</span>
			</a>
		</li>
	</c:forEach>
</ul>
	</c:when>
	<c:otherwise>
		<div style="text-align: center; padding:5px 0 5px 0;">
		    <strong>고객이슈가 없습니다.</strong>
		 </div>
	</c:otherwise>
</c:choose>

