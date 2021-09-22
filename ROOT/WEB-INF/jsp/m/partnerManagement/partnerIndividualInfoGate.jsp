<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>
<%
String req_params = getReqParams(request, "mode");
request.setAttribute("req_params", req_params);
%>
    <article class="gate_pg">

        <div class="ta_c">
            <img src="../../../images/m/img_search.svg" />
            <p class="fs18">파트너 <span class="fc_blue">검색</span></p>
        </div>

        <div class="search_pgin bg_white pd_b20">
            <div class="searchArea">
                <input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}" />
                <input type="text" placeholder="파트너명 입력" id="searchDetail" name="searchDetail" value="${map.search_detail}" onkeydown="if(event.keyCode == 13){searchDetailClick.getList();}" /><a href="#" onclick="searchDetailClick.getList();"><span class="icon_search"></span></a>
            </div>
        </div>

        <!-- 접근권한이 없을 떄 -->
        <div class="result_blank off">
            해당 고객정보에 접근 권한이 없습니다.<br/>
            접근권한 부여는 관리자에게 문의해주세요.<br/>
            문의처 : <a href="mailto:admin@gmailcom">admin@gmailcom</a> / <a href="tel:02-0938-1254">02-0938-1254</a>
        </div>
        <!--// 접근권한이 없을 떄 -->

<c:if test="${map.search_result eq 'Y'}">
    <c:choose>
    <c:when test="${fn:length(rows) > 0}">
    
        <!-- 검색결과가 있을 경우 -->
        <div class="result_on ">
            <div class="pd_l20 pd_r20">검색결과 (총 ${fn:length(rows)}개)</div>

            <ul class="list_type4 mg_b20">
        <c:forEach items="${rows}" var="item" varStatus="status">
                <li>
                    <a href="#" onclick="searchDetailClick.goDetail('${item.PARTNER_INDIVIDUAL_ID}','${item.PARTNER_ID}','${map.search_detail}');return false;">
                        <span class="top pd_b5">
                            <span class="subject fs22">${item.PARTNER_PERSONAL_NAME} <span class="fs12">${item.POSITION}</span></span>
                            <span class="ds_b">${item.COMPANY_NAME} / ${item.TEAM}</span>
                        </span>
                        <span class="bottom pd_t5">
                            <span class="name">
                                <span>${item.PHONE}</span> | <span>${item.EMAIL}</span>
                            </span> 
                        </span>
                    </a>
            <c:if test="${fn:length(item.PHONE) > 6}">
                    <a href="tel:${item.PHONE}" class="btn_phone_go"><img src="../../../images/m/icon_phone.png" alt="전화걸기"/></a>
                    <!-- 전화번호 클릭시 전화걸기 실행 됨  -->
            </c:if>
                </li>
        </c:forEach>

            </ul>
        </div>
        <!--// 검색결과가 있을 경우 -->
    </c:when>
    <c:otherwise>
        <!-- 등록된 파트너 정보가 없을 떄 -->
        <div class="result_blank off">
            등록된 파트너 정보가 없습니다.<br/>
            신규등록 해주세요</a>
        </div>
        <!--// 등록된 파트너 정보가 없을 떄 -->
    </c:otherwise>
    </c:choose>
</c:if>

        <a href="/partnerManagement/formPartnerIndividualInfoDetail.do<c:if test="${req_params ne ''}">?${req_params}</c:if>" class="btn_new r2 mg_b20">파트너 신규 등록</a>

        <div class="guide_pg mg_b20">* 등록된 정보가 없을 경우에 신규등록 해 주세요.</div>

    </article> 

<form id="formDetail">
<input type="hidden" id="customer_id" name="customer_id">
<input type="hidden" id="company_id" name="company_id">
<input type="hidden" id="search_detail" name="search_detail">

<input type="hidden" id="serchInfo" name="serchInfo">
<input type="hidden" id="search_result" name="search_result" value="Y" />
<input type="hidden" id="pageStart" name="pageStart" value="1" />
<input type="hidden" id="pageEnd" name="pageEnd" value="10000" />
<input type="hidden" id="serch" name="serch" value="2" />

<input type="hidden" id="companyId" name="companyId">
<input type="hidden" id="customerId" name="customerId" value="">
<input type="hidden" id="hiddenModalPK" name="hiddenModalPK" value="">
<input type="hidden" id="salesStatus" name="salesStatus" value="1">
</form>

<script type="text/javascript">

//var $ = jQuery.noConflict();
/**
 * 파트너사개인정보 게이트 페이지에서 사용된다
 */
var searchDetailClick = {
		
		//파트너사 개인정보 게이트 페이지에서 파트너 개인을 검색하면 파트너 리스트를 가져오는 function
		getList : function(){
			var params = $.param({
				pageStart : page.serchStart,
				pageEnd : page.serchEnd,
				serchInfo : $("#searchDetail").val(),
				creatorId : $("#hiddenModalCreatorId").val(),
				serch : 2,
				datatype : 'json'
			});
			$.ajax({
				url : "/partnerManagement/selectPartnerIndividualInfoList.do",
				datatype : 'json',
				method: 'POST',
				data : params,
				beforeSend : function(xhr){
					xhr.setRequestHeader("AJAX", true);
					$.ajaxLoading();
				},
				success : function(data){
					//$("div#row").html(data);
					if(data.rows.length > 0) searchDetailClick.goSearch(data.rows[0].PARTNER_INDIVIDUAL_ID, data.rows[0].PARTNER_ID, $("#searchDetail").val());
					else alert("검색결과가 없습니다.");
				},
				complete : function(){
					$.ajaxLoadingHide();
				}
			});
		},
		
		goSearch : function(partnerId, companyId, searchDetail){
			//$("#formDetail #customer_id").val(partnerId);
			$("#formDetail #company_id").val(companyId);
			$("#formDetail #search_detail").val(searchDetail);
			$("#formDetail #serchInfo").val(searchDetail);
			$("#formDetail").attr({action:"/partnerManagement/viewPartnerIndividualInfoGate.do", method:"get"}).submit();
		},
		
		//파트너사 개인정보 게이트 페이지에서 파트너를 검색하면 파트너 개인 상세 페이지로 이동한다
		goDetail : function(partnerId, companyId, searchDetail){
			//$("#formDetail #customer_id").val(partnerId);
			$("#formDetail #company_id").val(companyId);
			$("#formDetail #search_detail").val(searchDetail);
			$("#formDetail #serchInfo").val(searchDetail);
			
			$("#formDetail #companyId").val(companyId);
			$("#formDetail #customerId").val(partnerId);
			$("#formDetail #hiddenModalPK").val(partnerId);
			$("#formDetail").attr({action:"/partnerManagement/viewPartnerIndividualInfoDetail.do", method:"get"}).submit();
		}
}
</script>

<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>