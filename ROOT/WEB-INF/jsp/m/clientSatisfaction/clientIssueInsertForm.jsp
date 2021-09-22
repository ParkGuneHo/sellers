<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
    <title>고객이슈 등록</title>
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
        <a href="">고객만족</a> 
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <span>고객이슈</span>
    </div>

    <article class="">
        <div class="title_pg ta_c">
            <h2>이슈등록</h2>
            <a href="javascript:void(0);" class="btn_back" onClick="window.history.back(); return false;">back</a>
        </div>

        <div class="pg_cont pd_t20">

            <form method="post" class="form-horizontal" id="formModalData" name="formModalData" method="post" enctype="multipart/form-data">

                <div class="cont1 pd_b20 "><!-- 이슈기본정보  -->

                    <div class="form_input mg_b20">
                        <label class="">이슈제목</label>
                        <input type="text" class="form_control" id="textModalSubject" name="textModalSubject"/>
                    </div>

                    <div class="form_input mg_b20 off">
                        <div class="pos-rel">
                            <label>고객사</label>
                            <input type="text" class="form_control" id="textCommonSearchCompany" name="textCommonSearchCompany" placeholder="고객사를 검색해 주세요." value="${param.returnCompanyName}" autocomplete="off"/>
                        </div>
                    </div>                

                    <div class="form_input mg_b20 off">
                        <label class="">고객사ID</label>
                        <input type="text" class="form_control" id="textCommonSearchCompanyId" name="textCommonSearchCompanyId" value="${param.returnCompanyId}" readOnly/>
                    </div>

                    <div class="form-group">
                                   		<label class="col-sm-2 control-label"><i class="fa fa-check" style="color: green;"></i>고객명</label>
	                                     <div class="col-md-9 col-lg-10">
                                              <ul id="ulMultipleClient" class="flexdatalist-multiple" style="border: 1px solid rgb(204, 204, 204); border-radius: 4px; background-color: rgb(255, 255, 255);">
                                                  <li class="input-container flexdatalist-multiple-value pos-rel" id="liMultipleClient" name="liMultipleClient">
                                                      <input type="text" class="form-control" id="textMultipleClient" name="textMultipleClient" placeholder="고객명을 검색해 주세요." autocomplete="off"/>
                                                      <div class="autocomplete-suggestions "></div>
                                                  </li>
                                              </ul>                                                            
                                          </div>
                                   </div>

                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label>영업대표</label>
                            <input type="text" class="form_control" id="textModalSalesRepresentive" name="textModalSalesRepresentive" placeholder="영업대표를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>

                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label>이슈해결책임자</label>
                            <input type="text" placeholder="" class="form_control" id="textModalSolveOwner" name="textModalSolveOwner" placeholder="이슈해결책임자를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>

                    <div class="form_input mg_b20">
                        <label>이슈영역</label>
                        <select class="form_control" id="selectModalIssueCategory" name="selectModalIssueCategory">
                            <option value="">== 선택 ==</option>
                            <option value="제품">제품</option>
                            <option value="서비스">서비스</option>
                            <option value="지원">지원</option>
                        </select>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">이슈내용</label>
                        <textarea class="form_control" row="3" id="textareaModalIssueDetail" name="textareaModalIssueDetail"></textarea>
                    </div>                   

                    <div class="form_input mg_b20">
                        <label>이슈발생일</label>
                        <input type="date" class="form_control" id="textModalIssueDate" name="textModalIssueDate"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label>해결목표일</label>
                        <input type="date" class="form_control" id="textModalDueDate" name="textModalDueDate"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label>이슈해결일</label>
                        <input type="date" class="form_control" id="textModalIssueCloseDate" name="textModalIssueCloseDate"/>
                    </div>

                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label>이슈해결확인자</label>
                            <input type="text" placeholder="" class="form_control" id="textModalIssueConfirmId" name="textModalIssueConfirmId" placeholder="이슈해결확인자를 검색해 주세요." autocomplete="off"/>
                        </div>
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

                    <div class="form_input">
                        <label class="">기타</label>
                        <div class="guideBox">
                            이슈해결계획과 파일첨부는 PC에서만 가능합니다.
                        </div>
                    </div>

                </div>

                <input type="hidden"name="hiddenModalPK"            id="hiddenModalPK"      value=""/>
                <input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}"/>
                <input type="hidden" name="hiddenModalCompanyId" id="hiddenModalCompanyId" value="<%-- ${param.returnCompanyId} --%>"/>
                <input type="hidden" name="hiddenModalCustomerId" id="hiddenModalCustomerId" value="${param.returnCustomerId}"/>
                <input type="hidden" name="hiddenModalSalesId" id="hiddenModalSalesId"/>
                <input type="hidden" name="hiddenModalSolveOwnerId" id="hiddenModalSolveOwnerId"/>
                <input type="hidden" name="hiddenModalIssueConfirmId" id="hiddenModalIssueConfirmId"/>
                <input type="hidden" name="hiddenModalContactId" id="hiddenModalContactId" value="${param.hiddenModalContactId}" />
                <input type="hidden" name="hiddenModalMemberList" id="hiddenModalMemberList"/>
                <input type="hidden" name="hiddenModalHanName" id="hiddenModalHanName" value="${userInfo.HAN_NAME}"/>
                <input type="hidden" name="hiddenModalEmail" id="hiddenModalEmail" value="${userInfo.EMAIL}"/>
                
                <!-- 고객 만족도 -->
                <input type="hidden" name="hiddenCsatDetailId" id="hiddenCsatDetailId" value="${param.hiddenCsatDetailId}"/> 
                <input type="hidden" name="hiddenCsatDetailCompanyName" id="hiddenCsatDetailCompanyName" value="${param.hiddenCsatDetailCompanyName}"/> 
                <input type="hidden" name="hiddenCsatDetailCompanyId" id="hiddenCsatDetailCompanyId" value="${param.hiddenCsatDetailCompanyId}"/> 
                <input type="hidden" name="hiddenCsatDetailSubject" id="hiddenCsatDetailSubject" value="${param.hiddenCsatDetailSubject}"/> 
                <input type="hidden" name="hiddenCsatDetailCustomerName" id="hiddenCsatDetailCustomerName" value="${param.hiddenCsatDetailCustomerName}"/>
                <input type="hidden" name="hiddenCsatDetailCustomerRank" id="hiddenCsatDetailCustomerRank" value="${param.hiddenCsatDetailCustomerRank}"/> 
                <input type="hidden" name="hiddenCsatDetailCustomerId" id="hiddenCsatDetailCustomerId" value="${param.hiddenCsatDetailCustomerId}"/>
                <input type="hidden" name="hiddenSelectIssueId" id="hiddenSelectIssueId" value="${param.csat_id}"/> 
                <input type="hidden" name="hiddenSelectIssueStatus" id="hiddenSelectIssueStatus" value="${param.issue_status}"/> 
            </form>

        </div>

        <div class="pg_bottom_func len3">
            <ul>
                <li><a href="#" class="" id="viewClientIssueList"> <img src="${pageContext.request.contextPath}/images/m/icon_list.png" /> <span>목록</span></a></li>
                <li><a href="#" class="" id="insertClientIssue"> <img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /> <span>저장</span></a></li>
                <li><a href="#" class="" id="sharedClientIssue"> <img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /> <span>저장 및 공유</span></a></li>
            </ul>
        </div>

    </article>   

