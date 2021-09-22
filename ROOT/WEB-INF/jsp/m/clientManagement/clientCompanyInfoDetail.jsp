<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객사정보 상세보기</title>

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
		<span>고객사정보</span>
	</div>

	<article class="">
		<div class="title_pg ta_c">
			<h2 class="" id="COMPANY_NAME"></h2>
			<a href="#" class="btn_back" onclick="fncGoBack(); return false;">back</a>
		</div>
		
		<div class="author">
			<div id="UPDATE_NAME"></div>
		</div>
		
		<div class="mg_l10 mg_r10 mg_b20">
			<ul class="tabmenu tabmenu_type2 mg_b20">
				<li><a href="#" id="tab_1" class="active" onclick="fncSelectTab('1'); return false;">기본정보</a></li>
				<li><a href="#" id="tab_2" onclick="fncSelectTab('2'); return false;">영업기회</a></li>
				<!-- <li><a href="#" id="tab_3" onclick="fncSelectTab('3'); return false;">고객이슈</a></li> -->
				<li><a href="#" id="tab_3" onclick="fncSelectTab('3'); return false;">컨택이력</a></li>
				<li><a href="#" id="tab_4" onclick="fncSelectTab('4'); return false;">소속 고객개인</a></li>
			</ul>
		
			<div class="tabcont cont1"><!-- 기본정보 -->
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객사 ID
					</div>
					<div class="cont fl_l" id="COMPANY_ID"></div>
				</div>
				
				<div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> CEO
                    </div>
                    <div class="cont fl_l" id="CEO_NAME"></div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> COO
                    </div>
                    <div class="cont fl_l" id="COO_NAME"></div>
                </div>

                <div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> CFO
                    </div>
                    <div class="cont fl_l" id="CFO_NAME"></div>
                </div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 주소
					</div>
					<div class="cont fl_l" id="POSTAL_ADDRESS"></div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 대표전화
					</div>
					<div class="cont fl_l" id="COMPANY_TELNO">
                        <a href="tel:${detail.COMPANY_TELNO}" class="phone ds_in">${detail.COMPANY_TELNO}</a>
                    </div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 홈페이지 주소
					</div>
					<div class="cont fl_l" id="COMPANY_SITE"></div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 산업분류 
					</div>
					<div class="cont fl_l" id="SEGMENT_HAN_NAME"></div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 사업자등록번호 
					</div>
					<div class="cont fl_l" id="BUSINESS_NUMBER"></div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> ERP 등록번호
					</div>
					<div class="cont fl_l" id="ERP_REG_CODE"></div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 업태
					</div>
					<div class="cont fl_l" id="BUSINESS_TYPE"></div>
				</div>

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 종목
					</div>
					<div class="cont fl_l" id="BUSINESS_SECTOR"></div>
				</div>
				<div class="view_cata b_line off">
                    <label class="">로고 이미지</label>
                    <div class="photo_input">
                        
                        <!-- 등록된 로고가 없습니다.. -->
                    </div>
                </div>
				<div class="view_cata">
                    <label class="">조직도</label>
                    <div class="ta_c">
                        <div id="img_path"></div>
                        <div id="Organization_default"></div>
                    </div>
                </div>
                
			</div>
			
			<!-- 영업기회 -->
			<div class="tabcont cont2 off">
				<jsp:include page="./clientCompanyOppTab.jsp" flush="true"/>
			</div>
			
			<%-- <!-- 고객이슈 -->
			<div class="tabcont cont3 off">
				<jsp:include page="./clientCompanyIssueTab.jsp" flush="true"/>
			</div>  --%>
			
			<!-- 컨택이력 -->
			<div class="tabcont cont3 off">
				<jsp:include page="./clientContactTab.jsp" flush="true"/>
			</div>
			
			<!-- 소속 고객개인리스트 -->
			<div class="tabcont cont4 off">
				<jsp:include page="./clientCompanyIndividualTab.jsp" flush="true"/>
			</div>
		</div>
		</div>

		<div class="pg_bottom_func">
			<ul>
				<li><a href="#" class="" onclick="fncList(); return false;"> <img src="${pageContext.request.contextPath}/images/m//icon_list.png"/> <span>목록</span></a></li>
				<li><a href="#" class="" onclick="fncModify(); return false;"> <img src="${pageContext.request.contextPath}/images/m//icon_edit.png"/> <span>수정</span></a></li>
			</ul>
		</div>

	</article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>


</div>

<div class="modal_screen"></div>

<form method="post" id="updateForm" action="">
    <input type="hidden" id="mode" name="mode" value="upd" />
    <input type="hidden" id="pkNo" name="pkNo" value="" />
</form>  

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>


