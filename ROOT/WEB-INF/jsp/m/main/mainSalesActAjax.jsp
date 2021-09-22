<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="box_head">
	<h3 class="ta_c">영업기회(최근 7일)<span class="fs14 fc_gray_light">(총 ${fn:length(list)}개)</span></h3>
</div>

<ul class="my_act_list" id="my_act_list">
<c:choose>
	<c:when test="${fn:length(list) > 0}">
		<c:forEach items="${list}" var="list">
			<li>
		     	<a href="/clientSalesActive/selectOpportunityDetail.do?pkNo=${list.PK}">
					<span class="statusColor statusColor_yellow">영업기회</span>
					<span class="subject">
						${list.SUBJECT}
						<c:if test="${list.COACHING_TALK_COUNT > 0}">
	              			<span style="color: orange;">(${list.COACHING_TALK_COUNT})</span> 
				  		</c:if>
					</span>
					<span class="info">영업대표 : ${list.CREATE_NAME} / 매출처: ${list.COMPANY_NAME} / ${list.SYS_REGISTER_DATE}</span>
				</a>
			</li>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<li style="text-align: center; padding:5px 0 5px 0;">
			<strong>영업기회(최근 7일)가 없습니다.</strong>
		</li>
	</c:otherwise>
</c:choose>
</ul>