</div>

<% /*
<div class="modalpop r5">
    <div class="pop_header">
        <h3 class="pop_title">고객사 검색</h3>
        <!-- <a href="#" class="btn_pop_close">닫기</a> -->
    </div>
    <div class="pop_cont">
        <div class="search_input mg_r15 mg_l15 mg_b20">
            <input type="text" placeholder="고객사명을 입력해주세요" class="form_control" />
            <a href="#" class="btn btn-primary pd_l15 pd_r15">검색</a>
        </div>

        <div class="list_result">
            <ul>
                <li>
                    <label for="list1">
                        <span>삼성증권</span>
                        <input type="radio"  id="list1" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list2">
                        <span>삼성증권</span>
                        <input type="radio"  id="list2" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list3">
                        <span>삼성증권</span>
                        <input type="radio"  id="list3" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list4">
                        <span>삼성증권</span>
                        <input type="radio"  id="list4" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list5">
                        <span>삼성증권</span>
                        <input type="radio"  id="list5" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list6">
                        <span>삼성증권</span>
                        <input type="radio"  id="list6" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list7">
                        <span>삼성증권</span>
                        <input type="radio"  id="list7" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list8">
                        <span>삼성증권</span>
                        <input type="radio"  id="list8" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list9">
                        <span>삼성증권</span>
                        <input type="radio"  id="list9" name="customlist"/>
                    </label>
                </li>
                <li>
                    <label for="list10">
                        <span>삼성증권</span>
                        <input type="radio"  id="list10" name="customlist"/>
                    </label>
                </li>
            </ul>
        </div>
    </div>
    <div class="pop_footer">
        <a href="#" class="btn btn-default r5 pd_l20 pd_r20 mg_r10 btn_modal_close">취소</a>
        <a href="#" class="btn btn-primary r5 pd_l20 pd_r20">추가</a>
    </div>
</div>
<div class="modal_screen"></div>
*/
%>


