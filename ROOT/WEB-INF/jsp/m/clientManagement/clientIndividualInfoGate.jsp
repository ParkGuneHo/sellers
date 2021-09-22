<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객개인정보</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">

</head>

<body class="white_bg">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

	<!-- location -->
	<div class="location">
		<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<a href="#">고객사 및 고객개인정보</a> 
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<span>고객개인정보</span>
	</div>

	<article class="gate_pg">


		<div class="ta_c">
			<img src="${pageContext.request.contextPath}/images/m/img_search.svg" />
			<p class="fs18">고객개인 <span class="fc_blue">검색</span></p>
		</div>
		
		
		<div class="search_pgin pd_b20">
			<div class="searchArea">
				<input id="searchDetail" type="text" placeholder="고객명 입력" onkeydown="if(event.keyCode == 13){$('#btn_search').click();}"/>
                <a href="#" id="btn_search"><span class="icon_search"></span></a>
                <input type="hidden" name="hiddenModalCreatorId" id="hiddenModalCreatorId"/>
			</div>
		</div>

		<!-- 등록된 고객정보가 없을 떄 -->
		<div class="result_blank off">
			등록된 고객 정보가 없습니다.<br/>
			신규등록 해주세요</a>
		</div>
		<!--// 등록된 고객정보가 없을 떄 -->

		<!-- 접근권한이 없을 떄 -->
		<div class="result_blank off">
			해당 고객정보에 접근 권한이 없습니다.<br/>
			접근권한 부여는 관리자에게 문의해주세요.<br/>
			문의처 : <a href="mailto:admin@gmailcom">admin@gmailcom</a> / <a href="tel:02-0938-1254">02-0938-1254</a>
		</div>
		<!--// 접근권한이 없을 떄 -->

		
		<!-- 검색결과가 있을 경우 -->
		<div class="">
			<div class="pd_l20 pd_r20">검색결과 (총 <span id="result_cnt">0</span>개)</div>
			<ul class="list_type4 mg_b20" id="result_list">
			</ul>
		</div>
		<!--// 검색결과가 있을 경우 -->
		

		
		<a href="#" class="btn_new r2 mg_b20" id="clientIndvidualInsert">고객개인정보 신규 등록</a>
		
	</article>   

	<jsp:include page="../templates/footer.jsp" flush="true"/>


</div>

<div class="modal_screen"></div>

<form id="formSearch" name="formSearch">
    <input type="hidden" id="hiddenSearchType" />
</form>

<form id="formDetail">
    <input type="hidden" id="customer_id"   name="customer_id">
    <input type="hidden" id="company_id"    name="company_id">
    <input type="hidden" id="search_detail" name="search_detail">
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
            pageStart : curCnt,
            pageEnd : rowCount,
            serchInfo : $("#searchDetail").val(),
            creatorId : '${userInfo.MEMBER_ID_NUM}',
            serch : 2,
            datatype : 'json'
        });
	    
	    
		$.ajax({
            url : "/clientManagement/gridClientIndividualInfoList2.do",
            datatype : 'json',
            method: 'POST',
            data : params,
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
			success:function(data){
			    $('#result_list').html('');
			    var list = data.rows;
				var list_html = '';
				for (var i = 0; i < list.length; i++){
					list_html += fncGetItemHtml(list[i], _keyword);
				} 
				
				$('#result_cnt').html(list.length);
				$('#result_list').append(list_html);
			}
		});
	}
	
	//$("#textListSearchDetail").val()
	function fncDetail(_no, companyId, searchDetail){
        $("#formDetail #customer_id").val(_no);
        $("#formDetail #company_id").val(companyId);
        $("#formDetail #search_detail").val(searchDetail);
        $("#formDetail").attr("action", "/clientManagement/viewClientIndividualInfoDetail.do");
        //$("#formDetail").attr("action", "/clientManagement/selectCustomerInfo.do");
        $('#formDetail').submit();
	}

	function fncGetItemHtml(_object, searchDetail){
		var companyId= _object.COMPANY_ID;
		var obj_html = '';
		
		var division = "";
		if (typeof _object.DIVISION != "undefined") {
		    division = _object.DIVISION;
		}//,'+ searchDetail +'
		obj_html += '<li><a href="#" onclick="fncDetail('+ _object.CUSTOMER_ID +','+ companyId +',\''+ searchDetail +'\'); return false;">';//,'+ searchDetail +'
		obj_html += '<span class="top pd_b5">';
		obj_html += '<span class="subject fs22">'+_object.CUSTOMER_NAME+' <span class="fs12">'+_object.POSITION+'</span></span>';
		obj_html += ' <span class="ds_b">'+_object.COMPANY_NAME+' / '+division+'</span>';
		obj_html += '</span>';
		obj_html += '<span class="bottom pd_t5"><span class="name">';
		if (_object.CELL_PHONE != undefined && _object.CELL_PHONE != ''){
			obj_html += '<span>'+_object.CELL_PHONE+'</span>';
		}
		if (_object.CELL_PHONE != undefined && _object.CELL_PHONE != '' && _object.EMAIL != undefined && _object.EMAIL != ''){
			obj_html += ' | ';
		}
		if (_object.EMAIL != undefined && _object.EMAIL != ''){
			obj_html += '<span>'+_object.EMAIL + '</span>';
		}
		obj_html += '</span></span></a><a href="tel:'+_object.CELL_PHONE+'" class="btn_phone_go"><img src="/images/m/icon_phone.png" alt="전화걸기"/></a>';
		obj_html += '</li>';
		
		return obj_html;
	}

	
	$(document).ready(function() {
		$('#btn_search').click(function(e){
			e.preventDefault();
			var search_value = $('#searchDetail').val();
			if (search_value.length > 0){
				fncSearch(search_value);
			} else {
				alert('검색어를 입력해주세요.');
			}
		});
		
        // 고객 등록
        $("#clientIndvidualInsert").on("click", function(e) {
            $('#mode').val("ins");
            $("#inserForm").attr("action", "/clientManagement/clientIndividualInsertForm.do");
            console.log("mode[" +  $('#mode').val() + "]");
            $('#inserForm').submit();       
            e.preventDefault();
        }); 
	});
	
</script>

</body>
</html>