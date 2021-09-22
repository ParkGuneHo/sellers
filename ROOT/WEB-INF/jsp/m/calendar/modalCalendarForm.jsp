<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<title>캘린더</title>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>

	<article class="schedule_cont mg_b0">
		<div class="title_pg mg_b20 ta_c">
			<h2>일정</h2>
			<a href="#" class="btn_back" onclick="window.history.back();">back</a>
		</div>

		<div class="mg_l10 mg_r10">
<%--
			<form method="post" class="form-horizontal mg_l10 mg_r10" id="frmSchedule">
 --%>
			<form class="form-horizontal" id="formModalData" name="formModalData" method="post" enctype="multipart/form-data">

				<div class="cont1 pd_b20 "><!-- 이슈기본정보  -->

					<div class="form_input mg_b20">
						<input type="text" id="textModalEventSubject" name="textModalEventSubject"  value="${detail.EVENT_SUBJECT}" placeholder="제목을 입력해주세요" class="form_control schedule_subject" />
					</div>

					<div class="form_input mg_b20">
						<label class="fc_gray_light">일정구분</label>
						<select class="form_control" id="selectModalEventCode" name="selectModalEventCode" onClick="modal.checkEventCode();">
							<spring:eval expression="@config['code.calModalEventList']" />
<%--
							<option value="1" ${detail.EVENT_CODE eq '1' ? 'selected' : ''}>고객컨택</option>
							<option value="2" ${detail.EVENT_CODE eq '2' ? 'selected' : ''}>컨택준비</option>
							<option value="3" ${detail.EVENT_CODE eq '3' ? 'selected' : ''}>내부회의</option>
							<option value="4" ${detail.EVENT_CODE eq '4' ? 'selected' : ''}>교육</option>
							<option value="5" ${detail.EVENT_CODE eq '5' ? 'selected' : ''}>기타</option>
							<option value="6" ${detail.EVENT_CODE eq '6' ? 'selected' : ''}>휴가</option>
							<option value="7" ${detail.EVENT_CODE eq '7' ? 'selected' : ''}>이동시간</option>
--%>
						</select>
					</div>
					
					<%-- 사용안함 --%>
					<div class="form_input mg_b20" style="display:none">
						<label class="col-sm-1 control-label">달력</label>
						<div class="col-sm-3">
							<select class="form-control" name="selectModalCalendarID" id="selectModalCalendarID">
							<c:choose>
								<c:when test="${!empty calendarList}">
									<c:forEach items="${calendarList}" var="calendarList">
									<c:choose>
										<c:when test="${(calendarList.MEMBER_ID_NUM eq userInfo.MEMBER_ID_NUM) && (calendarList.CALENDAR_NAME eq '나의 캘린더')}">
											<option id="${calendarList.SYNC_YN}" value="${calendarList.CALENDAR_ID}">${calendarList.CALENDAR_NAME}</option>
										</c:when>
									</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
							</select>
						</div>
					</div>

					<div class="form_input mg_b20">
						<label class="fc_gray_light">장소</label>
						<input type="text" class="form_control" id="textModalEventLocation" name="textModalEventLocation" value="${detail.LOCATION}"/>
					</div>

					<div class="h_line pd_t10"></div>

					<div class="form_input mg_b20">
						<label class="fc_gray_light">상세내용</label>
						<textarea class="form_control" row="3" id="textareaModalEventDetail" name="textareaModalEventDetail">${detail.EVENT_DETAIL}</textarea>
					</div> 

					<div class="h_line pd_t10"></div>

					<div class="form_input">
						<label class="fc_gray_light">일정시작</label>
						<div class="daytime">
							<input type="date" value="${mode eq 'I' ? curDate : detail.START_DAY}" class="form_control" id="textModalStartDate" name="textModalStartDate" onchange="rrule.nthOfMonth();modal.chkDate(this);" /> <!-- 기본적으로 오늘 날짜 표시 -->
							<select class="form_control" id="selectModalStartDateTime" name="selectModalStartDateTime" onchange="modal.changeEndDate();">
								<option value="00:00"> 오전 12:00</option>
								<option value="00:30"> 오전 12:30</option>
								<option value="01:00"> 오전 01:00</option>
								<option value="01:30"> 오전 01:30</option>
								<option value="02:00"> 오전 02:00</option>
								<option value="02:30"> 오전 02:30</option>
								<option value="03:00"> 오전 03:00</option>
								<option value="03:30"> 오전 03:30</option>
								<option value="04:00"> 오전 04:00</option>
								<option value="04:30"> 오전 04:30</option>
								<option value="05:00"> 오전 05:00</option>
								<option value="05:30"> 오전 05:30</option>
								<option value="06:00"> 오전 06:00</option>
								<option value="06:30"> 오전 06:30</option>
								<option value="07:00"> 오전 07:00</option>
								<option value="07:30"> 오전 07:30</option>
								<option value="08:00"> 오전 08:00</option>
								<option value="08:30"> 오전 08:30</option>
								<option value="09:00"> 오전 09:00</option>
								<option value="09:30"> 오전 09:30</option>
								<option value="10:00"> 오전 10:00</option>
								<option value="10:30"> 오전 10:30</option>
								<option value="11:00"> 오전 11:00</option>
								<option value="11:30"> 오전 11:30</option>
								<option value="12:00"> 오후 12:00</option>
								<option value="12:30"> 오후 12:30</option>
								<option value="13:00"> 오후 01:00</option>
								<option value="13:30"> 오후 01:30</option>
								<option value="14:00"> 오후 02:00</option>
								<option value="14:30"> 오후 02:30</option>
								<option value="15:00"> 오후 03:00</option>
								<option value="15:30"> 오후 03:30</option>
								<option value="16:00"> 오후 04:00</option>
								<option value="16:30"> 오후 04:30</option>
								<option value="17:00"> 오후 05:00</option>
								<option value="17:30"> 오후 05:30</option>
								<option value="18:00"> 오후 06:00</option>
								<option value="18:30"> 오후 06:30</option>
								<option value="19:00"> 오후 07:00</option>
								<option value="19:30"> 오후 07:30</option>
								<option value="20:00"> 오후 08:00</option>
								<option value="20:30"> 오후 08:30</option>
								<option value="21:00"> 오후 09:00</option>
								<option value="21:30"> 오후 09:30</option>
								<option value="22:00"> 오후 10:00</option>
								<option value="22:30"> 오후 10:30</option>
								<option value="23:00"> 오후 11:00</option>
								<option value="23:30"> 오후 11:30</option>
							</select>
						</div>
					</div>

					<div class="form_input mg_b20">
						<label class="fc_gray_light">일정종료</label>
						<div class="daytime">
							<input type="date" value="${mode eq 'I' ? curDate : detail.END_DAY}" class="form_control" id="textModalEndDate" name="textModalEndDate" onchange="rrule.nthOfMonth();modal.chkDate(this);" /> <!-- 기본적으로 오늘 날짜 표시 -->
							<select class="form_control" id="selectModalEndDateTime" name="selectModalEndDateTime">
								<option value="00:00"> 오전 12:00</option>
								<option value="00:30"> 오전 12:30</option>
								<option value="01:00"> 오전 01:00</option>
								<option value="01:30"> 오전 01:30</option>
								<option value="02:00"> 오전 02:00</option>
								<option value="02:30"> 오전 02:30</option>
								<option value="03:00"> 오전 03:00</option>
								<option value="03:30"> 오전 03:30</option>
								<option value="04:00"> 오전 04:00</option>
								<option value="04:30"> 오전 04:30</option>
								<option value="05:00"> 오전 05:00</option>
								<option value="05:30"> 오전 05:30</option>
								<option value="06:00"> 오전 06:00</option>
								<option value="06:30"> 오전 06:30</option>
								<option value="07:00"> 오전 07:00</option>
								<option value="07:30"> 오전 07:30</option>
								<option value="08:00"> 오전 08:00</option>
								<option value="08:30"> 오전 08:30</option>
								<option value="09:00"> 오전 09:00</option>
								<option value="09:30"> 오전 09:30</option>
								<option value="10:00"> 오전 10:00</option>
								<option value="10:30"> 오전 10:30</option>
								<option value="11:00"> 오전 11:00</option>
								<option value="11:30"> 오전 11:30</option>
								<option value="12:00"> 오후 12:00</option>
								<option value="12:30"> 오후 12:30</option>
								<option value="13:00"> 오후 01:00</option>
								<option value="13:30"> 오후 01:30</option>
								<option value="14:00"> 오후 02:00</option>
								<option value="14:30"> 오후 02:30</option>
								<option value="15:00"> 오후 03:00</option>
								<option value="15:30"> 오후 03:30</option>
								<option value="16:00"> 오후 04:00</option>
								<option value="16:30"> 오후 04:30</option>
								<option value="17:00"> 오후 05:00</option>
								<option value="17:30"> 오후 05:30</option>
								<option value="18:00"> 오후 06:00</option>
								<option value="18:30"> 오후 06:30</option>
								<option value="19:00"> 오후 07:00</option>
								<option value="19:30"> 오후 07:30</option>
								<option value="20:00"> 오후 08:00</option>
								<option value="20:30"> 오후 08:30</option>
								<option value="21:00"> 오후 09:00</option>
								<option value="21:30"> 오후 09:30</option>
								<option value="22:00"> 오후 10:00</option>
								<option value="22:30"> 오후 10:30</option>
								<option value="23:00"> 오후 11:00</option>
								<option value="23:30"> 오후 11:30</option>
							</select>
						</div>
					</div>

					<div id="line_move" class="h_line pd_t10"></div>
					
					<div id="divModalEventCode" class="form_input" style="display:none">
						<label class="fc_gray_light">전 이동시간</label>
						<div>
							<select class="form_control" id="selectModalBeforeMoveTimeMin" name="selectModalBeforeMoveTimeMin">
								<option selected="selected" value="0">선택</option>
								<option value="30">30분</option>
								<option value="60">1시간</option>
								<option value="90">1시간 30분</option>
								<option value="120">2시간</option>
								<option value="150">2시간 30분</option>
								<option value="180">3시간</option>
								<option value="240">4시간</option>
								<option value="300">5시간</option>
								<option value="360">6시간</option>
								<option value="420">7시간</option>
								<option value="480">8시간</option>
							</select>
						</div>
					</div>

					<div id="divModalEventCode2" class="form_input mg_b20" style="display:none">
						<label class="fc_gray_light">후 이동시간</label>
						<div>
							<select class="form_control" id="selectModalAfterMoveTimeMin" name="selectModalAfterMoveTimeMin">
								<option selected="selected" value="0">선택</option>
								<option value="30">30분</option>
								<option value="60">1시간</option>
								<option value="90">1시간 30분</option>
								<option value="120">2시간</option>
								<option value="150">2시간 30분</option>
								<option value="180">3시간</option>
								<option value="240">4시간</option>
								<option value="300">5시간</option>
								<option value="360">6시간</option>
								<option value="420">7시간</option>
								<option value="480">8시간</option>
							</select>
						</div>
					</div>

					<div class="h_line pd_t10"></div>

					<div class="form_input mg_b20">
						<label class="fc_gray_light">옵션선택</label>
						<div class="mg_b10">
							<label for="f_action1" class="mg_r20"><input type="checkbox" class="option_dayfull va_m" id="checkboxModalAllday" name="checkboxModalAllday" value="N" onclick="modal.chkBox(this);" /><span class="va_m">종일</span></label>
							<label for="f_action2" class=""><input type="checkbox" class="option_repeat va_m" id="checkboxModalRepeat" name="checkboxModalRepeat" value="N" onclick="modal.chkBox(this);" /><span class="va_m">반복</span></label>
						</div>

						<div id="divModalRepeatOption" class="repeat_option mg_b20 off"><!-- 반복일정 설정 -->

							<div class="mg_b10 repeat_term repeat_week on"> <!-- "매주" 선택시 보여질 화면 -->
								<select class="form_control mg_r10" name="selectModalFreq" id="selectModalFreq" onchange="rrule.selectFreq(this);">
									<option value="2" selected="selected">매주</option>
									<option value="1">매월</option>
									<option value="3">분기</option>
									<option value="4">반기</option>
								</select>
								<div name="divModalInterval" id="divModalInterval">
									<select class="form-control mg_r10"
										name="selectModalInterval" id="selectModalInterval">
										<option value="1" selected="selected">1주에 한번</option>
										<option value="2">2주에 한번</option>
										<option value="3">3주에 한번</option>
										<option value="4">4주에 한번</option>
										<option value="5">5주에 한번</option>
										<option value="6">6주에 한번</option>
										<option value="7">7주에 한번</option>
										<option value="8">8주에 한번</option>
										<option value="9">9주에 한번</option>
									</select>
								</div>
								<!-- 
								<input type="text" value="1" size="2" class="form_control mg_r10" />
								<span>주마다</span>

								<div class="week_sel">
									<a href="#" class="active">일</a>
									<a href="#" class="">월</a>
									<a href="#" class="">화</a>
									<a href="#" class="">수</a>
									<a href="#" class="">목</a>
									<a href="#" class="">금</a>
									<a href="#" class="">토</a>
								</div>
								 -->
							</div>
							
							<div class="off" name="divModalInterval" id="divModalMonthlyByweekday">
								<label class="fc_gray_light">반복 마감일 </label>
								<div>
									<label class="select-com">
										<input type="radio" name="divModalMonthlyRule" value="BYMONTHDAY" checked="checked">
										<label class="mg-r10" id="divModalMonthlyRuleDate">매월 **일</label>
										<input type="radio" name="divModalMonthlyRule" value="BYDAY">
										<label class="mg-r10" id="divModalMonthlyRuleTh">매월 *번째 *요일</label>
									</label>
								</div>
							</div>
							<div id="divModalElseByweekday">
								<label class="fc_gray_light">반복일 </label>
								<div>
									<input type="checkbox" name="RRulecheckboxModalByweekday" id="checkboxModalRRuleMO" value="0" class="" />월
									<input type="checkbox" name="RRulecheckboxModalByweekday" id="checkboxModalRRuleTU" value="1" class="" />화
									<input type="checkbox" name="RRulecheckboxModalByweekday" id="checkboxModalRRuleWE" value="2" class="" />수
									<input type="checkbox" name="RRulecheckboxModalByweekday" id="checkboxModalRRuleTH" value="3" class="" />목
									<input type="checkbox" name="RRulecheckboxModalByweekday" id="checkboxModalRRuleFR" value="4" class="" />금
									<input type="checkbox" name="RRulecheckboxModalByweekday" id="checkboxModalRRuleSA" value="5" class="" />토
									<input type="checkbox" name="RRulecheckboxModalByweekday" id="checkboxModalRRuleSU" value="6" class="" />일
								</div>
							</div>