<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.js?ver=1.1"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        // 고객컨택내용 목록
        $("#viewClientIssueList").on("click", function(e) {
            location.href = '/clientSatisfaction/viewClientIssueList.do';
            e.preventDefault();
        });    

        // 저장 
        $("#insertClientIssue").on("click", function(e) {
            insertClientIssue(1);
            e.preventDefault();
        });          
 
        // 저장 및 공유
        $("#sharedClientIssue").on("click", function(e) {
            insertClientIssue(2);
            e.preventDefault();
        });  
        
        // 메일공유 직원 검색
        $("#member_search").on("click", function(e) {
            commonSearch.multipleMemberPop();
            e.preventDefault();
        });  

        pageInit(); // 페이지 초기화 구성
       
        <c:if test="${mode eq 'upd'}">
            updateDetail('${pkNo}');
        </c:if>
    });
    
    // 초기 페이지 구성에 필요한 정보를 세팅한다.
    function pageInit() {
        //유효성 체크
        validate();

        //자동완성 검색
        
        commonSearch.multipleMultipleClient($("#formModalData #textMultipleClient"), $('#formModalData #hiddenModalCustomerId'), $('#formModalData #liMultipleClient'));
        commonSearch.company($('#formModalData #textCommonSearchCompany'), $('#formModalData #hiddenModalCompanyId'), $('#formModalData #textCommonSearchCompanyId'));
        commonSearch.member($('#formModalData #textModalSalesRepresentive'), $('#formModalData #hiddenModalSalesId'));
        commonSearch.member($('#formModalData #textModalSolveOwner'), $('#formModalData #hiddenModalSolveOwnerId'));
        commonSearch.member($('#formModalData #textModalIssueConfirmId'), $('#formModalData #hiddenModalIssueConfirmId'));
        
        //직원 검색
        $('#textCommonSearchMember').on('keydown',function(key){
            if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
                commonSearch.multipleMemberPop();
             }
        });
    }
    
    
    function validate() {
        $("#formModalData").validate({ // joinForm에 validate를 적용
            ignore: "", 
            rules : {
                textModalSubject : {
                    required : true,
                    maxlength : 100
                },
                /* hiddenModalCompanyId : {
                    required : true
                }, */
                hiddenModalCustomerId : {
                    required : true
                    //maxlength : 10
                },
                textModalIssueCreator : {
                    required : true,
                    maxlength : 10
                },
                selectModalIssueCategory : {
                    required : true
                },
                // required는 필수, rangelength는 글자 개수(1~10개 사이)
                textModalIssueDate : {
                    required : true
                },
                textModalDueDate : {
                    required : true
                },
                textareaModalIssueDetail : {
                    minlength : 1,
                    maxlength : 2000
                },
                hiddenModalSolveOwnerId : {
                    required : true,
                    maxlength : 10
                },
                /* textModalIssueCloseDate : {
                    required : true
                }, */
                textareaModalSolvePlan : {
                    minlength : 1,
                    maxlength : 2000
                },
                selectModalSolveEvidenceYN : {
                    required : true
                },
                hiddenModalSalesId : {
                    required : true
                },
                textareaSolveEvidenceDetail : {
                    minlength : 1,
                    maxlength : 2000
                }
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
                    maxlength:"100글자 이하여야 합니다" 
                },
                /* hiddenModalCompanyId : {
                    required : "고객사를 선택하세요."
                }, */
                hiddenModalCustomerId : {
                    required : "고객명을 입력하세요."
                    //maxlength:"10글자 이하여야 합니다"
                },
                textModalIssueCreator : {
                    required : "이슈제기자를 입력하세요.",
                    maxlength:"10글자 이하여야 합니다"
                },
                selectModalIssueCategory : {
                    required : "이슈영역를 선택하세요."
                },
                // required는 필수, rangelength는 글자 개수(1~10개 사이)
                textModalIssueDate : {
                    required : "이슈발생일를 선택하세요."
                },
                textModalDueDate : {
                    required : "해결목표일을 선택하세요."
                },
                textareaModalIssueDetail : {
                    minlength : 1,
                    maxlength : 2000
                },
                hiddenModalSolveOwnerId : {
                    required : "이슈해결책임자를 입력하세요.",
                    maxlength:"10글자 이하여야 합니다"
                },
                /* textModalIssueCloseDate : {
                    required : "이슈해결일를 선택하세요."
                }, */
                textareaModalSolvePlan : {
                    minlength : 1,
                    maxlength : 2000
                },
                selectModalSolveEvidenceYN : {
                    required : "이슈해결 증빙여부를 선택하세요."
                },
                hiddenModalSalesId : {
                    required : "영업대표를 입력하세요."
                },
                textareaSolveEvidenceDetail : {
                    minlength : 1,
                    maxlength : 2000
                }
            },
            errorPlacement : function(error, element) {
                /* if($(element).prop("id") == "hiddenModalCompanyId") {
                    $("#textCommonSearchCompany").after(error);
                    location.href = "#textCommonSearchCompany";
                }else */ if($(element).prop("id") == "hiddenModalCustomerId") {
                    $("#textMultipleClient").after(error);
                    location.href = "#textMultipleClient";
                }else if($(element).prop("id") == "hiddenModalSalesId") {
                    $("#textModalSalesRepresentive").after(error);
                    location.href = "#textModalSalesRepresentive";
                }else if($(element).prop("id") == "hiddenModalSolveOwnerId") {
                    $("#textModalSolveOwner").after(error);
                    location.href = "#textModalSolveOwner";
                }else {
                    error.insertAfter(element); // default error placement.
                }
            }
        });               
    }
    
    function insertClientIssue(shareFlag) {
        var url = "/clientSatisfaction/insertClientIssue.do";
        <c:if test="${mode eq 'upd'}">
            url = "/clientSatisfaction/updateClientIssue.do";
        </c:if>
        
        $('#formModalData').ajaxForm({
            url : url,
            async : true,
            data : {
                issueSolvePlan :'[]', //PC버전과의 호환성을 위해 셋팅.  JSON파싱 오류로 인해 빈값을 전송.
                shareFlag : function(){
                    if(shareFlag == 1){
                        return false;
                    }else{
                        return true;
                    }
                }
            },
            beforeSubmit: function (data,form,option) {
                if($('#textModalIssueDate').val()>$('#textModalDueDate').val()) {
                    alert("이슈발생일이 해결목표일보다 이전입니다."); return false;
                }else if($('#textModalIssueDate').val()>$('#textModalIssueCloseDate').val() && $('#textModalIssueCloseDate').val()!=''){
                    alert("이슈발생일이 이슈해결일보다 이전입니다."); return false;
                }
                if(!confirm("저장하시겠습니까?")) {
                    return false;
                }
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success: function(data){
                console.log(data);
                 if(data.cnt > 0){
                    alert("저장하였습니다.");
                    $('#hiddenModalContactId').val(data.returnPK);
                    <c:if test="${mode eq 'upd'}">
                    	$('#hiddenModalContactId').val($("#hiddenModalPK").val());
                    </c:if>
					console.log($('#hiddenModalContactId').val());
                 }else{
                    alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
                }
                 
            },
            complete: function() {
            	var returnPkValue = $("input[name=hiddenModalContactId]").val();
                location.href= '/clientSatisfaction/selectClientIssueDetail.do?pkNo='+returnPkValue;
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
            url : "/clientSatisfaction/selectClientIssueDetail.do",
            async : false,
            datatype : 'json',
            mtype: 'POST',
            data : {
                pkNo : _pkNo,
                datatype : "jsonview"
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                console.log(data);
                
                var rowData = data.detail;
                var fileList = data.fileList;
                
                $("#hiddenModalPK").val(rowData.ISSUE_ID);
                
                $("#textModalSubject").val(rowData.ISSUE_SUBJECT);
                $("#textModalUpdateDate").val(rowData.SYS_UPDATE_DATE);
                $("#textModalIssueCreator").val(rowData.ISSUE_CREATOR);
                $("#selectModalIssueCategory").val(rowData.ISSUE_CATEGORY);
                
                
                
                if(!isEmpty(rowData.CUSTOMER_ID)){
					var customerIdArr = rowData.CUSTOMER_ID.split(",");
					var customerNameArr = rowData.CUSTOMER_NAME.split(",");
					var companyNameArr = rowData.COMPANY_NAME.split(",");
					var ccList = '';
					$("#hiddenModalCustomerId").val(customerIdArr);
					for(var i=0; i<customerNameArr.length; i++){
						commonSearch.addMultipleClient($('#formModalData #hiddenModalCustomerId'), $('#formModalData #liMultipleClient'), customerIdArr[i], customerNameArr[i], companyNameArr[i]);
						if(i>0) ccList = ccList + ', ';
						ccList = ccList + customerNameArr[i] + '[' + companyNameArr[i] + ']';
					}
					//$("#hiddenModalCcList").val(ccList);
				}
                //$("#textModalCustomerName").val(rowData.CUSTOMER_NAME);
                //$("#hiddenModalCustomerId").val(rowData.CUSTOMER_ID);
                
                $("#textModalSalesRepresentive").val(rowData.SALES_REPRESENTIVE_NAME);
                $("#hiddenModalSalesId").val(rowData.SALES_REPRESENTIVE_ID);
                $("#textCommonSearchCompany").val(rowData.COMPANY_NAME);
                //$("#textCommonSearchCompanyId, #hiddenModalCompanyId").val(rowData.COMPANY_ID);
                $("#textModalIssueDate").val(rowData.ISSUE_DATE);
                $("#textModalDueDate").val(rowData.DUE_DATE);
                $("#textareaModalIssueDetail").text(rowData.ISSUE_DETAIL);
                $("#textModalSolveOwner").val(rowData.SOLVE_OWNER_NAME);
                $("#hiddenModalSolveOwnerId").val(rowData.SOLVE_OWNER);
                $("#textModalIssueCloseDate").val(rowData.ISSUE_CLOSE_DATE);
                $("#textareaModalSolvePlan").text(rowData.SOLVE_PLAN);
                $("#selectModalIssueStatus").val(rowData.ISSUE_STATUS);
                $("#selectModalSolveEvidenceYN").val(rowData.SOLVE_EVIDENCE_YN);
                $("#textareaSolveEvidenceDetail").text(rowData.SOLVE_EVIDENCE_DETAIL);
                $("#textModalIssueConfirmId").val(rowData.CONFIRM_NAME);
                $("#hiddenModalIssueConfirmId").val(rowData.ISSUE_CONFIRM_ID);
                
                //고객컨택 연동
                /*
                $("#relationContact").html("");
                if(!isEmpty(rowData.EVENT_ID)){
                    $("#relationContact").html('<a href="/clientSalesActive/viewClientContactList.do?event_id='+rowData.EVENT_ID+'" target="_new" class="oppStatusColor oppStatusColor-complete">바로가기</a>');
                }else{
                    $("#relationContact").html('-');
                }
                */
                
                //파일
                /*
                if(!isEmpty(fileList)){
                    $("#divFileUploadList span").remove();
                    for(var i=0; i<fileList.length; i++){
                        $("#divFileUploadList").append('<span><a href="/common/downloadFile.do?fileId='+fileList[i].FILE_ID+'&fileTableName=4"><i class="fa fa-file-'+checkExtension(fileList[i].FILE_TYPE)+'-o fa-lg"></i> '+fileList[i].FILE_NAME+'</a> <a href="javascript:void(0);" onClick="modal.deleteFile('+fileList[i].FILE_ID+');"><i class="fa fa-times-circle"></i></a></span>');
                    }
                }else{
                    $("#divFileUploadList").html('<span class="blank-ment">선택된 파일이 없습니다</span>');
                }
                */
                
                
            },
            complete : function(){
            }
        });
        
    }
    

</script>

</body>
</html>