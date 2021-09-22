<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<% pageContext.setAttribute("enter", "\n"); %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>영업기회관리</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">

</head>

<body class="white_bg" onload="tabmenuLiWidth();">

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

	<article class="">
		<div class="title_pg">
			<h2 class="">${detail.SUBJECT}</h2>
			<a href="#" class="btn_back" onclick="fncGoBack(); return false;">back</a>
		</div>

		<div class="author">
			<span>${detail.HAN_NAME} (${detail.SYS_UPDATE_DATE})</span>
		</div>

		<ul class="tabmenu tabmenu_type2 mg_b20">
			<li><a href="#" id="tab_1" onclick="fncSelectTab('1'); return false;" class="active">기본정보</a></li>
			<li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">매출계획</a></li>
			<li><a href="#" id="tab_3" onclick="fncSelectTab('3'); return false;">마일스톤</a></li>
			<li><a href="#" id="tab_4" onclick="fncSelectTab('4'); return false;">Sales Cycle</a></li>
			<li><a href="#" id="tab_5" onclick="fncSelectTab('5'); return false;">Coaching Talk</a></li>
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

				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 계약/매출액
					</div>
					<div class="cont fl_l">
                        <fmt:formatNumber value="${detail.CONTRACT_AMOUNT}" pattern="#,###"/>
                    </div>
				</div>

				<%-- <div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 예상GP금액
					</div>
					<div class="cont fl_l">
                        <fmt:formatNumber value="${detail.GP_AMOUNT}" pattern="#,###"/>
                    </div>
				</div> --%>

				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 예상계약일자
					</div>
					<div class="cont fl_l">${detail.CONTRACT_DATE}</div>
				</div>

                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> Forecast여부
                    </div>
                    <div class="cont fl_l">${detail.FORECAST_YN}</div>
                </div>                

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span>EO
					</div>
					<div class="cont fl_l">${detail.EXEC_NAME}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span>OO
					</div>
					<div class="cont fl_l">${detail.OWNER_NAME}</div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 영업대표
					</div>
					<div class="cont fl_l">${detail.IDENTIFIER_NAME}</div>
				</div>

                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> 상세내용
                    </div>
                    <div class="cboth cont_box">
                    	${fn:replace(detail.DETAIL_CONENTS, enter, "<br/>")}
                    </div>
                </div>
                
                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> 차별화 가치
                    </div>
                    <div class="cboth cont_box">
                        ${fn:replace(detail.DISCRIMINATE_VALUE, enter, "<br/>")}
                    </div>
                </div>                
                
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> ROUTE
					</div>
					<div class="cboth cont_box">
						${fn:replace(detail.ROUTE, enter, "<br/>")}
					</div>
				</div>

                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> 파트너사
                    </div>
                    <div class="cboth cont_box" id="divOppPartnerM">
                    </div>
                </div>

                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> 파트너사 역할
                    </div>
                    <div class="cboth cont_box">
                    	${fn:replace(detail.PARTNER_ROLE, enter, "<br/>")}
                    </div>
                </div>


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

			</div>
			
			<!-- 매출계획 -->
			<div class="cont2 off">
                <div class="mg_b10">
					<select name="basis_year" id="basis_year">
                        <option value="2017">2017년</option>
                        <option value="2018">2018년</option>
                        <option value="2019">2019년</option>
                        <option value="2020">2020년</option>
					</select>
					<select name="basis_quarter" id="basis_quarter">
						<option value="00">선택</option>
						<option value="01">1분기</option>
						<option value="04">2분기</option>
						<option value="07">3분기</option>
						<option value="10">4분기</option>
					</select>
				</div>

                <% /*
				<h3 class="mg_b5">Total(회사전체)</h3>
				<table class="basic mg_b30">
					<colgroup><col width="30%"/><col/></colgroup>
					<tr>
						<th class="ta_r">Rev</th>
						<td>${detail.AMOUNT_REV}</td>
					</tr>
					<tr>
						<th class="ta_r">GP</th>
						<td>
							<span class="fc_green fs_18">${detail.AMOUNT_GP}</span>
						</td>
					</tr>
				</table>
				<div>
					<h3 class="mg_b5 mg_r5 fl_l">부서매출</h3>
					<select class="mg_b5" id="select_division">
						<option value="${detail.DIVISION_REV_1}|${detail.DIVISION_GP_1}">IBM HW 사업본부</option>
						<option value="${detail.DIVISION_REV_2}|${detail.DIVISION_GP_2}">IBM SW 사업본부</option>
						<option value="${detail.DIVISION_REV_3}|${detail.DIVISION_GP_3}">Dynatrace 사업본부</option>
						<option value="${detail.DIVISION_REV_4}|${detail.DIVISION_GP_4}">보안사업본부</option>
						<option value="${detail.DIVISION_REV_5}|${detail.DIVISION_GP_5}">I&P사업본부</option>
					</select>
				</div>
				<table class="basic mg_b30">
					<colgroup><col width="30%"/><col/></colgroup>
					<tr>
						<th class="ta_r">Rev</th>
						<td>${detail.DIVISION_REV_1}</td>
					</tr>
					<tr>
						<th class="ta_r">GP</th>
						<td>
							<span class="fc_green fs_18">${detail.DIVISION_GP_1}</span>
						</td>
					</tr>
				</table>
				*/ %>
                <div id="salesplan_result">
                </div>
                				
			</div>
			<!--// 매출현황 -->
			

			<div class="cont3 off"><!-- MileStones -->
				<div class="cboth keymilestones_list" id="oppMilestone">
				</div>
			</div>

			<div class="cont4 off"><!-- Sales Cycle -->

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> Sales Cycle
					</div>
					<div class="cont fl_l fs16">
						<strong>
							<c:choose>
							<c:when test="${detail.SALES_CYCLE eq '1'}">Validation</c:when>
							<c:when test="${detail.SALES_CYCLE eq '2'}">Qualification</c:when>
							<c:when test="${detail.SALES_CYCLE eq '3'}">Negotiation</c:when>
							<c:when test="${detail.SALES_CYCLE eq '4'}">Contract</c:when>
							</c:choose>
						</strong>
					</div>
				</div>
				<!-- 
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 체크리스트
					</div>
					
					<table class="basic2">
						<thead>
							<tr>
								<th>매출현황</th>
								<th>경쟁상황</th>
								<th>솔루션</th>
								<th>계약조건</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span class="status_lec statusColor_${detail.STATUS1}"></span></td>
								<td><span class="status_lec statusColor_${detail.STATUS2}"></span></td>
								<td><span class="status_lec statusColor_${detail.STATUS3}"></span></td>
								<td><span class="status_lec statusColor_${detail.STATUS4}"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				 -->
				 
				<!-- <div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span>체크리스트
					</div>
					<div class="cboth keymilestones_list" id="oppCheckList">
					</div>
				</div> -->

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 승리계획
					</div>
					<div class="cboth keymilestones_list" id="oppWinPlan">
						<% /*
                        <ul>
							<c:forEach items="${winPlanList}" var="plan">
							<li>
								<div class="top top2">
									<span class="cata r2">${plan.CHECKLIST_NAME}</span>
									<span class="title">${plan.MEMO}</span>
									<span class="status_lec statusColor_${plan.STATUS_COLOR}"></span>
								</div>
								<div class="cont">
									<span class="fc_gray_light">담당자 : </span> <span class="fc_black">${plan.ACTION_OWNER}</span><br/>
									<span class="fc_gray_light">해결기한 : </span> <span class="fc_black">${plan.DUE_DATE}</span> / 
									<span class="fc_gray_light">해결완료일 : </span> <span class="fc_black">${plan.CLOSE_DATE}</span>
								</div>
							</li>
							</c:forEach>
						</ul>
						*/ %>
					</div>
				</div>

			</div>

			<div class="cont5 off"><!-- Coaching Talk -->
                <div class="view_cata_full">
                	<jsp:include page="/WEB-INF/jsp/m/common/coachingTalkTab.jsp"/>
                </div>
            </div>
		</div>

		<!-- 
        <div class="pg_bottom">
			<div class="ta_c">
				<button type="button" class="btn lg btn-default pd_r15 pd_l15 r5" onclick="fncList(); return false;">목록</button>
			</div>
		</div>
         -->
        <div class="pg_bottom_func">
            <ul>
                <li><a href="#" class="" onclick="fncList(); return false;"> <img src="${pageContext.request.contextPath}/images/m//icon_list.png" /> <span>목록</span></a></li>
                <li><a href="#" class="" onclick="fncModify(); return false;"> <img src="${pageContext.request.contextPath}/images/m//icon_edit.png" /> <span>수정</span></a></li>
            </ul>
        </div>



	</article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>

