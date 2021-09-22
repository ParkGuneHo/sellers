<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="cboth individual_list">
	<ul></ul>
</div>

<a href="#" onclick="individualTab.fncShowMore(); return false;" class="btn_pg_more r2" id="individual_btn_more">
	<span class="va_m"></span> <span id="individual_span_more">더보기</span>
</a>

<form id="formDetail">
    <input type="hidden" id="customer_id"   name="customer_id">
    <input type="hidden" id="company_id"    name="company_id">
    <input type="hidden" id="search_detail" name="search_detail">
</form>

<script>

var individualTab = {
		totalCnt : 0,
		rowCount : 10,
		pkArray : '',
		curCnt : 0,
		
		fncShowMore : function(){
	    params = $.param({
	      pageStart : individualTab.curCnt,
	      rowCount : individualTab.rowCount,
	      numberPagingUseYn : "Y",
	      companyId : "${companyId}",
				searchPKArray : "${companyId}", 
				datatype : 'json'
	    });
	    
	    $.ajax({
	      type : "POST",
	      data : params,
	      async: false,
	      url: "/clientManagement/selectCompanyInfo.do",
	      success:function(data){
	          individualTab.fncDrawTable(data.clientCompanyList, data.totalCnt); 
	      }
	    });
    },
    
    fncDrawTable : function(list, totalCnt){    	
    	var list_html = '';
    	
   	 	if(list && list.length > 0){
   	 		//$('.individual_list tbody').append('');
   	 		
       	for (var i = 0; i < list.length; i++){
        	list_html += individualTab.fncGetItemHtml(list[i]);
        } 
       	
        $('.individual_list ul').append(list_html);

        // 카운트
        individualTab.totalCnt = totalCnt;
        individualTab.curCnt += list.length;
      }else{
      	$(".individual_list ul").html("<li><div class='top ta_c'><span class='individual_type r2 va_m'>No data</span></div></li>");
      } 
        
      if (parseInt(individualTab.curCnt) >= parseInt(individualTab.totalCnt)){
        $('#individual_btn_more').hide();
      } else {
     		var cnt_html = '더보기 '+individualTab.curCnt+' of ' + individualTab.totalCnt;
      	$('#individual_btn_more').html(cnt_html);
      }
    },
	
		fncGetItemHtml : function(_object){			
			var obj_html = '';
			obj_html += '<li><a href="#" onclick="individualTab.fncGoDetail';
			obj_html += "('"+_object.CUSTOMER_ID+"','"+_object.COMPANY_ID+"','"+_object.CUSTOMER_NAME+"');";
			obj_html += '">';
			obj_html += '<div class="top">';
			obj_html += '<span class="title">' + _object.CUSTOMER_NAME + '('+ _object.CUSTOMER_ID +')</span> ';
			obj_html += '</div>';
			obj_html += '<div class="cont">';
			
			var position = '';
			if(_object.DIVISION){
				position += _object.DIVISION;
			}
			
			if(_object.POSITION){
				if(position){
					position += '/';
				}
				position += _object.POSITION;
			}
			
			if(_object.POSITION_DUTY){
				if(position){
					position += '/';
				}
				position += _object.POSITION_DUTY;
			}
			
			obj_html += '<span class="fc_gray_light">본부/직급/직책 : </span> <span class="fc_black">' + position + '</span><br/>';
			obj_html += '<span class="fc_gray_light">담당업무 : </span> <span class="fc_black">' + _object.DUTY + '</span><br/>';
			obj_html += '<span class="fc_gray_light">관계수립 : </span> <span class="status_lec statusColor_'+_object.RELATION+'"></span><br/>';
			obj_html += '<span class="fc_gray_light">호감도 : </span> <span class="status_lec statusColor_'+_object.LIKEABILITY+'"></span><br/>';
			obj_html += '<span class="fc_gray_light">책임자 : </span> <span class="fc_black">' + _object.HAN_NAME + '</span><br/>';
			obj_html += '<span class="fc_gray_light">휴대전화 : </span> <span class="fc_black">' + _object.CELL_PHONE + '</span><br/>';
			obj_html += '<span class="fc_gray_light">메일주소 : </span> <span class="fc_black">' + _object.EMAIL + '</span>';
			obj_html += '</div>';
			obj_html += '</a></li>';
			return obj_html;
		},
    
    // 고객개인 디테일
    fncGoDetail : function(_no, companyId, searchDetail){    	
    	$("#formDetail #customer_id").val(_no); 				
			$("#formDetail #company_id").val(companyId); 				
			$("#formDetail #search_detail").val(searchDetail);
			$("#formDetail").attr("action", "/clientManagement/viewClientIndividualInfoDetail.do");
			$('#formDetail').submit();
    }
}

</script>