<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${map.searchCategory eq '본부전략'}"><title>회사/부문별전략</title></c:if>
<c:if test="${map.searchCategory eq '고객전략'}"><title>고객별전략</title></c:if>
<c:if test="${map.searchCategory eq '선투자프로젝트'}"><title>전략프로젝트</title></c:if>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
String req_params = getReqParams(request, "pkNo", "strategy");
request.setAttribute("req_params", req_params);
%>
	<article class="">
		<div class="title_pg">
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
				<li><a href="#" id="tab_1" onclick="fncSelectTab('1'); return false;" class="active">기본정보</a></li>
				<li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">KeyMilestones</a></li>
				<li><a href="#" id="tab_3" onclick="fncSelectTab('3'); return false;">이슈</a></li>
			</ul>
			
			<div class="cont1 "><!-- 기본정보 -->
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 카테고리
					</div>
					<div class="cont fl_l">${detail.CATEGORY}</div>
				</div>
	
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 검토주기
					</div>
					<div class="cont fl_l">
						<c:choose>
						<c:when test="${detail.REVIEW_CYCLE eq '0'}">매월 1회</c:when>
						<c:when test="${detail.REVIEW_CYCLE eq '1'}">분기 1회</c:when>
						<c:when test="${detail.REVIEW_CYCLE eq '2'}">반기 1회</c:when>
						</c:choose>
					</div>
				</div>
	
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 책임리더
					</div>
					${detail.RL_NAME} ${detail.RL_POSITION}
<c:if test="${fn:length(detail.RL_PHONE) > 6}">
					<a href="tel:${detail.RL_PHONE}" class="btn_phone_go"><img src="/images/m/icon_phone.png"/></a>
</c:if>
				</div>	
	
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 주요내용
					</div>
					<div class="cboth cont_box"><pre>${detail.KEY_CONTENTS}</pre></div>
				</div>
	
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 첨부파일
					</div>
					<div class="cboth cont_box">
						<ul class="file_list">
							<c:forEach items="${fileList}" var="file">
								<li><a href="/common/downloadFile.do?fileId=${file.FILE_ID}&fileTableName=1">${file.FILE_NAME}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="cont2 off"><!-- Key Milestones -->
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> Key Milestones
					</div>
					<div class="cboth keymilestones_list">
						<ul id="result_list">
						</ul>
					</div>
				</div>
			</div>
			
			
			<div class="cont3 off"> <!-- 이슈 -->
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 이슈
					</div>
					<div class="cboth issue_list">
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
								<span class="fc_gray_light">책임 담당자 : </span> <span class="fc_black">${issue.ACTION_OWNER}&nbsp;</span>
<c:if test="${fn:length(issue.ACTION_OWNER_PHONE) > 6}">
								<a href="tel:${issue.ACTION_OWNER_PHONE}" class="btn_phone_go"><img src="/images/m/icon_phone.png"/></a>
</c:if>
								<br>
								<span class="fc_gray_light">목표일 : </span> <span class="fc_black">${issue.DUE_DATE}</span> 
								/
								<span class="fc_gray_light">완료일 : </span> <span class="fc_black">
<c:if test="${issue.CLOSE_DATE ne ''}">
								${issue.CLOSE_DATE}
