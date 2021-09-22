<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
	<title>고객컨택내용</title>
	<link href="${pageContext.request.contextPath}/css/m/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/font-awesome/m/css/font-awesome.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/m/jqueryui/jquery-ui.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.css" rel="stylesheet">
</head>

<body class="white_bg" onload="tabmenuLiWidth();">

	<div class="container_pg">
		<jsp:include page="../templates/header.jsp" flush="true" />

		<!-- location -->
		<div class="location">
			<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
			<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg" />
			<a href="">고객영업활동</a> 
			<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg" />
			<span>고객컨택내용</span>
		</div>

		<article class="">
			<div class="title_pg mg_b20 ta_c">
				<c:choose>
					<c:when test="${mode eq 'ins'}">
						<h2>고객컨택내용 등록</h2>
					</c:when>
					<c:otherwise>
						<h2>고객컨택내용 수정</h2>
					</c:otherwise>
				</c:choose>
				<a href="javascript:void(0);" class="btn_back" onClick="window.history.back(); return false;">back</a>
			</div>

			<div class="pg_cont pd_t20">
				<form class="form-horizontal" id="formModalData" name="formModalData" method="post" enctype="multipart/form-data">
					<div class="cont1 pd_b20 ">
						<!-- 고객기본정보  -->
						<div class="form_input mg_b20">
							<label class=""><i class="fa fa-check" style="color: green;"></i>컨택 목적</label> 
							<input type="text" placeholder="" class="form_control" id="textModalSubject" name="textModalSubject" />
						</div>
						<div class="form_input mg_b20">
							<label class=""><i class="fa fa-check" style="color: green;"></i>컨택 방법</label>
							<select class="form_control" name="selectModalCategory" id="selectModalCategory">
								<spring:eval expression="@config['code.contactMethod']" />
							</select>
						</div>

						<div class="form_input mg_b20">
							<label class=""><i class="fa fa-check" style="color: green;"></i>컨택 일자</label>
							<input type="date" placeholder="2016-08-10" class="form_control" id="textModalEventDate" name="textModalEventDate" />
						</div>
						
						<div class="form_input mg_b20">
                                   	 	<div class="input-group">
	                                   	 	<select class="form-control" 
                              	 				name="selectModalStartDateTime"
												id="selectModalStartDateTime" onclick=""
												onchange="changeEndDate();">
	                                   	 		<option value="">선택</option>
														<option value="08:00">오전 08:00</option>
														<option value="08:30">오전 08:30</option>
														<option value="09:00">오전 09:00</option>
														<option value="09:30">오전 09:30</option>
														<option value="10:00">오전 10:00</option>
														<option value="10:30">오전 10:30</option>
														<option value="11:00">오전 11:00</option>
														<option value="11:30">오전 11:30</option>
														<option value="12:00">오후 12:00</option>
														<option value="12:30">오후 12:30</option>
														<option value="13:00">오후 01:00</option>
														<option value="13:30">오후 01:30</option>
														<option value="14:00">오후 02:00</option>
														<option value="14:30">오후 02:30</option>
														<option value="15:00">오후 03:00</option>
														<option value="15:30">오후 03:30</option>
														<option value="16:00">오후 04:00</option>
														<option value="16:30">오후 04:30</option>
														<option value="17:00">오후 05:00</option>
														<option value="17:30">오후 05:30</option>
														<option value="18:00">오후 06:00</option>
														<option value="18:30">오후 06:30</option>
														<option value="19:00">오후 07:00</option>
														<option value="19:30">오후 07:30</option>
														<option value="20:00">오후 08:00</option>
														<option value="20:30">오후 08:30</option>
														<option value="21:00">오후 09:00</option>
														<option value="21:30">오후 09:30</option>
														<option value="22:00">오후 10:00</option>
														<option value="22:30">오후 10:30</option>
														<option value="23:00">오후 11:00</option>
														<option value="23:30">오후 11:30</option>
	                                   	 	</select>
	                                      	<span class="input-group-addon">~</span>
	                                      	<select class="form-control" 
	                                      		name="selectModalEndDateTime"
												id="selectModalEndDateTime">
	                                      		<option value="">선택</option>
														<option value="08:00">오전 08:00</option>
														<option value="08:30">오전 08:30</option>
														<option value="09:00">오전 09:00</option>
														<option value="09:30">오전 09:30</option>
														<option value="10:00">오전 10:00</option>
														<option value="10:30">오전 10:30</option>
														<option value="11:00">오전 11:00</option>
														<option value="11:30">오전 11:30</option>
														<option value="12:00">오후 12:00</option>
														<option value="12:30">오후 12:30</option>
														<option value="13:00">오후 01:00</option>
														<option value="13:30">오후 01:30</option>
														<option value="14:00">오후 02:00</option>
														<option value="14:30">오후 02:30</option>
														<option value="15:00">오후 03:00</option>
														<option value="15:30">오후 03:30</option>
														<option value="16:00">오후 04:00</option>
														<option value="16:30">오후 04:30</option>
														<option value="17:00">오후 05:00</option>
														<option value="17:30">오후 05:30</option>
														<option value="18:00">오후 06:00</option>
														<option value="18:30">오후 06:30</option>
														<option value="19:00">오후 07:00</option>
														<option value="19:30">오후 07:30</option>
														<option value="20:00">오후 08:00</option>
														<option value="20:30">오후 08:30</option>
														<option value="21:00">오후 09:00</option>
														<option value="21:30">오후 09:30</option>
														<option value="22:00">오후 10:00</option>
														<option value="22:30">오후 10:30</option>
														<option value="23:00">오후 11:00</option>
														<option value="23:30">오후 11:30</option>
	                                      	</select>
                                      	</div>
                                    </div>
                                    
						<!-- <div class="form_input mg_b20">
							<div class="pos-rel">
								<label>고객사</label>
								<input type="text" placeholder="고객사를 검색해 주세요." class="form_control" id="textCommonSearchCompany" name="textCommonSearchCompany" />
							</div>
						</div> -->

						<!-- <div class="form_input mg_b20">
							<label>고객사ID</label>
							<input type="text" class="form_control" id="textCommonSearchCompanyId" name="textCommonSearchCompanyId" readOnly />
						</div> -->

						<div class="form_input mg_b20">
                       	  <label class=""><i class="fa fa-check" style="color: green;"></i>고객명</label>
                          <div class="">
                                  <ul id="ulMultipleClient" class="flexdatalist-multiple" style="border: 1px solid rgb(204, 204, 204); border-radius: 4px; background-color: rgb(255, 255, 255);">
                                      <li class="input-container flexdatalist-multiple-value pos-rel" id="liMultipleClient" name="liMultipleClient">
                                          <input type="text" class="form-control" id="textMultipleClient" name="textMultipleClient" placeholder="고객명을 검색해 주세요." autocomplete="off"/>
                                          <div class="autocomplete-suggestions "></div>
                                      </li>
                                  </ul>                                                            
                              </div>
                       </div>
                                   

						<!-- <div class="form_input mg_b20">
							<label>고객직급</label> <input type="text" placeholder="부장" class="form_control" id="textModalClientRank" name="textModalClientRank" />
						</div> -->

						<div class="form_input mg_b10">
							<label class="">상세내용</label>
							<textarea class="form_control" row="3" id="textareaModalEventContents" name="textareaModalEventContents"></textarea>
						</div>

						<div class="view_cata_full mg_b20">
							<div class="mg_b10 ta_c">
								추가로 입력할 부분을 선택해주세요.<br /> 저장 후 해당 페이지로 자동 전환됩니다.
							</div>
							<c:choose>
								<c:when test="${mode eq 'ins'}">
									<div class="ta_c">
										<a href="#" class="btn_contact_sel" id="selectSalesOpp">잠재영업기회</a>
										<input type="checkbox" name="checkSalesOpp" style="display: none;" />
										<a href="#" class="btn_contact_sel" id="selectIssue">이슈</a>
										<input type="checkbox" name="checkIssue" style="display: none;" />
										<!-- <a href="#" class="btn_contact_sel active">이슈</a> -->
									</div>
								</c:when>
								<c:otherwise>
									<div class="view_cata_full">
										<div class="ti">
											<span class="bullet dot"></span> 연관 잠재영업기회
										</div>
										<div class="cboth cont_list" id="relationHiddenOpp">
											<a href="#" class="btn_quick">바로가기</a>
										</div>
									</div>
									<div class="view_cata_full">
										<div class="ti">
											<span class="bullet dot"></span> 연관 고객이슈
										</div>
										<div class="cboth cont_list" id="relationClientIssue">
											<a href="#" class="btn_quick">바로가기</a>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="form_input mg_b20">
							<label class="">메일공유</label>
							<div class="search_input_after">
								<a href="#" class="btn_search_pop">직원선택</a>
								<%
									//<div class="result_search" id="result_search_emp">
								%>
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
										<a href="" class="close"></a> <strong class="pop-title">직원
											선택</strong>
									</div>
									<div class="cont">
										<div class="form-group">
											<div class="">
												<div class="sarch_area">
													<!-- 검색 -->
													<input type="text" placeholder="직원 검색" class="form-control"
														id="textCommonSearchMember"> <a href="#" class=""
														id="member_search">검색</a>
												</div>
											</div>
											<div class="search_result">
												<!-- 검색 결과 노출시 "off" 삭제 -->
												<strong>[직원 검색 결과]</strong>
												<%
													// <ul class="result_list">
												%>
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
							<div class="guideBox">Follow-Up-Action과 파일첨부는 PC에서만 가능합니다.
							</div>
						</div>

					</div>
					<input type="hidden" name="hiddenModalPK" id="hiddenModalPK" value="" />
					<input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}" />
					<input type="hidden" name="hiddenModalCompanyId" id="hiddenModalCompanyId" />
					<input type="hidden" name="hiddenModalCustomerId" id="hiddenModalCustomerId" />
					<input type="hidden" name="hiddenModalFollowManagerId" id="hiddenModalFollowManagerId" />
					<input type="hidden" name="hiddenModalMemberList" id="hiddenModalMemberList" />
					<input type="hidden" name="hiddenModalHanName" id="hiddenModalHanName" value="${userInfo.HAN_NAME}" />
					<input type="hidden" name="hiddenModalEmail" id="hiddenModalEmail" value="${userInfo.EMAIL}" />
					<input type="hidden" name="mode" id="mode" value="${mode}" />
					
					<!-- 생산성,일정 관련 데이터 -->
                     <input type="hidden" 	name="hiddenModalCalendarEventId"	id="hiddenModalCalendarEventId"/>
                     <input type="hidden" 	name="hiddenModalBeforeAnalEventTime"	id="hiddenModalBeforeAnalEventTime" value="생산성분석 값 상세보기시 계산 0.5=30분"/>
                     <input type="hidden" 	name="hiddenModalAfterAnalEventTime"	id="hiddenModalAfterAnalEventTime" value="생산성분석 값 저장하기기시 계산 0.5=30분"/>
                     <input type="hidden" 	name="hiddenModalBeforeEventDate"	id="hiddenModalBeforeEventDate" value="수정전 날짜"/>
				</form>

			</div>

			<div class="pg_bottom_func len3">
				<ul>
					<li><a href="#" class="" id="viewClientContactList"> <img
							src="${pageContext.request.contextPath}/images/m/icon_list.png" />
							<span>목록</span></a></li>
					<li><a href="#" class="" id="insertClientContact"> <img
							src="${pageContext.request.contextPath}/images/m/icon_edit.png" />
							<span>저장</span></a></li>
					<li><a href="#" class="" id="sharedClientContact"> <img
							src="${pageContext.request.contextPath}/images/m/icon_edit.png" />
							<span>저장 및 공유</span></a></li>
				</ul>
			</div>
		</article>
	</div>

	<div class="modal_screen"></div>

	<form name="formFollow" id="formFollow" method="post" action="">
		<input type="hidden" name="contactPK" id="contactPK" value="${pkNo}"/>
		<input type="hidden" name="issueFlag" id="issueFlag" />
		<input type="hidden" name="oppFlag" id="oppFlag" />
		<input type="hidden" name="returnCompanyId" id="returnCompanyId" />
		<input type="hidden" name="returnCompanyName" id="returnCompanyName" />
		<input type="hidden" name="returnCustomerName" id="returnCustomerName" />
		<input type="hidden" name="returnCustomerId" id="returnCustomerId" />
		<input type="hidden" name="returnCustomerRank" id="returnCustomerRank" />
	</form>


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
		$(document).ready(function() {
			// 고객컨택내용 목록
			$("#viewClientContactList").on("click", function(e) {
				location.href = '/clientSalesActive/viewClientContactList.do';
				e.preventDefault();
			});

			// 잠재영업기회 선택체크
			$("#selectSalesOpp").on("click", function(e) {
				selectSalesOpp();
				e.preventDefault();
			});

			// 이슈 선택 체크 
			$("#selectIssue").on("click", function(e) {
				selectIssue();
				e.preventDefault();
			});

			// 저장 
			$("#insertClientContact").on("click", function(e) {
				insertClientContact(1);
				e.preventDefault();
			});

			// 저장 및 공유
			$("#sharedClientContact").on("click", function(e) {
				insertClientContact(2);
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
			/* commonSearch.company($('#formModalData #textCommonSearchCompany'),
					$('#formModalData #hiddenModalCompanyId'),
					$('#formModalData #textCommonSearchCompanyId'));
			commonSearch.customer($('#formModalData #textModalCustomerName'),
					$('#formModalData #hiddenModalCustomerId'),
					$('#formModalData #textModalClientRank'),
					$('#formModalData #hiddenModalCompanyId')); */
			commonSearch.multipleMultipleClient($("#formModalData #textMultipleClient"), $('#formModalData #hiddenModalCustomerId'), $('#formModalData #liMultipleClient'));
			commonSearch.member($('#formModalData #textModalFollowUpManager'),
					$('#formModalData #hiddenModalFollowManagerId'));

			//직원 검색
			$('#textCommonSearchMember').on('keydown', function(key) {
				if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
					commonSearch.multipleMemberPop();
				}
			});
			
			//컨택시간
			var date = new Date();
			var hour = date.getHours()>9 ? ''+date.getHours() : '0'+date.getHours();
			var min = date.getMinutes()>9 ? ''+date.getMinutes() : '0'+date.getMinutes();
			if(parseInt(min)==0) {
				$("#selectModalStartDateTime").val(hour+":00");
				hour = (date.getHours()+1)>9 ? ''+(date.getHours()+1) : '0'+(date.getHours()+1);
				$("#selectModalEndDateTime").val(hour+":00");
			}else if(parseInt(min)>0 && parseInt(min)<=30) {
				$("#selectModalStartDateTime").val(hour+":30");
				hour = (date.getHours()+1)>9 ? ''+(date.getHours()+1) : '0'+(date.getHours()+1);
				$("#selectModalEndDateTime").val(hour+":30");
			}else if(parseInt(min)>30) {
				hour = (date.getHours()+1)>9 ? ''+(date.getHours()+1) : '0'+(date.getHours()+1);
				$("#selectModalStartDateTime").val(hour+":00");
				hour = (date.getHours()+2)>9 ? ''+(date.getHours()+2) : '0'+(date.getHours()+2);
				$("#selectModalEndDateTime").val(hour+":00");
			}
		}

		// 잠재영업기회 체크 확인
		function selectSalesOpp() {
			var checkFlag = $("input[name='checkSalesOpp']").prop("checked");
			if (checkFlag) {
				$("input[name='checkSalesOpp']").prop("checked", false);
			} else {
				$("input[name='checkSalesOpp']").prop("checked", true);
			}
		}

		// 이슈 체크 확인
		function selectIssue() {
			var checkFlag = $("input[name='checkIssue']").prop("checked");
			if (checkFlag) {
				$("input[name='checkIssue']").prop("checked", false);
			} else {
				$("input[name='checkIssue']").prop("checked", true);
			}
		}

		function validate() {
			$("#formModalData").validate({ // joinForm에 validate를 적용
				ignore : "",
				rules : {
					textModalSubject : {
						required : true,
						maxlength : 100
					},
					textModalEventDate : {
						required : true,
						maxlength : 10
					},
					selectModalCategory : {
						required : true
					},
					hiddenModalCustomerId : {
						required : true
					},
					selectModalStartDateTime : {
						required : true
					},
					selectModalEndDateTime : {
						required : true
					}
				},
				messages : { // rules에 해당하는 메시지를 지정하는 속성
					textModalSubject : {
						required : "컨택목적을 입력하세요.",
						maxlength : "100글자 이하여야 합니다"
					},
					textModalEventDate : {
						required : "컨택일를 선택해 주세요.",
						maxlength : 10
					},
					selectModalCategory : {
						required : "컨택방법을 선택하세요." // 이와 같이 규칙이름과 메시지를 작성
					},
					hiddenModalCustomerId : {
						required : "고객명을 검색해 주세요."
					},
					selectModalStartDateTime : {
						required : "컨택시작 시간을 선택해 주세요."
					},
					selectModalEndDateTime : {
						required : "컨택종료시간을 선택해 주세요."
					}
				},
				errorPlacement : function(error, element) {
					 if($(element).prop("id") == "hiddenModalCustomerId") {
					        $("#ulMultipleClient").after(error);
					        location.href = "#ulMultipleClient";
					    }else{
					        error.insertAfter(element); // default error placement.
					    }
				}
			})
		}
		

		function insertClientContact(shareFlag) {
			var url = "/clientSalesActive/insertClientContact.do";
			<c:if test="${mode eq 'upd'}">
			url = "/clientSalesActive/updateClientContact.do";
			</c:if>
			var oppFlag = $("input[name='checkSalesOpp']").prop("checked");
			var issueFlag = $("input[name='checkIssue']").prop("checked");
			
			
			timeDifference("#hiddenModalAfterAnalEventTime");
			console.log(oppFlag);
			console.log(issueFlag);
			console.log(shareFlag);
			console.log($('#hiddenModalCustomerId').val());

			$('#formModalData')
					.ajaxForm(
							{
								url : url,
								async : true,
								data : {
									fileData : "[]",
									contactFollowUpAction : "[]", //PC버전과의 호환성을 위해 셋팅.  JSON파싱 오류로 인해 셋팅한 후 넘김. 2017.04.20
									shareFlag : function() {
										if (shareFlag == 1) {
										
											return false;
										} else {
											return true;
										}
									}
								},
								beforeSubmit : function(data, form, option) {
									
									if (!confirm("저장하시겠습니까?")) {
										return false;
									}
									
									/* if (!oppFlag && !issueFlag) { // 셋다 노 체크
										if (!confirm("추가 입력사항이 선택되지 않았습니다.\n그래도 저장하시겠습니까?")) {
											return false;
										}
									} else {
										//if(!list.compareFlag){
										if (!confirm("저장하시겠습니까?")) {
											return false;
										}
										//}
									} */
								},
								success : function(data) {
									console.log(data);
									if (data.cnt > 0) {
										alert("저장하였습니다.");
										if(data.returnPK){
											$('#contactPK').val(data.returnPK);
										}
										console.log($('#contactPK').val());
									} else {
										alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
									}

								},
								complete : function() {
									var returnPkValue = $("input[name=contactPK]").val();
									if (!oppFlag && !issueFlag) { // 둘다 노 체크
										location.href = '/clientSalesActive/selectContactDetail.do?pkNo='+returnPkValue;
									} else if (oppFlag && issueFlag) { //둘다 체크
										alert("잠재영업기회 입력으로 이동합니다.");
										returnFollowUpAction(oppFlag, issueFlag, '/clientSalesActive/hiddenOpportunityInsertForm.do');
									} else if (oppFlag && !issueFlag) { //잠재영업기회만 체크
										alert("잠재영업기회 입력으로 이동합니다.");
										returnFollowUpAction(oppFlag, issueFlag, '/clientSalesActive/hiddenOpportunityInsertForm.do');
									} else if (!oppFlag && issueFlag) { //이슈만 체크 체크
										alert("이슈 입력으로 이동합니다.");
										returnFollowUpAction(oppFlag, issueFlag, '/clientSatisfaction/clientIssueInsertForm.do');
									}

								},
								error : function() {
									//에러발생을 위한 code페이지
									alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
								}
							});
			$('#formModalData').submit();
		}

		function returnFollowUpAction(oppFlag, issueFlag, url) {
			//$("#formFollow #contactPK").val(modal.contactPK);
			$("#formFollow #issueFlag").val(issueFlag);
			$("#formFollow #oppFlag").val(oppFlag);

			$("#formFollow #returnCompanyId").val($("#formModalData #hiddenModalCompanyId").val());
			$("#formFollow #returnCompanyName").val($("#formModalData #textCommonSearchCompany").val());
			$("#formFollow #returnCustomerName").val($("#formModalData #textModalCustomerName").val());
			$("#formFollow #returnCustomerId").val($("#formModalData #hiddenModalCustomerId").val());
			$("#formFollow #returnCustomerRank").val($("#formModalData #textModalClientRank").val());

			$("#formFollow").attr("action", url);
			$("#formFollow").submit();
		}

		function updateDetail(_pkNo) {
			console.log("this is update detail.");
			console.log(_pkNo);

			//상세정보를 가져와서 수정정보에 셋팅
			$.ajax({
						url : "/clientSalesActive/selectContactDetail.do",
						async : false,
						datatype : 'json',
						mtype : 'POST',
						data : {
							pkNo : _pkNo,
							datatype : "jsonview"
						},
						beforeSend : function() {
						},
						success : function(data) {
							console.log(data);

							var rowData = data.detail;
							var fileList = data.fileList;

							$("#formModalData #hiddenModalMemberList").val("");
							$("#hiddenModalPK").val(rowData.EVENT_ID);

							$("#textModalSubject").val(rowData.EVENT_SUBJECT);
							$("#divModalNameAndCreateDate").html(
									"보고자 : " + rowData.HAN_NAME + "/ 작성일 : "
											+ rowData.SYS_REGISTER_DATE);
							$("#textModalEventDate").val(rowData.EVENT_DATE);
							$("#selectModalCategory").val(
									rowData.EVENT_CATEGORY);
							$("#selectModalStartDateTime").val(rowData.EVENT_START_TIME);
							$("#selectModalEndDateTime").val(rowData.EVENT_END_TIME);
							
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
							/* $("#hiddenModalCustomerId")
									.val(rowData.CUSTOMER_ID);
							$("#textModalCustomerName").val(
									rowData.CUSTOMER_NAME);
							$("#textModalClientRank")
									.val(rowData.CUSTOMER_RANK); */
							$("#hiddenModalPK").val(rowData.EVENT_ID);
							$("#textareaModalEventContents").val(
									rowData.EVENT_CONTENTS);
							//$("#hiddenModalCompanyId").val(rowData.COMPANY_ID);
							/* $("#textCommonSearchCompanyId").val(
									rowData.COMPANY_ID);
							$("#textCommonSearchCompany").val(
									rowData.COMPANY_NAME); */
							$("[name='divRelation']").show();
							$("[name='checkOppIssue']").hide();
							if (rowData.CHECK_INFORMATION == "Y") {
								$("input[name='checkInformation']").prop("checked", true);
								$("input[name='checkInformation']").val("Y");
							} else {
								$("input[name='checkInformation']").prop("checked", false);
								$("input[name='checkInformation']").val("");
							}

							if (rowData.CHECK_SALESOPP == "Y") {
								$("input[name='checkSalesOpp']").prop("checked", true);
								$("input[name='checkSalesOpp']").val("Y");
							} else {
								$("input[name='checkSalesOpp']").prop("checked", false);
								$("input[name='checkSalesOpp']").val("");
							}

							if (rowData.CHECK_ISSUE == "Y") {
								$("input[name='checkIssue']").prop("checked",
										true);
								$("input[name='checkIssue']").val("Y");
							} else {
								$("input[name='checkIssue']").prop("checked",
										false);
								$("input[name='checkIssue']").val("N");
							}

							//잠재영업기회 연동
							$("#relationHiddenOpp").html("");
							if (!isEmpty(rowData.OPPORTUNITY_HIDDEN_ID)) {
								//$("#relationHiddenOpp").html('<a href="/clientSalesActive/viewHiddenOpportunityList.do?opportunity_hidden_id='+rowData.OPPORTUNITY_HIDDEN_ID+'" target="_new" class="oppStatusColor oppStatusColor-complete">바로가기</a>');
								$("#relationHiddenOpp")
										.html(
												'<a href="/clientSalesActive/viewHiddenOpportunityList.do?opportunity_hidden_id='
														+ rowData.OPPORTUNITY_HIDDEN_ID
														+ '" target="_new" class="oppStatusColor oppStatusColor-complete btn_quick">바로가기</a>');
							} else {
								$("#relationHiddenOpp").html('-');
							}

							//이슈 연동
							$("#relationClientIssue").html("");
							if (!isEmpty(rowData.ISSUE_ID)) {
								//$("#relationClientIssue").html('<a href="/clientSatisfaction/viewClientIssueList.do?issue_id='+rowData.ISSUE_ID+'" target="_new" class="oppStatusColor oppStatusColor-complete">바로가기</a>');
								$("#relationClientIssue")
										.html(
												'<a href="/clientSatisfaction/viewClientIssueList.do?issue_id='
														+ rowData.ISSUE_ID
														+ '" target="_new" class="oppStatusColor oppStatusColor-complete btn_quick">바로가기</a>');
							} else {
								$("#relationClientIssue").html('-');
							}

							//파일
							/*
							commonFile.reset();
							if(!isEmpty(fileList)){
							    $("#divFileUploadList span").remove();
							    for(var i=0; i<fileList.length; i++){
							        $("#divFileUploadList").append('<span style="padding-left:5px;"><a href="/common/downloadFile.do?fileId='+fileList[i].FILE_ID+'&fileTableName=3"><i class="fa fa-file-'+commonCheckExtension(fileList[i].FILE_TYPE)+'-o fa-lg"></i> '+fileList[i].FILE_NAME+'</a> <a href="javascript:void(0);" onClick="modal.deleteFile('+fileList[i].FILE_ID+');"><i class="fa fa-times-circle"></i></a></span>');
							    }
							}else{
							    $("#divFileUploadList").html('<span class="blank-ment">선택된 파일이 없습니다</span>');
							}
							 */

							//$("h4.modal-title").html(rowData.EVENT_SUBJECT);
							//$("small.font-bold").css('display','');
							//$("#buttonModalSubmit").html("저장하기");
							//modal.drawContactActionPlan();
							//modal.actionPlanReload();
							//$("#myModal1").modal();
							//list.compare_before = $("#formModalData").serialize();
						},
						complete : function() {
							//$.ajaxLoadingHide();
						}
					});

		}
		
		function changeEndDate() {
			var startDateTime = $("#selectModalStartDateTime").val();
			
			var split = startDateTime.split(":");
			var endHour = "";
			(parseInt(split[0],"10")+1) > 9 ? endHour = parseInt(split[0],"10")+1 : endHour = "0"+(parseInt(split[0],"10")+1);
			$("#selectModalEndDateTime").val(endHour+":"+split[1]);
		}
		
		//생산성 시간데이터 계산
		function timeDifference(obj) {
			var date1 = moment($("#textModalEventDate").val()+' '+$("#selectModalEndDateTime").val(), 'YYYY-MM-DD HH:mm').format('x');
			var date2 = moment($("#textModalEventDate").val()+' '+$("#selectModalStartDateTime").val(), 'YYYY-MM-DD HH:mm').format('x');
			var difference = date1 - date2;
			var minutesDifference = (difference/1000/60/60).toFixed(1);
			$(obj).val(minutesDifference);
		}
		
	</script>

</body>
</html>