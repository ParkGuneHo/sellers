<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>
<%
String req_params = getReqParams(request, "mode", "companyId", "customerId", "hiddenModalPK", "salesStatus");
request.setAttribute("req_params", req_params);

//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
//int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
String todayDate = sdf.format(todayCal.getTime());
%>
    <article class="">

        <div class="title_pg ta_c">
            <h2>${defaultInfo[0].PARTNER_PERSONAL_NAME} <span class="fs12">${defaultInfo[0].POSITION}</span></h2>
            <a href="javascript:void(0);" class="btn_back" onclick="window.history.back();">back</a>
        </div>

        <div class="author">
            <span>${userInfo.HAN_NAME}(<%=todayDate%>)</span>
        </div>

        <ul class="tabmenu tabmenu_type2 mg_b20">
            <li><a href="#" id="tab1" class="active">기본정보</a></li>
            <li><a href="#" id="tab2">소속사정보</a></li>
        </ul>

        <form id="formModalData" name="formModalData" method="post" enctype="multipart/form-data" class="form-horizontal">
        <input type="hidden" id="mode" name="mode" value="${map.mode}" />
        
        <div class="pg_cont pd_t10">

                <!-- 위의 탭 클릭시 아래의 cont1, cont2가  하나씩 보여지도록 해주세요 -->

                <div class="cont1" id="formTab1"><!-- 기본정보 -->

                    <div class="form_input mg_b20">
                        <label class="">파트너사직원명</label>
                        <input type="text" name="textModalPartnerName" id="textModalPartnerName" value="${defaultInfo[0].PARTNER_PERSONAL_NAME}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">직급</label>
                        <input type="text" name="textModalPosition" id="textModalPosition" value="${defaultInfo[0].POSITION}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">휴대전화 (ex:01012345678)</label>
                        <input type="text" name="textModalCellPhone" id="textModalCellPhone" value="${defaultInfo[0].CELL_PHONE}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">직장전화 (ex:0212345678)</label>
                        <input type="text" name="textModalPhone" id="textModalPhone" value="${defaultInfo[0].PHONE}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">이메일</label>
                        <input type="text" name="textModalEmail" id="textModalEmail" value="${defaultInfo[0].EMAIL}" placeholder="" class="form_control" />
                    </div>

<%--
                    <div class="h_line pd_t10"></div>

                    <div class="form_input mg_b20">
                        <label class="">개인정보</label>
                        <textarea name="textModalPerSonalInfo" id="textModalPerSonalInfo" class="form_control" row="3">${defaultInfo[0].PERSONALINFO}</textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">명함첨부</label>
 
                        <a href="#" id="photo_upload" class="btn lg btn-gray ds_b r5 ta_c">명함 첨부</a> <!-- 사진첨부 또는 촬영사진 첨부 -->

<input type="file" name="fileModalUploadPhoto" id="fileModalUploadPhoto" accept="image/*"
capture="camera" onchange="getThumbnailPrivew(this,$('#divModalUploadPhoto'))" style="display:none" />

                        <div class="photo_input" id="divModalUploadPhoto">
<c:if test="${defaultPhoto[0].FILE_NAME ne null && defaultPhoto[0].FILE_NAME ne ''}"> 
                            <img src="/uploads/${defaultPhoto[0].FILE_PATH}${defaultPhoto[0].FILE_NAME}" alt="명함 사진" />