<%--
							<div class="mg_b10 repeat_term repeat_month off">
								<select class="form_control mg_r10"> <!-- "매월" 선택시 보여질 화면 -->
									<option>매일</option>
									<option>매주</option>
									<option selected>매월</option>
								</select>
								<div class="fl_l">
									<input type="text" value="1" size="2" class="form_control mg_r10" />
									<span>개월마다</span>
									<div class="cboth">
										<select class="form_control mg_r10">
											<option>1일</option>
											<option>2일</option>
											<option>3일</option>
											<option>4일</option>
											<option>5일</option>
											<option>6일</option>
											<option>7일</option>
											<option>8일</option>
											<option>9일</option>
											<option>10일</option>
											<option>11일</option>
											<option>12일</option>
											<option>13일</option>
											<option>14일</option>
											<option>15일</option>
											<option>16일</option>
											<option>17일</option>
											<option>18일</option>
											<option>19일</option>
											<option>20일</option>
											<option>21일</option>
											<option>22일</option>
											<option>23일</option>
											<option>24일</option>
											<option>25일</option>
											<option>26일</option>
											<option>27일</option>
											<option>28일</option>
											<option>29일</option>
											<option>30일</option>
											<option>31일</option>
										</select>
									</div>
								</div>
							</div>
 --%>
 
							<div class="h_line pd_t10"></div>
<%--
							<div class="form_input">
								<label class="fc_gray_light">옵션 종료일</label>
								<input type="date" value="2016-08-10" class="form_control" /> <!-- 기본적으로 오늘 날짜 표시 -->
							</div>
 --%>
							<div class="form-group">
								<label class="fc_gray_light">종료일</label>
								<div class="col-sm-10">
									<label class="mg-r10">
										<input type="radio"	name="radioModalEndRule" id="radioModalCountNull"
											value="" checked="checked" 
											onclick='if($(this).prop("checked")){$("#textModalCountNum").val(""); $("#textModalCountNum").attr("disabled", true); $("#textModalEndRuleDate").attr("disabled", true); $("#textModalEndRuleDate").val("");}' />
										<span class="v-m">계속 반복</span>
									</label>
									<div class="mg-r10">
										<input type="radio" name="radioModalEndRule" id="radioModalCountNum" value="count"
											onclick='if($(this).prop("checked")){$("#textModalCountNum").attr("disabled", false); $("#textModalCountNum").attr("disabled", false); $("#textModalEndRuleDate").attr("disabled", true); $("#textModalEndRuleDate").val("");}' />
										<span class="v-m">
											<input type="text" disabled="disabled" name="textModalCountNum" id="textModalCountNum"
												value="" style="width: 40px;" maxlength="4">번 반복 후 종료
										</span>
									</div>
									<div class="mg-r10">
										<input type="radio" name="radioModalEndRule" id="checkboxModalEndRuleDate" value="until"
											onclick='if($(this).prop("checked")){$("#textModalCountNum").val(""); $("#textModalCountNum").attr("disabled", true); $("#textModalEndRuleDate").attr("disabled", false);}' />
										<label id="data_1">
											<label class="input-group date" style="display: block;">
											<!-- 
												<span class="input-group-addon" style="display: none">
												<i class="fa fa-calendar"></i>
												</span>
											-->
												종료일:
												<input type="date" disabled="disabled" name="textModalEndRuleDate" id="textModalEndRuleDate" value="" onchange="rrule.chkEndDate();"  class="form_control" />
										</label>
										</label>
									</div>
								</div>
							</div>

						</div>
						
					</div>


					<div class="h_line pd_t10"></div>

					<div class="form_input mg_b20">
						<label class="fc_gray_light">초대옵션</label>
						<div class="mg_b10">
						<%--
							<label for="f_invite" class="f_invite"><input type="checkbox" id="f_invite" name="innner" class="va_m" value="N" /><span class="va_m">초대</span></label>
						 --%>
							<label for="checkboxModalInvite">
								<input type="checkbox" name="checkboxModalInvite" id="checkboxModalInvite" onclick="modal.inviteChkBox(this)" value="Y">
								<span class="va_m">초대</span>
							</label>
						</div>

						<div id="div_invite_area" class="pop_search invite_option mg_b20 "><!-- 초대옵션 설정 -->
							<!-- 직원검색영역 -->
							<div class="pop_search_area invite-area ">
								<a href="#" class="btn-search">직원검색</a>
								<div class="list mg_b10">
									<ul class="" id="invite_member_list">
									</ul>
								</div>
							</div>
							<!--// 직원검색영역 -->

							<!-- 직원선택 팝업 -->
							<div class="pop_search_pop invite-member-pop off">
								<div class="pop-header">
									<button type="button" class="close"><img src="/images/m/icon_close_gray.svg" /></button>
									<strong class="pop-title">직원 선택</strong>
								</div>
								<div class="col-sm-12 cont">
									<div class="form-group pop_search_input">
										<input type="text" name="search_member_txt" id="search_member_txt" class="form_control" />
										<a href="#" onClick="fncSearchMember(); return false;">검색</a>
									</div>
									<div class="form-group">
										<div class="col-sm-12 mg-b10 "><!-- 검색 결과 노출시 "off" 삭제 -->
											<ul class="result_list" id="search_member_list">
											</ul>
										</div>
									</div>
								</div>
							</div>

							<!-- 참석자 리스트 : 초기에는 hidden 처리되면, 검색 후 등록하면 리스트가 display 됨. -->
<%--
							<div class="invite-area-list " style="display:none;">
								<h3 class="ag_c">참석자 리스트</h3>
								<table class="basic3">
									<colgroup>
										<col width=""/>
										<col width=""/>
										<col width=""/>
										<col width=""/>
									</colgroup>
									<thead>
										<tr>
											<th>이름</th>
											<th>발신상태</th>
											<th>수락여부</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>이상현</td>
											<td>미발신</td>
											<td>수락</td>
											<td>
												<a href="#" class="remove"><img src="/images/m/icon_close.svg" /></a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
--%>
							<!-- 캘린더 모달창 참석자 리스트 뿌려지는곳 -->
							<div class="invite-area-list"></div>
							
						</div>

						
					</div>

					<div class="h_line pd_t10"></div>

					<div class="form_input mg_b20">
						<label class="fc_gray_light">공개상태</label>
						<div class="mg_b10">
							<label for="radioModalShareN" class="mg_r20"><input type="radio" id="radioModalShareN" name="radioModalShareYN" class="va_m" value="N" ${detail.SHARE_YN eq 'N' ? 'checked' : ''}/><span class="va_m">비공개</span></label>
							<label for="radioModalShareY" class=""><input type="radio" id="radioModalShareY" name="radioModalShareYN" class="va_m" value="Y" ${empty detail || detail.SHARE_YN eq 'Y' ? 'checked' : ''}/><span class="va_m">공개</span></label>
						</div>
					</div>
					
					<!-- 알림 방식이 정의되지않아, 일단은 셀렉박스 display none -->
                    <div class="h_line pd_t10"></div>
                        <div class="form-group"><label class="col-sm-2 control-label">일정 알림</label>
	                        <div class="col-sm-2" style="display:none">
		                        <select class="form-control m-b" name="selectModalAlam" id="selectModalAlam">
	                                   <option value="mainNotice"> 알림쪽지 </option>
	                                   <option value="dbEmail"> 이메일 </option>
                                </select>
                                
	                        </div>
	                        
							<div class="col-sm-8">
                 				<label style="margin-right:30px"> <input type="radio" name="radioModalAlam" id="radioModalAlam0" value="notNotice" ${detail.ALARM_FLAG eq null || detail.ALARM_FLAG eq '' || detail.ALARM_FLAG eq 'N' ? 'checked' : ''} /> <span class="v-m">안함</span></label>
                 				<label style="margin-right:30px"> <input type="radio" name="radioModalAlam" id="radioModalAlam1" value="oneHour" ${detail.ALARM_FLAG eq 'H' ? 'checked' : ''} /> <span class="v-m">한시간 전</span></label>
                 				<label style="margin-right:30px"> <input type="radio" name="radioModalAlam" id="radioModalAlam2" value="oneDay" ${detail.ALARM_FLAG eq 'D' ? 'checked' : ''} /> <span class="v-m">하루 전</span></label>
                 				<label style="margin-right:30px"> <input type="radio" name="radioModalAlam" id="radioModalAlam3" value="oneWeek" ${detail.ALARM_FLAG eq 'W' ? 'checked' : ''} /> <span class="v-m">일주일 전</span></label>
               				</div>
                        </div>
                       

				</div>
				


				<!-- <input type="hidden" name="hiddenModalAlam" id="hiddenModalAlam" value=""/> -->
				
									<input type="hidden" name="hiddenModalCalendarId" id="hiddenModalCalendarId" value="" /> 
									<input type="hidden" name="hiddenModalEventId" id="hiddenModalEventId" value="" />
									<input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}" />
									<input type="hidden" name="hiddenModalStartRuleDate" id="hiddenModalStartRuleDate" value="" /> 
									<input type="hidden" name="hiddenModalEndRuleDate" id="hiddenModalEndRuleDate" value="" /> 
									<input type="hidden" name="hiddenModalCountNum" id="hiddenModalCountNum" value="" />
									<input type="hidden" name="hiddenModalLoopNum" id="hiddenModalLoopNum" value="" />
									<input type="hidden" name="hiddenModalEndCondition" id="hiddenModalEndCondition" value="" />
									<input type="hidden" name="hiddenModalRuleByweekday" id="hiddenModalRuleByweekday" value="" />
									<input type="hidden" name="hiddenModalRuleBy" id="hiddenModalRuleBy" value="" />
									<input type="hidden" name="hiddenModalRuleBymonthday" id="hiddenModalRuleBymonthday" value="" />
									<input type="hidden" name="hiddenModalRruleString" id="hiddenModalRruleString" value="" />
									<input type="hidden" name="hiddenModalAllday_YN" id="hiddenModalAllday_YN" value="" />
									<input type="hidden" name="hiddenModalRepeat_YN" id="hiddenModalRepeat_YN" value="" />
									<input type="hidden" name="hiddenModalMemberList" id="hiddenModalMemberList" value="" />
									<input type="hidden" name="hiddenModalSync_YN" id="hiddenModalSync_YN" value="" />
									<input type="hidden" name="hiddenModalEndDate" id="hiddenModalEndDate" value="" />
									<!-- deleteModal 만 사용 -->
									<input type="hidden" name="hiddenModalEXDate_YN" id="hiddenModalEXDate_YN" value="" />
									<input type="hidden" name="hiddenModalOrgStartDate" id="hiddenModalOrgStartDate" value="" />
									<input type="hidden" name="hiddenModalRruleDateOrder" id="hiddenModalRruleDateOrder" value="" />
									
									<input type="hidden" name="hiddenModalRruleSyncId" id="hiddenModalRruleSyncId" value="" />
									<input type="hidden" name="hiddenModalFollowingStartDate" id="hiddenModalFollowingStartDate" value="" />
									<input type="hidden" name="hiddenModalChangeCheckRuleByweekday" id="hiddenModalChangeCheckRuleByweekday" value="" /> 
									<input type="hidden" name="hiddenModalAllEventsStartDate" id="hiddenModalAllEventsStartDate" value="" />
									<input type="hidden" name="hiddenModalAllEventsEndDate" id="hiddenModalAllEventsEndDate" value="" />
									
									<input type="hidden" name="hiddenModalRRuleStartDateFlag" id="hiddenModalRRuleStartDateFlag" value="" />
									<input type="hidden" name="hiddenModalRRuleSettingCompareFlag" id="hiddenModalRRuleSettingCompareFlag" value="" />
									<input type="hidden" name="hiddenModalRRuleSettingAllEventFlag" id="hiddenModalRRuleSettingAllEventFlag" value="" />


									<input type="hidden" name="hiddenModalHanName" id="hiddenModalHanName" value="${userInfo.HAN_NAME}" /> 
									<input type="hidden" name="hiddenModalEmail" id="hiddenModalEmail" value="${userInfo.EMAIL}" />
			</form>

		</div>
