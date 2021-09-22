<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" pageEncoding="UTF-8" %>



<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객사정보</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">

</head>

<body class="white_bg">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

	<!-- location -->
	<div class="location">
		<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<a href="">고객사 및 고객개인정보</a> 
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<span>고객사정보</span>
	</div>

	<article class="gate_pg">
	
		<div class="ta_c">
			<img src="${pageContext.request.contextPath}/images/m/img_search.svg" />
			<p class="fs18">고객사 <span class="fc_blue">검색</span></p>
		</div>

		<div class="search_pgin pd_b20">
			<div class="searchArea">
                <!-- <input id="search_value" type="text" placeholder="고객명 또는 고객사명 입력" /> -->
                <% 
                //<input id="serchDetail" type="text" placeholder="고객명 또는 고객사명 입력" />
                %>
                <input id="textListSearchDetail" type="text" placeholder="고객명 또는 고객사명 입력" onkeydown="if(event.keyCode == 13){$('#btn_search').click();}"/>
                <a href="#" id="btn_search"><span class="icon_search"></span></a>
                <input type="hidden" id=hiddenNone" />
			</div>
		</div>
		
		
		
		<sec:authorize access="hasAnyRole('ROLE_CEO','ROLE_DIVISION','ROLE_TEAM','ROLE_MEMBER')">
			<!-- 등록된 고객정보가 없을 떄 -->
				<div class="result_blank off" id="div_no_result">
					등록된 고객 정보가 없습니다.<br/>
					신규등록 해주세요</a>
				</div>
			<!--// 등록된 고객정보가 없을 떄 -->
			
			<!-- 검색결과가 있을 경우 -->
				<div id="div_result">
					<div class="pd_l20 pd_r20">검색결과 (총 <span id="result_cnt">0</span>개)</div>
						<ul class="list_type4 mg_b20" id="result_list">
					</ul>
				</div>
			<!--// 검색결과가 있을 경우 -->
		</sec:authorize>
		<%--  <sec:authorize ifAnyGranted="ROLE_MEMBER"> --%>
				<!-- 접근권한이 없을 떄 -->
				<div class="result_blank off" id="div_no_permission">
					해당 고객정보에 접근 권한이 없습니다.<br/>
					접근권한 부여는 관리자에게 문의해주세요.<br/>
					문의처 : <a href="mailto:admin@gmailcom">admin@gmailcom</a> / <a href="tel:02-0938-1254">02-0938-1254</a>
				</div>
				<!--// 접근권한이 없을 떄 --> 		 	
	<%-- 	</sec:authorize>   --%>
		
		
		
		<a href="#" class="btn_new r2 mg_b20" id="clientCompanyInsert">고객사 신규 등록</a>

		<div class="guide_pg mg_b20">* 등록된 정보가 없을 경우에 신규등록 해 주세요.</div>
		
		<!-- 
		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more primary_bg r2 fc_white" id="btn_more">
			<span class="icon icon_arrow_down md va_m"></span> <span class="va_m" id="span_more">더보기 6 of 6</span>
		</a>
		 -->

	</article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>

</div>

<div class="modal_screen"></div>

  <!-- form 영역 -->
  
<form id="formSearch" name="formSearch">
	<input type="hidden" id="hiddenSearchType" />
	<input type="hidden" id="hiddenSearchTypeDetailCategory" name="detailCategory"/> 
	<input type="hidden" id="hiddenSearchTypeDetailCompanyName" name="companyName"/> 
	<input type="hidden" id="hiddenSearchTypeSysUpdateDate" name="SysUpdateDate"/>
	<input type="hidden" id="hiddenSearchTypePKArray" name="searchPKArray"/>
	<input type="hidden" id="hiddenSearchTypeResultInSearch" name="resultInSearch"/>
	<input type="hidden" id="hiddenFilePK" name="filePKArray" value=""/>
</form>
  
