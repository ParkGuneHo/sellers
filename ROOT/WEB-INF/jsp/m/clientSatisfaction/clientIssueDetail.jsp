<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<% pageContext.setAttribute("enter", "\n"); %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객이슈관리</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">

</head>

<body class="white_bg" onload="tabmenuLiWidth();">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>
	
	<!-- location -->
	<div class="location">
		<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<a href="">고객만족</a> 
		<img src="${pageContext.request.contextPath}/images/m//icon_arrow_gray.svg"/>
		<span>고객이슈</span>
	</div>

	<article class="">
		<div class="title_pg ">
			<h2>${detail.ISSUE_SUBJECT}</h2>
			<a href="#" class="btn_back" onclick="fncGoBack(); return false;">back</a>
		</div>

		<div class="author">
			<span>${detail.HAN_NAME}(${detail.ISSUE_DATE})</span>
		</div>

		<ul class="tabmenu tabmenu_type2 mg_b20">
			<li><a href="#" id="tab_1" onclick="fncSelectTab('1');return false;" class="active">기본정보</a></li>
			<li><a href="#" id="tab_2" onclick="fncSelectTab('2');return false;">이슈해결계획</a></li>
			<li><a href="#" id="tab_3" onclick="fncSelectTab('3');return false;">Coaching Talk</a></li>
		</ul>

		<div class="pg_cont">
			<!-- 위의 탭 클릭시 아래의 cont1, cont2, cont3 가  하나씩 보여지도록 해주세요 -->
	
			<div class="cont1 "><!-- 기본정보 -->
	
				<%-- <div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객사
					</div>
					<div class="cont fl_l">${detail.COMPANY_NAME}</div>
				</div> --%>
				
				<%-- <div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객사 ID
					</div>
					<div class="cont fl_l">${detail.COMPANY_ID}</div>
				</div> --%>
	
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 고객명
					</div>
					<div class="cont fl_l">	
						<c:forTokens  var="com" items="${detail.CUSTOMER_NAME}" delims="," varStatus="status" >
							    <c:out value="${com}"/>[<c:out value="${fn:split(detail.COMPANY_NAME,',')[status.index]}"/>]
						</c:forTokens>
					</div>
				</div>
				

				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 영업대표
					</div>
					<div class="cont fl_l">${detail.SALES_REPRESENTIVE_NAME}</div>
				</div>
				
				<%-- <div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 해결책임자
					</div>
					<div class="cont fl_l">${detail.CONFIRM_NAME}</div>
				</div>
				 --%>
				 
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span>해결책임자 
					</div>
					<div class="cont fl_l">${detail.SOLVE_OWNER_NAME}</div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l">
						<span class="bullet dot"></span> 이슈영역
					</div>
					<div class="cont fl_l">${detail.ISSUE_CATEGORY}</div>
				</div>
								
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 이슈내용
					</div>
					<div class="cboth cont_box">${fn:replace(detail.ISSUE_DETAIL, enter, "<br/>")}</div>
				</div>
				
				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 이슈발생일
					</div>
					<div class="cont fl_l">${detail.ISSUE_DATE}</div>
				</div>
				
				
				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 이슈해결일
					</div>
					<div class="cont fl_l">${detail.ISSUE_CLOSE_DATE}</div>
				</div> 
				
				<div class="view_cata b_line">
					<div class="ti fl_l w_120">
						<span class="bullet dot"></span> 해결목표일
					</div>
					<div class="cont fl_l">${detail.DUE_DATE}</div>
				</div>
				
				<c:if test="${!empty detail.EVENT_ID}">
					<div class="view_cata b_line">
						<div class="ti fl_l w_120">
							<span class="bullet dot"></span> 연관 고객컨택
						</div>
						<div class="cont fl_l">
							<a href="/clientSalesActive/selectContactDetail.do?pkNo=${detail.EVENT_ID}" class="btn_quick">바로가기</a>
						</div>
		            </div>
	            </c:if>
			
			<div class="view_cata b_line">
                    <div class="ti fl_l">
                        <span class="bullet dot"></span> 메일공유
                    </div>
                    <div class="cont fl_l">      </div>
                </div>

                <div class="view_cata_full">
                    <div class="ti mg_b5">
                        <span class="bullet dot"></span> 첨부파일
                    </div>
                    <div class="cboth cont_box">
                        <ul class="file_list">
                           
                        </ul>
                    </div>
                </div>
			</div>
			
			<div class="cont2 off"><!-- 이슈해결계획 -->
				<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span>이슈해결계획
					</div>
					<div class="cboth cont_box">
						<ul>
							<c:forEach items="${planList}" var="action">
							<li>
								<div class="top top2">
									<span class="title">${fn:replace(action.SOLVE_PLAN, enter, "<br/>")}</span>
									<c:choose>
										<c:when test="${action.STATUS eq 'R'}">
											<span class="status_lec statusColor_red"></span>
										</c:when>
										<c:when test="${action.STATUS eq 'Y'}">
											<span class="status_lec statusColor_yellow"></span>
										</c:when>
										<c:otherwise>
											<span class="status_lec statusColor_green"></span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="cont">
									<span class="fc_gray_light">책임자 : </span> <span class="fc_black">${action.SOLVE_OWNER}</span><br/>
									<span class="fc_gray_light">목표일 : </span> <span class="fc_black">${action.DUE_DATE}</span> / 
									<span class="fc_gray_light">완료일 : </span> <span class="fc_black">${action.CLOSE_DATE}</span>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
	
		<%-- 		<div class="view_cata_full">
					<div class="ti mg_b5">
						<span class="bullet dot"></span> 이슈해결(증빙내용)
					</div>
					<div class="cboth cont_box">${detail.SOLVE_EVIDENCE_DETAIL}</div>
				</div> --%>
	
			</div>
	
		<div class="cont3 off"><!-- Coaching Talk -->
       <div class="view_cata_full">
       	<jsp:include page="/WEB-INF/jsp/m/common/coachingTalkTab.jsp"/>
       </div>
    </div>

		<div class="pg_bottom_func">
			<ul>
				<li><a href="#" class="" onclick="fncList(); return false;"> <img src="${pageContext.request.contextPath}/images/m//icon_list.png" /> <span>목록</span></a></li>
				<li><a href="#" class="" onclick="fncModify(); return false;"> <img src="${pageContext.request.contextPath}/images/m//icon_edit.png" /> <span>수정</span></a></li>
			</ul>
		</div>

	</article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>

