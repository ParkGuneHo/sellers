<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.springframework.web.util.UrlPathHelper"%>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="java.util.HashMap" %>
<%
//URL 파라메터 제거
UrlPathHelper urlPathHelper = new UrlPathHelper();
String originalURL = urlPathHelper.getOriginatingRequestUri(request);
//out.println("originalURL : " + originalURL);

String[][] arrNavi = {
						{"파트너사협업관리","파트너 현황","/partnerManagement/viewPartnerSalesLinkage.do"}
						
						,{"파트너사협업관리","파트너사정보","/partnerManagement/viewPartnerCompanyInfoGate.do"}
						,{"파트너사협업관리","파트너사정보","/partnerManagement/viewPartnerCompanyInfoDetail.do"}
						,{"파트너사협업관리","파트너사정보","/partnerManagement/formPartnerCompanyInfoDetail.do"}
						
						,{"파트너사협업관리","파트너사개인정보","/partnerManagement/viewPartnerIndividualInfoGate.do"}
						,{"파트너사협업관리","파트너사개인정보","/partnerManagement/viewPartnerIndividualInfoDetail.do"}
						,{"파트너사협업관리","파트너사개인정보","/partnerManagement/formPartnerIndividualInfoDetail.do"}
						
						,{"사업전략","회사/부문별전략","/bizStrategy/viewBizStrategyCompany.do"}
						,{"사업전략","회사/부문별전략","/bizStrategy/selectBizStrategyDetail.do"}
						
						,{"사업전략","고객별전략","/bizStrategy/viewBizStrategyClient.do"}
						,{"사업전략","고객별전략","/bizStrategy/selectBizStrategyDetail.do"}
						
						,{"사업전략","전략프로젝트","/bizStrategy/viewBizStrategyProjectPlan.do"}
						,{"사업전략","전략프로젝트","/bizStrategy/modalProjectPlanInfo.do"}
						
						,{"패스워드","변경","/common/changePW.do"}
					};

String navi_name1 = "";
String navi_name2 = "";

for(int i=0; i<arrNavi.length; i++) {
	if(originalURL.equals(arrNavi[i][2])) {
		navi_name1 = arrNavi[i][0].toString();
		navi_name2 = arrNavi[i][1].toString();
		break;
	}
}

pageContext.setAttribute("navi_name1", navi_name1);

String searchCategory = request.getParameter("searchCategory");
if(searchCategory != null && searchCategory.equals("고객전략")) {
	navi_name2 = "고객별전략";
}
pageContext.setAttribute("navi_name2", navi_name2);
//request.setAttribute("navi_name2", navi_name2);
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>파트너사 정보</title>

<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/jquery.form.min.js"></script>


<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
<!-- 
<script src="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.js"></script>
 -->
 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/moment/moment.js"></script>
<!-- js-->

<link href="../../../css/m/style.css" rel="stylesheet" type="text/css">
<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />


<!--
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
    rel="stylesheet" type="text/css" /> 
<link href="/css/pc/jqueryui/jquery-ui.css" rel="stylesheet"/>
<link href="/js/pc/plugins/autocomplete/jquery.auto-complete.css" rel="stylesheet">
 -->
<script type="text/javascript">
//var $ = jQuery.noConflict();

(function($){
	$(document).ready(function(){
		$.ajaxLoading = function(){
			$("div.ajax-loader_sellers").show(); //ajax Loading
			setTimeout(function(){$("div.ajax-loader_sellers").hide();},300); //ajax Loading
		}
		 
		$.ajaxLoadingShow = function(){
			$("div.ajax-loader_sellers").show(); //ajax Loading
		}
		
		$.ajaxLoadingHide = function(){
			$("div.ajax-loader_sellers").hide(); //ajax Loading
		}
	});

	/* $(document).ready(function(){
		$.ajaxLoading = function(){
			$("div.ajax-loader_sellers").show(); //ajax Loading
			setTimeout(function(){$("div.ajax-loader_sellers").hide();},300); //ajax Loading
		}
		 
		$.ajaxLoadingShow = function(){
			$("div.ajax-loader_sellers").show(); //ajax Loading
		}
		
		$.ajaxLoadingHide = function(){
			$("div.ajax-loader_sellers").hide(); //ajax Loading
		}
	}); */

})(jQuery);

$(document).ready(function(){
	$.ajaxLoading = function(){
		$("div.ajax-loader_sellers").show(); //ajax Loading
		setTimeout(function(){$("div.ajax-loader_sellers").hide();},300); //ajax Loading
	}
	 
	$.ajaxLoadingShow = function(){
		$("div.ajax-loader_sellers").show(); //ajax Loading
	}
	
	$.ajaxLoadingHide = function(){
		$("div.ajax-loader_sellers").hide(); //ajax Loading
	}
});

</script>
</head>

<body class="white_bg">

<div class="container_pg">

	<jsp:include page="/WEB-INF/jsp/m/templates/header.jsp"/>
<%
//일정관리를 제외한 메뉴는 현재 메뉴명 노출
if(originalURL.indexOf("/calendar/") == -1 && originalURL.indexOf("/common/") == -1) {
%>
    <!-- location -->
    <div class="location">
        <a href="#" class="home"><img src="../../../images/m/icon_home.svg" /></a>
        <img src="../../../images/m/icon_arrow_gray.svg"/>
        <a href="">${navi_name1}</a> 
        <img src="../../../images/m/icon_arrow_gray.svg"/>
        <span>${navi_name2}</span>
    </div>
<%
}
%>