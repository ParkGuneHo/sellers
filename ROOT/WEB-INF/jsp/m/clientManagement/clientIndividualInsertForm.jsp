<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>
<c:choose><c:when test="${mode eq 'ins'}">고객사개인 추가</c:when><c:otherwise>고객사개인 수정페이지</c:otherwise></c:choose>
</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">

</head>

<body class="white_bg" onload="tabmenuLiWidth();">

<div class="container_pg">

    <jsp:include page="../templates/header.jsp" flush="true"/>

    <!-- location -->
    <div class="location">
        <a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <a href="">고객관리</a> 
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <span>고객개인정보</span>
    </div>

    <article class="">
        <div class="title_pg ta_c">
            <c:choose>
                <c:when test="${mode eq 'ins'}">
                    <h2>고객 신규 등록</h2>
                </c:when>
                <c:otherwise>
                    <h2 id="updateTitle">${detail.CUSTOMER_NAME} <span class="fs12">${detail.POSITION}</span></h2>
                </c:otherwise>
            </c:choose>
            <a href="javascript:void(0);" class="btn_back" onClick="window.history.back(); return false;">back</a>
        </div>

        <div class="author" id="updateAuthor">
            <span>이기섭(2016-08-10)</span>
        </div>        

        <div class="mg_l10 mg_r10">
            <ul class="tabmenu tabmenu_type2 mg_b20">
                <li><a href="#" id="tab_1" onclick="fncSelectTab('1'); return false;" class="active">기본정보</a></li>
                <li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">개인정보</a></li>
            </ul>

            <form class="form-horizontal mg_l10 mg_r10" id="formModalData" name="formModalData" method="post" enctype="multipart/form-data">

                <div class="cont1 pd_b20 "><!-- 기본정보  -->
                    <div class="form_input mg_b20">
                        <label class="">고객명</label>
                        <input type="text" class="form_control" id="textModalClientName" name="textModalClientName"/>
                    </div>
                    
                    
                    <!-- 김동용 -->
	                    <div class="form_input mg_b20">
                    <label class="">명함/사진</label></br>
	                    	<!-- <div class="nameCardBox"> -->
							<label for="fileModalUploadNameCard" class="fileUpload btn btn-gray" style="border-radius:7px;">명함첨부 및 촬영</label>
							
							<div class="filebox photo">
								<input type="file" id="fileModalUploadNameCard" name="fileModalUploadNameCard" capture="camera" accept="image/*" onchange="getThumbnailPrivew2(this,$('#divModalUploadNameCard'))" />
							</div>
							<div id="divModalUploadNameCard">
							<c:choose>
				                <c:when test="${mode eq 'ins'}">
									<img id="imgModalInsertNameCard" src="../../../images/m/namecard_default.png">
                				</c:when>
                			</c:choose>
							</div>
	                    </div>
	                    
	                    <div class="form_input mg_b20">
							<!-- <div class="photoBox"> -->					
							<label for="fileModalUploadPhoto" class="fileUpload btn btn-gray" style="border-radius:7px;">사진첨부 및 촬영</label>
							
							<div class="filebox photo">
								<input type="file" id="fileModalUploadPhoto" name="fileModalUploadPhoto" capture="camera" accept="image/*" onchange="getThumbnailPrivew(this,$('#divModalUploadPhoto'))" />
							</div>
							<div id="divModalUploadPhoto">
								<c:choose>
				                	<c:when test="${mode eq 'ins'}">
										<img id="imgModalInsertPhoto" src="../../../images/m/photo_default.png">
                					</c:when>
                				</c:choose>
							</div>
						</div>


                    <div class="form_input mg_b20">
                        <label class="">직급</label>
                        <input type="text" class="form_control" id="textModalPosition" name="textModalPosition"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">휴대전화</label>
                        <input type="text" placeholder="예) 01012345678" class="form_control" id="textModalCellPhone" name="textModalCellPhone"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">직장전화</label>
                        <input type="text" placeholder="예) 01012345678" class="form_control" id="textModalPhone" name="textModalPhone"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">전자메일</label>
                        <input type="text" class="form_control" id="textModalEmail" name="textModalEmail"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">재직여부</label>
                        <div>
                            <label for="f_action1" class="mg_r30"><input type="radio" class="va_m" value="Y" name="radioModalUseYN" checked/><span class="va_m">재직</span></label>
                            <label for="f_action2" class=""><input type="radio" class="va_m" value="N" id="radioModalUseYN" name="radioModalUseYN"/><span class="va_m">퇴사</span></label>
                        </div>
                    </div>

                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">고객사</label>
                            <input type="text" class="form_control" id="textCommonSearchCompany" name="textCommonSearchCompany" placeholder="고객사를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>
                    
                    <div class="form_input mg_b20">
                        <label class="">소속사ID</label>
                        <input type="text" class="form_control" id="textCommonSearchCompanyId" name="textCommonSearchCompanyId" readOnly/>
                    </div>
                    

                    <div class="form_input mg_b20">
                        <label class="">소속본부</label>
                        <input type="text" placeholder="" class="form_control" id="textModalDivision" name="textModalDivision"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">소속부서</label>
                        <input type="text" placeholder="" class="form_control" id="textModalPost" name="textModalPost"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">소속팀</label>
                        <input type="text" placeholder="" class="form_control" id="textModalTeam" name="textModalTeam"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">직책</label>
                        <input type="text" placeholder="" class="form_control" id="textModalPositionDuty" name="textModalPositionDuty"/>
                    </div>

                  <div class="h_line pd_t10"></div>
                    <div class="form_input mg_b20">
                        <label class="">보고라인</label>
                        
                        <div class="form_input mg_b20">
                            <span class="">소속팀</span>
                            	<div class=" col-sm-4 pos-rel">
                                <input type="text" class="form_control" placeholder="고객명 입력" id="textModalReportingLineTeamName" name="textModalReportingLineTeamName" autocomplete="off"/>
                                
                            	<input type="hidden" id="textModalReportingTeamResult" name="textModalReportingTeamResult" readOnly/>
                            </div>
                            </div>
                        <div class="form_input mg_b20">
                            <span class="">소속부서</span>
                            	<div class=" col-sm-4 pos-rel">
                                <input type="text" class="form_control" placeholder="고객명 입력" id="textModalReportingLinePostName" name="textModalReportingLinePostName" autocomplete="off"/>
                            </div>
                            	<input type="hidden" id="textModalReportingPostResult" name="textModalReportingPostResult" readOnly/>
                            
                        </div>
                        <div class="form_input mg_b20">
                            <span class="">소속본부</span>
                            <div class=" col-sm-4 pos-rel">
                                <input type="text" class="form_control" placeholder="고객명 입력" id="textModalReportingLineDivisionName" name="textModalReportingLineDivisionName" autocomplete="off"/>
                            </div>
                            	<input type="hidden" id="textModalReportingDivisionResult" name="textModalReportingDivisionResult" readOnly/>
                            
                        </div>
                    </div>

                    <div class="h_line pd_t10"></div>

                    <div class="form_input mg_b20">
                        <label class="">담당업무</label>
                        <input type="text" placeholder="" class="form_control" id="textModalDuty" name="textModalDuty"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">직장주소</label>
                        <input type="text" placeholder="" class="form_control" id="textModalAddress" name="textModalAddress"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">자사와의 관계</label>
                        <input type="text" placeholder="" class="form_control" id="textModalRelationshipInfo" name="textModalRelationshipInfo"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label>관계수립</label>
                        <select class="form_control" id="selectModalRelation" name="selectModalRelation">
                            <option value="green" selected="selected">YES</option>
                            <option value="red">NO</option>
                        </select>
                    </div>                    
                    
                    <div class="form_input mg_b20">
                        <label>호감도</label>
                        <select class="form_control" id="selectModalLikeAbility" name="selectModalLikeAbility">
                            <option value="green" selected="selected">Positive</option>
                            <option value="orange">Neutral</option>
                            <option value="red">Negative</option>
                            <option value="gray">None</option>
                        </select>
                    </div>                    
                    

                    <div class="form_input mg_b20">
                        <label class="">사내친한직원</label>
                        <input type="text" placeholder="" class="form_control" id="textModalFriendshipInfo" name="textModalFriendshipInfo"/>
                    </div>

                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">책임자</label>
                            <input type="text" class="form_control"  id="textModalDirectorName" name="textModalDirectorName"  placeholder="책임자를 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">정보출처</label>
                        <input type="text" placeholder="" class="form_control" id="textModalPerSonalInfoSource" name="textModalPerSonalInfoSource"/>
                    </div>

                    <div class="form_input mg_b20">
                        <div class="pos-rel">
                            <label class="">이전영업사원</label>
                            <input type="text" class="form_control" id="textModalPerSonalPrevSales" name="textModalPerSonalPrevSales"  placeholder="이전영업사원을 검색해 주세요." autocomplete="off"/>
                        </div>
                    </div>

                    <div class="h_line pd_t10"></div>

                    <% /****************** PC버전에서 조직도 등록 오류가 나서 주석으로 막음  filePK가 null값이 넘어가서 오류 남. 
                    <div class="form_input mg_b20">
                        <label class="">명함</label>
                        <input type="file" name="fileModalUploadPhoto" id="fileModalUploadPhoto" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#divModalUploadPhoto'))" />
                        <!-- <a href="" class="btn lg btn-gray ds_b r5 ta_c">사진첨부 및 촬영</a>--> <!-- 사진첨부 또는 촬영사진 첨부 --> 
                        <div class="photo_input" id="divModalUploadPhoto">
                            <img id="imgModalInsertPhoto" src="${pageContext.request.contextPath}/images/m/namecard.png" alt="샘플사진" />
                        </div>
                    </div>
                    ******************************/ %>
                    
                </div>

                <div class="cont2 pd_b20 off"><!-- 개인정보  -->

                    <div class="form_input mg_b20">
                        <label class="">학력</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalEducation" name="textModalPerSonalEducation"></textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">학력관련인맥</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalEducationPerson" name="textModalPerSonalEducationPerson"></textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">경력</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalCareer" name="textModalPerSonalCareer"></textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">경력관련인맥</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalCareerPerson" name="textModalPerSonalCareerPerson"></textarea>
                    </div>
                    

                    <div class="form_input mg_b20">
                        <label class="">사회활동</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalActs" name="textModalPerSonalActs"></textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">가족</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalFamily" name="textModalPerSonalFamily"></textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">성향</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalInclination" name="textModalPerSonalInclination"></textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">친한 사람</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalFamiliars" name="textModalPerSonalFamiliars"></textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">SNS</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalSNS" name="textModalPerSonalSNS"></textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">기타</label>
                        <textarea class="form_control" row="3" id="textModalPerSonalETC" name="textModalPerSonalETC"></textarea>
                    </div>
                </div>
                    
                <input type="hidden" name="hiddenModalPK"        id="hiddenModalPK"        value=""/>
                <input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}"/>
                <input type="hidden" name="hiddenModalCompanyId" id="hiddenModalCompanyId"/>
                <input type="hidden" name="hiddenModalDirectorId" id="hiddenModalDirectorId"/>
                <input type="hidden" name="hiddenModalPrevSalesMemberId" id="hiddenModalPrevSalesMemberId"/>
            </form>

        </div>

        <div class="pg_bottom_func">
            <ul>
                <li><a href="#" class="" id="clientIndividualList"> <img src="${pageContext.request.contextPath}/images/m/icon_list.png" /> <span>목록</span></a></li>
                <li><a href="#" class="" id="insertClientIndividual"> <img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /> <span>저장</span></a></li>
            </ul>
        </div>
    </article>

    <jsp:include page="../templates/footer.jsp" flush="true"/>
