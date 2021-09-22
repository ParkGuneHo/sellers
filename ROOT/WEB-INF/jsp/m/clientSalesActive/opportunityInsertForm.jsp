<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>영업기회</title>

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
        <span>영업기회</span>
    </div>

    <article class="">
        <div class="title_pg ta_c">
            <c:choose>
                <c:when test="${mode eq 'ins'}">
                    <h2 class="modal-title">영업기회 신규등록</h2>
                </c:when>
                <c:otherwise>
                    <h2 class="modal-title">영업기회 수정</h2>
                </c:otherwise>
            </c:choose>
            <a href="javascript:void(0);" class="btn_back" onclick="window.history.back(); return false;">back</a>
        </div>

        <div class="pg_cont pd_t20">
            <form class="form-horizontal" id="formModalData" name="formModalData" method="post" enctype="multipart/form-data">
                <div class="guideBox">모바일에서는 기본정보만 입력이 가능하며, 세부정보는 PC에서 입력해주세요.</div>
    
                <!-- 기본정보 -->
                <div class="cont1 pd_t10">
    
                    <div class="form_input mg_b20">
                        <label class="">제목</label>
                        <input type="text" placeholder="" class="form_control" id="textModalSubject" name="textModalSubject"/>
                    </div>
    
                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">매출처</label>
                            <input type="text" class="form_control" id="textCommonSearchCompany" name="textCommonSearchCompany" placeholder="매출처를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>
    
                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">End User</label>
                            <input type="text" class="form_control" id="textModalCustomerName" name="textModalCustomerName" placeholder="End User를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">계약/매출액</label>
                        <input type="text" class="form_control" id="textModalContractAmount" name="textModalContractAmount"/>
                    </div>
    
                    <!-- <div class="form_input mg_b20">
                        <label class="">예상GP금액</label>
                        <input type="text" class="form_control" id="textModalGPAmount" name="textModalGPAmount"/>
                    </div> -->
    
                    <div class="form_input mg_b20">
                        <label class="">예상계약일</label>
                        <input type="date" class="form_control" id="textModalContractDate" name="textModalContractDate" value=""/>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">Forecast여부</label>
                        <div> <!-- 아래의 항목 체크시 상단 Tab에 해당 메뉴 생성 -->
                            <label for="f_action1" class="mg_r30"><input type="radio" value="In" id="radioModalForecastYN" name="radioModalForecastYN" class="va_m"/><span class="va_m">in</span></label>
                            <label for="f_action2" class=""><input type="radio" value="Out" id="radioModalForecastYN" name="radioModalForecastYN" class="va_m"/><span class="va_m">out</span></label>
                        </div>
                    </div>
    
                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">Exec Owner</label>
                            <input type="text" class="form_control" id="textModalExecOwner" name="textModalExecOwner" placeholder="실행임원을 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>
    
                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">기술대표</label>
                            <input type="text" class="form_control" id="textModalOpportunityOwner" name="textModalOpportunityOwner" placeholder="기술대표를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>
    
                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">영업대표</label>
                            <input type="text" class="form_control" id="textModalOpportunityIdentifier" name="textModalOpportunityIdentifier" placeholder="영업대표를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">상세내용</label>
                        <textarea class="form_control ta_l" row="3" id="textareaModalDetailConents" name="textareaModalDetailConents"></textarea>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">차별화 가치</label>
                        <textarea class="form_control" row="3" id="textareaModalDiscriminateValue" name="textareaModalDiscriminateValue"></textarea>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">ROUTE</label>
                        <input type="text" class="form_control" id="textModalRoute" name="textModalRoute"/>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">파트너사</label>
                        <div class="search_input_after">
                            <a href="#" class="btn_search_pop">파트너사 검색</a>
                            <div class="company-current">
                            </div>
                            <% /* 
                            <div class="result_search">
                                <ul>
                                    <li><span>디유넷</span> <a href="#" class="icon_delete">삭제</a></li>
                                    <li><span>유니포인트</span> <a href="#" class="icon_delete">삭제</a></li>
                                </ul>
                            </div>
                            */ %>
    
                            <!-- 파트너 검색 팝업 -->
                            <div class="search_input_after_pop off">
                                <div class="pop-header">
                                    <a href="" class="close"></a>
                                    <strong class="pop-title">파트너사 선택</strong>
                                </div>
                                <div class="cont">
                                    <div class="form-group">
                                        <div class="">
                                            <div class="sarch_area"><!-- 검색 -->
                                                <input type="text" class="form-control" placeholder="파트너사 검색" class="form-control fl_l mg-r5" id="textCommonSearchPartner">
                                                <a href="#" class="" onClick="commonSearch.partnerInfo();">검색</a>
                                            </div>
                                        </div>
                                        <div class="search_result"><!-- 검색 결과 노출시 "off" 삭제 -->
                                            <strong>[파트너사 검색 결과]</strong>
                                            <% /*
                                            <ul class="result_list">
                                                <li><span>디유넷</span> <a href="#">추가</a></li>
                                                <li><span>유니포인트</span> <a href="#">추가</a></li>
                                            </ul>
                                            */ %>
                                            <ul class="company-list">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    
                    <div class="form_input mg_b20">
                        <label class="">파트너사 역할</label>
                        <textarea class="form_control ta_l" row="3" id="textModalPartnerRole" name="textModalPartnerRole"></textarea>
                    </div>
                    
                    <div class="form_input">
                        <label class="">첨부파일</label>
                        <div class="guideBox">
                            파일 첨부는 PC에서만 가능합니다.
                        </div>
                    </div>
                    
                    <input type="hidden"name="hiddenModalPK" id="hiddenModalPK"/>
                    <input type="hidden"name="hiddenModalOpportunityhiddenId" id="hiddenModalOpportunityhiddenId"/>
                    <input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}"/>
                    <input type="hidden" name="hiddenModalSalesCycle" id="hiddenModalSalesCycle" value="1" />
                    
                    <!-- <input type="hidden" name="hiddenModalSalesPartner" id="hiddenModalSalesPartner"/> -->
                    <input type="hidden" name="hiddenModalContractAmount" id="hiddenModalContractAmount"/>
                    <input type="hidden" name="hiddenModalGPAmount" id="hiddenModalGPAmount"/>
                   
                    <input type="hidden" name="hiddenModalSalesREVArr" id="hiddenModalSalesREVArr"/>
                    <input type="hidden" name="hiddenModalSalesGPArr" id="hiddenModalSalesGPArr"/>
                    <input type="hidden" name="hiddenModalSalesDateArr" id="hiddenModalSalesDateArr"/>
                   
                    <input type="hidden" name="hiddenModalCompanyId" id="hiddenModalCompanyId"/>
                    <input type="hidden" name="hiddenModalPartnerId" id="hiddenModalPartnerId"/>
                   
                    <input type="hidden" name="hiddenModalExecId" id="hiddenModalExecId"/>
                    <input type="hidden" name="hiddenModalOwnerId" id="hiddenModalOwnerId"/>
                    <input type="hidden" name="hiddenModalIdentifierId" id="hiddenModalIdentifierId"/>
                    <input type="hidden" name="hiddenModalCustomerId" id="hiddenModalCustomerId"/>
                    <input type="hidden" name="hiddenModalTempFlag" id="hiddenModalTempFlag" value="N"/>
                    
                </div>
            <!--// 기본정보 -->
             </form>
 
        </div>

        <div class="pg_bottom_func">
            <ul>
                <li><a href="#" class="" id="viewopportunityList"> <img src="${pageContext.request.contextPath}/images/m/icon_list.png" /> <span>목록</span></a></li>
                <li><a href="#" class="" id="insertOpportunity"> <img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /> <span>저장</span></a></li>
            </ul>
        </div>

    </article>   

