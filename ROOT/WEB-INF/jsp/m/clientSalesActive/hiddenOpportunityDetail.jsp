<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<% pageContext.setAttribute("enter", "\n"); %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>잠재영업기회</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">

</head>

<body class="white_bg" onload="tabmenuLiWidth();">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

	<!-- location -->
	<div class="location">
		<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
		<img src="${pageContext.request.contextPath}/images/m//icon_arrow_gray.svg"/>
		<a href="">고객영업활동</a> 
		<img src="${pageContext.request.contextPath}/images/m//icon_arrow_gray.svg"/>
		<span>잠재영업기회</span>
	</div>

	<article class="">
		<div class="title_pg">
			<h2 class="">${detail.SUBJECT}</h2>
			<a href="#" class="btn_back" onclick="fncGoBack(); return false;">back</a>
		</div>

		<div class="author">
			<span>${detail.HAN_NAME} (${detail.SYS_UPDATE_DATE})</span>
		</div>

        <ul class="tabmenu tabmenu_type2 mg_b20">
            <!-- 
            <li><a href="#" id="tab_1" onclick="fncSelectTab('1'); return false;" class="active">기본정보</a></li>
            <li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">Follow-Up-Action</a></li>
            -->
            <li><a href="#" id="tab_1" onclick="fncSelectTab('1'); return false;" class="active">기본정보</a></li>
            <li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">Action Plan</a></li>
            <li><a href="#" id="tab_3" onclick="fncSelectTab('3'); return false;">Coaching Talk</a></li>
        </ul>

		
		<div class="pg_cont">
			<!-- 위의 탭 클릭시 아래의 cont1, cont2, cont3 가  하나씩 보여지도록 해주세요 -->

			<div class="cont1 "><!-- 기본정보 -->

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 매출처
					</div>
					<div class="cont fl_l">${detail.COMPANY_NAME}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> End User
					</div>
					<div class="cont fl_l">${detail.CUSTOMER_NAME}</div>
				</div>

               <%--  <div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> 고객직급
                    </div>
                    <div class="cont fl_l">${detail.CUSTOMER_POSITION}</div>
                </div> --%>

                <div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> 영업대표
                    </div>
                    <div class="cont fl_l">${detail.SALESMAN_NAME}</div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 영업전환시점
                    </div>
                    <div class="cont fl_l">${detail.SALES_CHANGE_DATE}</div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 영업기회규모
                    </div>
                    <div class="cont fl_l">
                        <fmt:formatNumber value="${detail.OPPORTUNITY_AMOUNT}" pattern="#,###"/>
                    </div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 결과
                    </div>
                    <div class="cont fl_l">
                        <span>
                            <c:choose>
                                <c:when test="${detail.OPPORTUNITY_ID != null}">전환완료</c:when>
                                <c:otherwise>전환하기</c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </div>
				<c:if test="${!empty detail.EVENT_ID}">
                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 연관 고객컨택
                    </div>
                    <div class="cont fl_l">
                    	<a href="/clientSalesActive/selectContactDetail.do?pkNo=${detail.EVENT_ID}" class="btn_quick">바로가기</a>
                    </div>
                </div>
                </c:if>

                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> 내용
                    </div>
                    <div class="cboth cont_box">${fn:replace(detail.DETAIL_CONENTS, enter, "<br/>")}</div>
                </div>

                <% /***********************************************************************
                    * 메일공유 기능이 PC에 미 구현 되어 있음. comgyver.  2017.04.15 
                   */
                %>
                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 메일공유
                    </div>
                    <div class="cont fl_l"></div>
                </div>                

                <% /***********************************************************************
                     \* PC 버전에는 다운로드가 없어 일단 주석 처리 comgyver.  2017.04.15 
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 첨부파일
					</div>
					<div class="cboth cont_box">
						<ul class="file_list">
							<c:forEach items="${fileList}" var="file">
							<li><a href="/common/downloadFile.do?fileId=${file.FILE_ID}&fileTableName=6">${file.FILE_NAME}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
                */ %>

			</div>
			
            <div class="cont2 off"><!-- Action Plan-->

                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> Action Plan
                    </div>
                    
                    <div class="cboth keymilestones_list">
                        <ul class="list_type1" id="result_list">
                            <!-- 내용이 입력됩니다. -->
                        </ul>
                    </div>
                </div>

            </div>
            
            <div class="cont3 off"><!-- Coaching Talk -->
                <div class="view_cata_full">
                	<jsp:include page="/WEB-INF/jsp/m/common/coachingTalkTab.jsp"/>
                </div>
            </div>

		</div>

		<div class="pg_bottom">
			<div class="ta_c">
				<button type="button" class="btn lg btn-default pd_r15 pd_l15 r5" onclick="fncList(); return false;">목록</button>
			</div>
		</div>

        <div class="pg_bottom_func">
            <ul>
                <li><a href="#" class="" onclick="fncList(); return false;"> <img src="${pageContext.request.contextPath}/images/m/icon_list.png" /> <span>목록</span></a></li>
                <li><a href="#" class="" onclick="fncModify(); return false;"> <img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /> <span>수정</span></a></li>
            </ul>
        </div>
	</article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>

