<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>전략프로젝트</title>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>

	<article class="">
		<div class="title_pg  ">
			<h2 class="mg_b5">${detail.SUBJECT}</h2>
			<!-- 
			<a href="#" class="btn_back" onclick="fncGoBack(); return false;">back</a>
			 -->
			<a href="#" class="btn_back" onclick="fncList(); return false;">back</a>
		</div>

		<div class="author">
			<span>${detail.HAN_NAME}(${detail.SYS_REGISTER_DATE})</span>
		</div>
		

		<div class="mg_l10 mg_r10">
			<ul class="tabmenu tabmenu_type2 mg_b20">
				<li><a href="#" id="tab_1" class="active" onclick="fncSelectTab('1'); return false;">기본정보</a></li>
				<li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">매출현황</a></li>
				<li><a href="#" id="tab_3" onclick="fncSelectTab('3'); return false;">KeyMilestones</a></li>
				<li><a href="#" id="tab_4" onclick="fncSelectTab('4'); return false;">이슈</a></li>
			</ul>

			<!-- 위의 탭 클릭시 아래의 cont1, cont2, cont3 가  하나씩 보여지도록 해주세요 -->

			<div class="cont1 "><!-- 기본정보 -->
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 카테고리
					</div>
					<div class="cont fl_l">${detail.Category}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 사업부서
					</div>
					<div class="cont fl_l">${detail.MEMBER_TEAM}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객사
					</div>
					<div class="cont fl_l">${detail.COMPANY_NAME}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객사ID
					</div>
					<div class="cont fl_l">${detail.COMPANY_ID}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 책임리더
					</div>
					<div class="cont fl_l">${detail.EXEC_OWNER}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 영업대표
					</div>
					<div class="cont fl_l">${detail.CEO_NAME}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 기간
					</div>
					<div class="cont fl_l">${detail.START_DATE} ~ ${detail.END_DATE}</div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 프로젝트 개요
					</div>
					<div class="cboth cont_box"><pre>${detail.DETAIL_CONTENTS}</pre></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 첨부파일
					</div>
					<div class="cboth cont_box">
						<ul class="file_list">
							<c:forEach items="${fileList}" var="file">
							<li><a href="/common/downloadFile.do?fileId=${file.FILE_ID}&fileTableName=2">${file.FILE_NAME}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

			<div class="cont2 off"><!-- Plan / Actual -->
				<h3 class="mg_b5">계약금액 및 예상매출</h3>

				<div class="mg_b10">
					<select>
						<option ${detail.CONTRACT_AMOUNT_UNIT eq 'm' ? 'selected' : ''}>월</option>
						<option ${detail.CONTRACT_AMOUNT_UNIT eq 'q' ? 'selected' : ''}>분기</option>
					</select>
<%--
					<select id="select_contract">
						<c:forEach items="${selectProjectPlanContractInfo}" var="contract">
						<c:choose>
						<c:when test="${detail.CONTRACT_AMOUNT_UNIT eq 'q'}">
							<option value="${contract.BASIS_MONTH}">${contract.PLAN_YEAR}년 ${contract.PLAN_QUARTER}분기</option>
						</c:when>
						<c:otherwise>
							<option value="${contract.BASIS_MONTH}">${contract.PLAN_YEAR}년 ${contract.PLAN_MONTH}월</option>
						</c:otherwise>
						</c:choose>
						</c:forEach>
					</select>
 --%>
				</div>
				
				<table class="basic mg_b30"><!-- 예상매출 -->
					<colgroup><col width="130px"/><col/></colgroup>
					<c:forEach items="${selectProjectPlanContractInfo}" var="contract" varStatus="status">
					<tr class="tr_contract tr_contract_${contract.BASIS_MONTH}" style="${status.count eq '1' ? '' : 'display:none;'}">
						<th class="ta_r">Plan</th>
						<td>${contract.BASIS_PLAN_REVENUE_AMOUNT}</td>
					</tr>
					<tr class="tr_contract tr_contract_${contract.BASIS_MONTH}" style="${status.count eq '1' ? '' : 'display:none;'}">
						<th class="ta_r">Actual</th>
						<td>
							<span class="fc_green fs_18">${contract.BASIS_ACTUAL_REVENUE_AMOUNT}</span>
						</td>
					</tr>
					</c:forEach>
					<tr class="total">
						<th class="ta_r">전체계약금액</th>
						<td>${detail.CONTRACT_AMOUNT_TOTAL}</td>
					</tr>
				</table>

				<h3 class="mg_b5">투자비용 산정</h3>

				<div class="mg_b10">
					<select>
						<option ${detail.INVEST_AMOUNT_UNIT eq 'm' ? 'selected' : ''}>월</option>
						<option ${detail.INVEST_AMOUNT_UNIT eq 'q' ? 'selected' : ''}>분기</option>
					</select>