<form id="formDetail" method="post">
	<input type="hidden" id="customer_id" name="customer_id">
	<input type="hidden" id="company_id" name="company_id">
	<input type="hidden" id="searchDetail" name="searchDetail">
	<input type="hidden" id="opportunity_id" name="opportunity_id">
	<input type="hidden" id="issue_id" name="issue_id">
	<input type="hidden" id="returnProjectMGMTId" name="returnProjectMGMTId">
	<input type="hidden" id="returnPK" name="returnPK">
</form>

<form method="post" id="inserForm" action="">
    <input type="hidden" id="mode" name="mode" value="ins" />
</form>  


<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">

    //var totalCnt = '${totalCnt}';
    var totalCnt = 0;
    var rowCount = 10000;
	var pkArray = '';
	var curCnt = 0;
	var curCategory = '';

    function fncSearch(_keyword){
        var params = $.param({
            serchInfo : $("#textListSearchDetail").val(),
            creatorId : '${userInfo.MEMBER_ID_NUM}',
            pageStart : curCnt,
            pageEnd : rowCount,
            serch : 2,
            datatype : 'json'
        });

        $.ajax({
            //url : "/clientManagement/gridClientCompanyInfoView2.do",
            url : "/clientManagement/gridClientCompanyInfo.do",
            datatype : 'json',
            method: 'POST',
            data : params,
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                console.log("fncSearch keyword[" + _keyword + "]");
                console.log(data);

                var list = data.rows;
                var list_html = '';
                for (var i = 0; i < list.length; i++){
                    list_html += fncGetItemHtml(list[i]);
                } 
                
                if(list.length==0){
                    $('#div_no_result').show();
                    $('#div_result').hide();
                }else{
                    $('#div_result').show();
                    $('#result_cnt').html(list.length);
                    $('#result_list').html(list_html);
                    $('#div_no_result').hide();
                }
            },
            complete : function(){
            }
        });

    }	
	
    function fncDetail(_no){
        $("#formDetail #searchDetail").val($("#textListSearchDetail").val());
        $("#formDetail #company_id").val(_no);
        $("#formDetail").attr("action", "/clientManagement/viewClientCompanyInfoDetail.do");
        $('#formDetail').submit();
    }
    

	function fncGetItemHtml(_object){
		var obj_html = '';
		obj_html += '<li><a href="#" onclick="fncDetail('+_object.COMPANY_ID+');return false;">';
		obj_html += '<span class="subject">'+_object.COMPANY_NAME+'</span>';
		if (_object.CEO_NAME != undefined && _object.CEO_NAME != ''){
			obj_html += '<span class="name">대표 : '+_object.CEO_NAME+'</span>';
		}
		if (_object.COMPANY_TELNO != undefined && _object.COMPANY_TELNO != ''){
			obj_html += '<span class="custom_info">대표전화 : '+_object.COMPANY_TELNO+'</span>';
		}
		obj_html += '</a>';
		if (_object.COMPANY_TELNO != undefined && _object.COMPANY_TELNO != ''){
			obj_html += '<a href="tel:'+_object.COMPANY_TELNO+'" class="btn_phone_go"><img src="/images/m/icon_phone.png" alt="전화걸기"/></a>';
		}
		obj_html += '</li>';
		
		return obj_html;
	}
	
	$(document).ready(function() {
		$('#btn_search').click(function(e){
			e.preventDefault();
			var search_value = $('#textListSearchDetail').val();
			if (search_value.length > 0){
				fncSearch(search_value);
			} else {
				alert('검색어를 입력해주세요.');
			}
		});
		
        // 고객사  등록
        $("#clientCompanyInsert").on("click", function(e) {
            $('#mode').val("ins");
            $("#inserForm").attr("action", "/clientManagement/clientCompanyInsertForm.do");
            //console.log("mode[" +  $('#mode').val() + "]");
            $('#inserForm').submit();       
            e.preventDefault();
        }); 		
		
	});
	
</script>

</body>
</html>