<script type="text/javascript">

	function fncSelectTab(_no){
		
		// 탭 이동		
		for(var i=0; i<$('.tabmenu li').length; i++){				
			$('#tab_'+(i+1)).removeClass('active');
			$('.cont'+(i+1)).addClass('off');
		}		
		
		$('#tab_'+_no).addClass('active');
		$('.cont'+_no).removeClass('off');
	}
	
	function fncList(){
		location.href= '/clientManagement/viewClientCompanyInfoGate.do';
	}
	
	function fncModify() {
		//location.href= '/clientManagement/formClientCompanyInfo.do?mode=M&company_id=${param.company_id}';
        $("#updateForm").attr("action", "/clientManagement/clientCompanyInsertForm.do");
        $('#updateForm').submit();		
	}
	
	$(document).ready(function() {
     // 상세 정보 가져오기
     fnDetail();
     oppTab.fncShowMore();
     //issueTab.fncShowMore();
     contactTab.fncInit('COM');
	});
	
	function fnDetail() {
	  var params = $.param({
	      datatype : 'json',
	      jsp : '/clientManagement/clientCompanyInfoTabAjax'
	  });
	  
	  $.ajax({
		  url : "/clientManagement/selectCompanyInfo.do",
		  datatype : 'json',
		  data : {
	  		pageStart : individualTab.curCnt,
	      rowCount : individualTab.rowCount,
	      numberPagingUseYn : "Y",
	      "companyId" : '${companyId}',
	      "datatype" : "json"
		  },
		  cache : false,
		  method : 'POST',
		  beforeSend : function(xhr){
	      xhr.setRequestHeader("AJAX", true);
		  },
		  success : function(data){
	      var companyInfo = data.gridClientCompanyInfo[0];
	      var clientCompanyList = data.clientCompanyList;
	                      
	      //이미지 경로
				var coc = data.companyOrganizationChart;
				var path = data.imagePath; //properties-local.xml에서 경로 설정 필요합니다.
				
        $("#COMPANY_ID").html(companyInfo.COMPANY_ID);
        $("#COMPANY_NAME").html(companyInfo.COMPANY_NAME);
        $("#POSTAL_ADDRESS").html(companyInfo.POSTAL_ADDRESS);
        $("#COMPANY_TELNO").html("<a href='tel:" + companyInfo.COMPANY_TELNO + "' class='phone ds_in'>" + companyInfo.COMPANY_TELNO + "</a>");
        $("#COMPANY_SITE").html("<a href=" +companyInfo.COMPANY_SITE + ">"+companyInfo.COMPANY_SITE+"</a");
        $("#SEGMENT_HAN_NAME").html(companyInfo.SEGMENT_HAN_NAME);
        $("#BUSINESS_NUMBER").html(companyInfo.BUSINESS_NUMBER);
        $("#ERP_REG_CODE").html(companyInfo.ERP_REG_CODE);
        $("#BUSINESS_TYPE").html(companyInfo.BUSINESS_TYPE);
        $("#BUSINESS_SECTOR").html(companyInfo.BUSINESS_SECTOR);
        
        for( var i in clientCompanyList ){
        	var positionDuty = clientCompanyList[i].POSITION_DUTY;
        	if(!isEmpty(positionDuty))
        	switch (positionDuty.toUpperCase()) {
				case 'CEO':
					$("#CEO_NAME").html("<a href='/clientManagement/viewClientIndividualInfoDetail.do?company_id="+clientCompanyList[i].COMPANY_ID+"&customer_id="+clientCompanyList[i].CUSTOMER_ID+"'>"+clientCompanyList[i].CUSTOMER_NAME+"</a>");
					break;
				case 'COO':
					$("#COO_NAME").html("<a href='/clientManagement/viewClientIndividualInfoDetail.do?company_id="+clientCompanyList[i].COMPANY_ID+"&customer_id="+clientCompanyList[i].CUSTOMER_ID+"'>"+clientCompanyList[i].CUSTOMER_NAME+"</a>");
					break;	
				case 'CFO':
					$("#CFO_NAME").html("<a href='/clientManagement/viewClientIndividualInfoDetail.do?company_id="+clientCompanyList[i].COMPANY_ID+"&customer_id="+clientCompanyList[i].CUSTOMER_ID+"'>"+clientCompanyList[i].CUSTOMER_NAME+"</a>");
					break;
			}
        }
        
        var updateDate = moment(companyInfo.SYS_UPDATE_DATE);
				updateDate = updateDate.format("YYYY-MM-DD");
				$("#UPDATE_NAME").html("<span>" + companyInfo.HAN_NAME + "(" + updateDate + ")</span>");
				
				if(coc.length > 0){
					var path2 = coc[0].FILE_PATH + coc[0].FILE_NAME;
					var imagePath = path + path2;
					
					$("#img_path").html("<img src='../../../images/" + path2 + "'/>");
				}else{
					$("#Organization_default").html("<img src='../../../images/m/icon_org2.gif'/>");
				}				
	
        // 수정폼 데이터 입력
        $("#pkNo").val(companyInfo.COMPANY_ID);

        // 고객개인
        individualTab.fncDrawTable(clientCompanyList, data.totalCnt); 
      },
      complete : function(){
      }
	  });
	}
		
	var pageMove = {
		/* 영업기회 상세보기 */
		oppDetailView : function (opp_list){
			//window.location.href= "/clientSalesActive/selectOpportunityDetail.do";
		},
		/* 컨택이력 상세보기 */
		contactDetailView : function (contactList){
			
			//window.location.href= "/clientSalesActive/selectOpportunityDetail.do";
		}
	}
	
</script>

</body>
</html>