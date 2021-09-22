<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>회사/부문별전략</title>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>

	<article class="list_pg">

		<div class="topFunc mg_b10">
			<div class="sortArea">
				<div class="dropdown">
					<button class="dropdown-toggle r5 " type="button">
					    <span id="select_text">${map.detailCategory}</span>  
						<span class="caret"></span> 
					</button>
					<ul class="dropdown-menu w_100 r5 off">
						<li><a href="#" onclick="fncSelectGroup('회사전략'); return false;">회사전략</a></li>
						<li><a href="#" onclick="fncSelectGroup('본부전략'); return false;">본부전략</a></li>
						<li><a href="#" onclick="fncSelectGroup('팀전략'); return false;">팀전략</a></li>
					<%-- <c:choose>
						<c:when test="${fn:length(bizStrategySearchDetailGroup) > 0}">
							<c:forEach items="${bizStrategySearchDetailGroup}" var="category">
								<li><a href="#" onclick="fncSelectGroup('${category.CATEGORY}'); return false;">${category.CATEGORY}</a></li>
							</c:forEach>
						</c:when>
					</c:choose> --%>
					</ul>
				</div>
			</div>
		</div>	

<%--
		<c:choose>
		<c:when test="${param.strategy eq 'biz'}">
		<div class="topFunc mg_b10">
			<div class="sortArea">
				<div class="dropdown">
					<button class="dropdown-toggle r5 " type="button">
					    <span id="select_text">본부전략</span>  
						<span class="caret"></span> 
					</button>
					<ul class="dropdown-menu w_100 r5 off">
<!--
						<li><a href="#" onclick="fncSelectGroup('전략 선택'); return false;">전략 선택</a></li>
 -->
					<c:choose>
						<c:when test="${fn:length(bizStrategySearchDetailGroup) > 0}">
							<c:forEach items="${bizStrategySearchDetailGroup}" var="category">
								<li><a href="#" onclick="fncSelectGroup('${category.CATEGORY}'); return false;">${category.CATEGORY}</a></li>
							</c:forEach>
						</c:when>
					</c:choose>
					</ul>
				</div>
			</div>
		</div>
		</c:when>
		<c:otherwise>
		

		<div class="search_pgin pd_b20">
			<div class="searchArea">
				<input type="" placeholder="고객명 또는 제목 입력" /><a href="#"><span class="icon_search"></span></a>
			</div>
		</div>
		
		</c:otherwise>
		</c:choose>
 --%>
 
		<ul class="list_type1" id="result_list">
		<!-- 내용이 입력됩니다. -->
		</ul>
<%--
		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more primary_bg r2 fc_white" id="btn_more">
			<span class="icon icon_arrow_down md va_m"></span> <span class="va_m" id="span_more">더보기 6 of 6</span>
		</a>
 --%>
		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more r2" id="btn_more">
			<span class="va_m" id="span_more">더보기 6 of 6</span>
		</a>
	</article>
	
	<form id="frm" name="frm">
		
	</form>

<script src="<%=request.getContextPath()%>/js/m/jquery-1.11.0.min.js"></script>
<!--
<script src="<%=request.getContextPath()%>/js/m/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/m/common.js"></script>
 -->

