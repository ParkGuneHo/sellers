<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>전략프로젝트</title>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>

	<article class="list_pg">

		<div class="topFunc mg_b10">
			<div class="sortArea">
				<div class="dropdown">
					<button class="dropdown-toggle r5 " type="button">
						${searchCategory}
					</button>
					<ul class="dropdown-menu w_120 r5 off">
						<li href="#" onclick="fncChangeCategory('선투자프로젝트');return false;">선투자프로젝트</a></li>
						<li href="#" onclick="fncChangeCategory('신규솔루션');return false;">신규솔루션</a></li>
					</ul>
				</div>
			</div>
		</div>

		<ul class="list_type1" id="result_list">
		<!-- 내용이 입력됩니다. -->
		</ul>

		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more primary_bg r2 fc_white" id="btn_more">
			<span class="icon icon_arrow_down md va_m"></span> <span class="va_m" id="span_more">더보기 6 of 6</span>
		</a>

	</article>

<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
	var totalCnt = '${totalCnt}';
	var pkArray = '';
	var curCnt = 0;
	//var curCategory = '선투자프로젝트';
	var curCategory = '${map.searchCategory}';
	
	function fncDetail(_no){
		location.href = 'modalProjectPlanInfo.do?searchCategory='+curCategory+'&project_id='+_no;
	}
	
	function fncChangeCategory(_cate){
		curCategory = _cate;
		$('div.dropdown button').html(_cate);
		$('.dropdown-menu').hide();

		$.ajax({
			type : "POST",
			data : {
				"searchCategory" : curCategory,
				"searchPKArray" : pkArray ,
				"resultInSearch" : 'N',
				
				"datatype" : 'json',
				"latelyUpdateTable" : 'BIZ_PROJECT_PLAN',
				"listCount" : '',
				"searchPKArray" : ''
			},
			async: false,
			url: "/bizStrategy/selectProjectPlanCount.do",
			success:function(data){
				totalCnt = data.listCount;
				curCnt = 0;
				pkArray = data.searchPKArray;
				$('#result_list').html('');
				$('#btn_more').show();
				fncShowMore();
			}
		});
	}