<%--
		<div class="pg_bottom ta_c">
			<button type="button" class="btn lg btn-default pd_r15 pd_l15 r5" onClick="window.history.back();">취소</button>
			<button type="button" class="btn lg btn-primary pd_r15 pd_l15 r5" onClick="fncSaveSchedule(); return false;">저장</button>
			<!-- <button type="button" class="btn lg btn-primary pd_r15 pd_l15 r5">저장하고 메일보내기</button> -->
		</div>
 --%>
		<div class="pg_bottom ta_c">
<!-- 
			<button type="button" class="btn lg btn-default pd_r15 pd_l15 r3" onClick="fncSaveSchedule('delete'); return false;">삭제</button>
			<button type="button" class="btn lg btn-primary pd_r15 pd_l15 r3" onClick="fncSaveSchedule('submit'); return false;">저장</button>
 -->
			<button type="button" class="btn lg btn-default pd_r15 pd_l15 r3" onClick="modal.bfModal('delete'); return false;">삭제</button>
			<button type="button" class="btn lg btn-primary pd_r15 pd_l15 r3" onClick="modal.bfModal('submit'); return false;">저장</button>
<c:if test="${param.mode eq 'M'}">
			<button type="button" class="btn lg btn-primary pd_r15 pd_l15 r3" onclick="modal.mailSubmit(); return false;">저장하고 메일보내기</button>
</c:if>
		</div>


	</article>


	<article class="schedule_cont">

		<ul class="schedule_list" id="result_list">
		</ul>

	</article>

<jsp:include page="/WEB-INF/jsp/m/common/calendar_footer.jsp"/>
<!-- 
	<article class="fix_func">
		<ul>
			<li>
				<a href="" class="active">일</a>
			</li>
			<li>
				<a href="/calendar/viewCalendar.do">월</a>
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
 
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/moment/moment.js"></script>
<script src="${pageContext.request.contextPath}/js/m/rrule/rrule.js"></script>

<script type="text/javascript">
var compare_before;
var compare_after;
var compareFlag = false;

var invite_members = [];

