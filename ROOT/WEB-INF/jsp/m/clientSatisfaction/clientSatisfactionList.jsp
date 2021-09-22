<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>고객만족관리</title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">

</head>

<body class="white_bg">

<div class="container_pg">

	<jsp:include page="../templates/header.jsp" flush="true"/>

    <!-- location -->
    <div class="location">
        <a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <a href="">고객만족</a> 
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <span>고객만족도</span>
    </div>

    <article class="list_pg">

        <div class="topFunc mg_b10">
            <div class="sortArea">
                <div class="dropdown">
                    <!-- 
                    <button class="dropdown-toggle r5 " type="button" />분류 선택
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu w_100 r5 off">
                        <li><a href="#">파트너만족</a></li>
                        <li><a href="#">고객만족</a></li>
                    </ul>
                    -->
                    <label>컨택 방법</label>
                    <select class="form_control" name="selectSatisfactionCategory" id="selectSatisfactionCategory">
                        <option value="고객만족">고객만족</option>
                        <option value="파트너만족">파트너만족</option>
                    </select>
                </div>
            </div>
        </div>

        <ul class="list_type_good" id="result_list">
        </ul>

        <!-- 
        <a href="#" class="btn_pg_more primary_bg r2 fc_white">
            <span class="icon icon_arrow_down md va_m"></span> <span class="va_m">더보기 6 of 6</span>
        </a>
        -->
        
        <a href="#" onclick="fncShowMore(); return false;" class="btn_pg_more r2" id="btn_more">
            <span class="icon icon_arrow_down md va_m"></span> <span class="va_m" id="span_more">더보기 6 of 6</span>
        </a>


    </article>   

    <form method="post" id="detailForm" action="">
        <input type="hidden" id="pkNo" name="pkNo" value="" />
    </form>
    
    <form method="post" id="inserForm" action="">
        <input type="hidden" id="mode" name="mode" value="ins" />
    </form>  

</div>

<div class="modal_screen"></div>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>


<script type="text/javascript">
	//var totalCnt = '${totalCnt}';
	//var curCnt = 0;
    var totalCnt = 0;
    var rowCount = 10;
    var pkArray = '';
    var curCnt = 0;
    var curCategory = '';
    
    var params;
	
	
	function fncDetail(_no){
		//location.href = 'modalClientSatisfaction.do?csatId='+_no;
        console.log("!!!!!!!!!!!!!fncDetail");
        console.log(_no);
        $('#pkNo').val(_no);
        $("#detailForm").attr("action", "/clientSatisfaction/selectClientSatisfactionDetail.do");
        $('#detailForm').submit();
		
	}


	function fncChangeCategory(_cate){
		curCategory = _cate;
		$('div.dropdown button').html(_cate);
		$('.dropdown-menu').hide();

		$.ajax({
			type : "POST",
			data : {
				"searchCategory" : curCategory,
				"searchPKArray" : pkArray ,
				"resultInSearch" : 'N'
			},
			async: false,
			url: "/bizStrategy/selectProjectPlanCount.do",
			success:function(data){
				totalCnt = data.listCount;
				curCnt = 0;
				pkArray = data.searchPKArray;
				$('#result_list').html('');
				$('#btn_more').show();
				fncShowMore();
			}
		});
	}
	
	function fncGetItemHtml(_object){
		var obj_html = '';
		
		obj_html += '<li><a href="#" onclick="fncDetail('+_object.CSAT_ID+');return false;">';
        obj_html += '<span class="top"><span class="icon_rate r5">'+_object.AVG_CSAT_VALUE+'</span>';
        obj_html += '<span class="subject">'+_object.CSAT_SUBJECT+'</span></span>';
		obj_html += '<span class="bottom_div">';
		obj_html += '<span class="box_left"><span class="">참여기업 : '+_object.TOTAL_COUNT+'</span></span>';
		obj_html += '<span class="box_right"><span class="fc_gray_light">'+_object.CSAT_SURVEY_DATE+'</span></span>';
		obj_html += '</span></a></li>';
		
		return obj_html;
	}
	
	$(document).ready(function() {
		if ('${param.notice_event_id}' != ''){
			fncDetail('${param.notice_event_id}');
		}
		
	    fncGetTotalCount();
	    fncShowMore();
	    
        $("#selectSatisfactionCategory").change(function(){
            fncRest();
            fncGetTotalCount();
            fncShowMore();
        });
	    
	});
	
	function fncRest() {
	    curCnt = 0;
	    totalCnt = 0;
	    $('#result_list').html('');
	}
	
    function fncGetTotalCount() {
        params = $.param({
            pageStart : curCnt, //0
            rowCount : rowCount, //20
            latelyUpdateTable : "CLIENT_SAT_LOG",
            satisfactionCategory : $("#selectSatisfactionCategory").val()
        });

        
        $.ajax({
            url : "/clientSatisfaction/selectClientSatisfactionMasterListCount.do",
            async : false,
            datatype : 'json',
            method: 'POST',
            data : params,
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                //page count
                totalCnt = data.listCount;
            },
            complete : function(){
            }
        });
    }	
	
    function fncShowMore(){
        params = $.param({
            pageStart : curCnt, //0
            rowCount : rowCount, //20
            latelyUpdateTable : "CLIENT_SAT_LOG",
            //sortCategory : $("#selectSortCategory").val(),
            satisfactionCategory : $("#selectSatisfactionCategory").val()
            //searchCategory : searchCategory,
            //searchAll : $("#textSearchDetail").val(),
            //searchPKArray : searchPKArray,
            //resultInSearch : function(){
            //    if($("#result-in-search").is(":checked")){
            //        return "Y";
            //    }else{
            //        return "N";
            //    }
            //}
        });
        
        $.ajax({
            type : "POST",
            data : params,
            async: false,
            datatype : 'json',
            url: "/clientSatisfaction/selectClientSatisfactionMasterList.do",
            beforeSend : function(xhr){
                //console.log($("#selectSatisfactionCategory").val());
                xhr.setRequestHeader("AJAX", true);
            },
            success:function(data){
                //console.log("selectClientSatisfactionMasterList");
                //console.log(data);
                
                var list = data.rows;
                var list_html = '';
                
                if(list.length > 0) {
	                for (var i = 0; i < list.length; i++){
	                    list_html += fncGetItemHtml(list[i]);
	                }
	                
	                //console.log(list_html);
	                $('#result_list').append(list_html);
                }
                else {
                	list_html += '<li><a href="javascript:void(0);">';
                	list_html += '<span class="top"><span class="icon_rate r5"></span>';
                	list_html += '<span class="subject">No Data</span></span>';
                	list_html += '<span class="bottom_div">';
                	list_html += '<span class="box_left"><span class=""></span></span>';
                	list_html += '<span class="box_right"><span class="fc_gray_light"></span></span>';
                	list_html += '</span></a></li>';
                	
                    $('#result_list').html(list_html);
                }

                // 카운트
                curCnt += list.length;
                
                if (parseInt(curCnt) >= parseInt(totalCnt)){
                    $('#btn_more').hide();
                } else {
                    var cnt_html = '더보기 '+curCnt+' of ' + totalCnt;
                    $('#span_more').html(cnt_html);
                }
            },
            complete : function(){
            }
        });
    }
    
</script>

</body>
</html>