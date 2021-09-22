<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>고객별 전략</title>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>

	<article class="list_pg">

		<div class="search_pgin pd_b20">
			<div class="searchArea">
				<input type="text" name="search_keyword" id="search_keyword" value="${param.search_keyword}" placeholder="고객명 또는 제목 입력" /><a href="#" id="btn_search_keyword"><span class="icon_search"></span></a>
			</div>
		</div>
		
		<ul class="list_type1" id="result_list">
		<!-- 내용이 입력됩니다. -->
		</ul>
<%--
		<!-- <a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more primary_bg r2 fc_white" id="btn_more"> -->
		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more primary_bg r2" id="btn_more">
			<span class="icon icon_arrow_down md va_m"></span> <span class="va_m" id="span_more">더보기 6 of 6</span>
		</a>
 --%>
		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more r2" id="btn_more">
			<span class="va_m" id="span_more">더보기 6 of 6</span>
		</a>

	</article>
	
<script src="<%=request.getContextPath()%>/js/m/jquery-1.11.0.min.js"></script>
<!--
<script src="<%=request.getContextPath()%>/js/m/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/m/common.js"></script>
 -->

<script type="text/javascript">
	//var totalCnt = '${totalCnt}';
	var totalCnt = 0;
	var curCnt = 0;
	var detailCategory = '고객전략';
	//var detailCategory = '${map.detailCategory}';
	
	function fncDetail(_no){
		var v_url = 'selectBizStrategyDetail.do?pkNo='+_no+'&searchCategory='+detailCategory;
		var v_search_keyword = $("#search_keyword").val();
		
		if(v_search_keyword != "")
			v_url += '&search_keyword='+v_search_keyword;
		
		window.location.href = v_url;
	}
	
	function fncGetItemHtml(_object){
		var obj_html = '';
		obj_html += '<li><a href="#" onclick="fncDetail('+_object.BIZ_ID+');return false;">';
		obj_html += '<span class="top">';
		obj_html += '<span class="subject">'+_object.SUBJECT+'</span>';
		obj_html += '	<span class="icon_cata r2">'+_object.CATEGORY+'</span>';
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
			obj_html += '<span class="">'+_object.KEY_MILESTONE1+' ('+v_act_due_date1+')</span>';
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
			obj_html += '<span class="">'+_object.KEY_MILESTONE2+' ('+v_act_due_date2+')</span>';
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
			obj_html += '<span class="">'+_object.KEY_MILESTONE3+' ('+v_act_due_date3+')</span>';
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
	
	function fncShowMore(){
		var v_search_keyword = $("#search_keyword").val();
		var params = $.param({
			"rows" : 10,
			"lastrow" : curCnt,
			"sord" : "asc",
			"strategy" : "${param.strategy}",
			"detailCategory" : detailCategory,
			"searchKeyword" : v_search_keyword
		});
		
		//카운트
		$.ajax({
			url : "/bizStrategy/viewBizStrategyClientCountMobile.do",
			async : false,
 			datatype : 'json',
 			method: 'POST',
			data : params,
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
				//$.ajaxLoading();
			},
			success : function(data){
				totalCnt = data.totalCnt;
			},
			complete : function(){
				//$.ajaxLoadingHide();
			}
		});
		
		$.ajax({
			type : "POST",
			data : params,
			async: false,
			url: "/bizStrategy/gridBizStrategyList.do",
			success:function(data){
				var list = data.rows;
				var list_html = '';
				
				if(list.length == 0) {
					$('#result_list').html('<div style="text-align:center">내용이 없습니다.</div>');
				}
				else {
					for (var i = 0; i < list.length; i++){
						list_html += fncGetItemHtml(list[i]);
					}
					
					if(curCnt == 0) {
						$('#result_list').html(list_html);
					}
					else {
						$('#result_list').append(list_html);
					}

					// 카운트
					curCnt += list.length;
					
					if (parseInt(curCnt) >= parseInt(totalCnt)){
						$('#btn_more').hide();
					}
					else {
						$('#btn_more').show();
						var cnt_html = '더보기 '+curCnt+' of ' + totalCnt;
						$('#span_more').html(cnt_html);
					}
				}
			},
			error : function(xhr, status, code){
				alert("[에러]\ncode:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	$(document).ready(function() {
		if ('${param.bizId}' != ''){
			fncDetail('${param.bizId}');
		}

		$('#result_list').html('');
		fncShowMore();
		
		$("#btn_search_keyword").click(function(){
			curCnt = 0;
			fncShowMore();
		});
		
		$('#search_keyword').on('keypress', function(e) {
			if (e.which == 13) {
				$("#btn_search_keyword").click();
			}
		});
	});
</script>
<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>