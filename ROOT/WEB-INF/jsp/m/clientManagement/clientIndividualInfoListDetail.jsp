<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객사개인정보 상세보기</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">

</head>

<body class="white_bg" onload="tabmenuLiWidth();">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

	<!-- location -->
	<div class="location">
		<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<a href="">고객사 및 고객개인정보</a> 
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<span>고객개인정보</span>
	</div>

	<article class="">
		<div class="title_pg ta_c ">
			<h2 class="" id="textModalClientName"></h2>
			<a href="#" class="btn_back" onclick="fncGoBack(); return false;">back</a>
		</div>

        <div class="author">
            <%-- <span>${detail.HAN_NAME}(${detail.SYS_REGISTER_DATE})</span> --%>
            <div id="textModalCreatorId"></div>
        </div>

		<ul class="tabmenu tabmenu_type2 mg_b20">
			<li><a href="#" id="tab_1" class="active" onclick="fncSelectTab('1'); return false;">기본정보</a></li>
			<li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">개인정보</a></li>
			<li><a href="#" id="tab_3" onclick="fncSelectTab('3'); contactTab.fncInit(); return false;">컨택이력</a></li>
			<li><a href="#" id="tab_4" onclick="fncSelectTab('4');">소속고객정보</a></li>
            <% /*****************************************
             * 고객 컨택의 경우 PC버전에서 요구하는 파라미터가 너무 많아서 모바일에서 구현 불가능. 2017.06.14
             * 향후 고객 컨택 조회에 대한 파라미터 분석이 필요함. 
             * 해당 쿼리아이디 : clientSalesAtive_SQL.XML => selectClientContactList
			<li><a href="#" id="tab_3" onclick="fncSelectTab('3'); return false;">컨텍이력</a></li>
            ********************************************/ %>
		</ul>
		
		<div class="pg_cont">
			<div class="cont1 "><!-- 기본정보 -->
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객ID
					</div>
					<div class="cont fl_l" id="textCommonSearchCustomerId" name="textCommonSearchCustomerId"></div>
				</div>
				
				<!-- 김동용 -->
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 명함/사진
					</div>					
					
					<div class="cont fl_l" id="textModalClientBusinessCard" name="textModalClientBusinessCard"></div>
						
					<div class="cboth pd_t10 photo off" id="nameCardBox">
						<span class="bullet dot"></span> 명함<div id="nameCardURL"></div>
						<div id="nameCardDeafult"></div>
					</div>
					
					<div class="cboth pd_t10 photo off" id="photoBox">
						<span class="bullet dot"></span> 사진<div id="photoURL"></div>
						<div id="photoDeafult"></div>
					</div>										
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 소속팀
					</div>
					<div class="cont fl_l" id="textModalTeam" name="textModalTeam"></div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 소속부서
					</div>
					<div class="cont fl_l" id="textModalPost" name="textModalPost"></div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 소속본부
					</div>
					<div class="cont fl_l" id="textModalDivision" name="textModalDivision"></div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 담당업무
					</div>
					<div class="cont fl_l"  id="textModalDuty" name="textModalDuty"></div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객사명
					</div>
					<div class="cont fl_l" id="textCommonSearchCompany" name="textCommonSearchCompany"></div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객사ID
					</div>
					<div class="cont fl_l" id="textCommonSearchCompanyId" name="textCommonSearchCompanyId"></div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 휴대전화
					</div>
					<div class="cont fl_l" id="textModalCellPhone" name="textModalCellPhone"></div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 직장전화
					</div>
					<div class="cont fl_l" id="textModalPhone" name="textModalPhone"></div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 이메일
					</div>
					<div class="cont fl_l" id="textModalEmail" name="textModalEmail"><a href="mailto:adoro@dunet.co.kr" class="phone ds_in">${detail.EMAIL}</a></div>
				</div>
				
				<div class="view_cata b_line mg_b30">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 직장주소
					</div>
					<div class="cont fl_l"  id="textModalAddress" name="textModalAddress"></div>
				</div>
				
				<h3>보고라인</h3>
				<div class="view_cata_full b_line mg_b30">
                    <div id="textModalReportingLineTeamName" name="textModalReportingLineTeamName"></div>
                    <div id="textModalReportingLinePostName" name="textModalReportingLinePostName"></div>
                    <div id="textModalReportingLineDivisionName" name="textModalReportingLineDivisionName"></div>
                </div>
                
                <h3>기타</h3>
                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 관계수립
                    </div>
                    <div class="cont fl_l" id="selectModalRelation" name="selectModalRelation"></div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 호감도 
                    </div>
                    <div class="cont fl_l" id="selectModalLikeAbility" name="selectModalLikeAbility"></div>
                </div>

				<!-- 자사와의 관계 추가 -->
				<div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 책임자
                    </div>
                    <div class="cont fl_l" id="textModalDirectorName" name="textModalDirectorName"></div>
                </div>
                
				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 사내 친한 직원
					</div>
					<div class="cont fl_l" id="textModalFriendshipInfo" name="textModalFriendshipInfo"></div>
				</div>

                

                <!-- <div class="view_cata b_line">
                     -->

                <div class="view_cata b_line">
                    <div class="ti fl_l w_120">
                        <span class="bullet dot"></span> 이전영업사원
                    </div>
                    <div class="cont fl_l" id="textModalPerSonalPrevSales" name="textModalPerSonalPrevSales"></div>
                </div>
			</div>
				

			<div class="cont2 off"><!-- 개인정보 -->

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 학력
					</div>
					<div class="cboth cont_box" id="textModalPerSonalEducation" name="textModalPerSonalEducation"></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 학력관련인맥
					</div>
					<div class="cboth cont_box" id="textModalPerSonalEducationPerson" name="textModalPerSonalEducationPerson"></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 경력
					</div>
					<div class="cboth cont_box" id="textModalPerSonalCareer" name="textModalPerSonalCareer"></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 경력관련 인맥정보
					</div>
					<div class="cboth cont_box" id="textModalPerSonalCareerPerson" name="textModalPerSonalCareerPerson"></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 가족관계 
					</div>
					<div class="cboth cont_box" id="textModalPerSonalFamily" name="textModalPerSonalFamily"></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 친한 사람
					</div>
					<div class="cboth cont_box" id="textModalPerSonalFamiliars" name="textModalPerSonalFamiliars"></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 사회활동
					</div>
					<div class="cboth cont_box" id="textModalPerSonalActs" name="textModalPerSonalActs"></div>
				</div>
				
				<div class="view_cata_full">
					<div class="ti mg_b5">
                        <span class="bullet dot"></span> 정보출처
                    </div>
                    <div class="cboth cont_box" id="textModalPerSonalInfoSource" name="textModalPerSonalInfoSource"></div>
                </div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> SNS
					</div>
					<div class="cboth cont_box" id="textModalPerSonalSNS" name="textModalPerSonalSNS"></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 성향
					</div>
					<div class="cboth cont_box" id="textModalPerSonalInclination" name="textModalPerSonalInclination"></div>
				</div>

				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 기타
					</div>
					<div class="cboth cont_box" id="textModalPerSonalETC" name="textModalPerSonalETC"></div>
				</div>

			</div>
			
			<div class="cont3 off">
				<jsp:include page="./clientContactTab.jsp" flush="true"/>
				<!-- <ul class="contact_history_list">
					<li>
						<div class="top">
							<div id="contactInfo1"></div>
							<span class="title">
								<span class="contact_type r2 va_m">방문</span>
								<span class="va_m">대한상사 데이터베이스 기술지원 이슈</span>
							</span>
							<span class="custom_name">소속본부 : 기술연구소 / 보고자 : 김진선</span>
							<span class="date">컨택일 : 2016-09-06</span>
						</div>
					</li>
				</ul> -->
			</div>
			
			<div class="cont4 off">
				<jsp:include page="./clientIndividualComMemberTab.jsp" flush="true"/>
				<!-- <ul class="com_member_list">
					<li>
						<div class="form1"></div>
						<div class="form2"></div>
						<div class="form3"></div>
					</li>
				</ul> -->
			</div>
			
			
			
			
			<% /*****************************************
                * 고객 컨택의 경우 PC버전에서 요구하는 파라미터가 너무 많아서 모바일에서 구현 불가능. 2017.06.14
                * 향후 고객 컨택 조회에 대한 파라미터 분석이 필요함. 
                * 해당 쿼리아이디 : clientSalesAtive_SQL.XML => selectClientContactList
            <div class="cont3 off"><!-- 컨텍이력 -->
                <ul class="contact_history_list">
                    <li>
                        <div class="top">                            
                            <span class="title">
                                <span class="contact_type r2 va_m">방문</span>
                                <span class="va_m">BP사 고객의 DB2 이슈발생</span>
                            </span>
                            <span class="custom_name">소속본부 : 기술연구소 / 보고자 : 김진선</span>
                            <span class="date">컨택일 : 2016-09-06</span>
                        </div>
                    </li>
                    <li>
                        <div class="top">                            
                            <span class="title">
                                <span class="contact_type r2 va_m">E-mail</span>
                                <span class="va_m">BP사 고객의 DB2 이슈발생</span>
                            </span>
                            <span class="custom_name">소속본부 : 기술연구소 / 보고자 : 김진선</span>
                            <span class="date">컨택일 : 2016-09-06</span>
                        </div>
                    </li>
                </ul>
			</div>
			**********************************************/ %>
		</div>
		
        <div class="pg_bottom_func">
            <ul>
                <li><a href="#" class="" id="clientIndividualList"><img src="${pageContext.request.contextPath}/images/m/icon_list.png" /><span>목록</span></a></li>
                <li><a href="#" class="" id="insertClientIndividual"><img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /><span>수정</span></a></li>
            </ul>
        </div>
				<input type="hidden" name="hiddenPersonalNameCard" id="hiddenPersonalNameCard" value="${defaultPhoto[0].FILE_PATH}${defaultPhoto[0].FILE_NAME}" />
			    <input type="hidden" name="hiddenPersonalPhoto" id="hiddenPersonalPhoto" value="${defaultPhoto[1].FILE_PATH}${defaultPhoto[1].FILE_NAME}" />
	</article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>


