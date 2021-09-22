<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
    <title>잠재영업기회</title>
    
    <link href="${pageContext.request.contextPath}/css/m/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/m/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/m/jqueryui/jquery-ui.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.css" rel="stylesheet">

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
        <span>잠재영업기회</span>
    </div>

    <article class="">
        <div class="title_pg ta_c">
            <c:choose>
                <c:when test="${mode eq 'ins'}">
                    <h2 class="modal-title">잠재영업기회 신규등록</h2>
                </c:when>
                <c:otherwise>
                    <h2 class="modal-title">잠재영업기회 수정등록</h2>
                </c:otherwise>
            </c:choose>
            <a href="javascript:void(0);" class="btn_back" onClick="window.history.back(); return false;">back</a>
        </div>

        <div class="pg_cont pd_t20">
            <form class="form-horizontal" id="formModalData" name="formModalData" method="post" enctype="multipart/form-data">
            <!-- 기본정보 -->
                <div class="cont1 pd_b20">
                    <div class="form_input mg_b20">
                        <label class="">제목</label>
                        <input type="text" placeholder="" class="form_control" id="textModalSubject" name="textModalSubject"/>
                    </div>
    
                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label>매출처</label>
                            <input type="text" placeholder="매출처를 검색해 주세요." class="form_control" id="textCommonSearchCompany" name="textCommonSearchCompany" value="${param.returnCompanyName}" />
                        </div>
                    </div>    
    
                    <div class="form_input mg_b20" style="display:none;">
                        <label>고객사ID</label>
                        <input type="text" class="form_control" id="textCommonSearchCompanyId" name="textCommonSearchCompanyId" value="${param.returnCompanyId}" readOnly/>
                    </div>
    
                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">End User</label>
                            <input type="text" placeholder="End User을 검색해 주세요." class="form_control" id="textModalCustomerName" name="textModalCustomerName" value="${param.returnCustomerName}" />
                        </div>
                    </div>
    
                    <%-- <div class="form_input mg_b20">
                        <label>고객직급</label>
                        <input type="text" placeholder="부장" class="form_control" id="textModalCustomerRank" name="textModalCustomerRank" value="${param.returnCustomerRank}" />
                    </div> --%>
                    
                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">영업대표</label>
                            <input type="text" placeholder="영업대표를 검색해 주세요." class="form_control" id="textModalOppOwner" name="textModalOppOwner" placeholder="영업대표를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>
                    <% /***** 통합버전에는 항목이 없어서 삭제. 2017.04.26
                    <div class="form_input mg_b20">
                        <label class="">사업영역</label>
                        <select class="form_control">
                            <option>=== 선택 ===</option>
                            <option>H/W</option>
                            <option>S/W</option>
                        </select>
                    </div>
                    *****************************************************/
                    %>
    
                    <div class="form_input mg_b20">
                        <label class="">영업기회 전환시점</label>
                        <input type="date" placeholder="" class="form_control" id="textModalSalesChangeDate" name="textModalSalesChangeDate"/>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">예상규모</label>
                        <input type="text" placeholder="" class="form_control" name="textModalAmount" id="textModalAmount"/>
                    </div>

                    <div class="view_cata b_line">
                        <div class="ti fl_l w_120">
                            <span class="bullet dot"></span> 결과
                        </div>
                        <div class="cont fl_l" id="divModalResult">
                            <!-- <span>전환전</span>  -->
                        </div>
                    </div>
    
                    <div class="view_cata b_line">
                        <div class="ti fl_l w_120">
                            <span class="bullet dot"></span> 연관 고객컨택
                        </div>
                        <div class="cont fl_l" id="relationContact">
                            <!-- <a href="#" class="btn_quick">바로가기</a> -->
                        </div>
                    </div>                    
    
                    <div class="form_input mg_b20">
                        <label class="">내용</label>
                        <textarea class="form_control" row="3" id="textareaModalDetail" name="textareaModalDetail"></textarea>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">메일공유</label>
                        <div class="search_input_after">
                            <a href="#" class="btn_search_pop">직원선택</a>
                            <% //<div class="result_search" id="result_search_emp"> %>
                            <div class="company-current" id="result_search_emp">         
                                <!-- 
                                <ul>
                                    <li><span>김진욱</span> <a href="#" class="icon_delete">삭제</a></li>
                                    <li><span>이상현</span> <a href="#" class="icon_delete">삭제</a></li>
                                </ul>
                                -->
                            </div>

                            <!-- 직원 검색 팝업 -->
                            <div class="search_input_after_pop off">
                                <div class="pop-header">
                                    <a href="" class="close"></a>
                                    <strong class="pop-title">직원 선택</strong>
                                </div>
                                <div class="cont">
                                    <div class="form-group">
                                        <div class="">
                                            <div class="sarch_area"><!-- 검색 -->
                                                <input type="text" placeholder="직원 검색" class="form-control" id="textCommonSearchMember">
                                                <a href="#" class="" id="member_search">검색</a>
                                            </div>
                                        </div>
                                        <div class="search_result"><!-- 검색 결과 노출시 "off" 삭제 -->
                                            <strong>[직원 검색 결과]</strong>
                                            <% // <ul class="result_list"> %>
                                            <ul class="company-list">
                                                <!-- 
                                                <li><span>김진욱</span> <a href="#">추가</a></li>
                                                <li><span>김진욱</span> <a href="#">추가</a></li>
                                                 -->
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

    
                    <div class="guideBox">모바일에서는 기본정보의 등록이 가능하며, Action Plan은 PC에서 등록해주세요.</div>
                </div>
                
                <input type="hidden" name="hiddenModalPK"               id="hiddenModalPK"          value="${pkNo}"/>
                <input type="hidden" name="hiddenModalCreatorId"        id="hiddenModalCreatorId"   value="${userInfo.MEMBER_ID_NUM}"/>
                <input type="hidden" name="hiddenModalCompanyId"        id="hiddenModalCompanyId" value="${param.returnCompanyId}"/>
                <input type="hidden" name="hiddenModalCustomerId"       id="hiddenModalCustomerId" value="${param.returnCustomerId}"/>
                <input type="hidden" name="hiddenModalSalesId"          id="hiddenModalSalesId"/>
                <input type="hidden" name="hiddenModalContactId"        id="hiddenModalContactId" value="${param.contactPK}"/>
                <input type="hidden" name="hiddenModalAmount"           id="hiddenModalAmount"/>
                <input type="hidden" name="hiddenModalMemberList"       id="hiddenModalMemberList"/>
                <input type="hidden" name="hiddenModalHanName"          id="hiddenModalHanName"     value="${userInfo.HAN_NAME}"/>
                <input type="hidden" name="hiddenModalEmail"            id="hiddenModalEmail"       value="${userInfo.EMAIL}"/>
                <input type="hidden" name="hiddenRelationOpportunityId" id="hiddenRelationOpportunityId"/>
            </form>
            <!--// 기본정보 -->

        </div>

        <div class="pg_bottom_func len3">
            <ul>
                <li><a href="#" class="" id="goList"> <img src="${pageContext.request.contextPath}/images/m/icon_list.png" /> <span>목록</span></a></li>
                <li><a href="#" class="" id="goInsert"> <img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /> <span>저장</span></a></li>
                <li><a href="#" class="" id="goShared"> <img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /> <span>저장 및 공유</span></a></li>
            </ul>
        </div>

    </article>   