</div>

<div class="modal_screen"></div>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.js?ver=1.0"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        // 고객컨택내용 목록
        $("#viewopportunityList").on("click", function(e) {
            location.href = '/clientSalesActive/viewOpportunityList.do';
            e.preventDefault();
        });    
        
        // 저장 
        $("#insertOpportunity").on("click", function(e) {
            insertOpportunity();
            e.preventDefault();
        });    
        
        pageInit();
        
        <c:if test="${mode eq 'upd'}">
            updateDetail('${pkNo}');
        </c:if>        
 
    });
    
    // 초기 페이지 구성에 필요한 정보를 세팅한다.
    function pageInit() {
    	validate();
    	
        //자동완성 검색
        commonSearch.member($("#formModalData #textModalExecOwner"), $('#formModalData #hiddenModalExecId')); //실행임원
        commonSearch.member($("#formModalData #textModalOpportunityOwner"), $('#formModalData #hiddenModalOwnerId')); //OO
        commonSearch.member($("#formModalData #textModalOpportunityIdentifier"), $('#formModalData #hiddenModalIdentifierId')); //OI
        
        commonSearch.company($('#formModalData #textCommonSearchCompany'), $('#formModalData #hiddenModalCompanyId'), $('#formModalData #textCommonSearchCompanyId'));
        commonSearch.company($('#formModalData #textModalCustomerName'), $('#formModalData #hiddenModalCustomerId'), $('#formModalData #textCommonSearchCompanyId'));
        
        $("#textCommonSearchPartner").keydown(function (key) {
            if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
                commonSearch.partnerInfo();
             }
         });
        
        $('#textModalContractAmount').keyup(function(){
            //$('tr[name="revTr"]').eq(0).find('input[name="amount_r"]').eq(0).val($(this).val());
            //oppSalesPlan.quarterSum();
            //oppSalesPlan.divisionSum();
        });
        
        //tab menu
        $("ul.tabmenu-type").on({
            'click.modalTab' : function(e){
                e.preventDefault();
                var idx = $("ul.tabmenu-type li a").index($(this));
                $("ul.tabmenu-type li a").removeClass("sel");
                $(this).addClass("sel");
                $("div.modaltabmenu").addClass("off");
                $("div.modaltabmenu").eq(idx).removeClass("off");
            }
        },'li a');
        /* 
        $("ul.tabmenu-type li a").click(function(e){
            e.preventDefault();
            var idx = $("ul.tabmenu-type li a").index($(this));
            $("ul.tabmenu-type li a").removeClass("sel");
            $(this).addClass("sel");
            $("div.modaltabmenu").addClass("off");
            $("div.modaltabmenu").eq(idx).removeClass("off");
        }); */
        
        //유효성 검사
        $("#textModalSubject, #textCommonSearchCompany, #textModalCustomerName, #textModalContractAmount, #textModalGPAmount,  #textModalContractDate, #textModalOpportunityOwner, #textModalOpportunityIdentifier").on("blur",function(e){
            switch (e.target.id) {
                case "textModalOpportunityOwner":
                    $("#formModalData").find("#hiddenModalOwnerId").valid();
                    break;
                case "textModalOpportunityIdentifier":
                    $("#formModalData").find("#hiddenModalIdentifierId").valid();
                    break;
                case "textCommonSearchCompany":
                    $("#formModalData").find("#hiddenModalCompanyId").valid();
                    break;
                case "textModalCustomerName":
                    $("#formModalData").find("#hiddenModalCustomerId").valid();
                    break;
                default:
                    $("#formModalData").find(e.target).valid();
                    break;
            }
        });
    }
        
    function validate () {
        $("#formModalData").validate({ // joinForm에 validate를 적용
            ignore: '', 
            rules : {
                textModalSubject : {
                    required : true,
                    maxlength : 100
                },
                hiddenModalOwnerId : {
                    required : true
                },
                hiddenModalIdentifierId : {
                    required : true
                },
                hiddenModalCompanyId : {
                    required : true,
                },
                hiddenModalCustomerId : {
                    required : true
                },
                textModalContractAmount : {
                    required : true
                },
                textModalGPAmount : {
                    required : true
                },
                textModalContractDate : {
                    required : true
                }
            /*  textModalContractDate : {
                    required : true
                },
                // required는 필수, rangelength는 글자 개수(1~10개 사이)
                textModalContractAmount : {
                    required : true,
                    digits:true
                } */
            //pwdConfirm:{required:true, equalTo:"#pwd"}, 
            // equalTo : id가 pwd인 값과 같아야함
            //name:"required", // 검증값이 하나일 경우 이와 같이도 가능
            //personalNo1:{required:true, minlength:6, digits:true},
            // minlength : 최소 입력 개수, digits: 정수만 입력 가능
            //personalNo2:{required:true, minlength:7, digits:true},
            //email:{required:true, email:true},
            // email 형식 검증
            //blog:{required:true, url:true}
            // url 형식 검증
            },
            messages : { // rules에 해당하는 메시지를 지정하는 속성
                textModalSubject : {
                    required : "제목을 입력하세요.",
                    maxlength:"100글자 이하여야 합니다." 
                },
                hiddenModalOwnerId : {
                    required : "Owner을 입력하세요.",
                },
                hiddenModalIdentifierId : {
                    required : "영업대표를 입력하세요.",
                },
                hiddenModalCompanyId : {
                    required : "매출처를 입력하세요."
                },
                hiddenModalCustomerId : {
                    required : "End User을 입력하세요."
                },
                textModalContractAmount : {
                    required : "계약/매출액을 입력하세요."
                },
                textModalGPAmount : {
                    required : "예상GP금액을 입력하세요."
                },
                textModalContractDate : {
                    required : "계약일를 선택하세요."
                }
            },
            invalidHandler : function(error, element) {
                $('div.modaltabmenu').each(function(idx,obj){
                    $("ul.tabmenu-type li a").eq(idx).trigger('click.modalTab');
                    return false;
                });
            },
            errorPlacement : function(error, element) {
                if($(element).prop("id") == "hiddenModalExecId") {
                    $("#textModalExecOwner").after(error);
                    location.href = "#textModalExecOwner";
                }else if($(element).prop("id") == "hiddenModalOwnerId") {
                    $("#textModalOpportunityOwner").after(error);
                    location.href = "#textModalOpportunityOwner";
                }else if($(element).prop("id") == "hiddenModalIdentifierId") {
                    $("#textModalOpportunityIdentifier").after(error);
                    location.href = "#textModalOpportunityIdentifier";
                }else if($(element).prop("id") == "hiddenModalCompanyId") {
                    $("#textCommonSearchCompany").after(error);
                    location.href = "#textCommonSearchCompany";
                }else if($(element).prop("id") == "hiddenModalCustomerId") {
                    $("#textModalCustomerName").after(error);
                    location.href = "#textModalCustomerName";
                }else{
                    error.insertAfter(element); // default error placement.
                }
            }
        });        
    }    
    
    
    
    function insertOpportunity() {
        var url = "/clientSalesActive/insertOpportunity.do";
        <c:if test="${mode eq 'upd'}">
            url = "/clientSalesActive/updateOpportunity.do";
        </c:if>
        
        //예상계약금액, 예상GP금액
        $("#hiddenModalContractAmount").val($("#textModalContractAmount").val());
        $("#hiddenModalGPAmount").val($("#textModalGPAmount").val());
        
        $('#formModalData').ajaxForm({
            url : url,
            async : true,
            data : {
            	//PC버전과의 호환성을 위해 셋팅.  JSON파싱 오류로 인해 셋팅한 후 넘김.
            	mileStoneData : '[]',
	   			//checkMasterList : JSON.stringify(ockListMaster),
	   			//checkSubList : JSON.stringify(ockListSub),
	   			scCheckList : '[]',
	   			winMasterList : '[]',
	   			winSubList : '[]',
	   			productSalesData : '[]',
	   			productPsData : '[]',
	   			salesPlanData : '[]',
	   			salesSplitData : '[]',
	   			fileData : '[]'
            },
            beforeSubmit: function (data,form,option) {
                if(!confirm("저장하시겠습니까?")) return false;
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success: function(data){
                console.log(data);
                if(data.cnt > 0){
                    alert("저장하였습니다.");
                    //$('#contactPK').val(data.returnPK);
                    //console.log($('#contactPK').val());
                    window.location.href = "/clientSalesActive/viewOpportunityList.do";
                } else {
                    alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
                }
                 
            },
            complete: function() {
            },
            error: function(){
                //에러발생을 위한 code페이지
                alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
            }   
        });
        $('#formModalData').submit();
    }
    
    
    function updateDetail(_pkNo) {
        console.log("this is update detail.");
        console.log(_pkNo);

        //상세정보를 가져와서 수정정보에 셋팅
        $.ajax({
            url : "/clientSalesActive/selectOpportunityDetail.do",
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
                
                // gridClientIndividualInfo << 이거랑 같이 쓰고 있는거 같아서 일단 안바꾸고 위의 URL로 가져왔습니다.
                var rowData = data.detail;
                var fileList = data.fileList;
                
                //초기화
                $("#formModalData").validate().resetForm();
                
                $("#hiddenModalPK").val(rowData.OPPORTUNITY_ID);
                $("#textModalSubject").val(rowData.SUBJECT);
                //$("#divModalNameAndCreateDate").html("작성자 : "+rowData.HAN_NAME+"/ 작성일 : "+rowData.SYS_REGISTER_DATE);
                
                //코칭톡 버튼 show
                $("#buttonModalCoachingTalkView").show();
                
                if(isEmpty(rowData.FORECAST_YN)){
                    $("input:radio[name='radioModalForecastYN']").prop("checked",false);
                }else{
                    $("input:radio[name='radioModalForecastYN']:radio[value='"+rowData.FORECAST_YN+"']").prop("checked",true);  
                }
                
                //실행임원
                $("#textModalExecOwner").val(rowData.EXEC_NAME);
                $("#hiddenModalExecId").val(rowData.EXEC_ID);
                
                //기술대표
                $("#textModalOpportunityOwner").val(rowData.OWNER_NAME);
                $("#hiddenModalOwnerId").val(rowData.OWNER_ID);
                
                //영업대표
                $("#textModalOpportunityIdentifier").val(rowData.IDENTIFIER_NAME);
                $("#hiddenModalIdentifierId").val(rowData.IDENTIFIER_ID);
                
                //고객
                $("#textModalCustomerName").val(rowData.CUSTOMER_NAME);
                $("#textModalCustomerRank").val(rowData.CUSTOMER_POSITION);
                $("#hiddenModalCustomerId").val(rowData.CUSTOMER_ID);
                
                //고객사
                $("#textCommonSearchCompany").val(rowData.COMPANY_NAME);
                $("#textCommonSearchCompanyId").val(rowData.COMPANY_ID);
                $("#hiddenModalCompanyId").val(rowData.COMPANY_ID);
                
                //예상계약금액
                if(!isEmpty(rowData.CONTRACT_AMOUNT)){
                    $("#textModalContractAmount").val((rowData.CONTRACT_AMOUNT).toString());
                }else{
                    $("#textModalContractAmount").val(0);
                }
                if(!isEmpty(rowData.GP_AMOUNT)){
                    $("#textModalGPAmount").val((rowData.GP_AMOUNT).toString()); 
                }else{
                    $("#textModalGPAmount").val(0); 
                }
                
                $("#textModalContractDate").val(rowData.CONTRACT_DATE);
                
                $("#textModalPartnerRole").val(rowData.PARTNER_ROLE);
                $("#selectModalContractTerm").val(rowData.CONTRACT_TERM);
                $("#textModalRoute").val(rowData.ROUTE);
                $("#textareaModalDetailConents").val(rowData.DETAIL_CONENTS);
                $("#textareaModalDiscriminateValue").val(rowData.DISCRIMINATE_VALUE);
                
                $("ul.company-list").html("");
                $("#textCommonSearchPartner").val("");
                commonSearch.partnerArray = [];
                commonSearch.partnerSelect(rowData.SALES_PARTNER);
                
                //파일
                /*
                commonFile.reset();
                if(!isEmpty(fileList)){
                    $("#divFileUploadList span").remove();
                    for(var i=0; i<fileList.length; i++){
                        $("#divFileUploadList").append('<span style="padding-left:5px;"><a href="/common/downloadFile.do?fileId='+fileList[i].FILE_ID+'&fileTableName=6"><i class="fa fa-file-'+commonCheckExtension(fileList[i].FILE_TYPE)+'-o fa-lg"></i> '+fileList[i].FILE_NAME+'</a> <a href="javascript:void(0);" onClick="modal.deleteFile('+fileList[i].FILE_ID+');"><i class="fa fa-times-circle"></i></a></span>');
                    }
                }else{
                    $("#divFileUploadList").html('<span class="blank-ment">선택된 파일이 없습니다</span>');
                }
                */
                
                $("h2.modal-title").html(rowData.SUBJECT);
                
            },
            complete : function(){
            }
        });
        
    }    
    
</script>
</body>
</html>