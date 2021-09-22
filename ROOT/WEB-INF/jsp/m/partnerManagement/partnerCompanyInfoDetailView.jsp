<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<jsp:include page="/WEB-INF/jsp/m/common/top.jsp"/>
<%@ include file="/WEB-INF/jsp/m/common/functions.jsp" %>
<%
String req_params = getReqParams(request, "mode");
request.setAttribute("req_params", req_params);
%>

    <article class="">

        <div class="title_pg ta_c">
            <h2 class="">${selectPartnerCompanyInfo[0].COMPANY_NAME}</h2>
            <a href="#" class="btn_back" onclick="window.history.back();">back</a>
        </div>
<%--
        <div class="author">
            <span>이기섭(2016-08-10)</span>
        </div>
 --%>
        <div class="pg_cont">

            <div class="view_cata b_line">
                <div class="ti fl_l w_120">
                    <span class="bullet dot"></span> 파트너사 ID
                </div>
                <div class="cont fl_l">${selectPartnerCompanyInfo[0].PARTNER_ID}</div>
            </div>

            <%-- <div class="view_cata b_line">
                <div class="ti fl_l w_120">
                    <span class="bullet dot"></span> 파트너사 코드
                </div>
                <div class="cont fl_l">${selectPartnerCompanyInfo[0].PARTNER_CODE}</div>
            </div> --%>

            <div class="view_cata b_line">
                <div class="ti fl_l">
                    <span class="bullet dot"></span> CEO
                </div>
                <div class="cont fl_l">${selectPartnerCompanyInfo[0].CEO_NAME}</div>
            </div>

            <div class="view_cata b_line">
                <div class="ti fl_l">
                    <span class="bullet dot"></span> 대표전화
                </div>
                <div class="cont fl_l">
                    <span class="phone">${selectPartnerCompanyInfo[0].COMPANY_TELNO}</span>
<c:if test="${fn:length(selectPartnerCompanyInfo[0].COMPANY_TELNO) > 10}">
                    <a href="tel:${selectPartnerCompanyInfo[0].COMPANY_TELNO}" class="btn_phone_go_view"><img src="../../../images/m/icon_phone.png" alt="전화걸기"/></a>
                    <!-- 전화번호 클릭시 전화걸기 실행 됨  -->
</c:if>
                </div>
            </div>

            <div class="view_cata b_line">
                <div class="ti fl_l w_120">
                    <span class="bullet dot"></span> 사업자등록번호 
                </div>
                <div class="cont fl_l">${selectPartnerCompanyInfo[0].BUSINESS_NUMBER}</div>
            </div>

            <div class="view_cata b_line">
                <div class="ti fl_l">
                    <span class="bullet dot"></span> 업태
                </div>
                <div class="cont fl_l">${selectPartnerCompanyInfo[0].BUSINESS_TYPE}</div>
            </div>

            <div class="view_cata b_line">
                <div class="ti fl_l">
                    <span class="bullet dot"></span> 업종
                </div>
                <div class="cont fl_l">${selectPartnerCompanyInfo[0].BUSINESS_SECTOR}</div>
            </div>

            <div class="view_cata_full b_line">
                <div class="ti mg_b5">
                    <span class="bullet dot"></span> 주소
                </div>
                <div class="map_txt">
                    ${selectPartnerCompanyInfo[0].POSTAL_ADDRESS}<br/> 우편번호 : ${selectPartnerCompanyInfo[0].POSTAL_CODE}
                </div>
            </div>
<%--
            <div class="view_cata b_line">
                <label class="">로고 이미지</label>
                <div class="photo_input">
                    <img src="../../../images/m/company_logo.png" alt="샘플사진" />
                </div>
            </div>
 --%>
            <div class="view_cata">
                <label class="">조직도</label>
                <div class="">
<c:choose>
    <c:when test="${companyOrganizationChart[0].FILE_PATH ne '' && companyOrganizationChart[0].FILE_PATH ne null}">
                    <!-- 
                    <img class="mg-b20" src="/${companyOrganizationChart[0].FILE_PATH}${companyOrganizationChart[0].FILE_NAME}" style="background-size:cover;">
                     -->
                    <img src="/${companyOrganizationChart[0].FILE_PATH}${companyOrganizationChart[0].FILE_NAME}" alt="조직도 사진" />
	</c:when>
	<c:otherwise>
                    등록된 조직도가 없습니다.
    </c:otherwise>
</c:choose>
                </div>
            </div>

        </div>

        <div class="pg_bottom_func">
            <ul>
                <li><a href="/partnerManagement/viewPartnerCompanyInfoGate.do<c:if test="${req_params ne ''}">?${req_params}</c:if>" class=""> <img src="../../../images/m/icon_list.png" /> <span>목록</span></a></li>
                <li><a href="/partnerManagement/formPartnerCompanyInfoDetail.do?mode=update&${req_params}" class=""> <img src="../../../images/m/icon_edit.png" /> <span>수정</span></a></li>
            </ul>
        </div>

    </article>

<jsp:include page="/WEB-INF/jsp/m/common/bottom.jsp"/>