</c:if>
                        </div>
                    </div>
 --%>
 
                </div>

                <div class="cont2 off" id="formTab2" style="display:none"><!-- 소속사정보 -->

                    <div class="form_input mg_b20">
                        <label for="textCommonSearchCompany" class="">파트너사</label>
                        <input type="text" name="textCommonSearchCompany" id="textCommonSearchCompany" value="${defaultInfo[0].COMPANY_NAME}" placeholder="" class="form_control" autocomplete="off" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">파트너사ID</label>
                        <input type="number" name="textCommonSearchCompanyId" id="textCommonSearchCompanyId" value="${defaultInfo[0].PARTNER_ID}" placeholder="" class="form_control" readonly="true" style="background-color:#eee; opacity:1"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">소속본부</label>
                        <input type="text" name="textModalDivision" id="textModalDivision" value="${defaultInfo[0].DIVISION}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">소속부서</label>
                        <input type="text" name="textModalPost" id="textModalPost" value="${defaultInfo[0].POST}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">소속팀</label>
                        <input type="text" name="textModalTeam" id="textModalTeam" value="${defaultInfo[0].TEAM}" placeholder="" class="form_control" />
                    </div>
                    
                    <div class="form_input mg_b20">
                        <label class="">직책</label>
                        <input type="text" name="textModalPositionDuty" id="textModalPositionDuty" value="${defaultInfo[0].POSITION_DUTY}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">담당업무</label>
                        <input type="text" name="textModalDuty" id="textModalDuty" value="${defaultInfo[0].DUTY}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">친한고객사</label>
                        <input type="text" name="textModalFriendShipCompany" id="textModalFriendShipCompany" value="${defaultInfo[0].FRIENDSHIP_COMPANY}" placeholder="" class="form_control" />
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">친한고객</label>
                        <input type="text" name="textModalFriendShipCustomer" id="textModalFriendShipCustomer" placeholder="${defaultInfo[0].FRIENDSHIP_CUSTOMER}" class="form_control" />
                    </div>
 
                    <div class="form_input mg_b20">
                        <label class="">개인정보</label>
                        <textarea name="textModalPerSonalInfo" id="textModalPerSonalInfo" class="form_control" row="3">${defaultInfo[0].PERSONAL_INFO}</textarea>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">명함첨부</label>
 
                        <a href="#" id="photo_upload" class="btn lg btn-gray ds_b r5 ta_c">명함 첨부</a> <!-- 사진첨부 또는 촬영사진 첨부 -->

<input type="file" name="fileModalUploadPhoto" id="fileModalUploadPhoto" accept="image/*"
capture="camera" onchange="getThumbnailPrivew(this,'divModalUploadPhoto');" style="display:none" />

                        <div class="photo_input" id="divModalUploadPhoto">
<c:if test="${defaultPhoto[0].FILE_NAME ne null && defaultPhoto[0].FILE_NAME ne ''}"> 
                            <img src="/uploads/${defaultPhoto[0].FILE_PATH}${defaultPhoto[0].FILE_NAME}" alt="명함 사진" />
</c:if>
                        </div>
                    </div>
 
                </div>

        </div>
        
        
        
		<input type="hidden" name="hiddenModalPK" id="hiddenModalPK" value="${defaultInfo[0].PARTNER_INDIVIDUAL_ID}" />
		<input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}" />
		<input type="hidden" name="hiddenModalCompanyId" id="hiddenModalCompanyId" value="${defaultInfo[0].PARTNER_ID}" />
		<input type="hidden" name="hiddenModalPrevSalesMemberId" id="hiddenModalPrevSalesMemberId" />
		<input type="hidden" name="textModalSkillType" id="textModalSkillType" value="none" />
		<input type="hidden" name="radioModalUseYN" id="radioModalUseYN" value="Y" />
		<input type="hidden" name="hiddenModalPartnerId" id="hiddenModalPartnerId" value="${defaultInfo[0].PARTNER_ID}" />
		<input type="hidden" name="hiddenModalPartnerId" id="hiddenModalPartnerId" value="${defaultInfo[0].PARTNER_ID}" />
        </form>

        <div class="pg_bottom_func">
            <ul>
                <li><a href="/partnerManagement/viewPartnerIndividualInfoGate.do<c:if test="${req_params ne ''}">?${req_params}</c:if>" class=""> <img src="../../../images/m/icon_list.png" /> <span>목록</span></a></li>
                <li><a href="#" id="btn_submit" class=""> <img src="../../../images/m/icon_edit.png" /> <span>저장</span></a></li>
            </ul>
        </div>

    </article>    