$(document).ready(function() {
	
	//초대옵션 검색, 리스트 영역
	$('#div_invite_area').hide();
	
	if ('${mode}' == 'M'){
		var v_event_code = "${detail.EVENT_CODE}";
		
		if(v_event_code == "") {
			alert("이벤트 코드가 존재하지 않습니다.\n데이터 확인하세요.");
			window.history.back();
		}

		//var v_start = "${detail.start}";
		//var v_end = "${detail.end}";
		var v_start_date = "${param.start_date}";
		var v_start_time = "${detail.START_TIME}";
		var v_start = v_start_date + ' ' + v_start_time;
<c:choose>
	<c:when test="${detail.DAY_DIFF ne null && detail.DAY_DIFF ne ''}">
		var day_diff = Number("${detail.DAY_DIFF}");
	</c:when>
	<c:otherwise>
		var day_diff = 0;
	</c:otherwise>
</c:choose>
		var v_end_date = moment(v_start).add(day_diff, 'days');
		v_end_date = moment(v_end_date).format("YYYY-MM-DD");
		v_end_time = "${detail.END_TIME}";
		v_end = v_end_date + ' ' + v_end_time;
		
		var v_time_gap = "${detail.TIME_GAP}";
		var v_title = "${detail.title}";
		var v_event_detail = "${detail.EVENT_DETAIL}";
		var v_location = "${detail.LOCATION}";
		var v_event_id = "${detail.EVENT_ID}";
		var v_calendar_id = "${detail.CALENDAR_ID}";
		var v_allDay = <c:choose><c:when test="${detail.allDay eq 1}">true</c:when><c:when test="${detail.allDay eq 0}">false</c:when><c:otherwise>""</c:otherwise></c:choose>;
		var v_sync_yn = "${detail.SYNC_YN}";
		var v_repeat_yn = "${detail.REPEAT_YN}";

		var v_recurrence_freq = "${detail.RECURRENCE_FREQ}";
		var v_recurrence_byweekday = "${detail.RECURRENCE_BYWEEKDAY}";
		var v_recurrence_interval = "${detail.RECURRENCE_INTERVAL}";
		var v_recurrence_bymonthday = "${detail.RECURRENCE_BYMONTHDAY}";
		var v_recurrence_end_date = "${detail.RECURRENCE_END_DATE}";
		var v_recurrence_count = Number("${detail.RECURRENCE_COUNT}");
		var v_recurrence_rule = "${detail.RECURRENCE_RULE}";
		var v_share_yn = "${detail.SHARE_YN}";
		var v_alarm_target = "${detail.ALARM_TARGET}";
		var v_alarm_flag = "${detail.ALARM_FLAG}";
		var v_before_move_time = "${detail.BEFORE_MOVE_TIME}";
		var v_after_move_time = "${detail.AFTER_MOVE_TIME}";
		
		var v_invite_name = "${detail.INVITE_NAME}";
		var v_invite_member_id = "${detail.INVITE_MEMBER_ID}";
		var v_invite_email = "${detail.INVITE_EMAIL}";
		var v_invite_calendar_id = "${detail.INVITE_CALENDAR_ID}";
		var v_ex_date_yn = "${detail.EX_DATE_YN}";
		var v_recurrence_dateorder = "${detail.RECURRENCE_DateOrder}";
		
		
		if(v_event_code == 8 || v_event_code == 9 || v_event_code == 10) {
			//외부캘린더
			
			$("#textModalCountNum").val("");
			$("#textModalEndRuleDate").val("");
			
			var starteventdate = new Date(v_start);
			var startyear = starteventdate.getFullYear();
			var startmonth = (starteventdate.getMonth() <= 8) ? "0"+(starteventdate.getMonth()+1).toString() : starteventdate.getMonth()+1;
			var startdate = (starteventdate.getDate() <= 9) ? "0"+(starteventdate.getDate()).toString() : starteventdate.getDate();
			var starthour = (starteventdate.getHours() <= 9) ? "0"+(starteventdate.getHours()).toString() : starteventdate.getHours();
			var startmin = (starteventdate.getMinutes() <= 9) ? "0"+(starteventdate.getMinutes()).toString() : starteventdate.getMinutes();
			
			var endeventdate;
			var endyear;
			var endmonth;
			var enddate;
			var endhour;
			var endmin;
			
			//if(calEvent.end==null && calEvent.TIME_GAP!=null) {
			if(v_end == "" && v_time_gap != "") {
				endeventdate = new Date(v_start);
				endeventdate = new Date(Date.parse(endeventdate) + v_time_gap * 1000 * 60);
				endyear = endeventdate.getFullYear();
				endmonth = (endeventdate.getMonth() <= 8) ? "0"+(endeventdate.getMonth()+1).toString() : endeventdate.getMonth()+1;
				enddate = (endeventdate.getDate() <= 9) ? "0"+(endeventdate.getDate()).toString() : endeventdate.getDate();
				endhour = (endeventdate.getHours() <= 9) ? "0"+(endeventdate.getHours()).toString() : endeventdate.getHours();
				endmin = (endeventdate.getMinutes() <= 9) ? "0"+(endeventdate.getMinutes()).toString() : endeventdate.getMinutes();
			//}else if(calEvent.end!=null) {
			}
			else if(v_end != "") {
				endeventdate = new Date(v_end);
				endyear = endeventdate.getFullYear();
				endmonth = (endeventdate.getMonth() <= 8) ? "0"+(endeventdate.getMonth()+1).toString() : endeventdate.getMonth()+1;
				enddate = (endeventdate.getDate() <= 9) ? "0"+(endeventdate.getDate()).toString() : endeventdate.getDate();
				endhour = (endeventdate.getHours() <= 9) ? "0"+(endeventdate.getHours()).toString() : endeventdate.getHours();
				endmin = (endeventdate.getMinutes() <= 9) ? "0"+(endeventdate.getMinutes()).toString() : endeventdate.getMinutes();
			}
			else {
				endeventdate = starteventdate;
				endyear = startyear;
				endmonth = startmonth;
				enddate = startdate;
				endhour = starthour;
				endmin = startmin;
			}
			
			//$("#textModalEventSubject2").val(calEvent.title);
			$("#textModalEventSubject2").val(v_title);
			//$("#selectModalEventCode2").val(calEvent.EVENT_CODE);
			//$("#selectModalCalendarID2").val(calEvent.CALENDAR_ID);
			//$("#textareaModalEventDetail2").val(calEvent.EVENT_DETAIL);
			$("#textareaModalEventDetail2").val(v_event_detail);
			var tAreaH = $("#textareaModalEventDetail2")[0].value.substr(0, $("#textareaModalEventDetail2")[0].selectionStart).split("\n").length*17;
			$("#textareaModalEventDetail2").height(1).height($("#textareaModalEventDetail2").prop('scrollHeight')+(tAreaH+12));
			
			$("#selectModalStartDateTime2").val(startyear+"-"+startmonth+"-"+startdate+"  "+starthour+":"+startmin);
			$("#selectModalEndDateTime2").val(endyear+"-"+endmonth+"-"+enddate+"  "+endhour+":"+endmin);
			//$("#textModalEventLocation2").val(calEvent.LOCATION);
			$("#textModalEventLocation2").val(v_location);
			//모바일 없음 $("#buttonModalDelete").css('display','');
			rrule.nthOfMonth();
			//$("#myModalOutlook").modal();
			compare_before = $("#formModalData").serialize();
		}
		else if(v_event_code != 5) {
			//일정초대
			selectInviteMemberList(v_event_id);

			$("input:checkbox[name=RRulecheckboxModalByweekday]").each(function (index) {  
				this.checked=false;
			});
			$("#textModalCountNum").val("");
			$("#textModalEndRuleDate").val("");

			//if(calEvent.end==null && calEvent.TIME_GAP!=null) {
			if(v_end == "" && v_time_gap != "") {
				endeventdate = new Date(v_start);
				endeventdate = new Date(Date.parse(endeventdate) + v_time_gap * 1000 * 60);
				$("#hiddenModalEndDate").val(moment(endeventdate).format("YYYY-MM-DD"));
			}
			else{
				$("#hiddenModalEndDate").val(moment(v_end).format("YYYY-MM-DD"));
			}

			var starteventdate = new Date(v_start);
			var startyear = starteventdate.getFullYear();
			var startmonth = (starteventdate.getMonth() <= 8) ? "0"+(starteventdate.getMonth()+1).toString() : starteventdate.getMonth()+1;
			var startdate = (starteventdate.getDate() <= 9) ? "0"+(starteventdate.getDate()).toString() : starteventdate.getDate();
			var starthour = (starteventdate.getHours() <= 9) ? "0"+(starteventdate.getHours()).toString() : starteventdate.getHours();
			var startmin = (starteventdate.getMinutes() <= 9) ? "0"+(starteventdate.getMinutes()).toString() : starteventdate.getMinutes();
			
			var endeventdate;
			var endyear;
			var endmonth;
			var enddate;
			var endhour;
			var endmin;

			//if(calEvent.end==null && calEvent.TIME_GAP!=null) {
				//if(calEvent.allDay==false) {
			if(v_end == "" && v_time_gap != "") {
				if(v_allDay == false) {
					endeventdate = new Date(v_start);
					endeventdate = new Date(Date.parse(endeventdate) + v_time_gap * 1000 * 60);
					endyear = endeventdate.getFullYear();
					endmonth = (endeventdate.getMonth() <= 8) ? "0"+(endeventdate.getMonth()+1).toString() : endeventdate.getMonth()+1;
					enddate = (endeventdate.getDate() <= 9) ? "0"+(endeventdate.getDate()).toString() : endeventdate.getDate();
					endhour = (endeventdate.getHours() <= 9) ? "0"+(endeventdate.getHours()).toString() : endeventdate.getHours();
					endmin = (endeventdate.getMinutes() <= 9) ? "0"+(endeventdate.getMinutes()).toString() : endeventdate.getMinutes();
				}
				else if(v_allDay == true) {
					endeventdate = new Date(v_start);
					endeventdate = new Date(Date.parse(endeventdate) + v_time_gap * 1000 * 60);
					endeventdate.setDate(endeventdate.getDate()-1);
					endyear = endeventdate.getFullYear();
					endmonth = (endeventdate.getMonth() <= 8) ? "0"+(endeventdate.getMonth()+1).toString() : endeventdate.getMonth()+1;
					enddate = (endeventdate.getDate() <= 9) ? "0"+(endeventdate.getDate()).toString() : endeventdate.getDate();
					endhour = (endeventdate.getHours() <= 9) ? "0"+(endeventdate.getHours()).toString() : endeventdate.getHours();
					endmin = (endeventdate.getMinutes() <= 9) ? "0"+(endeventdate.getMinutes()).toString() : endeventdate.getMinutes();
				}
			}
			//else if(calEvent.end!=null) {
				//if(calEvent.allDay==false) {
			else if(v_end != "") {
				if(v_allDay == false) {
					endeventdate = new Date(v_end);
					endyear = endeventdate.getFullYear();
					endmonth = (endeventdate.getMonth() <= 8) ? "0"+(endeventdate.getMonth()+1).toString() : endeventdate.getMonth()+1;
					enddate = (endeventdate.getDate() <= 9) ? "0"+(endeventdate.getDate()).toString() : endeventdate.getDate();
					endhour = (endeventdate.getHours() <= 9) ? "0"+(endeventdate.getHours()).toString() : endeventdate.getHours();
					endmin = (endeventdate.getMinutes() <= 9) ? "0"+(endeventdate.getMinutes()).toString() : endeventdate.getMinutes();
				}
				else if(v_allDay == true) {
					endeventdate = new Date(v_end);
					endeventdate.setDate(endeventdate.getDate()-1);
					endyear = endeventdate.getFullYear();
					endmonth = (endeventdate.getMonth() <= 8) ? "0"+(endeventdate.getMonth()+1).toString() : endeventdate.getMonth()+1;
					enddate = (endeventdate.getDate() <= 9) ? "0"+(endeventdate.getDate()).toString() : endeventdate.getDate();
					endhour = (endeventdate.getHours() <= 9) ? "0"+(endeventdate.getHours()).toString() : endeventdate.getHours();
					endmin = (endeventdate.getMinutes() <= 9) ? "0"+(endeventdate.getMinutes()).toString() : endeventdate.getMinutes();
				}
			}
			else {
				endeventdate = starteventdate;
				endyear = startyear;
				endmonth = startmonth;
				enddate = startdate;
				endhour = starthour;
				endmin = startmin;
			}

			$("#textModalEventLocation").val(v_location);
			$("#textModalEventSubject").val(v_title);
			$("#selectModalEventCode").val(v_event_code);
			$("#selectModalCalendarID").val(v_calendar_id);
			$("#textareaModalEventDetail").val(v_event_detail);
			var tAreaH = $("#textareaModalEventDetail")[0].value.substr(0, $("#textareaModalEventDetail")[0].selectionStart).split("\n").length*17;
			$("#textareaModalEventDetail").height(1).height($("#textareaModalEventDetail").prop('scrollHeight')+(tAreaH+12));
			
			$("#textModalStartDate").val(startyear+"-"+startmonth+"-"+startdate);
			$("#hiddenModalOrgStartDate").val(startyear+"-"+startmonth+"-"+startdate);
			$("#selectModalStartDateTime").val(starthour+":"+startmin);
			$("#textModalEndDate").val(endyear+"-"+endmonth+"-"+enddate);
			$("#selectModalEndDateTime").val(endhour+":"+endmin);
			$("#hiddenModalRruleString").val('');
			
			$("#selectModalSyncId").val(v_sync_yn);

			if(v_allDay == false || v_allDay == "") {
				$("#checkboxModalAllday").val("N");
				$("#hiddenModalAllday_YN").val("N");
				$("#checkboxModalAllday").prop("checked", false);
				//$("#selectModalStartDateTime").css("display", "");
				//$("#selectModalEndDateTime").css("display", "");
				////$("#selectModalStartDateTime").attr("disabled", false); 
				////$("#selectModalEndDateTime").attr("disabled", false);

				//모바일은 disabled 처리
				$("#selectModalStartDateTime").attr("disabled", false);
				$("#selectModalEndDateTime").attr("disabled", false);
			}
			else if(v_allDay == true){
				$("#checkboxModalAllday").val("Y");
				$("#hiddenModalAllday_YN").val("Y");
				$("#checkboxModalAllday").prop("checked", true);
				//$("#selectModalStartDateTime").val(""); $("#selectModalStartDateTime").css("display", "none");
				//$("#selectModalEndDateTime").val(""); $("#selectModalEndDateTime").css("display", "none");
				////$("#selectModalStartDateTime").val(""); $("#selectModalStartDateTime").attr("disabled", true); 
				////$("#selectModalEndDateTime").val(""); $("#selectModalEndDateTime").attr("disabled", true);
				
				//모바일은 disabled 처리
				$("#selectModalStartDateTime").attr("disabled", true);
				$("#selectModalEndDateTime").attr("disabled", true);
				
				$('#selectModalStartDateTime').css('background','#ddd');
				$('#selectModalEndDateTime').css('background','#ddd');
			}
			
			//REPEAT_YN 값 어디감?, REPEAT_Y는 위에 반복 설정에서 세팅
			//if(v_repeat_yn == "Y" || v_repeat_y == "Y") {
			if(v_repeat_yn == "Y") {
				$("#checkboxModalRepeat").val("Y");
				$("#hiddenModalRepeat_YN").val("Y");
				$("#checkboxModalRepeat").prop("checked", true);
				$("#selectModalFreq").val(v_recurrence_freq);

				if(v_recurrence_freq == '1'){
					rrule.selectFreq($("#selectModalFreq")["0"]);
					$("#divModalMonthlyByweekday").show();
					$("#divModalElseByweekday").hide();
					
					if(isEmpty(v_recurrence_byweekday)){
						$('input:radio[name=divModalMonthlyRule]')["0"].checked=true;
					}
					else{
						$('input:radio[name=divModalMonthlyRule]')["1"].checked=true;
					}
				}
				else if(v_recurrence_freq == '2'){
					rrule.selectFreq($("#selectModalFreq")["0"]);
					$("#divModalMonthlyByweekday").hide();
					$("#divModalElseByweekday").show();
				}
				else if(v_recurrence_freq == '3'){
					rrule.selectFreq($("#selectModalFreq")["0"]);
					$("#divModalMonthlyByweekday").show();
					$("#divModalElseByweekday").hide();
					if(isEmpty(v_recurrence_byweekday)){
						$('input:radio[name=divModalMonthlyRule]')["0"].checked=true;
					}else{
						$('input:radio[name=divModalMonthlyRule]')["1"].checked=true;
					}
				}
				
				$("#selectModalInterval").val(v_recurrence_interval);
				//if(calEvent.RECURRENCE_BYWEEKDAY!=undefined) {
				if(v_recurrence_byweekday != "") {
					var byWeekDay = v_recurrence_byweekday.substring(6, v_recurrence_byweekday.length).split(',');
					for(var i=0; i<byWeekDay.length; i++) {
						$("#checkboxModalRRule" + byWeekDay[i]).prop("checked", true);
					}
				}

				//if(calEvent.RECURRENCE_BYMONTHDAY!=undefined) {
				if(v_recurrence_bymonthday != "") {
					var byMonthDay = v_recurrence_bymonthday.charAt(0);
					if(byMonthDay != '+' && byMonthDay != '-'){
						$('input:radio[name="divModalMonthlyRule"]:input[value="BYMONTHDAY"]').prop("checked", true);
					}else{
						$('input:radio[name="divModalMonthlyRule"]:input[value="BYDAY"]').prop("checked", true);
					}
				}

				//if(calEvent.RECURRENCE_END_DATE!=undefined) {
				if(v_recurrence_end_date != "") {
					$("#checkboxModalEndRuleDate").prop("checked", true);
					$("#textModalEndRuleDate").val(v_recurrence_end_date);
					$("#textModalEndRuleDate").attr("disabled", false);
					$("#textModalCountNum").attr("disabled", true);
				}
				else if(v_recurrence_count == 500) {
					$("#radioModalCountNull").prop("checked", true);
					$("#textModalEndRuleDate").attr("disabled", true);
					$("#textModalCountNum").attr("disabled", true);
				}
				//else if(v_recurrence_count < 500 || v_recurrence_count > 500) {
				else if(v_recurrence_count > 0 && v_recurrence_count != 500) {
					$("#radioModalCountNum").prop("checked", true);
					$("#textModalCountNum").val(v_recurrence_count);
					$("#textModalEndRuleDate").attr("disabled", true);
					$("#textModalCountNum").attr("disabled", false);
				}
				else {
					$("#radioModalCountNull").prop("checked", true);
					$("#textModalCountNum").val("");
					$("#textModalCountNum").attr("disabled", true);
					$("#textModalEndRuleDate").val("");
					$("#textModalEndRuleDate").attr("disabled", true);
				}
				
				$("#hiddenModalRruleString").val(v_recurrence_rule);
				rrule.getRepeat($("#hiddenModalRruleString").val());
				//$("#divModalRepeatOption").css("display", "");
				
				$('#divModalRepeatOption').show();
			}
			//else if(calEvent.REPEAT_YN=="N" || calEvent.REPEAT_YN==null) {
			else if(v_repeat_yn == "N" || v_repeat_yn == "") {
				$("#checkboxModalRepeat").val("N");
				$("#hiddenModalRepeat_YN").val("N");
				$("#checkboxModalRepeat").prop("checked", false);
				//$("#divModalRepeatOption").css("display", "none");
				
				$('#divModalRepeatOption').hide();
			}

			if(v_share_yn == "Y"){
				$("#radioModalShareY").prop("checked", true);
				//$("input:radio[name='radioModalShareYN']:radio[value='Y']").prop("checked", true);
			}
			else if (v_share_yn == "N"){
				$("#radioModalShareN").prop("checked", true);
				//$("input:radio[name='radioModalShareYN']:radio[value='N']").prop("checked", true);
			}

			$("#selectModalAlam").val(v_alarm_target);
			if(v_alarm_flag == "H"){
				//한시간전
				$("#radioModalAlam1").prop("checked", true);
			}
			else if(v_alarm_flag == "D"){
				//하루전
				$("#radioModalAlam2").prop("checked", true);
			}
			else if(v_alarm_flag == "W"){
				//일주일전
				$("#radioModalAlam3").prop("checked", true);
			}
			else {
				$("#radioModalAlam0").prop("checked", true);
			}
			
			//if(calEvent.BEFORE_MOVE_TIME =="" || calEvent.BEFORE_MOVE_TIME==null){
			if(v_before_move_time == "" || v_before_move_time == null){
				$("#divModalEventCode").css("display", "none");
			}
			else{
				$("#divModalEventCode").css("display", "");
				$("#selectModalBeforeMoveTimeMin").val(v_before_move_time);
			}
			
			//if(calEvent.AFTER_MOVE_TIME =="" || calEvent.AFTER_MOVE_TIME==null){
			if(v_after_move_time == "" || v_after_move_time == null){
				$("#divModalEventCode2").css("display", "none");
			}
			else{
				$("#divModalEventCode2").css("display", "");
				$("#selectModalAfterMoveTimeMin").val(v_after_move_time);
			}

			//모바일 없음 $("div.company-current").html("");
			$("#hiddenModalMemberList").val("");

			if($("#selectModalEventCode option:selected").attr('id') == 'meeting') {
				$("#divModalEventCode").show();
				$("#divModalEventCode2").show();
				$('#line_move').css("display", "block");
			}
			else {
				$("#divModalEventCode").hide();
				$("#divModalEventCode2").hide();
				$('#line_move').css("display", "none");
			}
			
			

			//일단 무조건 체크 해제
			$("#checkboxModalInvite").val("N");
			$("#checkboxModalInvite").prop("checked", false);
			//모바일 없음 $("#divModalConviteOption").css("display", "none");

			$("#textModalInviteName").val(v_invite_name);
			$("#textModalInviteId").val(v_invite_member_id);
			$("#textModalInviteMail").val(v_invite_email);
			$("#textModalInviteCalendarId").val(v_invite_calendar_id);
			$("#hiddenModalEventId").val(v_event_id);
			$("#hiddenModalEXDate_YN").val(v_ex_date_yn);
			$("#hiddenModalRruleDateOrder").val(v_recurrence_dateorder);
			/*추가*/
			$("#hiddenModalRruleSyncId").val(calEvent.RRULE_SYNC_ID);
        	$("#hiddenModalRuleByweekday").val(calEvent.RECURRENCE_BYWEEKDAY);
        	if($("#hiddenModalRruleSyncId").val() != null && $("#hiddenModalRruleSyncId").val() != ""){
        		$("#checkboxModalRepeat").parent().hide();
        	}else{
        		$("#checkboxModalRepeat").parent().show();
        	}
        	
        	
			$("#hiddenModalMemberList").val("");
			commonSearch.multipleMemberArray=[];
				
			//모바일 없음 $("#buttonModalSubmit").html("저장하기");
			//모바일 없음 $("#buttonModalMailSubmit").html("저장하고 메일보내기");
			//모바일 없음 $("#buttonModalDelete").css('display','');
			rrule.nthOfMonth();
			
			//$(".repeat_upd_msg_pop").hide();
			//$(".repeat_del_msg_pop").hide();
			
			//$.ajaxLoadingHide();
			//$("#myModal1").modal();
			
			compare_before = $("#formModalData").serialize();
		}
	}
	else if ('${mode}' == 'I'){
		modal.reset("${curDate}");
	}
	
});  //$(document).ready(function() {

	
	function fncList(){
		window.history.back();
	}

