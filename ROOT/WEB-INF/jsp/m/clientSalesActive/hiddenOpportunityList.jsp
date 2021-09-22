<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>



<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>잠재영업기회</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">

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
        <span>잠재영업기회</span>
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
                <a href="#" class="btn btn-primary r5" id="inserthiddenOpportunity"><span class="">잠재영업기회 등록</span></a>
            </div>
        </div>

        <ul class="list_type1" id="result_list">
        <!-- 내용이 입력됩니다. -->
        </ul>

		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more r2" id="btn_more">
			<span class="va_m"></span> <span id="span_more">더보기 6 of 6</span>
		</a>
    </article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>

</div>

<div class="modal_screen"></div>

    <form method="post" id="insertForm" action="">
        <input type="hidden" id="mode" name="mode" value="ins" />
    </form>     

    <form method="post" id="detailForm" action="">
        <input type="hidden" id="pkNo" name="pkNo" value="" />
    </form>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>
<script src="/../../js/pc/custom.js"></script>

<script type="text/javascript">
	var totalCnt = 0;
	var curCnt = 0;
	var rowCount = 10;
	var searchDivision = '';
    var params;
	
	function fncDetail(_no){
		//location.href = 'modalOpportunity.do?oppId='+_no;
        $('#pkNo').val(_no);
        $("#detailForm").attr("action", "/clientSalesActive/selectHiddenOpportunityDetail.do?coaching_talk=${param.coaching_talk}");
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
		
		fncGetTotalCount();
		fncShowMore();
	}
	
	function fncGetItemHtml(_object){
		var obj_html = '';

		obj_html += '<li><a href="#" onclick="fncDetail('+_object.OPPORTUNITY_HIDDEN_ID+');return false;">';
		obj_html += '<span class="top"><span class="icon_cata">'+_object.COMPANY_NAME+'</span> ';
		obj_html += '<span class="subject">'+_object.SUBJECT+'</span></span>';
		obj_html += '<span class="bottom"><span class="name">매출처 : '+_object.COMPANY_NAME+'/ End User :'+_object.CUSTOMER_NAME+'</span>';
		
		obj_html += '<span class="date fc_gray_light">영업대표 : '+_object.SALESMAN_NAME+' '+_object.SALESMAN_POSITION+' / 예상규모 : '+add_comma(_object.OPPORTUNITY_AMOUNT.toString())+'원</span>';
		if (_object.SALES_CHANGE_DATE != undefined){
			obj_html += '<span class="date fs13 fc_gray_light letter_s">영업기회 전환시점 : '+_object.SALES_CHANGE_DATE+'</span>';
		}
		
		obj_html += '</span></a>';
		obj_html += '</li>';
		
		return obj_html;
	}
	
	$(document).ready(function() {
		if ('${param.opportunity_hidden_id}' != ''){
			fncDetail('${param.opportunity_hidden_id}');
		}
		
	    fncGetTotalCount();
		fncShowMore();

        // 잠재영업기회 등록 페이지 이동
        $("#inserthiddenOpportunity").on("click", function(e) {
            $('#mode').val("ins");
            $("#insertForm").attr("action", "/clientSalesActive/hiddenOpportunityInsertForm.do");
            $('#insertForm').submit();       
            e.preventDefault();
        });     
	
	});

    function fncGetTotalCount() {
        params = $.param({
            pageStart : curCnt,
            rowCount : rowCount,
            datatype : 'json',
            latelyUpdateTable : "OPPORTUNITY_HIDDEN_LOG"
        });
        //카운트, 최근업데이트, 결과내 검색
        $.ajax({
            url : "/clientSalesActive/selectHiddenOpportunityCount.do",
            async : false,
            datatype : 'json',
            method: 'POST',
            data : params,
            success : function(data){
                //page count
                totalCnt = data.listCount;
            },
        });     
    }	
	
    function fncShowMore(){
        params = $.param({
            pageStart : curCnt,
            rowCount : rowCount,
            numberPagingUseYn : "Y",
            datatype : 'json',
            latelyUpdateTable : "OPPORTUNITY_HIDDEN_LOG"
        });
        
        $.ajax({
            type : "POST",
            data : params,
            async: false,
            datatype : 'json',
            url: "/clientSalesActive/selectHiddenOpportunity.do",
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
	
    function fncShowMore_20170415(){
        $.ajax({
            type : "POST",
            data : {
                "rows" : 10,
                "lastrow" : curCnt,
                "sortMethod" : "asc",
                "resultInSearch" : "N",
                "latelyUpdateTable" : "SELLERS.OPPORTUNITY_HIDDEN_LOG", 
                "searchDivision" : searchDivision
            },
            async: false,
            url: "/salesActive/selectHiddenOpportunity.do",
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
	
</script>

</body>
</html>