<STYLE TYPE="text/css" media="all">
.ui-autocomplete { 
    position: absolute; 
    cursor: default; 
    height: 200px; 
    overflow-y: scroll; 
    overflow-x: hidden;}
</STYLE>

<!-- Mainly scripts -->
	<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/m/jquery.form.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/m/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.js?ver=1.0"></script>
	<script src="${pageContext.request.contextPath}/js/m/common.js"></script>
	
<script type="text/javascript">

var commSearch = {
	//파트너사 자동완성 검색
	partner : function(obj,hiddenObj,obj_id){
		obj.autoComplete({
			minChars: 2,
			cache: 0,
			emptyMsg : "파트너",
			emptyUrl : "/partnerManagement/listPartnerCompanyGate.do?modalReset=1",
			source: function(term, response){
				$.ajax({
					url: "/common/searchPartnerInfo.do",
					dataType: "json",
					data: {
						companyName: term
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader("AJAX", true);
					},
					success: function( data ) {
						//alert("data : " + data);
						response( 
								$.map(data.list, function( item ) {
									console.log(item.PARTNER_PERSONAL_NAME);
									alert("item.COMPANY_NAME : " + item.COMPANY_NAME);
									return {
										label: item.COMPANY_NAME,
										value: item.PARTNER_ID
									}
								})
						);	
					},
					complete : function() {

					}
				});
			},
			onSelect : function(e, term, item){
				hiddenObj.val($(item).attr("hidden-data"));
				//partner사 ID
				obj_id.val($(item).attr("hidden-data"));
				//유효성검사
		    	hiddenObj.valid();
			}
		}).keyup(function(key){
			//backspace or delete
			if(key.keyCode == 46 || key.keyCode == 8){
				if((obj.val()).trim() == "" || obj.val() == null){
					hiddenObj.val("");
					obj_id.val("");
					hiddenObj.valid();
				}
			}
		});
	}
}


	
jQuery(document).ready(function($){
	//자동완성 검색
	//commSearch.partner($("#formModalData #textCommonSearchCompany"), $('#formModalData #hiddenModalCompanyId'), $("#formModalData #textCommonSearchCompanyId"));
	
	$("#textCommonSearchCompany").autocomplete({
		width: 300,
		max: 10,
		delay: 100,
		minLength: 2,
		autoFocus: true,
		cacheLength: 1,
		scroll: true,
		highlight: false,
		source: function(request, response) {

			$.ajax({
				url: "/common/searchPartnerInfo.do",
				dataType: "json",
				data: {
					companyName: request.term
				},
				beforeSend : function(xhr){
					xhr.setRequestHeader("AJAX", true);
				},
				success: function( data, textStatus, jqXHR ) {
					//alert("data : " + data);
					//response(data.list);

					response( 
							$.map(data.list, function( item ) {
								//console.log(item.PARTNER_PERSONAL_NAME);
								//alert("item.COMPANY_NAME : " + item.COMPANY_NAME)
								return {
									label: item.COMPANY_NAME,
									value: item.PARTNER_ID
								}
							})
					);

				},
				/*
				complete : function() {
				},
				*/
				error: function(jqXHR, textStatus, errorThrown){
					//console.log( textStatus);
					alert(textStatus);
				}
			});
		},
		select: function(event, ui) {
			event.preventDefault();
			$("input#hiddenModalCompanyId").val(ui.item.value);
			$("input#textCommonSearchCompany").val(ui.item.label);
			$("input#textCommonSearchCompanyId").val(ui.item.value);
			
			//$("input#hiddenModalPartnerId").val(ui.item.value);
			//alert(ui.item.value);
		},
		focus : function(event, ui) {
			event.preventDefault();
			//$("input#textCommonSearchCompany").val(ui.item.label);
		}
		/*
		,
		close : function(event, ui) {
			event.preventDefault();
			$("#textModalDivision").focus();
			
		}
		*/
	});
	
	$('#tab1').click(function(){
		$('#formTab1').show();
		$('#formTab2').hide();
		
		$('#tab1').addClass("active");
		$('#tab2').removeClass();
	});
	
	$('#tab2').click(function(){
		$('#formTab1').hide();
		$('#formTab2').show();
		
		$('#tab1').removeClass();
		$('#tab2').addClass("active");
	});
	
	$('#photo_upload').click(function(event){
		event.preventDefault();
		$("#fileModalUploadPhoto").click();
	});
	
	$('#btn_submit').click(function(event){
		var browser = getIEVersionCheck();
		//alert($("#fileModalUploadPhoto").val());

		var url;
		/*
		if(comparePerSonalProfile == $("#divPersonalInfoProfile").html())$("#textModalPerSonalProfile").val("");
		if(comparePerSonalActs == $("#divPersonalInfoSocialAtcs").html())$("#textModalPerSonalActs").val("");
		if(comparePerSonalFamily == $("#divPersonalInfoFamily").html())$("#textModalPerSonalFamily").val("");
		if(comparePerSonalInclination == $("#divPersonalInfoInclination").html())$("#textModalPerSonalInclination").val("");
		if(comparePerSonalFamiliars == $("#divPersonalInfoFamiliars").html())$("#textModalPerSonalFamiliars").val("");
		if(comparePerSonalSNS == $("#divPersonalInfoSNS").html())$("#textModalPerSonalSNS").val("");
		if(comparePerSonalETC == $("#divPersonalInfoETC").html())$("#textModalPerSonalETC").val("");
		
		(modalFlag == "ins") ? url = "/partnerManagement/insertPartnerIndividualInfo.do" : url = "/partnerManagement/updatePartnerIndividualInfo.do";
		*/
		
		var modalFlag = $("#mode").val();
		
		url = (modalFlag == "upd")?"/partnerManagement/updatePartnerIndividualInfo.do":"/partnerManagement/insertPartnerIndividualInfo.do";
		
		//유효성 체크
		//파트너사직원명 유효성 체크
		if(!$('#textModalPartnerName ').val()) {
			alert("파트너사직원명을 입력하세요!");
			$('#textModalPartnerName ').focus();
			return false;
		}
		//직급 유효성 체크
		if(!$('#textModalPosition').val()) {
			alert("직급을 입력하세요!");
			$('#textModalPosition').focus();
			return false;
		}
		//휴대전화 유효성 체크
		if(!$('#textModalCellPhone').val()){
			alert("휴대전화를 입력해주세요!");
			$('#textModalCellPhone').focus();
			return false;
		}
		//직장전화 유효성 체크
		if(!$('#textModalPhone').val()) {
			alert("직장전화를 입력해주세요!");
			$('#textModalPhone').focus();
			return false;
		}
		//이메일 유효성 체크
		if(!$('#textModalEmail').val()){
			alert("이메일을 입력해주세요!");
			$('#textModalEmail').focus();
			return false;
		}
		
		//소속사정보 탭 포커싱 속성
		function formtab2(){
			$('#formTab1').hide();
			$('#formTab2').show();
			$('#tab1').removeClass();
			$('#tab2').addClass("active");
		}
		
		//파트너사 유효성 체크
		if(!$('#textCommonSearchCompany').val()){
			alert("파트너사를 검색해주세요!");
			formtab2();
			$('#textCommonSearchCompany').focus();
			
			return false;
		}
		
		//소속본부 유효성 체크
		if(!$('#textModalDivision').val()){
			alert("소속본부를 입력해주세요!");
			formtab2();
			$('#textModalDivision').focus();
			
			return false;
		}
		
		//소속부서 유효성 체크
		if(!$('#textModalPost').val()){
			alert("소속부서를 입력해주세요!");
			formtab2();
			$('#textModalPost').focus();
			
			return false;
		}
		
		//소속팀 유효성 체크
		if(!$('#textModalTeam').val()){
			alert("소속팀을 입력해주세요!");
			formtab2();
			$('#textModalTeam').focus();
			
			return false;
		}
		
		//직책 유효성 체크
		if(!$('#textModalPositionDuty').val()){
			alert("직책을 입력해주세요!");
			formtab2();
			$('#textModalPositionDuty').focus();
			
			return false;
		}
		
		//담당업무 유효성 체크
		if(!$('#textModalDuty').val()){
			alert("담당업무를 입력해주세요!");
			formtab2();
			$('#textModalDuty').focus();
			
			return false;
		}
		
		//친한고객사 유효성 체크
		if(!$('#textModalFriendShipCompany').val()){
			alert("친한고객사를 입력해주세요!");
			formtab2();
			$('#textModalFriendShipCompany').focus();
			
			return false;
		}
		
		//친한고객 유효성 체크
		if(!$('#textModalFriendShipCustomer').val()){
			alert("친한고객을 입력해주세요!");
			formtab2();
			$('#textModalFriendShipCustomer').focus();
			
			return false;
		}
		
		//개인정보 유효성 체크
		if(!$('#textModalPerSonalInfo').val()){
			alert("개인정보를 입력해주세요!");
			formtab2();
			$('#textModalPerSonalInfo').focus();
			
			return false;
		}
		
		$('#formModalData').ajaxForm({
    		url : url,
    		async : false,
			beforeSubmit: function (data,form,option) {
				/*
				if(!compareFlag){
					if(!confirm("저장하시겠습니까?")) return false;
					salesDetail.selectVendor(lastEditRowQ);
				}
				*/
				
				if(!confirm("저장하시겠습니까?")) return false;
				$.ajaxLoadingShow();
			},
			data : {
				datatype : 'json',
				browser:browser
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
			},
			success: function(data){
				//성공후 서버에서 받은 데이터 처리
				if(data.cnt > 0){
					/*
					if(modalFlag == "upd") {
						salesDetail.insertQualification();
					}
					compare_before = $("#formModalData").serialize();
					compareFlag = false;
					*/
					alert("저장하였습니다.");
					if(modalFlag == "upd") {
						window.location.href = "/partnerManagement/viewPartnerIndividualInfoGate.do<c:if test="${req_params ne ''}">?${req_params}</c:if>";
					}
					else {
						window.location.href = "/partnerManagement/viewPartnerIndividualInfoGate.do<c:if test="${req_params ne ''}">?${req_params}</c:if>";
					}
					/*
					if(modalFlag == "upd") {
						clientSerchList.get(1, 20);
						clientList.goDetail($("#hiddenPartnerIndividualId").val(), $("#hiddenModalCompanyId").val());
					}else {
						searchDetailClick.goDetail(data.filePK, $("#hiddenModalCompanyId").val(), $("#textModalPartnerName").val());
					}

					if(modalFlag=="upd"){
						$("#divModalPhotoUploadArea .fileModalUploadPhoto").remove();
						$('#divFileUploadList').html('<span>파일을 선택해 주세요.</span>');
						$("#divModalFile > span").remove();
					}else if(modalFlag=="ins"){
						$('#myModal1').modal("hide");
					}
					*/
				}else{
					alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
				}
			},
			error : function(xhr, status, code){
				alert("[에러]\ncode:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			},
			complete : function(){
				$.ajaxLoadingHide();
			}
		});
		
		$('#formModalData').submit();
		 
	});

});

function getThumbnailPrivew(html, el_id) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            //$target.css('display', '');
            document.getElementById(el_id).style.display = "";
            /* console.log($target);
            console.log(html);
            console.log(html.files);
            console.log(e.target.result);
            console.log(html.files[0]);
            console.log(); */
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            
            //$('#divModalUploadPhoto span').hide();
            //$target.html('<img class="photo" id="imgModalInsertPhoto" border="0" alt="" style="background:url('+ e.target.result + ') no-repeat center center; background-size:cover;" />');
            
            //$('#divModalUploadPhoto').html();
            //$target.html('<img src="'+ e.target.result + '" alt="명함 사진" />');
            document.getElementById(el_id).innerHTML = '<img src="'+ e.target.result + '" alt="명함 사진" />'; 
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>

<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>