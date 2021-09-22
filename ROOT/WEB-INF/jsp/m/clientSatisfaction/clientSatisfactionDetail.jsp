<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<% pageContext.setAttribute("enter", "\n"); %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객만족관리</title>
<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">
</head>

<body class="white_bg" onload="tabmenuLiWidth();">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

    <!-- location -->
    <div class="location">
        <a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <a href="">고객만족</a> 
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <span>고객만족도</span>
    </div>

    <article class="">
        <div class="title_pg mg_b10 ">
            <h2 class="mg_b5">${detail.CSAT_SUBJECT}</h2>
            <a href="#" class="btn_back" onclick="fncGoBack(); return false;">back</a>
        </div>
        
        <div class="author" id="divModalNameAndCreateDate">
            <span>${detail.HAN_NAME} (${detail.SYS_UPDATE_DATE})</span>
        </div>

        <div class="mg_l10 mg_r10 mg_b20">

            <ul class="tabmenu tabmenu_type2 mg_b20">
                <li><a href="#" id="tab_1" onclick="fncSelectTab('1'); return false;" class="active">기본정보</a></li>
                <li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">조사결과</a></li>
                <li><a href="#" id="tab_3" onclick="fncSelectTab('3'); return false;">Follow-up</a></li>
            </ul>

        <div class="pg_cont">
            <!-- 위의 탭 클릭시 아래의 cont1, cont2가  하나씩 보여지도록 해주세요 -->

            <div class="cont1 "><!-- 기본정보 -->

                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> 상세내용
                    </div>
                    <div class="cboth cont_box">${fn:replace(detail.CSAT_DETAIL, enter, "<br/>")}</div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> 책임자
                    </div>
                    <div class="cont fl_l">${detail.CSAT_SURVEY_NAME}</div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> 책임자 ID
                    </div>
                    <div class="cont fl_l">${detail.CREATOR_ID}</div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> 조사일
                    </div>
                    <div class="cont fl_l">${detail.CSAT_SURVEY_DATE}</div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> 카테고리
                    </div>
                    <div class="cont fl_l">${detail.CSAT_CATEGORY}</div>
                </div>

                <!-- 
                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> 첨부파일
                    </div>
                    <div class="cboth cont_box">
                        <ul class="file_list">
                            <li><a href="">만족도조사.doc </a></li>
                        </ul>
                    </div>
                </div>
                 -->

            </div>

            <div class="cont2 off"><!-- 조사결과 -->
                <div class="view_cata">
                    <span class="bullet dot va_m"></span> 
                    <span class="va_m">평가평균 :</span> <strong class="fs18 va_m">${detail.AVG_CSAT_VALUE}</strong>
                    / <span class="va_m">조사건수 :</span> <strong class="fs18 va_m">${detail.TOTAL_COUNT}</strong>                    
                </div>

                <div class="satisfaction_list" id="clientSatisfactionDetail">
                </div>
            </div>

            <div class="cont3 off"><!-- Follow up action -->
                <!-- Follow up action -->
                <div class="cboth keymilestones_list" id="followUpAction">
                </div>
                <!-- // 이슈해결계획 -->

            </div>

        </div>

        </div>

        <div class="pg_bottom_func">
            <ul>
                <li><a href="#" class="" onclick="fncList(); return false;"> <img src="${pageContext.request.contextPath}/images/m//icon_list.png" /> <span>목록</span></a></li>
                <!-- <li><a href="#" class="" onclick="fncModify(); return false;"> <img src="${pageContext.request.contextPath}/images/m//icon_edit.png" /> <span>수정</span></a></li> -->
            </ul>
        </div>

    </article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>

</div>


<div class="modal_screen"></div>