</div>

<div class="modal_screen"></div>

<form id="formSampleFile" name="formSampleFile" method="post">
    <input type="hidden" name="sampleFileName" id="hiddenModalPK" value="${detail.OPPORTUNITY_HIDDEN_ID}"/>
</form>

<form method="post" id="updateForm" action="">
    <input type="hidden" id="mode" name="mode" value="upd" />
    <input type="hidden" id="pkNo" name="pkNo" value="${detail.OPPORTUNITY_HIDDEN_ID}" />
</form>

<input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}"/>
<input type="hidden" name="hiddenModalSalesId" id="hiddenModalSalesId" value="${detail.SALESMAN_ID}"/>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">
	function fncList(){
		location.href= '/clientSalesActive/viewHiddenOpportunityList.do';
	}
	
    function fncSelectTab(_no){
        // 탭 이동
        $('#tab_1').removeClass('active');
        $('#tab_2').removeClass('active');
        $('#tab_'+_no).addClass('active');
        
        // 탭에 해당하는 컨테이너 보여주기
        $('.cont1').addClass('off');
        $('.cont2').addClass('off');
        $('.cont'+_no).removeClass('off');
    }
	
	function fncActionPlan(){
        /*
	    params = $.param({
            pageStart : curCnt,
            rowCount : rowCount,
            numberPagingUseYn : "Y",
            datatype : 'json',
            latelyUpdateTable : "OPPORTUNITY_HIDDEN_LOG"
        });
        */
        
        $.ajax({
            type : "POST",
            //data : params,
            async: false,
            datatype : 'json',
            url: "/clientSalesActive/gridActionPlanHiddenOpportunity.do?pkNo="+$("#hiddenModalPK").val(),
            success:function(data){
                //console.log(data);
                var list = data.rows;
                var list_html = '';
                for (var i = 0; i < list.length; i++){
                    list_html += fncGetItemHtml(list[i]);
                } 
                
                $('#result_list').append(list_html);

                // 카운트
                //curCnt += list.length;
                /*
                if (parseInt(curCnt) >= parseInt(totalCnt)){
                    $('#btn_more').hide();
                } else {
                    var cnt_html = '더보기 '+curCnt+' of ' + totalCnt;
                    $('#span_more').html(cnt_html);
                }*/
            }
        });		
	}

    function fncGetItemHtml(_object){
        var obj_html = '';
        var close_date = '';
        var status_color = '';
        
        obj_html += '<li>';
        obj_html += '   <div class="top top2">';
        //obj_html += '       <span class="cata r2">'+_object.STATUS+'</span>';
        obj_html += '       <span class="cata r2">'+'STATUS'+'</span>';
        obj_html += '       <span class="title">'+_object.DETAIL_CONENTS.replace(/\n/g, '<br/>')+'</span>';
        if (_object.STATUS == 'G') {
            status_color = 'statusColor_green';
        } else if (_object.STATUS == 'Y') {
            status_color = 'statusColor_yellow';
        } else if (_object.STATUS == 'T') {
            status_color = 'statusColor_red';
        }
        
        obj_html += '       <span class="status_lec '+status_color+'"></span>';
        obj_html += '   </div>';
        obj_html += '   <div class="cont">';
        obj_html += '       <span class="fc_gray_light">담당자 : </span> <span class="fc_black">'+_object.ACTION_OWNER+'</span><br/>';
        obj_html += '       <span class="fc_gray_light">완료예정일 : </span> <span class="fc_black">'+_object.DUE_DATE+'</span> /';
        
        if (typeof _object.CLOSE_DATE != 'undefined') {
            close_date = _object.CLOSE_DATE;
        }
        obj_html += '       <span class="fc_gray_light">실제완료일 : </span> <span class="fc_black">'+close_date+'</span>';
        obj_html += '   </div>';
        obj_html += '</li>';
        
        return obj_html;
    }	
	
    function fncModify(){
        $("#updateForm").attr("action", "/clientSalesActive/hiddenOpportunityInsertForm.do");
        $('#updateForm').submit();
    }   

	$(document).ready(function() {
		$('#select_division').change(function(e){
			var select_val = $(this).val();
			var division_val = select_val.split('|');
			
		});
		
		// Action Plan 조회
		fncActionPlan();
		
		// Coaching Talk 조회
		coachingTalk.view('HOPP');
		
		// 코칭톡 탭으로 이동
		if('${param.coaching_talk}'.toUpperCase() == 'Y'){
			fncSelectTab('3');
		}
	});
</script>
</body>
</html>