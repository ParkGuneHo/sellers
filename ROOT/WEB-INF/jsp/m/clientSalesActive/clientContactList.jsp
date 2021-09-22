<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객컨텍관리</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">

</head>

<body class="white_bg">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

	<!-- location -->
	<div class="location">
		<a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg"/></a>
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<a href="">고객영업활동</a> 
		<img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
		<span>고객컨텍내용</span>
	</div>

	<article class="list_pg">
	
        <div class="topFunc_search_new mg_b10">            
            <div class="search_pgin">
                <div class="searchArea">
                    <input type="text" id="textCustomerName" placeholder="고객명 입력" />
                    <a href="#" onClick="fncSearch(); return false;"><span class="icon_search"></span></a>
                </div>
            </div>            
            <a href="#" class="btn btn-primary r5" id="clientContactInsertForm"><span class="">컨택등록</span></a>
        </div>
	
		<!-- 
		<div class="topFunc mg_b10">
			<div class="sortArea fl_l">
				<div class="dropdown">
					<button class="dropdown-toggle r5 " type="button">
						<span id="select_text">컨텍 분류선택</span>
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu w_120 r5 off">
						<li><a href="#" onclick="fncSelectGroup('컨텍 분류선택'); return false;">== 선택 ==</a></li>
						<li><a href="#" onclick="fncSelectGroup('방문'); return false;">방문</a></li>
						<li><a href="#" onclick="fncSelectGroup('마케팅'); return false;">마케팅</a></li>
						<li><a href="#" onclick="fncSelectGroup('SNS'); return false;">SNS</a></li>
						<li><a href="#" onclick="fncSelectGroup('E-mail'); return false;">E-mail</a></li>
						<li><a href="#" onclick="fncSelectGroup('전화'); return false;">전화</a></li>
					</ul>
				</div>
			</div>

			<div class="fl_r">
				<a href="#" class="btn btn-primary r5" onclick="fncRegister(); return false;"> <span class="icon lg icon_pencil_white va_tb"></span> 컨텍등록</a>
			</div>
		</div>
		 -->

		<ul class="list_type1" id="result_list">
		<!-- 내용이 입력됩니다. -->
		</ul>

		<a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more r2" id="btn_more">
			<span class="va_m" id="span_more">더보기 6 of 6</span>
		</a>

	</article>   
	<jsp:include page="../templates/footer.jsp" flush="true"/>
	
	<form id="frm" name="frm">
		
	</form>

    <form method="post" id="inserForm" action="">
        <input type="hidden" id="mode" name="mode" value="ins" />
    </form>    
    
    <form method="post" id="detailForm" action="">
        <input type="hidden" id="pkNo" name="pkNo" value="" />
    </form>

</div>
<div class="modal_screen"></div>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>

