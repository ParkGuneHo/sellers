<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" pageEncoding="UTF-8" %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>THE Seller's</title>
<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">
</head>

<body class="landing_quickmenu_bg">

<div class="container">

     <jsp:include page="../templates/header.jsp" flush="false"/>

     <article class="landing_quickmenu">

	    <div class="ta_r pd_t10 mg_b10">
            <a href="#" class="btn_quickmenu_set" onclick="modal.set();">바로가기 메뉴 설정</a>
        </div>

        <div class="ment">
        		※ 셀러스 ‘바로가기’ 화면입니다. 원하는 메뉴를 등록해주세요.<br/>
            (6개까지 등록 가능합니다.)
        </div> 

    </article>

</div>

<!-- 바로가기 메뉴 설정 팝업 -->
<jsp:include page="./mainLandingPageModal.jsp" flush="false"/>

<div class="modalpop_screen"></div>

<!--최영완 Firebase App (the core Firebase SDK) is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/5.10.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.10.1/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.10.1/firebase-messaging.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/common.js"></script>
<script type="text/javascript">
$('.modalpop_screen').hide();
$(document).ready(function(){
	mainLandingPage.init();
});

var mainLandingPage = {
		init : function(){
			var filter = "win16|win32|win64|mac";
			if(navigator.platform){
				if(0 > filter.indexOf(navigator.platform.toLowerCase())){
					//최영완 - 안드로이드와 통신 (FirebaseDatabase에 유저 ID, Token 저장)
					//window.Token.TokenPut("${userInfo.MEMBER_ID_NUM}");
					
					var userAgent = navigator.userAgent.toLowerCase();
					if(userAgent.indexOf('sellers') != -1){
						Token.TokenPut("${userInfo.MEMBER_ID_NUM}");
					}
				}
			}
			mainLandingPage.selectUserMobileLandingPage();
		},
		
		/* getParams : function() { //공통 파라미터
			
		}, */
		
		selectUserMobileLandingPage : function() { //사용자 메인랜딩페이지 설정 조회
			var params = $.param({
				datatype : 'html',
				jsp : '/main/mainLandingPageAjax'
			});
			
			$('article.landing_quickmenu').prevAll("ul.quickmenu_display").remove();
		
			//사용자 메뉴 리스트
			$.ajax({
				url : "/main/selectUserMobileLandingPage.do",
				async : false,
	 			datatype : 'html',
	 			method: 'POST',
	 			//data : selectUserMobileLandingPage.getParams() + "&" + listParams,
	 			data : params,
				beforeSend : function(xhr){
					xhr.setRequestHeader("AJAX", true);
					//$.ajaxLoading();
				},
				success : function(data){
					$('article.landing_quickmenu').before(data);
				},
				complete : function(){
				}
			});
		}
}

//최영완 - Android에서 호출
function insertUserMobileToken(token){
	var params = $.param({
		datatype : 'json',
		userDi : token,
		member_id_num : "${userInfo.MEMBER_ID_NUM}"
	});
	//DB에 사용자 모바일 토큰값 저장
	$.ajax({
		url : "/main/insertUserMobileToken.do",
		async : false,
			datatype : 'json',
			method: 'POST',
			data : params,
		beforeSend : function(xhr){
			xhr.setRequestHeader("AJAX", true);
		},
		success : function(data){
			//$('article.landing_quickmenu').before(data);
		},
		complete : function(){
		}
	});
}
</script>
</body>
</html>