<%--
					<select id="select_invest">
						<c:forEach items="${selectProjectPlanInvestInfo}" var="invest">
						<c:choose>
						<c:when test="${detail.CONTRACT_AMOUNT_UNIT eq 'q'}">
							<option value="${invest.BASIS_MONTH}">${invest.PLAN_YEAR}년 ${invest.PLAN_QUARTER}분기</option>
						</c:when>
						<c:otherwise>
							<option value="${invest.BASIS_MONTH}">${invest.PLAN_YEAR}년 ${invest.PLAN_MONTH}월</option>
						</c:otherwise>
						</c:choose>
						</c:forEach>
					</select>
 --%>
				</div>

				
				<table class="basic mg_b30">
					<colgroup><col width="130px"/><col/></colgroup>
					<c:forEach items="${selectProjectPlanInvestInfo}" var="invest" varStatus="status">
					<tr class="tr_invest tr_invest_${invest.BASIS_MONTH}" style="${status.count eq '1' ? '' : 'display:none;'}">
						<th class="ta_r">Plan</th>
						<td>${invest.BASIS_PLAN_INVEST_AMOUNT}</td>
					</tr>
					<tr class="tr_invest tr_invest_${invest.BASIS_MONTH}" style="${status.count eq '1' ? '' : 'display:none;'}">
						<th class="ta_r">Actual</th>
						<td>
							<span class="fc_green fs_18">${invest.BASIS_ACTUAL_INVEST_AMOUNT}</span>
						</td>
					</tr>
					</c:forEach>
					<tr class="total">
						<th class="ta_r">전체투자금액</th>
						<td>${detail.INVEST_AMOUNT}</td>
					</tr>
				</table>
				
			</div>

			<div class="cont3 off"><!-- keymilestones -->
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> Key Milestones
					</div>
					<div class="cboth keymilestones_list">
						<ul>
							<c:forEach items="${rows}" var="kms">
							<c:if test="${!empty kms.KEY_MILESTONE}">
							<li>
								<div class="top">
									<span class="title">${kms.KEY_MILESTONE}</span>
									<c:if test="${kms.STATUS eq 'G'}"><span class="status_lec statusColor_green"></span></c:if>
									<c:if test="${kms.STATUS eq 'Y'}"><span class="status_lec statusColor_yellow"></span></c:if>
									<c:if test="${kms.STATUS eq 'R'}"><span class="status_lec statusColor_red"></span></c:if>
								</div>
								<div class="cont">
									<span class="fc_gray_light">책임 담당자 : </span> <span class="fc_black">${kms.ACT_ID}</span><br/>
									<span class="fc_gray_light">목표일 : </span> <span class="fc_black">${kms.ACT_DUE_DATE}</span>
									<c:if test="${!empty kms.ACT_CLOSE_DATE}">
									 / <span class="fc_gray_light">완료일 : </span> <span class="fc_black">${kms.ACT_CLOSE_DATE}</span>
									 </c:if>
								</div>
							</li>
							</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			
			<!-- 이슈 -->
			<div class="cont4 off">
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 이슈
					</div>
					<div class="cboth issue_list">
						<ul>
						<c:forEach items="${issueList}" var="issue">
							<li>
								<div class="top top2">
									<span class="cata r2">${issue.ISSUE_NAME}</span> <span class="cata2 r2">${issue.ISSUE_ITEM}</span>
									<span class="title">${issue.ACTION_PLAN_NAME}</span>
									<c:choose>
										<c:when test="${issue.STATUS eq 'R'}">
											<span class="status_lec statusColor_red"></span>
										</c:when>
										<c:when test="${issue.STATUS eq 'Y'}">
											<span class="status_lec statusColor_yellow"></span>
										</c:when>
										<c:otherwise>
											<span class="status_lec statusColor_green"></span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="cont">
									<span class="fc_gray_light">책임 담당자 : </span> <span class="fc_black">${issue.ACTION_OWNER }</span><br/>
									<span class="fc_gray_light">목표일 : </span> <span class="fc_black">${issue.DUE_DATE}</span> / 
									<span class="fc_gray_light">완료일 : </span> <span class="fc_black">${issue.CLOSE_DATE}</span>
								</div>
							</li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="pg_bottom">
			<div class="ta_c">
				<button type="button" class="btn lg btn-default pd_r15 pd_l15 r5" onclick="fncList(); return false;">목록</button>
			</div>
		</div>

	</article>

<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.min.js"></script>
<!-- 
<script src="${pageContext.request.contextPath}/js/common.js"></script>
 -->

<script type="text/javascript">
	function fncList(){
		location.href= '/bizStrategy/viewBizStrategyProjectPlan.do?searchCategory=${param.searchCategory}';
	}
	
	function fncSelectTab(_no){
		// 탭 이동
		$('#tab_1').removeClass('active');
		$('#tab_2').removeClass('active');
		$('#tab_3').removeClass('active');
		$('#tab_4').removeClass('active');
		$('#tab_'+_no).addClass('active');
		
		// 탭에 해당하는 컨테이너 보여주기
		$('.cont1').addClass('off');
		$('.cont2').addClass('off');
		$('.cont3').addClass('off');
		$('.cont4').addClass('off');
		$('.cont'+_no).removeClass('off');
		
	}
	
	$(document).ready(function() {
		$('#select_contract').change(function(){
			var basis_month = $(this).val();
			$('.tr_contract').hide();
			$('.tr_contract_'+basis_month).show();
		});

		$('#select_invest').change(function(){
			var basis_month = $(this).val();
			$('.tr_invest').hide();
			$('.tr_invest_'+basis_month).show();
		});
	});
</script>

<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>