</div>

<div class="modal_screen"></div>

<input type="hidden" name="hiddenPersonalNameCard" id="hiddenPersonalNameCard" value="${defaultPhoto[0].FILE_PATH}${defaultPhoto[0].FILE_NAME}" />
<input type="hidden" name="hiddenPersonalPhoto" id="hiddenPersonalPhoto" value="${defaultPhoto[1].FILE_PATH}${defaultPhoto[1].FILE_NAME}" />

<form method="post" id="updateForm" action="">
    <input type="hidden" id="mode" name="mode" value="upd" />
    <input type="hidden" id="pkNo" name="pkNo" value="" />
</form>  

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.js"></script>
<link href="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/file/jQuery.MultiFile.min.js"></script>

<script type="text/javascript">
	
    $(document).ready(function() {
        // 상세 정보 가져오기
        fnDetail();
        //getCustomerContact();
        contactTab.fncInit();
        comMemberTab.fncShowMore();
        nameCard();
        
        <% /*****************************************
         * 고객 컨택의 경우 PC버전에서 요구하는 파라미터가 너무 많아서 모바일에서 구현 불가능. 2017.06.14
         * 향후 고객 컨택 조회에 대한 파라미터 분석이 필요함. 
         * 해당 쿼리아이디 : clientSalesAtive_SQL.XML => selectClientContactList
        // 컨택정보가져오기
        getCustomerContact();
         ***********************************/ %>
        
        // 고객 목록 조회 페이지 이동
        $("#clientIndividualList").on("click", function(e) {
            location.href = '/clientManagement/viewClientIndividualInfoGate.do';
            e.preventDefault();
        });
    

        // 고객 수정 페이지 이동
        $("#insertClientIndividual").on("click", function(e) {
            $("#updateForm").attr("action", "/clientManagement/clientIndividualInsertForm.do");
            $('#updateForm').submit();       
            e.preventDefault();
        });
    });

    function fnDetail() {
        var params = $.param({
            datatype : 'json',
            jsp : '/clientManagement/clientCompanyInfoTabAjax'
        });
        
        $.ajax({
            url : "/clientManagement/selectCustomerInfo.do",
            datatype : 'json',
            data : {
                "customerId" : '${customerId}',
                "datatype" : "json"
            },
            cache : false,
            method : 'POST',
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                var clientInfo = data.defaultInfo[0];
                //console.log(clientInfo);
               
                var use_yn = "재직"; // 재직(Y) / 퇴직(N) 여부
                $("#textModalClientBusinessCard").html("<a href'#' class='fc_orange' onClick='showCard();'>[명함/사진보기]</a>");	//김동용
                $("#textModalClientBusinessCardBox").html("<img src='../../../images/m/namecard3.png'>");
                $("#textModalClientName").html(clientInfo.CUSTOMER_NAME + " <span class='fs12'>" + undefinedCheck(clientInfo.POSITION) + "</span>");
               	$("#textModalCellPhone").html("<a href='tel:" + undefinedCheck(clientInfo.CELL_PHONE) + "' class='phone ds_in'>" + undefinedCheck(clientInfo.CELL_PHONE) + "</a>");
               	$("#textModalPhone").html("<a href='tel:" + undefinedCheck(clientInfo.PHONE) + "' class='phone ds_in'>" + undefinedCheck(clientInfo.PHONE) + "</a>");
               	$("#textModalEmail").html("<a href='mailto:" + undefinedCheck(clientInfo.EMAIL) + "' class='phone ds_in'>" + undefinedCheck(clientInfo.EMAIL) + "</a>");
                if (clientInfo.USE_YN == "N") {
                    use_yn = "퇴직";
                }
                $("#radioModalUseYN").html(use_yn);
                $("#textCommonSearchCompany").html("<a href='/clientManagement/viewClientCompanyInfoDetail.do?company_id="+clientInfo.COMPANY_ID+"' style='text-decoration:underline'>"+clientInfo.COMPANY_NAME+"</a>");
                $("#textCommonSearchCompanyId").html(clientInfo.COMPANY_ID);
                $("#textCommonSearchCustomerId").html(clientInfo.CUSTOMER_ID);
                $("#textModalDivision").html(clientInfo.DIVISION);
                $("#textModalPost").html(clientInfo.POST);
                $("#textModalTeam").html(clientInfo.TEAM);
                $("#textModalPositionDuty").html(clientInfo.POSITION_DUTY);
                $("#textModalReportingLineTeamName").html("1단계 : " + undefinedCheck(clientInfo.TEAM_POSITION_DUTY) + "<a href='' class='fc_orange'> " + undefinedCheck(clientInfo.TEAM_NAME) + "</a>" + undefinedCheck(clientInfo.TEAM_POSITION));// + "(" + undefinedCheck(clientInfo.DIVISION_ID) + ")"
                $("#textModalReportingLinePostName").html("2단계 : " + undefinedCheck(clientInfo.POST_POSITION_DUTY) + "<a href='' class='fc_orange'> " + undefinedCheck(clientInfo.POST_NAME) + "</a>" + undefinedCheck(clientInfo.POST_POSITION));// + "(" + undefinedCheck(clientInfo.POST_ID) + ")"
                $("#textModalReportingLineDivisionName").html("3단계 : " + undefinedCheck(clientInfo.DIVISION_POSITION_DUTY) + "<a href='' class='fc_orange'> " + undefinedCheck(clientInfo.DIVISION_NAME) + "</a>" + undefinedCheck(clientInfo.DIVISION_POSITION));// + "(" + undefinedCheck(clientInfo.TEAM_ID) + ")"
                $("#textModalDuty").html(clientInfo.DUTY);
                $("#textModalAddress").html(clientInfo.ADDRESS);
                $("#textModalRelationshipInfo").html(clientInfo.PINFO_RELATIONSHIP);
                $("#selectModalRelation").html("<span class='status_lec statusColor_" + clientInfo.RELATION + "'></span>");
                $("#selectModalLikeAbility").html("<span class='status_lec statusColor_" + clientInfo.LIKEABILITY + "'></span>");
                $("#textModalFriendshipInfo").html(clientInfo.FRIENDSHIP_INFO);
                $("#textModalDirectorName").html(undefinedCheck(clientInfo.DIRECTOR_NAME) + " " + undefinedCheck(clientInfo.DIRECTOR_POSITION));
                $("#textModalPerSonalInfoSource").html(clientInfo.INFO_SOURCE);
                $("#textModalPerSonalPrevSales").html(undefinedCheck(clientInfo.PREV_SALES_HAN_NAME) + " " + undefinedCheck(clientInfo.PREV_SALES_POSITION));
                $("#textModalPerSonalEducation").html(clientInfo.PINFO_EDUCATION);
                $("#textModalPerSonalEducationPerson").html(clientInfo.PINFO_EDUCATION_PERSON);
                $("#textModalPerSonalCareer").html(clientInfo.PINFO_CAREER);
                $("#textModalPerSonalCareerPerson").html(clientInfo.PINFO_CAREER_PERSON);
                $("#textModalPerSonalActs").html(clientInfo.PINFO_SOCIAL_ACTS);
                $("#textModalPerSonalFamily").html(clientInfo.PINFO_FAMILY);
                $("#textModalPerSonalInclination").html(clientInfo.PINFO_INCLINATION);
                $("#textModalPerSonalFamiliars").html(clientInfo.PINFO_FAMILIARS);
                $("#textModalPerSonalSNS").html(clientInfo.PINFO_SNS);
                $("#textModalPerSonalETC").html(clientInfo.PINFO_ETC);
                //작성일자
                var updateDate = moment(clientInfo.SYS_UPDATE_DATE);
				updateDate = updateDate.format("YYYY-MM-DD");
                $("#textModalCreatorId").html("<span>" + clientInfo.CREATOR_NAME +" (" + updateDate + ")</span");
                
                $("#").html("");
                
				
                // 수정폼 데이터 입력
                $("#pkNo").val(clientInfo.CUSTOMER_ID);
            },
            complete : function(){
            }
        });
    }    
	
    function showCard(){	//김동용
    	if($("#nameCardBox").css("display") == "none" && $("#photoBox").css("display") == "none"){   
            jQuery('#nameCardBox').show();
            jQuery('#nameCardURL').show();
            jQuery('#nameCardDeafult').show();
            //김동용
            jQuery('#photoBox').show();
            jQuery('#photoURL').show();
            jQuery('#photoDeafult').show();
            
        } else {  
            jQuery('#nameCardBox').hide();
            jQuery('#nameCardURL').hide();
            jQuery('#nameCardDeafult').hide();
            //김동용
            jQuery('#photoBox').hide();
            jQuery('#photoURL').hide();
            jQuery('#photoDeafult').hide();
        }
    }
    
    <% /*****************************************
     * 고객 컨택의 경우 PC버전에서 요구하는 파라미터가 너무 많아서 모바일에서 구현 불가능. 2017.06.14
     * 향후 고객 컨택 조회에 대한 파라미터 분석이 필요함. 
     * 해당 쿼리아이디 : clientSalesAtive_SQL.XML => selectClientContactList
     ********************************************/ %>
    function getCustomerContact() {
        var params = $.param({
            datatype : 'json',
            jsp : '/clientManagement/clientIndividualInfoListDetail'
        });

        $.ajax({
            url : "/clientManagement/selectCustomerContact.do",
            datatype : 'json',
            data : {
                customerId : "${customerId}", 
                searchCustomerId : "${customerId}",
                datatype : "json"
            },
            cache : false,
            method : 'POST',
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
            	var contactInfo = data.clientContact;
            	if(contactInfo.length > 0){
	            	for(var i= 0 ; i < contactInfo.length; i++) {
	            		$(".contact_history_list").html("");
	            		for(var i= 0 ; i < contactInfo.length; i++) {
	            			$(".contact_history_list").append("<li><a href='/clientSalesActive/selectContactDetail.do?pkNo=" + contactInfo[i].EVENT_ID + "'><div class='top'>"
	            				+ "<span class='title'><span class='contact_type r2 va_m'>" + contactInfo[i].EVENT_CATEGORY + "</span>"
	            				+ "<span class='va_m'> " + contactInfo[i].EVENT_SUBJECT + "</span></span>"
	            				+ "<span class='custom_name'>소속본부 : " + contactInfo[i].DIVISION_NAME + "/ 보고자 : " + contactInfo[i].HAN_NAME + "</span>"
	            				+ "<span class='date'>컨택일 : " + contactInfo[i].EVENT_DATE + "</span></div></a></li>"
	            			);
	            		}
	            	}
            	}else{
            		/* $(".contact_history_list").html("<li><div class='top'>"
            			+ "<span class='title'>"
            			+ "<span class='contact_type r2 va_m'>No data</span>"
            			+ "<span class='va_m'> No data</span>"
            			+ "<span class='custom_name'>소속본부 : No data"
            			+ "<span class='date'>컨택일 : No data"
            			+ "<span>"
            			+ "</div></li>"); */
            		$(".contact_history_list").html("<li><div class='top ta_c'><span class='contact_type r2 va_m'>No data</span></div></li>");
            	}
            	//$("#textModalEventSubject").html(contactInfo.EVENT_SUBJECT);
            	/* $("div#customerAjax").html(data);
                console.log(data); */
            },
            complete : function(){
            }
        });        
    }
    
    function nameCard(){
    	var params = $.param({
    		datatype : 'json',
    		jsp : '/clientManagement/clientIndividualInfoListDetail'
    	});
    	$.ajax({
    		url : "/clientManagement/selectCustomerInfo.do",
    		datatype : 'json',
    		data : {
    			customerId : "${customerId}",
    			companyId : "${companyId}",
                datatype : "json"
    		},
    		cache : false,
    		method : 'POST',
    		beforeSend : function(xhr){
    			xhr.setRequestHeader("AJAX", true);
    		},
    		success : function(data){
    			//김동용
    			var nameCard = data.defaultPhoto;
    			console.log(nameCard);
    			var path = data.imagePath; //properties-local.xml에서 경로 설정 필요합니다.
    			
    			var nameCardURL =  nameCard[0].FILE_PATH + nameCard[0].FILE_NAME;	//명함:
    			var photoURL =  nameCard[1].FILE_PATH + nameCard[1].FILE_NAME;		//사진:
    				    				
				var date = new Date();
    			
   			//명함
   			if(nameCard[0].FILE_PATH.length > 0){
   				/* $("#nameCardURL").html("<img src='../../../images/"+ nameCardURL  + "' />"); */
  				$("#nameCardURL").html("<img src='/" + nameCardURL  + "?time=" + date.getTime() + "' />");		//김동용

   			}else{
   				$("#nameCardDeafult").html("<img src='../../../images/m/namecard_default.png'/>");			//김동용    				
   			}
  	  			
    		//사진
    		if(nameCard[1].FILE_PATH.length > 0){
    				$("#photoURL").html("<img src='/" + photoURL  + "?time=" + date.getTime() + "' />");		//김동용
    			}else{
    				$("#photoDeafult").html("<img src='../../../images/m/photo_default.png'/>");				//김동용

    			}
    		},
    		complate : function(){
    			
    		}
    	})
    }
    
    function undefinedCheck(_param) {
        // 목표일과 완료일 undefined 체크
        if (typeof _param != "undefined") {
            return _param;
        } else {
            return "";
        }
    }

    function gogogo(companyInfo){
		alert(companyInfo);
	}
    
	function fncList(){
		location.href="/clientManagement/listClientIndividualInfoList.do";
	}
	
	function fncModify(){
        $("#updateForm").attr("action", "/clientManagement/clientIndividualInsertForm.do");
        $('#updateForm').submit();      
	
	}
	
	function fncSelectTab(_no){
		// 탭 이동
		$('#tab_1').removeClass('active');
		$('#tab_2').removeClass('active');
		$('#tab_3').removeClass('active');
		$('#tab_4').removeClass('active');
		$('#tab_'+_no).addClass('active');
		
		// 탭에 해당하는 컨테이너 보여주기
		$('.cont1').addClass('off');
		$('.cont2').addClass('off');
		$('.cont3').addClass('off');
		$('.cont4').addClass('off');
		$('.cont'+_no).removeClass('off');
		
	}

</script>
</body>
</html>