<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        // 조사결과
        fnclientSatisfactionDetail();
        
        // Follow-Up-Action
        fncFollowUpAction();
        
    });
    
    function fnclientSatisfactionDetail() {
        //조사결과 계획 
        $.ajax({
            url : "/clientSatisfaction/gridClientSatisfactionDetailList.do",
            async : false,
            datatype : 'json',
            type : "POST",
            data : {
                csat_id : '${detail.CSAT_ID}'
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                console.log(data);
                $('#clientSatisfactionDetail').html('');
                var list_html = '<ul>';
                for(var i=0; i<data.rows.length; i++){
                    list_html += fnclientSatisfactionDetailHtml(data.rows[i]);
                }
                list_html += "</ul>";
                $('#clientSatisfactionDetail').append(list_html);
            },
            complete : function(){
            }
        }); 
    }

    // 마일스톤  HTML 생성
    function fnclientSatisfactionDetailHtml(_object) {
        var obj_html = '';
        var survey_date = "";
        
        // 목표일과 완료일 undefined 체크
        if (typeof _object.CSAT_SURVEY_DATE != "undefined") {
            survey_date = _object.CSAT_SURVEY_DATE;
        }

        obj_html += "<li>";
        obj_html += "    <div class='top'>";
        obj_html += "        <span class='title'>" + _object.COMPANY_NAME + "</span>";
        obj_html += "        <span class='icon_rate r5'>" + _object.CSAT_VALUE + "</span>";
        obj_html += "    </div>";
        obj_html += "    <div class='cont'>";
        obj_html += "        <span class='fc_gray_light'>응답자 : </span> <span class='fc_black'>" + _object.RESP_CUSTOMER_NAME + "</span><br/>";
        obj_html += "        <span class='fc_gray_light'>조사방법 : </span> <span class='fc_black'>" + _object.CSAT_METHOD + "</span> /";
        obj_html += "        <span class='fc_gray_light'>조사일 : </span> <span class='fc_black'>" + survey_date + "</span>";
        obj_html += "        <div class='pd_t5'>" + _object.CSAT_DETAIL + "</div>";
        obj_html += "    </div>";
        //obj_html += "    <a href='#' class='btn_issue_go'>" + "이슈 등록하기" + "</a>"; // PC버전에서 동작 하지 않아 주석처리.  2017.06.09
        obj_html += "</li>";

        return obj_html; 
    }
    
    // Follow up action
    function fncFollowUpAction() {
        //매출 계획 
        $.ajax({
            url : "/clientSatisfaction/gridSolvePlanClientSatisfaction.do",
            async : false,
            datatype : 'json',
            type : "POST",
            data : {
                pkNo : '${detail.CSAT_ID}'
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                console.log(data);
                $('#followUpAction').html('');
                var list_html = '<ul>';
                for(var i=0; i<data.rows.length; i++){
                    list_html += ffncFollowUpActionHtml(data.rows[i]);
                }
                list_html += "</ul>";
                $('#followUpAction').append(list_html);
            },
            complete : function(){
            }
        });
    }
    

    // Follow up action  HTML 생성
    function ffncFollowUpActionHtml(_object) {
        
        var obj_html = '';
        var statusColor = "";
        var due_date = "";
        var close_date = "";
        
        // 마일스톤 상태값에 따른 css 변경
        if (_object.STATUS == "Y") {
            statusColor = "yellow";
        } else if (_object.STATUS == "R") {
            statusColor = "red";
        } else if (_object.STATUS == "G") {
            statusColor = "green";
        }
       
        // 목표일과 완료일 undefined 체크
        if (typeof _object.DUE_DATE != "undefined") {
            due_date = _object.DUE_DATE;
        }
        if (typeof _object.CLOSE_DATE != "undefined") {
            close_date = _object.CLOSE_DATE;
        }

        obj_html += "<li>";
        obj_html += "    <div class='top top2'>";
        obj_html += "        <span class='title'>" + _object.CSAT_ACTION_DETAIL.replace(/\n/g, '<br/>') + "</span>";
        obj_html += "        <span class='status_lec statusColor_" + statusColor + "'></span>";
        obj_html += "    </div>";
        obj_html += "    <div class='cont'>";
        obj_html += "        <span class='fc_gray_light'>책임자 : </span> <span class='fc_black'>" + _object.SOLVE_OWNER + "</span><br/>";
        obj_html += "        <span class='fc_gray_light'>목표일 : </span> <span class='fc_black'>" + due_date + "</span> /";
        obj_html += "        <span class='fc_gray_light'>완료일 : </span> <span class='fc_black'>" + close_date + "</span>";
        obj_html += "        <div class='pd_t5 mg_b30'>"+ _object.SOLVE_PLAN.replace(/\n/g, '<br/>') + "</div>";
        obj_html += "    </div>";
        obj_html += "</li>";

        return obj_html; 
    }    
    
    

    function fncList(){
		location.href= '/clientSatisfaction/viewClientSatisfactionList.do';
	}
	
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
</script>
</body>
</html>