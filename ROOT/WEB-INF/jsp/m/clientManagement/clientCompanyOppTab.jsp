<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<ul class="sale_opp_list">
</ul>

<a href="#" onclick="oppTab.fncShowMore(); return false;" class="btn_pg_more r2" id="opp_btn_more">
	<span class="va_m"></span> <span id="opp_span_more">더보기</span>
</a>

<script>

var oppTab = {
		
		totalCnt : 0,
		rowCount : 10,
		pkArray : '',
		curCnt : 0,
		
		fncGetItemHtml : function(_object){
			var obj_html = "";
			obj_html = "<li><a href='/clientSalesActive/selectOpportunityDetail.do?pkNo=" +_object.OPPORTUNITY_ID + "'>";
			obj_html += "<span class='title'>" + _object.SUBJECT + "</span>";
			obj_html +=  "<span class='cont'>";
			/* obj_html +=  "<span class='price'>예상계약금 : " + opp_list[i].CONTRACT_AMOUNT + "</span>" */;
			obj_html +=  "<span class='date'>계약일 : " + _object.CONTRACT_DATE + "</span>";
			obj_html +=  "</span>";
			obj_html +=  "</a></li>";
			return obj_html;
		},
		
		fncShowMore : function(_cate){
        params = $.param({
            pageStart : oppTab.curCnt,
            rowCount : oppTab.rowCount,
            numberPagingUseYn : "Y",
            companyId : "${companyId}",
						searchPKArray : "${companyId}", 
						datatype : 'json'
        });
        
        $.ajax({
            type : "POST",
            data : params,
            async: false,
            url: "/clientManagement/selectCompanyOpp.do",
            success:function(data){
                var list = data.currentOpportunity;
                var list_html = '';
                
                if(list && list.length > 0){
                	for (var i = 0; i < list.length; i++){
                        list_html += oppTab.fncGetItemHtml(list[i]);
                    }
                  
                    $('.sale_opp_list').append(list_html);

                    // 카운트
                    oppTab.totalCnt = data.totalCnt;
                    oppTab.curCnt += list.length;
                }else{
                	$(".sale_opp_list").html("<li><div class='top ta_c'><span class='sale_opp_type r2 va_m'>No data</span></div></li>");
                }  
                
                if (parseInt(oppTab.curCnt) >= parseInt(oppTab.totalCnt)){
                    $('#opp_btn_more').hide();
                } else {
                    var cnt_html = '더보기 '+oppTab.curCnt+' of ' + oppTab.totalCnt;
                    $('#opp_span_more').html(cnt_html);
                }
            }
        });
    }
}

</script>