</div>

<div class="modal_screen"></div>

<form method="post" id="updateForm" action="">
    <input type="hidden" id="mode" name="mode" value="upd" />
    <input type="hidden" id="pkNo" name="pkNo" value="${detail.OPPORTUNITY_ID}" />
</form>  

<input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}"/>
<input type="hidden" name="hiddenModalExecId" id="hiddenModalExecId" value="${detail.EXEC_NAME}"/>
<input type="hidden" name="hiddenModalOwnerId" id="hiddenModalOwnerId" value="${detail.OWNER_ID}"/>
<input type="hidden" name="hiddenModalIdentifierId" id="hiddenModalIdentifierId" value="${detail.IDENTIFIER_ID}"/>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $('#select_division').change(function(e){
            var select_val = $(this).val();
            var division_val = select_val.split('|');
            
        });
        
        // 매출 계획 조회
        $('#basis_year').change(function(e){
            fnSalesPlan();
        });

        
        // 매출 계획 조회
        $('#basis_quarter').change(function(e){
            fnSalesPlan();
        });
        
        // 마일스톤 조회
        fnOppMilestone();
        
        // 체크리스트
        //fncCheckList();
        
        // 승리계획
        fncWinPlan();
        
        //파트너사
        commonSearch.partnerSelect2("${detail.SALES_PARTNER}");
        
        // Coaching Talk 조회
		coachingTalk.view('OPP');
		
		// 코칭톡 탭으로 이동
		if('${param.coaching_talk}'.toUpperCase() == 'Y'){
			fncSelectTab('5');
		}
        
    });
    
    
    function fncList(){
		location.href= '/clientSalesActive/viewOpportunityList.do';
	}
    
    function fncModify(){
        $("#updateForm").attr("action", "/clientSalesActive/opportunityInsertForm.do");
        $('#updateForm').submit();
    }    
	
	function fncSelectTab(_no){
		// 탭 이동
		$('#tab_1').removeClass('active');
		$('#tab_2').removeClass('active');
		$('#tab_3').removeClass('active');
		$('#tab_4').removeClass('active');
		$('#tab_5').removeClass('active');
		$('#tab_'+_no).addClass('active');
		
		// 탭에 해당하는 컨테이너 보여주기
		$('.cont1').addClass('off');
		$('.cont2').addClass('off');
		$('.cont3').addClass('off');
		$('.cont4').addClass('off');
		$('.cont5').addClass('off');
		$('.cont'+_no).removeClass('off');
	}
	
	
	// 매출 계획
	function fnSalesPlan() {
        var basis_month;
        var basis_year = $('#basis_year').val();
        var basis_quarter = $('#basis_quarter').val();
        if (basis_quarter != '00') {
            basis_month = basis_year + '-' + basis_quarter + '-01'; // '해당년도-분기(01, 04, 07, 10)'.  예) 2017년 3분기 => 2017-07
            console.log(basis_month);

            //매출 계획 
            $.ajax({
                url : "/clientSalesActive/selectOpportunitySalesPlan.do",
                async : false,
                datatype : 'json',
                type : "POST",
                data : {
                    opportunity_id:'${detail.OPPORTUNITY_ID}',
                    basis_month:basis_month
                    
                },
                beforeSend : function(xhr){
                    xhr.setRequestHeader("AJAX", true);
                },
                success : function(data){
                    var salesAmount = data.salesAmount;
                    var salesListCount = data.salesListCount;
                    
                    // 목록 초기화
                    $('#salesplan_result').html('');
                    
                    var list_html = '';
                    var rev = 0;
                    var gp = 0;
                    //입력한 부서 만큼 html 생성
                    
                    for(var i=0; i<salesListCount.length; i++){
                        rev = 0;
                        gp = 0;
                        for (var j=0; j<salesAmount.length; j++) {
                            if (salesListCount[i].MEMBER_ID_NUM == salesAmount[j].MEMBER_ID_NUM) {
                                rev = salesAmount[j].REV;
                                gp = salesAmount[j].GP;
                            }
                        }
                        list_html += fnSalePlanHtml(salesListCount[i], rev, gp);
                    }
                    $('#salesplan_result').append(list_html);
                },
                complete : function(){
                }
            });
        }   
	}
	
	// 매출 계획 HTML 생성
	function fnSalePlanHtml(_userObject, _rev, _gp) {
	    var obj_html = '';
	    
	    obj_html += "<h3 class='mg_b5'>" + _userObject.HAN_NAME + "</h3>";
	    obj_html += "<table class='basic mg_b30'>";
	    obj_html += "    <colgroup><col width='30%''/><col/></colgroup>";
	    obj_html += "    <tr><th class='ta_r'>Rev</th><td>" + numberWithCommas(_rev) + "</td></tr>";
	    obj_html += "    <tr><th class='ta_r'>GP</th><td>" + numberWithCommas(_gp) + "</td></tr>";
        obj_html += "</table>";
        
        return obj_html; 
	}
	
    // 마일스톤
    function fnOppMilestone() {
        //매출 계획 
        $.ajax({
            url : "/clientSalesActive/selectOpportunityMilestons.do",
            async : false,
            datatype : 'json',
            type : "POST",
            data : {
                pkNo : '${detail.OPPORTUNITY_ID}'
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                $('#oppMilestone').html('');
                var list_html = '<ul>';
                for(var i=0; i<data.rows.length; i++){
                    list_html += fnOppMilestoneHtml(data.rows[i]);
                }
                list_html += "</ul>";
                $('#oppMilestone').append(list_html);
            },
            complete : function(){
            }
        });
    }
	

    // 마일스톤  HTML 생성
    function fnOppMilestoneHtml(_object) {
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
        obj_html += "    <div class='top'>";
        obj_html += "        <span class='title'>" + _object.KEY_MILESTONE + "</span>";
        obj_html += "        <span class='status_lec statusColor_" + statusColor + "'></span>";
        obj_html += "    </div>";
        obj_html += "    <div class='cont'>";
        
        if(isEmpty(_object.ACT_NAME)){
	        obj_html += "        <span class='fc_gray_light'>책임담당자 : </span> <span class='fc_black'></span><br/>";
        }else{
        	obj_html += "        <span class='fc_gray_light'>책임담당자 : </span> <span class='fc_black'>" + _object.ACT_NAME + "</span><br/>";
        }
        obj_html += "        <span class='fc_gray_light'>목표일 : </span> <span class='fc_black'>" + due_date + "</span> /";
        obj_html += "        <span class='fc_gray_light'>완료일 : </span> <span class='fc_black'>" + close_date + "</span>";
        obj_html += "    </div>";
        obj_html += "</li>";

        return obj_html; 
    }
    
    
	// 체크리스트
	function fncCheckList(){
        //매출 계획 
        $.ajax({
            url : "/clientSalesActive/gridOpportunityCheckList.do",
            async : false,
            datatype : 'json',
            type : "POST",
            data : {
                hiddenModalPK : '${detail.OPPORTUNITY_ID}'
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                $('#oppCheckList').html('');
                var list_html = '<ul>';
                for(var i=0; i<data.rows.length; i++){
                    list_html += fncCheckListHtml(data.rows[i]);
                }
                list_html += "</ul>";
                $('#oppCheckList').append(list_html);
            },
            complete : function(){
            }
        });		
	}


    // 체크리스트  HTML 생성
    function fncCheckListHtml(_object) {
        var obj_html = '';
        var statusColor = "";
        var due_date = "";
        var close_date = "";
        
        // 마일스톤 상태값에 따른 css 변경
        if (_object.HIDDEN_STATUS == "Y") {
            statusColor = "yellow";
        } else if (_object.HIDDEN_STATUS == "R") {
            statusColor = "red";
        } else if (_object.HIDDEN_STATUS == "G") {
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
        obj_html += "        <span class='cata r2'>" + _object.CHECKLIST_NAME + "</span>";
        obj_html += "        <span class='title'>" + _object.MEMO + "</span>";
        obj_html += "        <span class='s_ti'>";
        obj_html += "             <span class='fc_gray_light'>plan:</span>" + _object.ACTION_PLAN_NAME;
        obj_html += "        </span>";
        obj_html += "        <span class='status_lec statusColor_" + statusColor + "'></span>";
        obj_html += "    </div>";
      
        
        obj_html += "    <div class='cont'>";
        
        if(isEmpty(_object.ACTION_OWNER_NAME)){
        	obj_html += "        <span class='fc_gray_light'>책임담당자 : </span> <span class='fc_black'></span><br/>";
        }else{
        	obj_html += "        <span class='fc_gray_light'>책임담당자 : </span> <span class='fc_black'>" + _object.ACTION_OWNER_NAME + "</span><br/>";
        }
        
        obj_html += "        <span class='fc_gray_light'>목표일 : </span> <span class='fc_black'>" + due_date + "</span> /";
        obj_html += "        <span class='fc_gray_light'>완료일 : </span> <span class='fc_black'>" + close_date + "</span>";
        obj_html += "    </div>";
        obj_html += "</li>";

        return obj_html; 
    }
    	
	
    // 윈플랜
    function fncWinPlan(){
        $.ajax({
            url : "/clientSalesActive/gridSalesCycleWinPlan.do",
            async : false,
            datatype : 'json',
            type : "POST",
            data : {
                hiddenModalPK : '${detail.OPPORTUNITY_ID}'
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                $('#oppWinPlan').html('');
                console.log("###########################################");
                console.log(data.rows);
                var list_html = '<ul>';
                for(var i=0; i<data.rows.length; i++){
                    list_html += fncWinPlanHtml(data.rows[i]);
                }
                list_html += "</ul>";
                $('#oppWinPlan').append(list_html);
            },
            complete : function(){
            }
        }); 		
	}

    // 윈플랜  HTML 생성
    function fncWinPlanHtml(_object) {
        var obj_html = '';
        var statusColor = "";
        var due_date = "";
        var close_date = "";
        
        // 마일스톤 상태값에 따른 css 변경
        if (_object.HIDDEN_STATUS == "Y") {
            statusColor = "yellow";
        } else if (_object.HIDDEN_STATUS == "R") {
            statusColor = "red";
        } else if (_object.HIDDEN_STATUS == "G") {
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
        obj_html += "        <span class='cata r2'>" + _object.CHECKLIST_NAME + "</span>";
        obj_html += "        <span class='title'>" + _object.ITEM_2BE_FIXED + "</span>";
        obj_html += "        <span class='s_ti'>";
        obj_html += "             <span class='fc_gray_light'>WinPlan:</span>" + _object.ACTION_PLAN_NAME;
        obj_html += "        </span>";
        obj_html += "        <span class='status_lec statusColor_" + statusColor + "'></span>";
        obj_html += "    </div>";
      
        
        obj_html += "    <div class='cont'>";
        
        if(isEmpty(_object.ACTION_OWNER_NAME)){
        	obj_html += "        <span class='fc_gray_light'>책임담당자 : </span> <span class='fc_black'></span><br/>";
        }else{
        	obj_html += "        <span class='fc_gray_light'>책임담당자 : </span> <span class='fc_black'>" + _object.ACTION_OWNER_NAME + "</span><br/>";
        }
        obj_html += "        <span class='fc_gray_light'>목표일 : </span> <span class='fc_black'>" + due_date + "</span> /";
        obj_html += "        <span class='fc_gray_light'>완료일 : </span> <span class='fc_black'>" + close_date + "</span>";
        obj_html += "    </div>";
        obj_html += "</li>";

        return obj_html; 
    }	
	
</script>
</body>
</html>