/*
	function fncGetItemHtml(_object){
		var obj_html = '';
		obj_html += '<li><a href="#" onclick="fncDetail('+_object.PROJECT_ID+');return false;">';
		obj_html += '<span class="top">';
		obj_html += '<span class="subject">'+_object.SUBJECT+'</span>';
		obj_html += ' <span class="icon_cata r2">'+_object.CATEGORY+'</span>';
		obj_html += '</span>';
		obj_html += '<span class="middle">';
		obj_html += '<span class="">책임리더 : '+_object.EXEC_OWNER+'</span>';
		obj_html += '</span>';
		if (_object.KEY_MILESTONE1 != undefined || _object.KEY_MILESTONE2 != undefined){
			obj_html += '<span class="bottom">';
			obj_html += '<strong>Key Milestones</strong><span class="keymilestones">';
			
			//마일스톤
			if (_object.KEY_MILESTONE1 != undefined){
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
				obj_html += '<span class="">'+_object.KEY_MILESTONE1+' ('+_object.ACT_DUE_DATE1+')</span>';
				obj_html += '</span>';
			}
	
			if (_object.KEY_MILESTONE2 != undefined){
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
				obj_html += '<span class="">'+_object.KEY_MILESTONE2+' ('+_object.ACT_DUE_DATE2+')</span>';
				obj_html += '</span>';
			}
			
			obj_html += '</span></span>';
		}
		obj_html += '</a>';
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
*/

	function fncGetItemHtml(_object){
		var obj_html = '';
		obj_html += '<li><a href="#" onclick="fncDetail('+_object.PROJECT_ID+');return false;">';
		obj_html += '<span class="top">';
		obj_html += '<span class="subject">'+_object.SUBJECT+'</span>';
		obj_html += ' <span class="icon_cata r2">'+_object.Category+'</span>';
		obj_html += '</span>';
		obj_html += '<span class="middle">';
		obj_html += '<span class="">책임리더 : '+_object.EXEC_OWNER+'</span>';
		obj_html += '</span>';
		if (typeof _object.KEY_MILESTONE_PREV != 'undefined' || typeof _object.KEY_MILESTONE_ING != 'undefined' || typeof _object.KEY_MILESTONE_NEXT != 'undefined'){
			obj_html += '<span class="bottom">';
			obj_html += '<strong>Key Milestones</strong><span class="keymilestones">';
			
			//마일스톤
			if (typeof _object.KEY_MILESTONE_PREV != 'undefined'){
				obj_html += '<span class="step">';
				obj_html += '<span class="status_circle statusColor_'+_object.STATUS_COLOR_PREV+'"></span>';
				obj_html += '<span class="">'+_object.KEY_MILESTONE_PREV+' ('+_object.ACT_DUE_DATE_PREV+')</span>';
				obj_html += '</span>';
			}

			if (typeof _object.KEY_MILESTONE_ING != 'undefined'){
				obj_html += '<span class="step">';
				obj_html += '<span class="status_circle statusColor_'+_object.STATUS_COLOR_ING+'"></span>';
				obj_html += '<span class="">'+_object.KEY_MILESTONE_ING+' ('+_object.ACT_DUE_DATE_ING+')</span>';
				obj_html += '</span>';
			}
			
			if (typeof _object.KEY_MILESTONE_NEXT != 'undefined'){
				obj_html += '<span class="step">';
				obj_html += '<span class="status_circle statusColor_'+_object.STATUS_COLOR_NEXT+'"></span>';
				obj_html += '<span class="">'+_object.KEY_MILESTONE_NEXT+' ('+_object.ACT_DUE_DATE_NEXT+')</span>';
				obj_html += '</span>';
			}
			
			obj_html += '</span></span>';
		}
		obj_html += '</a>';
		
		if(_object.STATUS != '') {
			obj_html +=  '<div class="status_current statusColor_'+_object.STATUS+'"></div>';
		}
		
		obj_html += '</li>';
		
		return obj_html;
	}

	$(document).ready(function() {
		if ('${param.bizProjectId}' != ''){
			fncDetail('${param.bizProjectId}');
		}
		//fncChangeCategory('선투자프로젝트');
		fncChangeCategory('${map.searchCategory}');
	});
	
	var searchPKArray = "";
	
	function fncShowMore() {
		//공통 파라미터
		var params2 = $.param({
			pageStart : curCnt,
			rowCount : 10,
			latelyUpdateTable : "BIZ_PROJECT_PLAN",
			sortCategory : '', //$("#selectSortCategory").val(),
			searchCategory :curCategory,
			searchDivision : '', //$("#selectSearchDivision").val(),
			searchStartDate : '', //$("#textSearchStartDate").val(),
			searchEndDate : '', //$("#textSearchEndDate").val(),
			searchSalesPlan : '', //$("#textSearchSalesPlan").val(),
			searchInvestPlan : '', //$("#textSearchInvestPlan").val(),
			searchPKArray : searchPKArray,
			resultInSearch : 'N' /* function(){
				if($("#result-in-search").is(":checked")){
					return "Y";
				}else{
					return "N";
				}
			}
			*/
		});
		
		var params = $.param({
			datatype : 'json'
		});

		//카운트, 최근업데이트, 결과내 검색
		$.ajax({
			url : "/bizStrategy/selectProjectPlanCount.do",
			async : false,
 			datatype : 'json',
 			method: 'POST',
			data : params+'&'+params2,
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
				//$.ajaxLoading();
			},
			success : function(data){
				//page count
				//page.totalCount = data.listCount;
				curCnt = data.listCount;
				
				//최근 업데이트
				/*
				if(!isEmpty(data.latelyUpdate)){
					$("#LATELY_UPDATE_DATE").html(data.latelyUpdate);
				}
				//결과내 검색
				searchPKArray = data.searchPKArray;
				*/
			},
			complete : function(){
				//$.ajaxLoadingHide();
			}
		});
/*
		params = $.param({
			datatype : 'html',
			jsp : '/bizstrategy/bizStrategyProjectPlanAjax'
		});
*/
		//리스트
		$.ajax({
			url : "/bizStrategy/selectProjectPlanList.do",
			async : false,
 			//datatype : 'html',
 			datatype : 'json',
 			method: 'POST',
			data : params+'&'+params2,
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
				//$.ajaxLoading();
			},
			success : function(data){
				//$('tbody#row').append(data);
				
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
					var cnt_html = '더보기 '+curCnt+' of ' + totalCnt;
					$('#span_more').html(cnt_html);
				}
			},
			complete : function(){
				//$.ajaxLoadingHide();
			}
		});
	}
/*
	function fncShowMore(){
		$.ajax({
			type : "POST",
			data : {
				"rows" : 10,
				"lastrow" : curCnt,
				"sord" : "asc",
				"searchCategory" : curCategory,
				"searchPKArray" : pkArray 
			},
			async: false,
			url: "/bizStrategy/gridProjectPlanList.do",
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
					var cnt_html = '더보기 '+curCnt+' of ' + totalCnt;
					$('#span_more').html(cnt_html);
				}
			}
		});
	}
*/
</script>

<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>