<script type="text/javascript">
	var totalCnt = '${totalCnt}';
	var curCnt = 0;
	//var detailCategory = '본부전략';
	var detailCategory = '${map.detailCategory}';
	
	function fncDetail(_no){
		location.href = 'selectBizStrategyDetail.do?pkNo='+_no+'&searchCategory='+detailCategory+'&strategy=${param.strategy}';
	}
	
	function fncGetItemHtml(_object){
		var obj_html = '';
		obj_html += '<li><a href="#" onclick="fncDetail('+_object.BIZ_ID+');return false;">';
		obj_html += '<span class="top">';
		obj_html += '<span class="subject">'+_object.SUBJECT+'</span>';
		obj_html += '<span class="icon_cata r2">'+_object.CATEGORY+'</span>';
		obj_html += '</span>';
		obj_html += '<span class="bottom">';
		obj_html += '<strong>Key Milestones</strong><span class="keymilestones">';
		//마일스톤
		if (_object.KEY_MILESTONE1 != null && _object.KEY_MILESTONE1 != ''){
			obj_html += '<span class="step">';
			switch (_object.STATUS1) {
			case "G":
				obj_html +=  '<span class="status_circle statusColor_green"></span>';
				break;
			case "Y":
				obj_html +=  '<span class="status_circle statusColor_yellow"></span>';
				break;
			case "R":
				obj_html +=  '<span class="status_circle statusColor_red"></span>';
				break;
			default:
				obj_html +=  '<span class="status_circle"></span>';
				break;
			}
			
			var v_act_due_date1 = (typeof _object.ACT_DUE_DATE1 == 'undefined')?'':_object.ACT_DUE_DATE1;
			obj_html += '<span>'+_object.KEY_MILESTONE1+' ('+v_act_due_date1+')</span>';
			obj_html += '</span>';
		}

		if (_object.KEY_MILESTONE2 != null && _object.KEY_MILESTONE2 != ''){
			obj_html += '<span class="step">';
			switch (_object.STATUS2) {
			case "G":
				obj_html +=  '<span class="status_circle statusColor_green"></span>';
				break;
			case "Y":
				obj_html +=  '<span class="status_circle statusColor_yellow"></span>';
				break;
			case "R":
				obj_html +=  '<span class="status_circle statusColor_red"></span>';
				break;
			default:
				obj_html +=  '<span class="status_circle"></span>';
				break;
			}

			var v_act_due_date2 = (typeof _object.ACT_DUE_DATE2 == 'undefined')?'':_object.ACT_DUE_DATE2;
			obj_html += '<span>'+_object.KEY_MILESTONE2+' ('+v_act_due_date2+')</span>';
			obj_html += '</span>';
		}
		
		if (_object.KEY_MILESTONE3 != null && _object.KEY_MILESTONE3 != ''){
			obj_html += '<span class="step">';
			switch (_object.STATUS3) {
			case "G":
				obj_html +=  '<span class="status_circle statusColor_green"></span>';
				break;
			case "Y":
				obj_html +=  '<span class="status_circle statusColor_yellow"></span>';
				break;
			case "R":
				obj_html +=  '<span class="status_circle statusColor_red"></span>';
				break;
			default:
				obj_html +=  '<span class="status_circle"></span>';
				break;
			}
			
			var v_act_due_date3 = (typeof _object.ACT_DUE_DATE3 == 'undefined')?'':_object.ACT_DUE_DATE3;
			obj_html += '<span>'+_object.KEY_MILESTONE3+' ('+v_act_due_date3+')</span>';
			obj_html += '</span>';
		}
		
		obj_html += '</span></span></a>';
		switch (_object.STATUS) {
		case "G":
			obj_html +=  '<div class="status_current statusColor_green"></div>';
			break;
		case "Y":
			obj_html +=  '<div class="status_current statusColor_yellow"></div>';
			break;
		case "R":
			obj_html +=  '<div class="status_current statusColor_red"></div>';
			break;
		default:
			obj_html +=  '<div class="status_current"></div>';
			break;
		}
		obj_html += '</li>';
		
		return obj_html;
	}
	
	function fncSelectGroup(_group){
		$('#select_text').html(_group);
		$('.dropdown-toggle').next().toggle();
		$('.caret').toggleClass('caret_up');
		
		if (_group == '전략 선택') _group = '';
		detailCategory = _group;
		curCnt = 0;
		$('#result_list').html('');
		
		$.ajax({
			type : "POST",
			data : {
				"strategy" : "${param.strategy}",
				"detailCategory" : detailCategory
			},
			async: false,
			url: "/bizStrategy/countBizStrategyCompany.do",
			success:function(data){
				totalCnt = data.totalCnt;
			},
			error : function(xhr, status, code){
				alert("[에러]\ncode:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
		
		fncShowMore();
	}
	
	$(document).ready(function() {
		if ('${param.bizId}' != ''){
			fncDetail('${param.bizId}');
		}

		$('#result_list').html('');
		fncShowMore();
	});
	
	function fncShowMore(){
		$.ajax({
			type : "POST",
			data : {
				"rows" : 10,
				"lastrow" : curCnt,
				"sord" : "asc",
				"strategy" : "${param.strategy}",
				"detailCategory" : detailCategory
			},
			async: false,
			url: "/bizStrategy/gridBizStrategyList.do",
			success:function(data){
				var list = data.rows;
				var list_html = '';
				for (var i = 0; i < list.length; i++){
					list_html += fncGetItemHtml(list[i]);
				} 
				
				$('#result_list').append(list_html);
				
				// 카운트
				curCnt += list.length;
				
				if (parseInt(curCnt) >= parseInt(totalCnt)){
					$('#btn_more').hide();
				} else {
					$('#btn_more').show();
					var cnt_html = '더보기 '+curCnt+' of ' + totalCnt;
					$('#span_more').html(cnt_html);
				}
			},
			error : function(xhr, status, code){
				alert("[에러]\ncode:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	}
</script>

<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>