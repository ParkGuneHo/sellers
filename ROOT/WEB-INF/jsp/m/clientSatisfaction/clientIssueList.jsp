<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객이슈</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">

</head>

<body class="white_bg">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

	<!-- location -->
	<div class="location">
		<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<a href="">고객만족</a> 
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<span>고객이슈</span>
	</div>

	<article class="list_pg">

		<div class="topFunc mg_b10">
			<div class="sortArea fl_l">
				<div class="dropdown">
					<button class="dropdown-toggle r5 " type="button">
						<span id="select_group_text">이슈 종류 선택</span>
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu w_120 r5 off">
						<li href="javascript:void(0); return false;" onclick="fncChangeCategory('서비스'); return false;">서비스</a></li>
						<li href="javascript:void(0); return false;" onclick="fncChangeCategory('지원'); return false;">지원</a></li>
						<li href="javascript:void(0); return false;" onclick="fncChangeCategory('제품'); return false;">제품</a></li>
					</ul>
				</div>
			</div>

			<div class="fl_r">
				<a href="#" class="btn md primary_bg fc_white r5" id="clientIssueInsertForm">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 이슈등록 
                </a>
			</div>
		</div>
		
		<!-- 적용할 드롭다운 -->
		
		<%-- <div class="topFunc mg_b10">
			<div class="sortArea">
				<div class="dropdown">
					<button class="dropdown-toggle r5 " type="button">
					    <span id="select_text">${map.detailCategory}</span>  
						<span class="caret"></span> 
					</button>
					<ul class="dropdown-menu w_100 r5 off">
					<c:choose>
						<c:when test="${fn:length(IssueSearchDetailGroup) > 0}">
							<c:forEach items="${issueSerachDetailGroup}" var="category">
								<li><a href="#" onclick="fncChangeCategory('${category.ISSUE_CATEGORY}'); return false;">${category.ISSUE_CATEGORY}</a></li>
							</c:forEach>
						</c:when>
					</c:choose>
					</ul>
				</div>
			</div>
		</div> --%>
		

		<ul class="list_type1" id="result_list">
		 
		<!-- 내용이 입력됩니다. -->
		</ul>

		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more r2" id="btn_more">
			<span class="icon icon_arrow_down md va_m"></span> <span class="va_m" id="span_more">더보기 6 of 6</span>
		</a>

	</article>   
	<jsp:include page="../templates/footer.jsp" flush="true"/>
	
	<form id="frm" name="frm">
		
	</form>

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
	var totalCnt = 0;
	var rowCount = 10;
	var pkArray = '';
	var curCnt = 0;
	var curCategory = '';
	
	var params;
	
	function changeCategory(){
		curCategory = _cate;
		$('div.dropdown button').html(_cate);
		$('.dropdown-menu').hide();
	}
	
	function fncDetail(_no){
        $('#pkNo').val(_no);
        $("#detailForm").attr("action", "/clientSatisfaction/selectClientIssueDetail.do?coaching_talk=${param.coaching_talk}");
        $('#detailForm').submit();
	}
	
    function fncDetail_20170414(_no){
        location.href = 'modalClientIssue.do?issueId='+_no;
    }

    
    /*
    function fncRegister(){
		location.href = 'formClientIssue.do?mode=I';
	}
    */
	
	function fncChangeCategory(_cate){
		$('div.dropdown button').html(_cate);
		$('.dropdown-menu').hide();

		$.ajax({
			type : "POST",
			data : {
				"searchCategory" : _cate,
				"resultInSearch" : 'N',
				"menuFlag" : _cate,
				latelyUpdateTable : "CLIENT_ISSUE_LOG"
			},
			async: false,
			url: "/clientSatisfaction/selectIssueListCount.do",
			success:function(data){
				//totalCnt = data.totalCnt;
				listCount = data.listCount;
				curCnt = 0;
				
				//pkArray = data.searchPKArray;

				$('#btn_more').hide();
				
				if(listCount > 0) {
					
					if(listCount > 10)
						$('#btn_more').show();
					
					$('#result_list').html('');
					fncShowMore(_cate);
				}
				else {
					var obj_html = '';
					obj_html += '<li>';
					obj_html += '<span class="top"><span class="icon_cata r2"></span> ';
					obj_html += '<span class="subject">No Data</span></span>';
					obj_html += '<span class="bottom"><span class="name"></span>';
					obj_html += '<span class="date fs13 fc_gray_light"></span></span>';		
					obj_html += '</li>';
					
					$('#result_list').html(obj_html);
				}
			}
		});
		
	}
	
    function fncGetItemHtml(_object){
		var obj_html = '';
			obj_html += '<li><a href="#" onclick="fncDetail('+_object.ISSUE_ID+');return false;">';
			obj_html += '<span class="top"><span class="icon_cata r2">'+_object.COMPANY_NAME+'</span> ';
			obj_html += '<span class="subject">'+_object.ISSUE_SUBJECT+'</span></span>';
			//obj_html += '<span class="bottom"><span class="name">'+_object.CUSTOMER_NAME+' '+_object.CUSTOMER_POSITION+' / '+_object.SALES_REPRESENTIVE_NAME+' '+_object.POSITION_STATUS+'</span>';
			obj_html += '<span class="bottom"><span class="name">'+_object.CUSTOMER_NAME+' / '+_object.SALES_REPRESENTIVE_NAME+'</span>';
			obj_html += '<span class="date fs13 fc_gray_light">발생일자 : '+_object.ISSUE_DATE+'</span></span>';		
			//obj_html += '<span class="issue_status">';
			//obj_html += '<span class="box_left"><span class="icon_cata r2">'+_object.ISSUE_CATEGORY+'</span></span>';
			//obj_html += '<span class="box_right"><span class="issue_status_current statusColor_'+_object.ISSUE_STATUS+' r2"> '+_object.ISSUE_STATUS_TEXT+'</span></span>';
			obj_html += '</a>';
			obj_html += '<div class="status_current statusColor_'+_object.ISSUE_STATUS_TEXT+'"></div>';
			obj_html += '</li>';
		return obj_html;
	}
	
	$(document).ready(function() {
		if ('${param.issue_id}' != ''){
			fncDetail('${param.issue_id}');
		}
		
		//fncChangeCategory();
		/* if ('${issue_id}' != ''){
			location.href="/salesActive/modalClientIssue.do?issueId=${issue_id}"
		} */
		fncGetTotalCount();
		fncShowMore();

	      // 컨택등록 이벤트 등록
        $("#clientIssueInsertForm").on("click", function(e) {
            $('#mode').val("ins");
            $("#inserForm").attr("action", "/clientSatisfaction/clientIssueInsertForm.do");
            console.log("mode[" +  $('#mode').val() + "]");
            $('#inserForm').submit();       
            e.preventDefault();
        });     

		
	});
	
	function fncGetTotalCount() {
        params = $.param({
        	currentPage : 1,
        	pagingSize : 10,
            pageStart : curCnt,
            rowCount : rowCount,
            latelyUpdateTable : "CLIENT_ISSUE_LOG"
        });
        //카운트, 최근업데이트, 결과내 검색
        $.ajax({
            url : "/clientSatisfaction/selectIssueListCount.do",
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

	
    function fncShowMore(_cate){
        params = $.param({
            pageStart : curCnt,
            rowCount : rowCount,
            numberPagingUseYn : "Y",
            latelyUpdateTable : "CLIENT_ISSUE_LOG",
            searchCategory : _cate
        });
        
        $.ajax({
            type : "POST",
            data : params,
            async: false,
            url: "/clientSatisfaction/selectClientIssueList.do",
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