</div>

<div class="modal_screen"></div>

<form id="formSampleFile" name="formSampleFile" method="post">
    <input type="hidden" name="sampleFileName" value=""/>
</form>

<form id="formRedirectOpportunity" name="formRedirectOpportunity" method="post">
    <input type="hidden" name="returnOpportunityhiddenId" id="returnOpportunityhiddenId"/>
    <input type="hidden" name="opportunity_id" id="opportunity_id"/>
    <input type="hidden" name="returnCompanyId" id="returnCompanyId"/>
    <input type="hidden" name="returnCompanyName" id="returnCompanyName"/>
    <input type="hidden" name="returnCustomerName" id="returnCustomerName"/>
    <input type="hidden" name="returnCustomerId" id="returnCustomerId"/>
    <input type="hidden" name="returnCustomerRank" id="returnCustomerRank"/>
    <input type="hidden" name="returnSubject" id="returnSubject"/>
    <input type="hidden" name="returnOpportunityamount" id="returnOpportunityamount"/>
</form>

<form name="formFollow" id="formFollow" method="post" action="">
    <input type="hidden" name="contactPK" id="contactPK"/>
	<input type="hidden" name="issueFlag" id="issueFlag" value="${param.issueFlag}"/>
	<input type="hidden" name="oppFlag" id="oppFlag" value="${param.oppFlag}"/>
    <input type="hidden" name="returnCompanyId" id="returnCompanyId"/>
    <input type="hidden" name="returnCompanyName" id="returnCompanyName"/>
    <input type="hidden" name="returnCustomerName" id="returnCustomerName"/>
    <input type="hidden" name="returnCustomerId" id="returnCustomerId"/>
    <input type="hidden" name="returnCustomerRank" id="returnCustomerRank"/>
    <input type="hidden" name="hiddenModalContactId" id="hiddenModalContactId" value="${param.contactPK}"/>