<%--
	//반복일정 수정일정인지 아닌지 체크
	function fncSaveSchedule(val) {
		compare_after = $("#formModalData").serialize();
		
		//if(val == 'submit' && compare_before != compare_after){
		if(val == 'submit'){
			if('${mode}' == 'M' && ($('#hiddenModalRruleString').val() != null && $('#hiddenModalRruleString').val() != '')){
				//$(".repeat_upd_msg_pop").show();
				layer_open('layer_submit');
			}
			else{
				rruleSubmit(0, "submit");
			}
		}
		else if(val == 'delete'){
			if('${mode}' == 'M' && ($('#hiddenModalRruleString').val() != null && $('#hiddenModalRruleString').val() != '')){
				layer_open('layer_delete');
			}
			else{
				deleteModal();
			}
		}

		/*
		if(val == 'submit' && compare_before != compare_after){
			if(modalFlag == 'upd' && ($('#hiddenModalRruleString').val()!=null && $('#hiddenModalRruleString').val()!='')){
				$(".repeat_upd_msg_pop").show();
			}else{
				modal.submit();
			}
		}else if(val == 'submit' && compare_before == compare_after){
			$('#myModal1').modal("hide");
		}else if(val == 'delete'){
			if(modalFlag == 'upd' && ($('#hiddenModalRruleString').val()!=null && $('#hiddenModalRruleString').val()!='')){
				$(".repeat_del_msg_pop").show();
				}else{
					modal.deleteModal();
			}
		}
		*/
	}
--%>

	function fncSearchMember(){
		var search_member_txt = $('#search_member_txt').val();
		if (search_member_txt.length < 2){
			alert('2 글자 이상 입력해주세요.');
			$('#search_member_txt').focus();
		} else {

			$.ajax({
				url: "/common/searchMemberInfo.do",
				async : false,
				dataType: "json",
	            data: {
	            	memberName: search_member_txt
	            },
				success : function(data) {
					var memberList = data.list;
					$("#search_member_list").html("");
					if (memberList.length > 0) {
						for (var i = 0; i < memberList.length; i++) {
							$("#search_member_list").append(
								'<li><span>'+memberList[i].HAN_NAME+'</span>&nbsp;<a href="javascript:fncAddMember(\''+memberList[i].MEMBER_ID_NUM+'\',\''+memberList[i].HAN_NAME+'\',\''+memberList[i].EMAIL+'\');void(0);"><img src="/images/m/icon_plus.svg" /></a></li>'
							);
						}
					} else {
						$("#search_member_list").append(
								"<li><span>데이터가 없습니다.</span></li>");
					}
				},
				complete : function() {

				},
				error : function() {
					alert("직원 검색을 실패했습니다.\n관리자에게 문의하세요.");
				}
			});
		}
	}
	
	function fncAddMember(member_id_num, han_name, email){
		//if ($.inArray(member_id_num, invite_members) < 0){
		if($.inArray(member_id_num+"/"+email+"/"+han_name, invite_members) == -1) {
			//invite_members.push(member_id_num);
			invite_members.push(member_id_num+"/"+email+"/"+han_name);
			var _html = '<li class="value" id="member_'+member_id_num+'"><span class="txt">'+han_name+'</span>';
			_html += '<a href="#" onClick="fncRemoveMember(\''+member_id_num+'\'); return false;" class="remove"><img src="/images/m/icon_close.svg" /></a></li>';
			$('#invite_member_list').append(_html);
			
			$("#hiddenModalMemberList").val(invite_members);
		} else {
			
		}
	}
	
	function fncRemoveMember(member_id_num){
		if ($.inArray(member_id_num, invite_members) < 0){
			
		} else {
			invite_members.pop(member_id_num);
			$('#member_'+member_id_num).remove();
		}
	}
	
	
function selectInviteMemberList(event_id) {
	var params = $.param({
		hiddenModalEventId : event_id,
		datatype : 'json'
	});
	
	$.ajax({
		url : "/calendar/getInviteMemberList.do",
		beforeSend : function(xhr){
			xhr.setRequestHeader("AJAX", true);
			//$.ajaxLoadingShow();
		},
		data :params,
		success : function(data){
			/* $("#checkboxModalInviteList").val("Y");
			$("#checkboxModalInviteList").prop("checked", true);
			$("#divModalConviteOption").css("display", ""); */
			//$("#formModalData .invite-area-list").html('');
			$("#formModalData .invite-area-list").html('<h3 class="ag_c">참석자 리스트</h3>' 
							+ '<table class="basic3">'
							+ '<colgroup>'
							+ '<col width=""/>'
							+ '<col width=""/>'
							+ '<col width=""/>'
							//+ '<col width=""/>'
							+ '<col width=""/>'
							+ ' </colgroup>'
							+ ' <thead> '
							+ '     <tr> '
							+ '         <th>이름</th> '
							+ '         <th>발신상태</th> '
							+ '         <th>수락여부</th> '
							/*  + '         <th>수락시간</th> ' */
							+ '         <th>삭제</th> ' 
							+ '     </tr> '
							+ ' </thead>'
							+ ' <tbody id="tbodyModalInviteList">'
							+ ' </tbody>'
							+ ' </table>');  

			for(i=0; i<data.InviteMemberList.length; i++){
				$("#tbodyModalInviteList").append('<tr>');
				$("#tbodyModalInviteList").append('<td style="text-align:center;">'+data.InviteMemberList[i].HAN_NAME+'</td>');
				$("#tbodyModalInviteList").append('<td style="text-align:center;">'+data.InviteMemberList[i].SEND_STATUS_YN+'</td>');
				$("#tbodyModalInviteList").append('<td style="text-align:center;">'+data.InviteMemberList[i].INVITE_YN+'</td>');
				$("#tbodyModalInviteList").append('<td style="text-align:center;"><a onClick="inviteMemberDel(this,'+event_id+','+data.InviteMemberList[i].INVITE_ID+','+data.InviteMemberList[i].CALENDAR_ID+');"><img src="/images/m/icon_close.svg" alt="삭제" /></a></td>');
				$("#tbodyModalInviteList").append('</tr>');
				
				/* $("#formModalData .invite-area-list").append('<div class="col-sm-4">'+data.InviteMemberList[i].EMAIL+'</div>'); */
				/* $("#formModalData .invite-area-list").append('<div class="col-sm-4">'+moment(data.InviteMemberList[i].SYS_UPDATE_DATE).format('YYYY[-]MM[-]DD HH:mm:ss')+'</div>'); */
				/* $("#formModalData .invite-area-list").append('</div>'); */
			}
			//초대 체크박스 
			if(data.InviteMemberList.length > 0){
				$("#checkboxModalInvite").val("Y");
				$("#checkboxModalInvite").prop("checked", true);
				
				//$("#divModalConviteOption").css("display", "");
				//$("#buttonModalMailSubmit").css("display", "");
				
				//초대 영역 보이기
				//$('.pop_search_area').show();
				$('#div_invite_area').show();
			}else{
				$("#checkboxModalInvite").val("N");
				$("#checkboxModalInvite").prop("checked", false);
				
				//$("#divModalConviteOption").css("display", "none");
				//$("#buttonModalMailSubmit").css("display", "none");
				
				//초대 영역 숨기기
				//$('.pop_search_area').hide();
				$('#div_invite_area').hide();
			}
			//compare_before = $("#formModalData").serialize();
		},
		complete : function(){
			//$.ajaxLoadingHide();
		}
	});
}
	
function inviteMemberDel(obj, event_id, invite_id, calendar_id) {
	
	var params = $.param({
		event_id : event_id,
		invite_id : invite_id,
		calendar_id : calendar_id,
		datatype : 'json'
	});
	
	$.ajax({
		url : "/calendar/deleteInviteMemberList.do",
		data :params,
		beforeSend : function(xhr){
			xhr.setRequestHeader("AJAX", true);
			//if(!compareFlag) {
				if(!confirm("참석자를 삭제하시겠습니까?")) return false;
           	//}
			//$.ajaxLoadingShow();
		},
		success : function(data){
			alert("참석자를 삭제하였습니다.");
			//$('tbody#tbodyModalInviteList tr').remove();
			var tr = $(obj).parent().parent();
			//라인 삭제
			tr.remove();

			compare_before = $("#formModalData").serialize();
		},
		complete : function(){
			
		}
	});
}


var modalFlag = "ins/upd"; //추가 수정 변수
var v_mode = '${mode}';

if(v_mode == 'M') {
	modalFlag = "upd";
}
else {
	modalFlag = "ins";
}
	