</c:if>
								</span>
 
								<%-- /<span class="fc_gray_light">완료일 : </span> <span class="fc_black">${issue.CLOSE_DATE}</span> --%>
							</div>
						</li>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<div class="pg_bottom">
			<div class="ta_c">
				<button type="button" onClick="fncList(); return false;" class="btn lg btn-default pd_r15 pd_l15 r5">목록</button>
			</div>
		</div>

	</article>
	
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
	function fncSelectTab(_no){
		// 탭 이동
		$('#tab_1').removeClass('active');
		$('#tab_2').removeClass('active');
		$('#tab_3').removeClass('active');
		$('#tab_'+_no).addClass('active');
		
		// 탭에 해당하는 컨테이너 보여주기
		$('.cont1').addClass('off');
		$('.cont2').addClass('off');
		$('.cont3').addClass('off');
		$('.cont'+_no).removeClass('off');
	}

	function fncList(){
		//location.href= '/bizStrategy/viewBizStrategyCompany.do?strategy=${param.strategy}';
<c:choose>
	<c:when test="${map.searchCategory eq '고객전략'}">
		window.location.href= '/bizStrategy/viewBizStrategyClient.do<c:if test="${req_params ne ''}">?${req_params}</c:if>';
	</c:when>
	<c:otherwise>
		//window.location.href= '/bizStrategy/viewBizStrategyCompany.do?searchCategory=${map.searchCategory}';
		window.location.href= '/bizStrategy/viewBizStrategyCompany.do<c:if test="${req_params ne ''}">?${req_params}</c:if>';
	</c:otherwise>
</c:choose>
	}

	function fncGetItemHtml(_object){
		var obj_html = '';
		
		if (_object.KEY_MILESTONE != ''){
			
			obj_html += '<li><div class="top"><span class="title">'+_object.KEY_MILESTONE+'</span>';
			
			var nowDate = commonDate.year+commonDate.month+commonDate.day.trim();
			if(_object.ACT_DUE_DATE == '' && _object.ACT_CLOSE_DATE == ''){
				obj_html +=  '<span class="status_circle"></span>';
			}else{
				
				if(_object.ACT_DUE_DATE){
					_object.ACT_DUE_DATE = (_object.ACT_DUE_DATE.replaceAll("-","")).trim();
				}
				if(_object.ACT_CLOSE_DATE){
					_object.ACT_CLOSE_DATE = (_object.ACT_CLOSE_DATE.replaceAll("-","")).trim();
				}
				
				if((_object.ACT_DUE_DATE >= nowDate) && !_object.ACT_CLOSE_DATE){
					_object.STATUS = 'Y';
				}else if(_object.ACT_DUE_DATE < nowDate && !_object.ACT_CLOSE_DATE){
					_object.STATUS = 'R';
				}else if(_object.ACT_DUE_DATE && _object.ACT_CLOSE_DATE){
					_object.STATUS = 'G';
				} 
				
				switch (_object.STATUS) {
				case "G":
					obj_html +=  '<span class="status_lec statusColor_green"></span>';
					break;
				case "Y":
					obj_html +=  '<span class="status_lec statusColor_yellow"></span>';
					break;
				case "R":
					obj_html +=  '<span class="status_lec statusColor_red"></span>';
					break;
				default:
					'<span class="status_lec"></span>';
					break;
				}
			}
			
			obj_html += '</div><div class="cont">'; 
			obj_html += '<span class="fc_gray_light">책임담당자 : </span>';
			
			var v_act_name = (typeof _object.ACT_NAME == "undefined")?"":_object.ACT_NAME;
			obj_html += '<span class="fc_black">'+v_act_name+'</span>';
			
			if(typeof _object.ACT_PHONE != "undefined" && _object.ACT_PHONE != '') {
				obj_html += '&nbsp;<a href="tel:'+_object.ACT_PHONE+'" class="btn_phone_go"><img src="/images/m/icon_phone.png" alt="전화걸기"/></a>';
			}
			
			obj_html += '<br/>';
			obj_html += '<span class="fc_gray_light">목표일 : </span> <span class="fc_black">'+_object.ACT_DUE_DATE+'</span>';
			
			var v_act_close_date = (typeof _object.ACT_CLOSE_DATE == "undefined")?"":_object.ACT_CLOSE_DATE;
			obj_html += ' / <span class="fc_gray_light">완료일 : </span> <span class="fc_black">'+v_act_close_date+'</span>';	
			obj_html += '</div></li>';
		}
		
		return obj_html;
	}
	$(document).ready(function() {
		$.ajax({
			type : "POST",
			data : {
				"biz_id" : '${detail.BIZ_ID}'
			},
			async: false,
			url: "/bizStrategy/gridMileStonesBizStrategyList.do",
			success:function(data){
				var list = data.rows;
				var list_html = '';
				for (var i = 0; i < list.length; i++){
					list_html += fncGetItemHtml(list[i]);
				} 
				
				$('#result_list').html(list_html);
				
			}
		});
	});
</script>


<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>