</form>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.js?ver=1.0"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        pageInit(); // 페이지 초기화 구성

        // 메일공유 직원 검색
        $("#member_search").on("click", function(e) {
            commonSearch.multipleMemberPop();
            e.preventDefault();
        });  
        
        // 고객컨택내용 목록
        $("#goList").on("click", function(e) {
            location.href = '/clientSalesActive/viewHiddenOpportunityList.do';
            e.preventDefault();
        });
        
        // 저장 
        $("#goInsert").on("click", function(e) {
            insertClientContact(1);
            e.preventDefault();
        });          
 
        // 저장 및 공유
        $("#goShared").on("click", function(e) {
            insertClientContact(2);
            e.preventDefault();
        });
	
        //자동완성 검색
        commonSearch.company($('#formModalData #textCommonSearchCompany'), $('#formModalData #hiddenModalCompanyId'), $('#formModalData #textCommonSearchCompanyId'));
        commonSearch.company($('#formModalData #textModalCustomerName'), $('#formModalData #hiddenModalCustomerId'), $('#formModalData #textCommonSearchCompanyId'));
        
        commonSearch.member($('#formModalData #textModalOppOwner'), $('#formModalData #hiddenModalSalesId'));
        
        //직원 검색
        $('#textCommonSearchMember').on('keydown',function(key){
            if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
                commonSearch.multipleMemberPop();
             }
        });
        
        <c:if test="${mode eq 'upd'}">
            updateDetail('${pkNo}');
        </c:if>        
    });
    
    // 초기 페이지 구성에 필요한 정보를 세팅한다.
    function pageInit() {
        //유효성 체크
        validate();
    }
    
    function validate () {
        $("#formModalData").validate({ // joinForm에 validate를 적용
            ignore: "", 
            rules : {
                textModalSubject : {
                    required : true,
                    maxlength : 100
                },
                /* selectModalCategory : {
                    required : true
                }, */
                textModalOppOwner : {
                    required : true
                },
                // required는 필수, rangelength는 글자 개수(1~10개 사이)
                textCommonSearchCompany : {
                    required : true
                },
                textModalCustomerName : {
                    required : true
                },
                textModalAmount : {
                    required : true
                },
                textModalSalesChangeDate : {
                	required : true
                }
            },
            messages : { // rules에 해당하는 메시지를 지정하는 속성
                textModalSubject : {
                    required : "제목을 입력하세요.",
                    maxlength:"100글자 이하여야 합니다" 
                },
                /* selectModalCategory : {
                    required : "잠재기회 영역을 선택하세요." 
                    // 이와 같이 규칙이름과 메시지를 작성
                    //rangelength:"1글자 이상, 10글자 이하여야 합니다.",
                    //digits:"숫자만 입력해 주세요."
                }, */
                textModalOppOwner : {
                    required : "영업대표를 입력하세요."
                },
                textCommonSearchCompany : {
                    required : "고객사를 선택하세요."
                //rangelength:"1글자 이상, 30글자 이하여야 합니다"
                },
                textModalCustomerName : {
                    required : "고객명을 입력해 주세요."
                },
                textModalAmount : {
                    required : "예상규모를 입력해 주세요."
                },
                textModalSalesChangeDate : {
                	required : "영업기회 전환일을 선택해주세요"
                }
            },
            errorPlacement : function(error, element) {
                if($(element).prop("id") == "hiddenModalCompanyId") {
                    $("#textCommonSearchCompany").after(error);
                    location.href = "#textCommonSearchCompany";
                }else {
                    error.insertAfter(element); // default error placement.
                }
            }
        });       
    }
    
    function insertClientContact(shareFlag) {
        var url = "/clientSalesActive/insertHiddenOpportunity.do";
        <c:if test="${mode eq 'upd'}">
            url = "/clientSalesActive/updateHiddenOpportunity.do";
        </c:if>    
        
        $("#hiddenModalAmount").val($("#textModalAmount").val());
        $('#formModalData').ajaxForm({
            url : url,
            async : true,
            data : {
                hiddenActionPlanGridData : '[]', //PC버전과의 호환성을 위해 셋팅.  JSON파싱 오류로 인해 셋팅한 후 넘김. 2017.04.20
                shareFlag : function(){
                    if(shareFlag == 1){
                        return false;
                    }else{
                        return true;
                    }
                    console.log(shareFlag);

                }
            },
            beforeSubmit: function (data,form,option) {
                //if(!list.compareFlag){
                    if(!confirm("저장하시겠습니까?")){
                        return false;
                    }
                //}
            },
            success: function(data){
                console.log(data);
                 if(data.cnt > 0){
                    alert("저장하였습니다.");
                    if(data.returnPK){
                    	$('#hiddenModalPK').val(data.returnPK);
                    }
                }else{
                    alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
                }
            },
            complete: function() {
            	var issueFlag1 = $("input[name=issueFlag]").val();
            	var oppFlag1 = $("input[name=oppFlag]").val();
            	var returnPkValue = $("input[name=hiddenModalContactId]").val();
            	
            	if (issueFlag1 != "true" && oppFlag1 == "true") { // 고객컨택 -> 잠재영업 종료
					location.href = '/clientSalesActive/selectHiddenOpportunityDetail.do?pkNo='+returnPkValue;
				}else if (issueFlag1 == "true" && oppFlag1 =="true") { //둘다 체크
					alert("고객이슈 입력으로 이동합니다.");
					returnFollowUpAction(issueFlag, '/clientSatisfaction/clientIssueInsertForm.do');
				}else{
					//잠재영업기회 단일 등록
					location.href = '/clientSalesActive/selectHiddenOpportunityDetail.do?pkNo='+$('#hiddenModalPK').val();
				}
            },
            error: function(){
                //에러발생을 위한 code페이지
                alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
            }   
        });  
        
        $('#formModalData').submit();
    }
    
    function returnFollowUpAction(contactPK, url) {
    	$("#formFollow #contactPK").val(contactPK);
    	
    	$("#formFollow #returnContactId").val($("#formModalData #hiddenModalContactId").val());
        $("#formFollow #returnCompanyId").val($("#formModalData #hiddenModalCompanyId").val());
        $("#formFollow #returnCompanyName").val($("#formModalData #textCommonSearchCompany").val());
        $("#formFollow #returnCustomerName").val($("#formModalData #textModalCustomerName").val());
        $("#formFollow #returnCustomerId").val($("#formModalData #hiddenModalCustomerId").val());
        $("#formFollow #returnCustomerRank").val($("#formModalData #textModalCustomerRank").val());
        
        $("#formFollow").attr("action",url);
        $("#formFollow").submit();
    }
    
    function updateDetail(_pkNo) {
        console.log(_pkNo);

        //상세정보를 가져와서 수정정보에 셋팅
        $.ajax({
            url : "/clientSalesActive/selectHiddenOpportunityDetail.do",
            async : false,
            datatype : 'json',
            mtype: 'POST',
            data : {
                pkNo : _pkNo,
                datatype : "jsonview"
            },
            beforeSend : function(){
            },
            success : function(data){
                console.log(data);
                var rowData = data.detail;
                var fileList = data.fileList;
                
                $("#hiddenModalPK").val(rowData.OPPORTUNITY_HIDDEN_ID);
                
                $("#textModalSubject").val(rowData.SUBJECT);
                //$("#divModalNameAndCreateDate").html("작성자 : "+rowData.HAN_NAME+"/ 작성일 : "+rowData.SYS_REGISTER_DATE);
                
                $("#textCommonSearchCompany").val(rowData.COMPANY_NAME);
                $("#textCommonSearchCompanyId").val(rowData.COMPANY_ID);
                $("#hiddenModalCompanyId").val(rowData.COMPANY_ID);
                $("#textModalCustomerName").val(rowData.CUSTOMER_NAME);
                $("#textModalCustomerRank").val(rowData.CUSTOMER_POSITION);
                $("#hiddenModalCustomerId").val(rowData.CUSTOMER_ID);
                $("#selectModalCategory").val(rowData.CATEGORY);
                $("#textModalOppOwner").val(rowData.SALESMAN_NAME);
                $("#textModalDivision").val(rowData.SALESMAN_DIVISION);
                $("#hiddenModalSalesId").val(rowData.SALESMAN_ID);
                $("#hiddenModalContactId").val(rowData.EVENT_ID);
                //$("#textModalAmount").val(String(rowData.OPPORTUNITY_AMOUNT).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
                $("#textModalAmount").val(rowData.OPPORTUNITY_AMOUNT);
                $("#textModalSalesChangeDate").val(rowData.SALES_CHANGE_DATE);
                $('[name="divRelation"]').show();
                $('#divModalResult').html('');
                
                if(!isEmpty(rowData.OPPORTUNITY_ID)){
                    $('#divModalResult').append('<a href="javascript:void(0);" class="oppStatusColor oppStatusColor-complete" onClick="goOpportunity('+rowData.OPPORTUNITY_HIDDEN_ID+','+rowData.OPPORTUNITY_ID+');">전환완료</a>');
                    $('#hiddenRelationOpportunityId').val(rowData.OPPORTUNITY_ID);
                }else{
                    $('#divModalResult').append('<a href="javascript:void(0);" class="oppStatusColor oppStatusColor" onClick="goOpportunity('+rowData.OPPORTUNITY_HIDDEN_ID+',\'\');">전환하기</a>');
                    $('#hiddenRelationOpportunityId').val(null);
                }
                
                //고객컨택 연동
                $("#relationContact").html("");
                if(!isEmpty(rowData.EVENT_ID)){
                    $("#relationContact").html('<a href="/clientSalesActive/viewClientContactList.do?event_id='+rowData.EVENT_ID+'" target="_new" class="oppStatusColor oppStatusColor-complete">바로가기</a>');
                }else{
                    $("#relationContact").html('-');
                }
                
                
                $("#textareaModalDetail").val(rowData.DETAIL_CONENTS);
                
                //$("#buttonModalDelete").show();
                
                $("h2.modal-title").html(rowData.SUBJECT);
                //$("small.font-bold").css('display','');
                //$("#buttonModalSubmit").html("저장하기");
                
                //modal.drawHiddenActionPlan();
                //modal.actionPlanReload();
                
                //$("#divModalCoachingTalk").hide(); //코톡 숨기기
                
                //$("#myModal1").modal();
                
                //list.compare_before = $("#formModalData").serialize();
                
                //코톡알림 바로가기시 코톡창 바로 보이게 설정.
                //if(list.coaching_talk == 'Y'){
                //    $("#buttonModalCoachingTalkView").click();
                //}
            },
            complete : function(){
                //$.ajaxLoadingHide();
            }
        });       
    }    

    function goOpportunity(pkNo,opportunity_id){
        if(!isEmpty(opportunity_id)){
            $("#formRedirectOpportunity #opportunity_id").val(opportunity_id);
        }else{
            //상세보기로 gogo.
            $.ajax({
                url : "/clientSalesActive/selectHiddenOpportunityDetail.do",
                async : false,
                datatype : 'json',
                mtype: 'POST',
                data : {
                    pkNo : pkNo,
                    datatype : "jsonView"
                },
                beforeSend : function(){
                    //$.ajaxLoadingShow();
                },
                success : function(data){
                    console.log(data);
                    var rowData = data.detail;
                    
                    $("#formRedirectOpportunity #returnOpportunityhiddenId").val(rowData.OPPORTUNITY_HIDDEN_ID);
                    $("#formRedirectOpportunity #returnCompanyId").val(rowData.COMPANY_ID);
                    $("#formRedirectOpportunity #returnCompanyName").val(rowData.COMPANY_NAME);
                    $("#formRedirectOpportunity #returnCustomerName").val(rowData.CUSTOMER_NAME);
                    $("#formRedirectOpportunity #returnCustomerId").val(rowData.CUSTOMER_ID);
                    $("#formRedirectOpportunity #returnCustomerRank").val(rowData.CUSTOMER_POSITION);
                    $("#formRedirectOpportunity #returnSubject").val(rowData.SUBJECT);
                    $("#formRedirectOpportunity #returnOpportunityamount").val(String(rowData.OPPORTUNITY_AMOUNT).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
                },
                complete : function(){
                    //$.ajaxLoadingHide();
                }
            });
        }
        var frm = document.formRedirectOpportunity; 
        frm.target  = "_new"; 
        frm.action  = "/clientSalesActive/viewOpportunityList.do"; 
        frm.submit();   
    }
    
    
</script>


</body>
</html>