var modal = {
	changeEndDate : function() {
		var startDateTime = $("#selectModalStartDateTime").val();
		
		var split = startDateTime.split(":");
		var endHour = "";
		(parseInt(split[0],"10")+1) > 9 ? endHour = parseInt(split[0],"10")+1 : endHour = "0"+(parseInt(split[0],"10")+1);
		$("#selectModalEndDateTime").val(endHour+":"+split[1]);
	},
	//신규등록
	reset : function(date) {
		//modalFlag = "ins";
		
		//$("#divInviteMemberList").html('');
		//$("#divInviteMemberList").html('<div class="form-group"><label class="col-sm-2 control-label" style="text-align: center;">이름</label>'+
		//		'<label class="col-sm-4 control-label" style="text-align: center;">메일</label>'+
		//		'<label class="col-sm-2 control-label" style="text-align: center;">수락여부</label>'+
		//		'<label class="col-sm-4 control-label" style="text-align: center;">수락시간</label></div>');

		//모바일 없음 $("small.font-bold").html("");
		$("#formModalData input:text").val("");
		$("#formModalData select > option:first").prop("selected",true);
		$("#formModalData textarea").val("");
		$("#formModalData textarea").height(1).height(33);
		$("#formModalData .invite-area-list").html("");
		$("#checkboxModalInvite").val("N");
		$("#checkboxModalInvite").prop("checked", false);
		//모바일 없음 $("#divModalConviteOption").css("display", "none");
		
		//$('select[name^="selectModal"]').val("");
		//$('select[name^="selectModal"]').attr("disabled", false);
		$('input[name^="checkboxModal"]').val("N");
		$('input[name^="checkboxModal"]').prop("checked", false);
		
		//$('select[id^="selectModalSyncId"] > option:nth-child(2)').attr("selected", "selected");
		$("#radioModalCountNull").prop("checked", true);
		$("#selectModalBeforeMoveTimeMin").val("0");
		$("#selectModalAfterMoveTimeMin").val("0");
		$("#selectModalFreq").val("2");       //반복일정 매주
		$("#selectModalInterval").val("1");   //반복일정 1주에 한번
		//$("#divModalInterval").hide();
		rrule.selectFreq($("#selectModalFreq")[0]);
		
		$("#hiddenModalAllday_YN").val("N");
		$("#hiddenModalRepeat_YN").val("N");
		
		//모바일 없음 $("h4.modal-title").html("일정관리 신규 등록");
		//모바일 없음 $("#buttonModalSubmit").html("저장하기");
		//모바일 없음 $("#buttonModalMailSubmit").html("저장하고 메일보내기");
		//모바일 없음 $("#buttonModalDelete").css('display','none');

		//if($("#checkboxModalInvite").val()=='N'){
		//	alert("asfasf");
		//	$("#buttonModalMailSubmit").css('display', 'none');
		//}else{
		//	alert("aaa");
		//	$("#buttonModalMailSubmit").css('display', '');
		//} 
		 
		//모바일 없음 $("#buttonModalMailSubmit").css("display", "none");
		$("input:checkbox[name=RRulecheckboxModalByweekday]").each(function (index) {  
			this.checked=false;
	    }); 
		$("#textModalCountNum").attr("disabled", true);    //종료일(OO번 반복 후 종료) 
       	$("#textModalEndRuleDate").attr("disabled", true); //종료일(종료 날짜 텍스트 박스)
       	
       	//모바일 없음 $("div.company-current").html("");
       	$("#hiddenModalMemberList").val("");
       	//모바일 없음 commonSearch.multipleMemberArray=[];
       	
		if(date && date != moment().format("YYYY-MM-DD")) {
			$("#textModalStartDate").val(moment(date).format("YYYY-MM-DD"));    //일정시작일자
			$("#textModalEndDate").val(moment(date).format("YYYY-MM-DD"));      //일정종료날짜
			$("#selectModalStartDateTime").val("09:00");                        //일정시작시간
			$("#selectModalEndDateTime").val("10:00");                          //일정종료시간
		}
		else {
			var hour = new Date().getHours()>9 ? ''+new Date().getHours() : '0'+new Date().getHours();
			var min = new Date().getMinutes()>9 ? ''+new Date().getMinutes() : '0'+new Date().getMinutes();

			if(parseInt(min) == 0) {
				$("#selectModalStartDateTime").val(hour+":00");
				hour = (new Date().getHours()+1) > 9 ? ''+(new Date().getHours()+1) : '0'+(new Date().getHours()+1);
				$("#selectModalEndDateTime").val(hour+":00");
			}
			else if(parseInt(min) > 0 && parseInt(min) <= 30) {
				$("#selectModalStartDateTime").val(hour+":30");
				hour = (new Date().getHours()+1) > 9 ? ''+(new Date().getHours()+1) : '0'+(new Date().getHours()+1);
				$("#selectModalEndDateTime").val(hour+":30");
			}
			else if(parseInt(min) > 30) {
				hour = (new Date().getHours()+1) > 9 ? ''+(new Date().getHours()+1) : '0'+(new Date().getHours()+1);
				$("#selectModalStartDateTime").val(hour+":00");
				hour = (new Date().getHours()+2) > 9 ? ''+(new Date().getHours()+2) : '0'+(new Date().getHours()+2);
				$("#selectModalEndDateTime").val(hour+":00");
			}
			$("#textModalStartDate").val(commonDate.year+"-"+commonDate.month+"-"+commonDate.day);
			$("#textModalEndDate").val(commonDate.year+"-"+commonDate.month+"-"+commonDate.day);
		}
		
		// 여기부터
		var $officeCalendars = $("#calendar-other-office365").children();
		if($officeCalendars.size() == 0){
			
		}else{
			
		}
		
		//이동시간
		if($("#selectModalEventCode option:selected").attr('id')=='meeting') {
			$("#divModalEventCode").show();
			$("#divModalEventCode2").show();
			
			$('#line_move').css("display", "block");
			$('#before_move').css("display", "block");
			$('#after_move').css("display", "block");
		}else {
			$("#divModalEventCode").hide();
			$("#divModalEventCode2").hide();
			
			$('#line_move').css("display", "none");
			$('#before_move').css("display", "none");
			$('#after_move').css("display", "none");
		}
		
		//공개상태
		$("input:radio[name='radioModalShareYN']:radio[value='Y']").prop("checked", true);
		//일정알림
		$("input:radio[name='radioModalAlam']:radio[value='notNotice']").prop("checked", true);
		 
		$("#divModalRepeatOption").hide();  //반복일정 설정 영역
		//모바일 없음 $("#divModalMoveOption").hide();
		//모바일 없음 $("#divModalConviteOption").hide();
		
		rrule.nthOfMonth();
		//$("#myModal1").modal();
		
		//신규등록창도 수정사항 확인.
		compare_before = $("#formModalData").serialize();
	},

	//외부캘린더 공유여부 확인(사용안하는 듯)
	checkCalendarSync : function() {
		//alert($("#calendarSyncYN").val());
		if($("#calendarSyncYN").val() == 'N'){
			$("#divModalSyncCalendar").hide();
		}else{
			$("#divModalSyncCalendar").show();
		}
		/* 
		if($("#hiddenModalSync_YN option:selected").attr('id')=='Y') {
			$("#divModalSyncCalendar").show();
		}else {
			$("#divModalSyncCalendar").hide();
		}
		 */
	},
	//일정구분
	checkEventCode : function() {
		if($("#selectModalEventCode option:selected").attr('id') == 'meeting') {
			$("#divModalEventCode").show();
			$("#divModalEventCode2").show();
			$('#line_move').css("display", "block");
		}
		else {
			$("#divModalEventCode").hide();
			$("#divModalEventCode2").hide();
			$('#line_move').css("display", "none");
		}
	},
	//반복일정 수정일정인지 아닌지 체크
	bfModal : function(val) {
		compare_after = $("#formModalData").serialize();
		//if(val == 'submit' && compare_before != compare_after){
		if(val == 'submit'){
			if(modalFlag == 'upd' && ($('#hiddenModalRruleString').val() != null && $('#hiddenModalRruleString').val() != '')){
				//$(".repeat_upd_msg_pop").show();
				layer_open('layer_submit');
			}
			else{
				modal.submit();
			}
		}
		//else if(val == 'submit' && compare_before == compare_after){
			//$('#myModal1').modal("hide");
		//}
		else if(val == 'delete'){
			if(modalFlag == 'upd' && ($('#hiddenModalRruleString').val() != null && $('#hiddenModalRruleString').val() != '')){
				//(".repeat_del_msg_pop").show();
				layer_open('layer_delete');
			}
			else{
				modal.deleteModal();
			}
		}
	},
	//반복일정삭제시 deleteModal()전에 태움 팝업창 버튼3개 1:반복일정 전체삭제, 2:선택한일정만 삭제, 3:선택한 일정부터 반복일정 삭제
	//rruleCase -> 0:캘린더 이벤트 정보만 수정, 1:반복일정 전체삭제, 2:선택한일정만 삭제, 3:선택한 일정부터 반복일정 삭제
	rruleSubmit : function(num, val) {
		compareFlag = true;
		rruleCase = num;
		
		if(rruleCase == 1){
			$("#checkboxModalRepeat").val("N");
			$("#hiddenModalRepeat_YN").val("N");
		}
		else if(rruleCase == 2){
			if($("#textModalCountNum").val() != '' && $("#textModalCountNum").val() != null){
				$("#textModalCountNum").val($("#textModalCountNum").val()-$("#hiddenModalRruleDateOrder").val());
			}
		}
		
		if(val == 'submit'){
			modal.submit();
		}
		else if(val == 'delete'){
			modal.deleteModal();
		}
	},
	//일정 추가
	submit : function() {
		//모바일 체크 추가 시작
		var textModalEventSubject = $("#textModalEventSubject").val();
		if(!textModalEventSubject) {
			alert("제목을 입력하세요.");
			$("#textModalEventSubject").focus();
			return false;
		}
		
		if(textModalEventSubject.length > 100) {
			alert("100글자 이하여야 합니다.");
			$("#textModalEventSubject").focus();
			return false;
		}
		
		var selectModalEventCode = $("#selectModalEventCode").val();
		if(!selectModalEventCode) {
			alert("일정구분을 선택하세요.");
			$("#selectModalEventCode").focus();
			return false;
		}
		//모바일 체크 추가 끝
		
		//////////////////////////////일정추가
		$("#hiddenModalSync_YN").val($("#selectModalCalendarID > option:selected").attr("id"));
		$("#hiddenModalCalendarId").val($("#selectModalCalendarID").val());
		
		//종일일정 설정
		if($("#hiddenModalAllday_YN").val() == "Y") {
			var addDate = new Date($("#textModalEndDate").val());
			addDate = new Date(addDate.getFullYear() + "-" + (addDate.getMonth()+1) + "-" + (addDate.getDate()+1));
			$("#hiddenModalEndDate").val(moment(addDate).format("YYYY-MM-DD"));
		}
		else {
			$("#hiddenModalEndDate").val($("#textModalEndDate").val());
		}
		
		//반복룰 설정
		if($("#checkboxModalRepeat").val()=="Y") {
			rrule.setRepeat();
		}

		
		if(typeof rruleStartList == "undefined")
			rruleStartList = new Array();
		
		if(typeof rruleEndList == "undefined")
			rruleEndList = new Array();
		
		var param = $.param({
			datatype : 'json',
			sendMailFlag : 'N',
			rruleStartList : JSON.stringify(rruleStartList),
			rruleEndList : JSON.stringify(rruleEndList),
			rruleCase : rruleCase
		});
		var v_params = $('#formModalData').serialize() + '&' + param;
		
		var url;
		(modalFlag == "ins") ? url = "/calendar/insertCalendarEvent.do" : url = "/calendar/updateCalendarEvent.do";
		//$('#formModalData').ajaxForm({
		$.ajax({
			url : url,
			async : false,
			dataType: "json",
			beforeSubmit: function (data,form,option) {
				//if(!compareFlag) {
					if(!confirm("저장하시겠습니까?")){ 
						return false;
					}
				//}
				//$.ajaxLoadingShow();
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
			},
			/*
			data :{
				datatype : 'json',
				sendMailFlag : 'N',
				rruleStartList : JSON.stringify(rruleStartList),
				rruleEndList : JSON.stringify(rruleEndList),
				rruleCase : rruleCase
			},
			*/
			data : v_params,
			success: function(data){
				//성공후 서버에서 받은 데이터 처리
				if(data.cnt >= 0){
					if(data.map.insertDupEvent == 'Y'){
						alert("해당 시간에 중복되는 일정이 있습니다.");
					}
					compare_before = $("#formModalData").serialize();
					compareFlag = false;
					alert("일정을 저장하였습니다.");
					//$('#myModal1').modal("hide");
					//$('#calendar').fullCalendar('refetchEvents');
					
					window.location.href = "/calendar/viewCalendar.do";
				}
				else if(data.cnt == -9){
					if(data.map.insertDupEvent == 'Y'){
						alert("해당 시간에 중복되는 일정이 있습니다.");
					}
					compare_before = $("#formModalData").serialize();
					compareFlag = false;
					alert("일정을 등록하였습니다. \n\n사내캘린더 일정 등록에는 실패하였습니다 \n관리자에게 문의하세요.");
					//$('#myModal1').modal("hide");
					//$('#calendar').fullCalendar('refetchEvents');
					
					window.location.href = "/calendar/viewCalendar.do";
				}
				else {
					alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
				}
			},
			complete: function() {
				//$.ajaxLoadingHide();
			}
		});
		//}).submit();
	},
	//메일 보내기
	mailSubmit : function() {
		var textModalEventSubject = $("#textModalEventSubject").val();
		if(!textModalEventSubject) {
			alert("제목을 입력하세요.");
			$("#textModalEventSubject").focus();
			return false;
		}
		
		if(textModalEventSubject.length > 100) {
			alert("100글자 이하여야 합니다.");
			$("#textModalEventSubject").focus();
			return false;
		}
		
		var selectModalEventCode = $("#selectModalEventCode").val();
		if(!selectModalEventCode) {
			alert("일정구분을 선택하세요.");
			$("#selectModalEventCode").focus();
			return false;
		}

		/*
		alert("d");
		return false; */
		var url;
		//alert($("#selectModalSyncCalendarID > option:selected").val());
		//alert($("#selectModalCalendarID > option:selected").attr("id"));
		$("#hiddenModalSync_YN").val($("#selectModalCalendarID > option:selected").attr("id"));
		$("#hiddenModalCalendarId").val($("#selectModalCalendarID").val());
		if($("#checkboxModalRepeat").val() == "Y") {
			rrule.setRepeat();
		}
		
		if($("#hiddenModalAllday_YN").val() == "Y") {
			var addDate = new Date($("#textModalEndDate").val());
			addDate = new Date(addDate.getFullYear() + "-" + (addDate.getMonth()+1) + "-" + (addDate.getDate()+1));
			$("#hiddenModalEndDate").val(moment(addDate).format("YYYY-MM-DD"));
		}
		else {
			$("#hiddenModalEndDate").val($("#textModalEndDate").val());
		}
		
		var param = $.param({
			datatype : 'json',
			sendMailFlag : 'Y',
			rruleCase : rruleCase
		});
		var v_params = $('#formModalData').serialize() + '&' + param;
		
		(modalFlag == "ins") ? url = "/calendar/insertCalendarEvent.do" : url = "/calendar/updateCalendarEvent.do";
		//$('#formModalData').ajaxForm({
		$.ajax({
			url : url,
			async : false,
			dataType: "json",
			beforeSubmit: function (data,form,option) {
				//if(!compareFlag) {
					if(!confirm("저장하시겠습니까?")) return false;
				//}
				//$.ajaxLoadingShow();
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
			},
			/*
			data :{
				datatype : 'json',
				sendMailFlag : 'Y',
				rruleCase : rruleCase
			},
			*/
			data : v_params,
			success: function(data){
				//성공후 서버에서 받은 데이터 처리
				if(data.cnt >= 0){
					if(data.map.insertDupEvent == 'Y'){
						alert("해당 시간에 중복되는 일정이 있습니다.");
					}
					compare_before = $("#formModalData").serialize();
					compareFlag = false;
					alert("일정을 저장하였습니다.");
					//$('#myModal1').modal("hide");
					//$('#calendar').fullCalendar('refetchEvents');
					
					window.location.href = "/calendar/viewCalendar.do";
				}
				else if(data.cnt == -9){
					if(data.map.insertDupEvent == 'Y'){
						alert("해당 시간에 중복되는 일정이 있습니다.");
					}
					compare_before = $("#formModalData").serialize();
					compareFlag = false;
					alert("일정을 등록하였습니다. \n\n사내캘린더 일정 등록에는 실패하였습니다 \n관리자에게 문의하세요.");
					//$('#myModal1').modal("hide");
					//$('#calendar').fullCalendar('refetchEvents');
					
					window.location.href = "/calendar/viewCalendar.do";
				}
				else {
					alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
				}

				//반복룰 설정	            	
				//$('#calendar').fullCalendar('refetchEvents');
			},
			complete: function() {
				//$.ajaxLoadingHide();
			}
        });
	},
	deleteModal : function(){
		$.ajax({
			url : "/calendar/deleteCalendarEvent.do",
			datatype : 'json',
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
				//if(!compareFlag) {
					if(!confirm("삭제하시겠습니까?")) return false;
				//}
				//$.ajaxLoadingShow();
			},
			data :{
				datatype : 'json',
				hiddenModalEventId : $("#hiddenModalEventId").val(),
				textModalEventSubject : $("#textModalEventSubject").val(),
				textareaModalEventDetail : $("#textareaModalEventDetail").val(),
				selectModalStartDateTime : $("#selectModalStartDateTime").val(),
				selectModalEndDateTime : $("#selectModalEndDateTime").val(),
				textModalEventLocation : $("#textModalEventLocation").val(),
				rruleCase : rruleCase,
				hiddenModalOrgStartDate : $("#hiddenModalOrgStartDate").val(),
				hiddenModalEXDate_YN : $("#hiddenModalEXDate_YN").val()
			},
			success : function(data){
				if(data.cnt > 0) {/* alert("삭제하였습니다."); */ 
					compareFlag = false;
					//$('#myModal1').modal("hide");
					
					alert("삭제하였습니다.");
					window.location.href = "/calendar/viewCalendar.do";
				}
				//$('#calendar').fullCalendar('refetchEvents');
			},
			complete : function(){
				//$.ajaxLoadingHide();
			}
		});
	},
	chkBox : function(data) {
		if(!$("#"+data.id).prop("checked")) {
			$("#"+data.id).val("N");
			switch(data.id) {
				case "checkboxModalAllday" :
					$("#hiddenModalAllday_YN").val("N");
					/* $("#selectModalStartDateTime").attr("disabled", false);  */
					/* $("#selectModalEndDateTime").attr("disabled", false); break; */
					//$("#selectModalStartDateTime").css("display", "");
					//$("#selectModalEndDateTime").css("display", "");
					
					//모바일은 disabled 처리
					$("#selectModalStartDateTime").attr('disabled', false);
					$("#selectModalEndDateTime").attr('disabled', false);
					$('#selectModalStartDateTime').css('background','#fff');
					$('#selectModalEndDateTime').css('background','#fff');
					
					break;
				case "checkboxModalRepeat" :
					$("#hiddenModalRepeat_YN").val("N"); 
					//$("#divModalRepeatOption").css("display", "none");
					$("#divModalRepeatOption").hide();
					break;
				//case "checkboxModalMove"   : $("#divModalMoveOption").css("display", "none"); break;
			}
		}
		else {
			$("#"+data.id).val("Y");
			switch(data.id) {
				case "checkboxModalAllday" :
					$("#hiddenModalAllday_YN").val("Y");
					/* $("#selectModalStartDateTime").val(""); $("#selectModalStartDateTime").attr("disabled", true); */ 
					/* $("#selectModalEndDateTime").val(""); $("#selectModalEndDateTime").attr("disabled", true); break; */
					//$("#selectModalStartDateTime").val("");
					//$("#selectModalStartDateTime").css("display", "none");
					//$("#selectModalEndDateTime").val("");
					//$("#selectModalEndDateTime").css("display", "none");

					//모바일은 disabled 처리
					//$("#selectModalStartDateTime").val(v_start_time);
					$("#selectModalStartDateTime").attr("disabled", true);
					//$("#selectModalEndDateTime").val(v_end_time);
					$("#selectModalEndDateTime").attr("disabled", true);

					$('#selectModalStartDateTime').css('background','#ddd');
					$('#selectModalEndDateTime').css('background','#ddd');
					break;
				case "checkboxModalRepeat" :
					$("#hiddenModalRepeat_YN").val("Y");
					//$("#divModalRepeatOption").css("display", "");
					$("#divModalRepeatOption").show();
					break;
				//case "checkboxModalMove"   : $("#divModalMoveOption").css("display", ""); break;
			}
			rrule.selectFreq($("#selectModalFreq")[0]);
		}
	},
	inviteChkBox : function(data) {
		if(!$("#"+data.id).prop("checked")) {
			$("#"+data.id).val("N");
			/*
			switch(data.id) {
				case "checkboxModalInvite" :
					$("#divModalConviteOption").css("display", "none");
					$("#buttonModalMailSubmit").css("display", "none");
					break;
			}
			*/
			$('#div_invite_area').hide();
		}
		else {
			$("#"+data.id).val("Y");
			/*
			switch(data.id) {
				case "checkboxModalInvite" :
					$("#divModalConviteOption").css("display", "");
					$("#buttonModalMailSubmit").css("display", "");
					break;
			}
			*/
			$('#div_invite_area').show();
		}
	},
	chkDate : function(click) {
		if($("#textModalStartDate").val() != "" && $("#textModalEndDate").val() == "") {
			$("#textModalEndDate").val($("#textModalStartDate").val());
		}
		else if($("#textModalStartDate").val() == "" && $("#textModalEndDate").val() != "") {
			$("#textModalStartDate").val($("#textModalEndDate").val());
		}
		else if($("#textModalStartDate").val() != "" && $("#textModalEndDate").val() != "") {
			var startDate = $("#textModalStartDate").val().split('-');
			startDate = parseInt(startDate[0]+startDate[1]+startDate[2]);
			var endDate = $("#textModalEndDate").val().split('-');
			endDate = parseInt(endDate[0]+endDate[1]+endDate[2]);
			
			if(startDate > endDate) {
				if(click.id == "textModalStartDate")
					$("#textModalEndDate").val($("#textModalStartDate").val());
				else
					$("#textModalStartDate").val($("#textModalEndDate").val());
			}
		}
		$("#hiddenModalEndDate").val($("#textModalEndDate").val());
		
		if($("#checkboxModalRepeat").val() == 'Y'){
			rrule.selectFreq($("#selectModalFreq")[0]);
			$("input:checkbox[name=RRulecheckboxModalByweekday]").each(function (index) {  
				this.checked=false;
		    });
			modal.chkBox($("#checkboxModalRepeat")[0]);
		}
	}
}