</div>

<form method="post" id="updateForm" action="">
    <input type="hidden" id="mode" name="mode" value="upd" />
    <input type="hidden" id="pkNo" name="pkNo" value="${detail.ISSUE_ID}" />
</form>  

<input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}"/>
<input type="hidden" name="hiddenModalSalesId" id="hiddenModalSalesId" value="${detail.SALES_REPRESENTIVE_ID}"/>
<input type="hidden" name="hiddenModalSolveOwnerId" id="hiddenModalSolveOwnerId" value="${detail.SOLVE_OWNER}"/>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">

	function fncList(){
		location.href= '/clientSatisfaction/viewClientIssueList.do';
	}
	
	function fncModify(){
        $("#updateForm").attr("action", "/clientSatisfaction/clientIssueInsertForm.do");
        $('#updateForm').submit();
	}
	
	function fncSelectTab(_no){
		// 탭 이동
		$('#tab_1').removeClass('active');
		$('#tab_2').removeClass('active');
		$('#tab_3').removeClass('active');
		$('#tab_'+_no).addClass('active');
		
		// 탭에 해당하는 컨테이너 보여주기
		$('.cont1').addClass('off');
		$('.cont2').addClass('off');
		$('.cont3').addClass('off');
		$('.cont'+_no).removeClass('off');
	}
	
	$(document).ready(function() {		
		// Coaching Talk 조회
		coachingTalk.view('ISSUE');
		
		// 코칭톡 탭으로 이동
		if('${param.coaching_talk}'.toUpperCase() == 'Y'){
			fncSelectTab('3');
		}
	});
</script>
</body>
</html>