<script type="text/javascript">
	var totalCnt = '${totalCnt}';
	var curCnt = 0;
	var eventCategory = '';
	var searchAll = '';
	
	function fncSearch(){
		var textCustomerName = $('#textCustomerName').val();
		if (textCustomerName == '') {
			searchAll = textCustomerName;
			curCnt = 0;
			$('#result_list').html('');
			fncShowMore();
		} else if (textCustomerName.length < 2){
			alert('검색어는 2자 이상 입력해주세요.');
			return;
		} else {
			searchAll = textCustomerName;
			curCnt = 0;
			$('#result_list').html('');
			fncShowMore();
		}
	}
	
	function fncDetail(_no){
		$('#pkNo').val(_no);
		$("#detailForm").attr("action", "/clientSalesActive/selectContactDetail.do?coaching_talk=${param.coaching_talk}");
		$('#detailForm').submit();
	}
	
	function fncGetItemHtml(_object){
		var obj_html = '';
		obj_html += '<li><a href="#" onclick="fncDetail('+_object.EVENT_ID+');return false;">';
		obj_html += '<span class="top">';
		obj_html += '<span class="subject">'+_object.EVENT_SUBJECT+'</span>';
		obj_html += ' <span class="icon_cata r2">'+_object.EVENT_CATEGORY+'</span>';
		obj_html += '</span>';
		obj_html += '<span class="bottom">';
		obj_html += '<span class="name">작성자 : '+_object.HAN_NAME+'</span>';
		
		if(!isEmpty(_object.CUSTOMER_NAME)){
			var customerNameArr = _object.CUSTOMER_NAME.split(",");
			var companyNameArr = _object.COMPANY_NAME.split(",");
			if(customerNameArr.length > 1){
				obj_html += '<span class="name">고객명 : '+customerNameArr[0]+' 외 '+parseInt(customerNameArr.length-1)+'명</span>';
			}else if(customerNameArr.length == 1){
				obj_html += '<span class="name">고객명 : '+customerNameArr[0]+'</span>';
			}else{
				obj_html += '<span class="name"></span>';
			}
			
			if(companyNameArr.length > 1){
				obj_html += '<span class="name">고객사 : '+companyNameArr[0]+' 외 '+parseInt(companyNameArr.length-1)+'개</span>';
			}else if(companyNameArr.length == 1){
				obj_html += '<span class="name">고객사 : '+companyNameArr[0]+'</span>';
			}
			
		}else{
			obj_html += '<span class="name"></span>';
		}
		obj_html += '<span class="date">컨텍일자 : '+_object.EVENT_DATE+'</span>';
		obj_html += '</span></span></a>';
		obj_html += '</li>';
		
		return obj_html;
	}
	
	function fncSelectGroup(_group){
		$('#select_text').html(_group);
		$('.dropdown-toggle').next().toggle();
		$('.caret').toggleClass('caret_up');
		
		if (_group == '컨텍 분류선택') _group = '';
		eventCategory = _group;
		curCnt = 0;
		$('#result_list').html('');
		fncShowMore();
	}
	
	$(document).ready(function() {
		if ('${param.event_id}' != ''){
			fncDetail('${param.event_id}');
		}
		
	    // 컨택등록 이벤트 등록
        $("#clientContactInsertForm").on("click", function(e) {
            //location.href = 'formClientContact.do?mode=I';
            $('#mode').val("ins");
            $("#inserForm").attr("action", "/clientSalesActive/clientContactInsertForm.do");
            console.log("mode[" +  $('#mode').val() + "]");
            $('#inserForm').submit();       
            e.preventDefault();
        });	    
	    
	    $('#result_list').html('');
		fncShowMore();
	});

	function fncShowMore(){
        var listParams = $.param({
            datatype : 'json',
            jsp : '/clientSalesActive/clientContactListAjax'
        });
        
        var countParams = $.param({
            datatype : 'json'
        });
	    
        var params = $.param({
        	currentPage : 1,
        	pagingSize : 10,
            pageStart : curCnt,
            rowCount : 10,
            latelyUpdateTable : "CLIENT_EVENT_LOG",
            //검색조건
            searchCustomerName : $("#textCustomerName").val()
        });   
	    
        //카운트, 최근업데이트, 결과내 검색
        $.ajax({
            url : "/clientSalesActive/selectClientContactCount.do",
            async : false,
            datatype : 'json',
            method: 'POST',
            data : params + "&" + countParams,
            success : function(data){
                console.log(data);
                //page count
                totalCnt = data.listCount;
            },
            complete : function(){
            }
        });	    
	    
      //리스트
	    $.ajax({
	            type : "POST",
	            data : params + "&" + listParams,
	            async: false,
	            datatype : 'json',
	            method: 'POST',
	            url: "/clientSalesActive/selectClientContactList.do",
	            success:function(data){
	                var list = data.rows;
	                var list_html = '';
	                for (var i = 0; i < list.length; i++){
	                    list_html += fncGetItemHtml(list[i]);
	                } 
	                
	                $('#result_list').append(list_html);
	                
	                // 카운트
	                curCnt += list.length;
	                
	                if (parseInt(curCnt) >= parseInt(totalCnt)){
	                    $('#btn_more').hide();
	                } else {
                        var cnt_html = '더보기 '+curCnt+' of ' + totalCnt;
                        //var cnt_html = '더보기';
	                    $('#span_more').html(cnt_html);
	                }
	            }
	        });
	    }
	
	function fncShowMore_20170405(){
		$.ajax({
			type : "POST",
			data : {
				"rows" : 10,
				"lastrow" : curCnt,
				"sord" : "asc",
				"event_category" : eventCategory,
				"searchAll" : searchAll
			},
			async: false,
			datatype : 'json',
			url: "/salesActive/gridClientContact.do",
			success:function(data){
				var list = data.rows;
				var list_html = '';
				for (var i = 0; i < list.length; i++){
					list_html += fncGetItemHtml(list[i]);
				} 
				
				$('#result_list').append(list_html);
				
				// 카운트
				curCnt += list.length;
				
				if (parseInt(curCnt) >= parseInt(totalCnt)){
					$('#btn_more').hide();
				} else {
					var cnt_html = '더보기 '+curCnt+' of ' + totalCnt;
					$('#span_more').html(cnt_html);
				}
			}
		});
	}
</script>
</body>
</html>