//월반복 변수 (매월 **일, 매월 *번째 *요일)
var monthRruleDate = "";
var monthRruleTh = "";
var monthRruleDayEn = "";
var monthRruleThKo = "";
var monthRruleDay = "";
var monthRruleDayKo = "";

var ruleToString;
var rruleStartList;
var rruleEndList;

var rruleCase = 0;

var rrule = {
	//월 몇주차?
	nthOfMonth : function() {
		/* var monthRruleDate = "";
		var monthRruleTh = "";
		var monthRruleDay = ""; */
		var mntDate = moment($("#textModalStartDate").val());
		//다음주 확인
		var nextMntDate = Math.ceil(moment($("#textModalStartDate").val()).add(7, 'day').date()/7); 
		monthRruleDate = mntDate.toString().slice(8,10);
		monthRruleTh = Math.ceil(mntDate.date() / 7);
		
		if(nextMntDate == 1){
			monthRruleTh = 0;
		}
		switch (monthRruleTh) {
			case 1: monthRruleThKo = '첫째'; 
				break;
			case 2: monthRruleThKo = '둘쩨'; 
				break;
			case 3: monthRruleThKo = '셋째'; 
				break;
			case 4: monthRruleThKo = '넷째'; 
				break;
			case 5: monthRruleThKo = '다섯째'; 
				break;
			default : monthRruleThKo = '마지막'; 
				break;
		}
		switch (moment(mntDate).format("E")) {
			case '1': monthRruleDay = '0'; monthRruleDayEn = 'MO'; monthRruleDayKo = '월';
				break;
			case '2': monthRruleDay = '1'; monthRruleDayEn = 'TU'; monthRruleDayKo = '화';
				break;
			case '3': monthRruleDay = '2'; monthRruleDayEn = 'WE'; monthRruleDayKo = '수';
				break;
			case '4': monthRruleDay = '3'; monthRruleDayEn = 'TH'; monthRruleDayKo = '목';
				break;
			case '5': monthRruleDay = '4'; monthRruleDayEn = 'FR'; monthRruleDayKo = '금';
				break;
			case '6': monthRruleDay = '5'; monthRruleDayEn = 'SA'; monthRruleDayKo = '토';
				break;
			case '7': monthRruleDay = '6'; monthRruleDayEn = 'SU'; monthRruleDayKo = '일';
				break;
		}
		$("#divModalMonthlyRuleDate").html(monthRruleDate+"일");
		$("#divModalMonthlyRuleTh").html(monthRruleThKo+"주 "+monthRruleDayKo+"요일");
	},
	
	//빈도선택
	selectFreq : function(rule) {
		//console.log("selectFreq");
		//console.log(rule);
		var num="";
		var cnt="";
		var txt="";
		if(rule.value=="1"){
			$("#divModalMonthlyByweekday").show();
			$("#divModalElseByweekday").hide();
			cnt=12;
			$("#divModalInterval").css("display", "");
			$("#selectModalInterval").val("1");
			num=['한달','두달','세달','네달','다섯달','여섯달','일곱달','여덟달','아홉달','열달','열한달','일년'];
		}else if(rule.value=="2"){
			$("#divModalMonthlyByweekday").hide();
			$("#divModalElseByweekday").show();
			cnt=9;
			$("#divModalInterval").css("display", "");
			$("#selectModalInterval").val("1");
			num=['1주','2주','3주','4주','5주','6주','7주','8주','9주'];
			var wkDate = moment($("#textModalStartDate").val());
			
			$("#checkboxModalRRule"+monthRruleDayEn).prop("checked",true);
		}else if(rule.value=="3"){
			$("#divModalMonthlyByweekday").show();
			$("#divModalElseByweekday").hide();
			$("#divModalInterval").css("display", "none");
			$("#selectModalInterval").val("3");
		}else if(rule.value=="4"){
			$("#divModalMonthlyByweekday").show();
			$("#divModalElseByweekday").hide();
			$("#divModalInterval").css("display", "none");
			$("#selectModalInterval").val("6");
		}
		if(rule.value=="1" || rule.value=="2"){
			for(var i=1; i<=cnt; i++) {
				txt+="<option value='"+i+"'>"+num[i-1]+"에 한번</option>";
			}
			$("#selectModalInterval").html(txt);
		}
	},
	
	//반복룰 설정
	setRepeat : function() {
		$("#hiddenModalStartRuleDate").val($("#textModalStartDate").val());
		
		switch ($("#selectModalFreq").val()) {
		case "2":
			var byWeekdayCheck = "BYDAY=";
			$("input:checkbox:checked[name=RRulecheckboxModalByweekday]").each(function (index) {
				switch ($(this).val()) {
				case "0":
					if(byWeekdayCheck.length == 6){
						byWeekdayCheck += "MO";
					}else{
						byWeekdayCheck += ",MO";
					}
					break;
				case "1":
					if(byWeekdayCheck.length == 6){
						byWeekdayCheck += "TU";
					}else{
						byWeekdayCheck += ",TU";
					}
					break;
				case "2":
					if(byWeekdayCheck.length == 6){
						byWeekdayCheck += "WE";
					}else{
						byWeekdayCheck += ",WE";
					}
					break;
				case "3":
					if(byWeekdayCheck.length == 6){
						byWeekdayCheck += "TH";
					}else{
						byWeekdayCheck += ",TH";
					}
					break;
				case "4":
					if(byWeekdayCheck.length == 6){
						byWeekdayCheck += "FR";
					}else{
						byWeekdayCheck += ",FR";
					}
					break;
				case "5":
					if(byWeekdayCheck.length == 6){
						byWeekdayCheck += "SA";
					}else{
						byWeekdayCheck += ",SA";
					}
					break;
				case "6":
					if(byWeekdayCheck.length == 6){
						byWeekdayCheck += "SU";
					}else{
						byWeekdayCheck += ",SU";
					}
					break;
				default:
					break;
				}
		    });
			if(byWeekdayCheck.length < 7){ //주간반복 요일체크가 null일 경우 선택한 요일로 자동 세팅.
				byWeekdayCheck = byWeekdayCheck + monthRruleDayEn;
			}
			$("#hiddenModalRuleByweekday").val(byWeekdayCheck);
			break;
		default:
			var byMonthCheck = "";
			if($("input[name=divModalMonthlyRule]:checked").val() == 'BYMONTHDAY'){
				$("#hiddenModalRuleBy").val('BYMONTHDAY=');
				byMonthCheck = $("#divModalMonthlyRuleDate").html().substring(0,2);
			}else if($("input[name=divModalMonthlyRule]:checked").val() == 'BYDAY'){
				$("#hiddenModalRuleBy").val('BYDAY=');
				if(monthRruleTh == 0){
					byMonthCheck = "-1" + monthRruleDayEn;
				}else{
					byMonthCheck = "+" + monthRruleTh + monthRruleDayEn;
				}
			}
			$("#hiddenModalRuleBymonthday").val(byMonthCheck);
			break;
		}
		
		if($("input[name=radioModalEndRule]:checked").val() == ''){ //계속반복 == 4년동안
			$("#hiddenModalEndCondition").val('loop');
			$("#hiddenModalLoopNum").val('4');
		}else if($("input[name=radioModalEndRule]:checked").val() == 'count'){ //횟수 반복
			$("#hiddenModalEndCondition").val('count');
			$("#hiddenModalCountNum").val($("#textModalCountNum").val());
		}else if($("input[name=radioModalEndRule]:checked").val() == 'until'){ //종료일 설정
			$("#hiddenModalEndCondition").val('until');
			$("#hiddenModalEndRuleDate").val($("#textModalEndRuleDate").val());
		}
	},
	
	//불러온 반복룰 문자열 나누기
	getRepeat : function(data) {
		rule = RRule.fromString(data).origOptions;
	},
	
	//반복종료일 2년이내 확인
	chkEndDate : function() {
		if($("#textModalEndRuleDate").val()!="") {
			var startEventRuleDate = new Date($("#textModalStartDate").val());
			var endEventRuleDate = new Date($("#textModalEndRuleDate").val());
			var result = ((endEventRuleDate-startEventRuleDate)/86400000);
			
			if(result > 729) {
				alert("2년 이내로 선택해 주세요.");
				$("#textModalEndRuleDate").val("");
			}
			else if(result < 1) {
				alert("반복 종료일이 시작일보다 이전입니다.");
				$("#textModalEndRuleDate").val("");
			}
		}
	},
	
	inputRrule : function(freqCheck, dtstart, until, count, interval, byweekday, bymonthday) {
		//alert(freqCheck+" "+dtstart+" "+until+" "+interval+" "+byweekday+" "+bymonthday);ruleToString
		if(until != "" && until != null){
			if(byweekday != "" && byweekday != null){
				ruleToString = new RRule({
					freq: freqCheck, //빈도
					dtstart: dtstart, //시작일
					until: until, //종료조건 횟수
					interval: interval, //주기
					byweekday: byweekday //요일 선택 복수일경우 대괄호 or 월별선택 > 요일 체크
				});
			}else if(bymonthday != "" && bymonthday != null){
				ruleToString = new RRule({
					freq: freqCheck, //빈도
					dtstart: dtstart, //시작일
					until: until, //종료조건 횟수
					interval: interval, //주기
					bymonthday : bymonthday //월별선택 > 일자 체크	
				});
			}else{
				ruleToString = new RRule({
					freq: freqCheck, //빈도
					dtstart: dtstart, //시작일
					until: until, //종료조건 횟수
					interval: interval //주기
				});
			}
		}else if(count != "" && count != null){
			if(byweekday != "" && byweekday != null){
				ruleToString = new RRule({
					freq: freqCheck, //빈도
					dtstart: dtstart, //시작일
					count: count, //종료조건 횟수
					interval: interval, //주기
					byweekday : byweekday //요일 선택 복수일경우 대괄호 or 월별선택 > 요일 체크
				});
			}else if(bymonthday != "" && bymonthday != null){
				ruleToString = new RRule({
					freq: freqCheck, //빈도
					dtstart: dtstart, //시작일
					count: count, //종료조건 횟수
					interval: interval, //주기
					bymonthday : bymonthday //월별선택 > 일자 체크	
				});
			}else{
				ruleToString = new RRule({
					freq: freqCheck, //빈도
					dtstart: dtstart, //시작일
					count: count, //종료조건 횟수
					interval: interval //주기
				});
			}
		}
	}
}
</script>
<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}

		//alert($(document).height());
		//alert(temp.outerHeight() + '/' + temp.outerHeight() / 2);
		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', $(document).outerHeight()/2.2+'px'); //temp.css('margin-top', '-'+$(document).outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut();  //'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}
