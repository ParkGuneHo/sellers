<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<ul class="contact_history_list">
</ul>

<a href="#" onclick="contactTab.fncShowMore(); return false;" class="btn_pg_more r2" id="contact_btn_more">
	<span class="va_m"></span> <span id="contact_span_more">더보기</span>
</a>

<script>

var contactTab = {
		
		totalCnt : 0,
		rowCount : 10,
		pkArray : '',
		curCnt : 0,
		cate : '',
		
		fncInit : function(_cate){
			
			$('.contact_history_list').html('');
			
			contactTab.totalCnt = 0;
			contactTab.rowCount = 10;
			contactTab.pkArray = ''
			contactTab.curCnt = 0;
			contactTab.cate = _cate;
			
			contactTab.fncShowMore();
		},
		
		fncGetItemHtml : function(_object){
			
			var obj_html = "";			
			obj_html += "<li><a href='/clientSalesActive/selectContactDetail.do?pkNo=" + _object.EVENT_ID + "'; ><div class='top'>";
			obj_html += "<span class='title'>";
			obj_html += "<span class='contact_type re va_m'>" + _object.EVENT_CATEGORY + "</span>";
			obj_html += "<span class='va_m'> " + _object.EVENT_SUBJECT + "</span>";
			obj_html += "</span>";
			obj_html += "<span class='custom_name'>소속본부 : " + _object.DIVISION_NAME + " / 보고자 : " + _object.HAN_NAME + "</span>";
			obj_html +=  "<span class='date'>컨택일 : " + _object.EVENT_DATE + "</span>";
			obj_html += "</div></a></li>";
			
			return obj_html;
		},
		
		fncShowMore : function(){
				var params;
				var url;
			
				if(contactTab.cate == 'COM'){
					params = $.param({
	            pageStart : contactTab.curCnt,
	            rowCount : contactTab.rowCount,
	            numberPagingUseYn : "Y",
	            companyId : "${companyId}",
	            searchPKArray : "${companyId}", 
							datatype : 'json'
	        });
					
					url = "/clientManagement/selectCompanyContact.do";
				}else{
					params = $.param({
	            pageStart : contactTab.curCnt,
	            rowCount : contactTab.rowCount,
	            numberPagingUseYn : "Y",
	            customerId : "${customerId}",
	            searchCustomerId : "${customerId}", 
							datatype : 'json'
	        });
					
					url = "/clientManagement/selectCustomerContact.do";
				}			
        
        
        $.ajax({
            type : "POST",
            data : params,
            async: false,
            url: url,
            success:function(data){
                var list = data.clientContactList;;
                var list_html = '';
                                
                if(list && list.length > 0){
                	for (var i = 0; i < list.length; i++){
                        list_html += contactTab.fncGetItemHtml(list[i]);
                    }
                	
                	$('.contact_history_list').append(list_html);
                	
                	// 카운트
                  contactTab.totalCnt = data.totalCnt;
                  contactTab.curCnt += list.length;
                }else{
                	$(".contact_history_list").html("<li><div class='top ta_c'><span class='contact_type r2 va_m'>No data</span></div></li>");
                }  
                
                if (parseInt(contactTab.curCnt) >= parseInt(contactTab.totalCnt)){
                    $('#contact_btn_more').hide();
                } else {
                    var cnt_html = '더보기 '+contactTab.curCnt+' of ' + contactTab.totalCnt;
                    $('#contact_span_more').html(cnt_html);
                }
            }
        });
    }
}

</script>