</div>

<div class="modal_screen"></div>

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

    $(document).ready(function(e){
        // 고객 조회 페이지 이동
        $("#clientIndividualList").on("click", function(e) {
            location.href = '/clientManagement/viewClientIndividualInfoGate.do';
            e.preventDefault();
        });    
        
        // 저장 
        $("#insertClientIndividual").on("click", function(e) {
            insertClientIndividual();
            e.preventDefault();
        }); 
        
        // 신규등록시  초기세팅
        <c:if test="${mode ne 'upd'}">
            init();
        </c:if> 
        
        validate();
        
        //자동완성 검색
        commonSearch.company($("#formModalData #textCommonSearchCompany"), $('#formModalData #hiddenModalCompanyId'), $('#formModalData #textCommonSearchCompanyId'));
        commonSearch.customer($("#formModalData #textModalReportingLineDivisionName"), $('#formModalData #textModalReportingDivisionResult'), $("#formModalData #textModalReportingDivisionPosition"), $("#formModalData #textCommonSearchCompanyId"));
        commonSearch.customer($("#formModalData #textModalReportingLinePostName"), $('#formModalData #textModalReportingPostResult'), $("#formModalData #textModalReportingPostPosition"), $("#formModalData #textCommonSearchCompanyId"));
        commonSearch.customer($("#formModalData #textModalReportingLineTeamName"), $('#formModalData #textModalReportingTeamResult'), $("#formModalData #textModalReportingTeamPosition"), $("#formModalData #textCommonSearchCompanyId"));
        commonSearch.member($("#formModalData #textModalDirectorName"), $("#hiddenModalDirectorId"));
        commonSearch.member($("#formModalData #textModalPerSonalPrevSales"), $("#hiddenModalPrevSalesMemberId"));
        
        <c:if test="${mode eq 'upd'}">
           updateDetail('${pkNo}');
        </c:if> 
    });
    
    
    function insertClientIndividual() {
    	var browser = getIEVersionCheck();
        var url = "/clientManagement/insertClientIndividualInfo.do";
        <c:if test="${mode eq 'upd'}">
            url = "/clientManagement/updateClientIndividualInfo.do";
        </c:if>  
        
        $('#formModalData').ajaxForm({
            url : url,
            type: "POST", 
            async : false,
            data : {
                datatype : 'json',
                browser : browser
            },
            beforeSubmit: function (data,form,option) {
                console.log();
                if(!confirm("저장하시겠습니까?"))  {
                    return false;
                }
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success: function(data){
                console.log(data);
                //성공후 서버에서 받은 데이터 처리
                if(data.cnt > 0){
                    compareFlag = false;
                    alert("저장하였습니다.");
                   /*  window.location.href ="/clientManagement/viewClientIndividualInfoGate.do"; */
                    window.location.href ="javascript:history.back();";
                }else if(data.error == 'sequence'){
                    alert("시퀀스에러.\n관리자에게 문의하세요.");
                }else{
                    alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
                }
            },
            complete: function() {
            } 
        });   
         
        $('#formModalData').submit();
    }
    
    
    // 수정하기 위한 고객사 데이터 셋팅
    function updateDetail(_pkNo) {
        var params = $.param({
            datatype : 'json',
            jsp : '/clientManagement/clientCompanyInfoTabAjax'
        });
        
        $.ajax({
            url : "/clientManagement/selectCustomerInfo.do",
            datatype : 'json',
            data : {
                "customerId" : _pkNo,
                "datatype" : "json"
            },
            cache : false,
            method : 'POST',
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                var clientInfo = data.defaultInfo[0];
//                console.log(clientInfo);
                
                //김동용	명함/사진 수정
                var Card = data.defaultPhoto;
                var path = data.imagePath;
                
                //명함
                var CardURL = Card[0].FILE_PATH + Card[0].FILE_NAME ;
                	console.log(Card[0].FILE_PATH.length);
                	
                                               
                var image = document.createElement("img");
                var imageparent = document.getElementById("divModalUploadNameCard");
                image.src = "/" + CardURL;
                imageparent.appendChild(image);
                                
                if(Card[0].FILE_PATH.length > 0){  
                	$("#divModalUploadNameCard").attr("src", image.src);    
				} else {
					//기본사진
					$("#divModalUploadNameCard").html("<img src='../../../images/m/namecard_default.png'/>");
				}

                
                //사진
                var photoURL =  Card[1].FILE_PATH + Card[1].FILE_NAME ;
            	console.log(Card[1].FILE_PATH.length);

                var image1 = document.createElement("img");
                var imageparent1 = document.getElementById("divModalUploadPhoto");
                image1.src = "/" + photoURL;
                imageparent1.appendChild(image1);
                
                if(Card[1].FILE_PATH.length > 0){
                    $("#divModalUploadPhoto").attr("src", image1.src);    
				} else {
					//기본명함
                    $("#divModalUploadPhoto").html("<img src='../../../images/m/photo_default.png'/>");    
				}
                
                                
                $("#updateTitle").html(clientInfo.CUSTOMER_NAME + " <span class='fs12'>" + clientInfo.POSITION + "</span>");
                //$("#updateAuthor").html(clientInfo.HAN_NAME + " / " + clientInfo.SYS_UPDATE_DATE); 
                $("#updateAuthor").html(clientInfo.HAN_NAME);
                
                $("#textModalClientName").val(clientInfo.CUSTOMER_NAME);
                $("#textModalPosition").val(clientInfo.POSITION);
                $("#textModalCellPhone").val(clientInfo.CELL_PHONE);
                $("#textModalPhone").val(clientInfo.PHONE);
                $("#textModalEmail").val(clientInfo.EMAIL);
                $('input:radio[name=radioModalUseYN]:input[value=' + clientInfo.USE_YN + ']').attr("checked", true);
                $("#textCommonSearchCompany").val(clientInfo.COMPANY_NAME);
                $("#textCommonSearchCompanyId").val(clientInfo.COMPANY_ID);
                $("#textModalDivision").val(clientInfo.DIVISION);
                $("#textModalPost").val(clientInfo.POST);
                $("#textModalTeam").val(clientInfo.TEAM);
                $("#textModalPositionDuty").val(clientInfo.POSITION_DUTY);
                $("#textModalReportingLineTeamName").val(clientInfo.DIVISION_NAME);
                $("#textModalReportingTeamResult").val(clientInfo.DIVISION_ID);
                $("#textModalReportingLinePostName").val(clientInfo.POST_NAME);
                $("#textModalReportingPostResult").val(clientInfo.POST_ID);
                $("#textModalReportingLineDivisionName").val(clientInfo.TEAM_NAME);
                $("#textModalReportingDivisionResult").val(clientInfo.TEAM_ID);
                $("#textModalDuty").val(clientInfo.DUTY);
                $("#textModalAddress").val(clientInfo.ADDRESS);
                $("#textModalRelationshipInfo").val(clientInfo.PINFO_RELATIONSHIP);
                $("#selectModalRelation").val(clientInfo.RELATION).attr("selected", "selected");
                $("#selectModalLikeAbility").val(clientInfo.LIKEABILITY).attr("selected", "selected");
                $("#textModalFriendshipInfo").val(clientInfo.FRIENDSHIP_INFO);
                $("#textModalDirectorName").val(clientInfo.DIRECTOR_NAME);
                $("#textModalPerSonalInfoSource").val(clientInfo.INFO_SOURCE);
                $("#textModalPerSonalPrevSales").val(clientInfo.PREV_SALES_HAN_NAME);
                $("#textModalPerSonalEducation").val(clientInfo.PINFO_EDUCATION);
                $("#textModalPerSonalEducationPerson").val(clientInfo.PINFO_EDUCATION_PERSON);
                $("#textModalPerSonalCareer").val(clientInfo.PINFO_CAREER);
                $("#textModalPerSonalCareerPerson").val(clientInfo.PINFO_CAREER_PERSON);
                $("#textModalPerSonalActs").val(clientInfo.PINFO_SOCIAL_ACTS);
                $("#textModalPerSonalFamily").val(clientInfo.PINFO_FAMILY);
                $("#textModalPerSonalInclination").val(clientInfo.PINFO_INCLINATION);
                $("#textModalPerSonalFamiliars").val(clientInfo.PINFO_FAMILIARS);
                $("#textModalPerSonalSNS").val(clientInfo.PINFO_SNS);
                $("#textModalPerSonalETC").val(clientInfo.PINFO_ETC);

                $("#hiddenModalPK").val(clientInfo.CUSTOMER_ID);
                $("#hiddenModalCompanyId").val(clientInfo.COMPANY_ID);
                $("#hiddenModalPrevSalesMemberId").val(clientInfo.PREV_SALES_MEMBER_ID);
            },
            complete : function(){
            }
        });
    }    
    
    function init() {
        //$('#formModalData').validate().resetForm(); 
        $("#formModalData #hiddenModalPK").val("");
    }
    
    function validate() {
        $("#formModalData").validate({ // joinForm에 validate를 적용
            ignore: "",
            rules : {
                textModalClientName : {
                    required : true,
                    maxlength : 40
                },
                hiddenModalCompanyId : {
                    required : true
                }
            },
            messages : { // rules에 해당하는 메시지를 지정하는 속성
                textModalClientName : {
                    required : "고객개인명을 입력하세요."
                },
                hiddenModalCompanyId : {
                    required : "고객사를 입력하세요." // 이와 같이 규칙이름과 메시지를 작성
                }
            },
            invalidHandler : function(error, element) {
                $('div.modaltabmenu').each(function(idx,obj){
                    $("ul.tabmenu-type li a").eq(idx).trigger('click.modalTab');
                    return false;
                });
            },
            errorPlacement : function(error, element) {
                if($(element).prop("id") == "hiddenModalCompanyId") {
                    $("#textCommonSearchCompany").after(error);
                    location.href = "#textCommonSearchCompany";
                }
                else {
                    error.insertAfter(element); // default error placement.
                }
            }
        })        
    }
    
    // 파일 첨부시 해당 파일 썸네일을 보여주는 함수. //김동용
    function getThumbnailPrivew(html, $target) {
        if (html.files && html.files[0]) {
            var reader = new FileReader();
            console.log(reader);
            console.log(html.files[0]);
            reader.onload = function (e) {
            	//김동용
                $("#divModalUploadPhoto").html('<img id="imgModalInsertPhoto" border="0" alt="" src='+ e.target.result + ' no-repeat center center; background-size:cover;" />'); 
                //$("#imgModalInsertPhoto").attr("src", e.target.result);
            }
            reader.readAsDataURL(html.files[0]);
        }
    }
    
    //김동용
    function getThumbnailPrivew2(html, $target) {
        if (html.files && html.files[0]) {
            var reader = new FileReader();
            console.log(reader);
            console.log(html.files[0]);
            reader.onload = function (e) {
            	//김동용
                $("#divModalUploadNameCard").html('<img id="imgModalInsertNameCard" border="0" alt="" src='+ e.target.result + ' no-repeat center center; background-size:cover;" />'); 
                //$("#imgModalInsertNameCard").attr("src", e.target.result);
            }
            reader.readAsDataURL(html.files[0]);
        }
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

    
</script>
</body>
<!-- 김동용  -->
<style>
.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    width:50;
    max-width:100%;
}
 
.filebox input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}
</style>
</html>