</script>



<style type="text/css">
	.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 310px; height:auto;  background-color:#fff; border: 5px solid #3571B5; z-index: 1000000;}
	.pop-layer .pop-container {padding: 20px 25px;}
	.pop-layer p.ctxt {color: #666; line-height: 25px;}
	.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

	a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}	
	a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
</style>

<div id="layer_submit" class="pop-layer">
	<div class="repeat_del_msg_pop">
		<div class="row top"><strong>반복일정 수정</strong></div>
		
		<div class="row mg_b10">
		이번 일정만 변경하시겠습니까 혹은 반복되는 일정 모두를 변경하시겠습니까?<br/>
		아니면 이번 일정과 향후의 반복되는 일정 모두를 변경하시겠습니까?<br /><br />
		</div>

		<div class="row mg_b10">
			<a href="#" onclick="modal.rruleSubmit(1,'submit'); return false;">이번 일정만</a>
			<span>반복일정의 다른 모든 일정을 그대로 유지합니다.</span>
		</div>
		<div class="row mg_b10">
			<a href="#" onclick="modal.rruleSubmit(2,'submit'); return false;">향후 모든 일정</a>
			<span>이 일정 및 향후 모든 일정이 모두 변경됩니다. 미래 일정에 대한 변경사항이 손실됩니다.</span>
		</div>
		<div class="row">
			<a href="#" onclick="modal.rruleSubmit(3,'submit'); return false;">모든 일정</a>
			<span>반복되는 모든 일정을 변경합니다. 다른 일정에 대한 변경사항이 손실됩니다.</span>
		</div>
		<div class="bottom">
		    <a href="#" class="cbtn">변경 취소</a>
		</div>
	</div>
</div>

<div id="layer_delete" class="pop-layer">
	<div class="repeat_del_msg_pop">
		<div class="row top"><strong>반복일정 삭제</strong></div>
		
		<div class="row mg_b10">반복되는 일정에서 이번 일정만 삭제, 전체 일정 삭제, 이번 일정과 향후 일정 삭제 중에서 선택하세요.</div>
		
		<div class="row mg_b10">
		    <a href="#" onclick="modal.rruleSubmit(1,'delete'); return false;">이번 일정만</a>
		    <span>반복일정의 다른 모든 일정을 그대로 유지합니다.</span>
		</div>
		<div class="row mg_b10">
		    <a href="#" onclick="modal.rruleSubmit(2,'delete'); return false;">향후 모든 일정</a>
		    <span>해당 일정 및 향후 모든 일정이 삭제됩니다.</span>
		</div>
		<div class="row">
		    <a href="#" onclick="modal.rruleSubmit(3,'delete'); return false;">모든 일정</a>
		    <span>반복되는 모든 일정을 삭제합니다.</span>
		</div>
		<div class="bottom">
		    <a href="#" class="cbtn">변경 취소</a>
		</div>
	</div>
</div>

<%--
<div id="layer_submit" class="pop-layer">
	<div class="pop-container">
		<div class="pop-conts">
			<!--content //-->
			<p class="ctxt mb20">
				<strong>반복일정 수정</strong><br />
				
				이번 일정만 변경하시겠습니까 혹은 반복되는 일정 모두를 변경하시겠습니까?<br/>
				아니면 이번 일정과 향후의 반복되는 일정 모두를 변경하시겠습니까?<br /><br />
				
				<!-- <a href="#" onclick="modal.rruleSubmit(1,'submit');">이번 일정만</a>
				<button type="button" onclick="modal.rruleSubmit(1,'submit');">이번 일정만</button> -->
				<input type="button" value="이번 일정만" onclick="modal.rruleSubmit(1,'submit');" />
				<span>반복일정의 다른 모든 일정을 그대로 유지합니다.</span><br />

				<!-- <a href="#" onclick="modal.rruleSubmit(2,'submit');">향후 모든 일정</a>
				<button type="button" onclick="modal.rruleSubmit(2,'submit');">향후 모든 일정</button> -->
				<input type="button" value="이번 일정만" onclick="modal.rruleSubmit(2,'submit');" />
				<span>이 일정 및 향후 모든 일정이 모두 변경됩니다. 미래 일정에 대한 변경사항이 손실됩니다.</span><br />
				
				<!-- <a href="#" onclick="modal.rruleSubmit(3,'submit');">모든 일정</a>
				<button type="button" onclick="modal.rruleSubmit(3,'submit');">모든 일정</button> -->
				<input type="button" value="이번 일정만" onclick="modal.rruleSubmit(3,'submit');" />
				<span>반복되는 모든 일정을 변경합니다. 다른 일정에 대한 변경사항이 손실됩니다.</span>
			</p>

			<div class="btn-r">
				<a href="#" class="cbtn">Close</a>
			</div>
			<!--// content-->
		</div>
	</div>
</div>

<div id="layer_delete" class="pop-layer">
	<div class="pop-container">
		<div class="pop-conts">
			<!--content //-->
			<p class="ctxt mb20">
				<strong>반복일정 삭제</strong><br />
				
				반복되는 일정에서 이번 일정만 삭제, 전체 일정 삭제, 이번 일정과 향후 일정 삭제 중에서 선택하세요.<br /><br />
				
				<!-- <a href="#" onclick="modal.rruleSubmit(1,'delete');">이번 일정만</a>
				<button type="button" onclick="modal.rruleSubmit(1,'delete');">이번 일정만</button> -->
				<input type="button" value="이번 일정만" onclick="modal.rruleSubmit(1,'delete');" />
				<span>반복되는 다른 모든 일정은 그대로 유지됩니다.</span><br />

				<!-- <a href="#" onclick="modal.rruleSubmit(2,'delete');">향후 모든 일정</a>
				<button type="button" onclick="modal.rruleSubmit(2,'delete');">향후 모든 일정</button> -->
				<input type="button" value="향후 모든 일정" onclick="modal.rruleSubmit(2,'delete');" />
				<span>해당 일정 및 향후 모든 일정이 삭제됩니다.</span><br />
				
				<!-- <a href="#" onclick="modal.rruleSubmit(3,'delete');">모든 일정</a>
				<button type="button" onclick="modal.rruleSubmit(3,'delete');">모든 일정</button> -->
				<input type="button" value="모든 일정" onclick="modal.rruleSubmit(3,'delete');" />
				<span>반복되는 모든 일정을 삭제합니다.</span>
			</p>

			<div class="btn-r">
				<a href="#" class="cbtn">Close</a>
			</div>
			<!--// content-->
		</div>
	</div>
</div>
 --%>

<div>
<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>