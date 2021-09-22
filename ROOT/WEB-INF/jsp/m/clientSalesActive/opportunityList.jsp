<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>영업기회관리</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">

</head>

<body class="white_bg">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

	<!-- location -->
	<div class="location">
		<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<a href="">고객영업활동</a> 
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<span>영업기회</span>
	</div>

	<article class="list_pg">

		<div class="topFunc mg_b10">
			<!-- <div class="sortArea fl_l">
				<div class="dropdown">
					<button class="dropdown-toggle r5 " type="button" />
						<span id="select_text">부서선택</span>
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu w_150 r5 off">
						<li><a href="#" onclick="fncSelectGroup('부서선택'); return false;">== 선택 ==</a></li>
						<li><a href="#" onclick="fncSelectGroup('R&D팀'); return false;">R&D 팀</a></li>
						<li><a href="#" onclick="fncSelectGroup('기술연구소'); return false;">기술연구소</a></li>
						<li><a href="#" onclick="fncSelectGroup('비즈니스 아키텍트팀'); return false;">비즈니스 아키텍트팀</a></li>
					</ul>
				</div>
			</div> -->

			<div class="fl_r">
				<a href="#" class="btn btn-primary r5" id="opportunityInsertForm">
                    <span class="">영업기회 등록</span>
                </a>
			</div>
		</div>

		<ul class="list_type1" id="result_list">
		</ul>

		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more r2" id="btn_more">
			<span class="va_m"></span> <span id="span_more">더보기 6 of 6</span>
		</a>

	</article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>

    <form method="post" id="detailForm" action="">
        <input type="hidden" id="pkNo" name="pkNo" value="" />
    </form>
    
    <form method="post" id="inserForm" action="">
        <input type="hidden" id="mode" name="mode" value="ins" />
    </form>  

</div>

<div class="modal_screen"></div>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">
	//var totalCnt = '${totalCnt}';
	//var curCnt = 0;
	var searchDivision = '';
	
    var totalCnt = 0;
    var rowCount = 10;
    var pkArray = '';
    var curCnt = 0;
    var curCategory = '';
    //var params;
	
	function fncDetail(_no){
        $('#pkNo').val(_no);
        $("#detailForm").attr("action", "/clientSalesActive/selectOpportunityDetail.do?coaching_talk=${param.coaching_talk}");
        $('#detailForm').submit();
	}
	
	
	function fncSelectGroup(_group){
		$('#select_text').html(_group);
		$('.dropdown-toggle').next().toggle();
		$('.caret').toggleClass('caret_up');
		
		if (_group == '부서선택') _group = '';
		searchDivision = _group;
		curCnt = 0;
		$('#result_list').html('');
		fncShowMore();
	}
	
	function fncGetItemHtml(_object){
		var obj_html = '';

		obj_html += '<li><a href="#" onclick="fncDetail('+_object.OPPORTUNITY_ID+');return false;">';
		obj_html += '<span class="top"><span class="subject">'+_object.SUBJECT+'</span></span>';
		obj_html += '<span class="bottom"><span class="name">매출처 : '+_object.COMPANY_NAME+' / End User : '+_object.CUSTOMER_NAME+'</span>';
		
		
		obj_html += '<span class="date fs13 fc_gray_light">영업대표 : '+ _object.IDENTIFIER_NAME +' / 계약일자 : '+_object.CONTRACT_DATE+'</span></span>';
		
		obj_html += '<span class="opportunity_status">';
		obj_html += '<span class="statusColor_'+_object.STATUS1+' r2">일정/예산</span> ';
		obj_html += '<span class="statusColor_'+_object.STATUS2+' r2">경쟁상황</span> ';
		obj_html += '<span class="statusColor_'+_object.STATUS3+' r2">솔루션</span> ';
		obj_html += '<span class="statusColor_'+_object.STATUS4+' r2">계약조건</span>';
		obj_html += '</span></a>';
		
		obj_html += '</li>';
		
		return obj_html;
	}
	
	$(document).ready(function() {
		if ('${param.opportunity_id}' != ''){
			fncDetail('${param.opportunity_id}');
		}
		
		fncShowMore();
		
        // 컨택등록 이벤트 등록
        $("#opportunityInsertForm").on("click", function(e) {
            $('#mode').val("ins");
            $("#inserForm").attr("action", "/clientSalesActive/opportunityInsertForm.do");
            console.log("mode[" +  $('#mode').val() + "]");
            $('#inserForm').submit();       
            e.preventDefault();
        });   		
	});
	
	function getParams() {
	    var params = $.param({
	    	currentPage : 1,
        	pagingSize : 10,
            pageStart : curCnt,
            rowCount : rowCount,
            //sortCategory : sortCategory,
            latelyUpdateTable : "OPPORTUNITY_LOG"
            //searchDivision : searchDivision,
            //searchTeam : searchTeam,
            //searchMember : searchMember,
            //searchSumYear : $('#spanListYear').text(),
            //searchSumQuarter : $('#spanListQuarter').text(),
            //검색 start
            //searchCompany : function(){
            //    if(!isEmpty($("#textSearchCompany").val())){
            //        return $("#textSearchCompany").val();
            //    }else{
            //        return "${param.hiddenDashBoardCompany}";
            //    }
            //},
            //searchCompanyCategory : "${param.hiddenDashBoardCompanyCateogry}",
            //searchProduct : "${param.hiddenDashBoardProduct}",
            
            //searchOwner : $("#textSearchOwner").val(),
            //searchForecast : $("#selectSearchForecast").val(),
            //searchSalesCycle : $("#selectSearchSalesCycle").val(),
            //searchContractAmount : $("#textContractAmount").val(),
            //searchContractStartDate : $("#textSearchContractStartDate").val(),
            //searchContractEndDate : $("#textSearchContractEndDate").val(),
            //검색 end
            //searchPKArray : searchPKArray,
            //resultInSearch : function(){
            //    if($("#result-in-search").is(":checked")){
            //        return "Y";
            //    }else{
            //        return "N";
            //    }
            //}
        });	 
	    return params;
	}
	
	function fncShowMore(){
        var countParams = $.param({
            datatype : 'json'
        });
        
	    //카운트, 최근업데이트,결과내 검색
        $.ajax({
            url : "/clientSalesActive/selectOpportunityCount.do",
            async : false,
            datatype : 'json',
            method: 'POST',
            data : getParams() + "&" + countParams,
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                console.log("################ selectOpportunityCount.do start ####################");
                console.log(data);
                console.log("################ selectOpportunityCount.do end ####################");
                totalCnt = data.listCount;
                //결과내 검색
                searchPKArray = data.searchPKArray;
            },
            complete : function(){
            }
        });
        
        var listParams = $.param({
            datatype : 'json',
            jsp : '/clientSalesActive/opportunityListAjax'
        });

        //리스트
	    $.ajax({
            url : "/clientSalesActive/selectOpportunity.do",
            async : false,
            datatype : 'json',
            method: 'POST',
            data : getParams() + "&" + listParams,
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                console.log("################ selectOpportunityCount.do start ####################");
                console.log(data);
                console.log("################ selectOpportunityCount.do end ####################");

                var list = data.rows;
                var list_html = '';
                
                if(list.length > 0){
                	for (var i = 0; i < list.length; i++){
                      list_html += fncGetItemHtml(list[i]);
                  }
                  
                  $('#result_list').append(list_html);
                }else{
                	if(curCnt == 0){
                		$('#result_list').html('<p style="text-align: center;">데이터가 없습니다.</p>');
                	}
                }
                
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
            }
        });
	}
	
</script>
</body>
</html>