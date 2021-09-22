<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="cboth essue_list">
	<ul>
	</ul>
</div>

<a href="#" onclick="issueTab.fncShowMore(); return false;" class="btn_pg_more r2" id="issue_btn_more">
	<span class="va_m"></span> <span id="issue_span_more">더보기</span>
</a>

<script>

var issueTab = {
		
		totalCnt : 0,
		rowCount : 10,
		pkArray : '',
		curCnt : 0,
		
		fncGetItemHtml : function(_object){
			var obj_html = "";
			
			var color_value = _object.ISSUE_STATUS_TEXT;
    		
   		if(color_value == "#f20056" && color_value != null){
   			
				var red_value = "<span class='status_lec statusColor_red'></span>";
				obj_html += "<li><a href='/clientSatisfaction/selectClientIssueDetail.do?pkNo=" + _object.ISSUE_ID + "'><div class='top'>"
				obj_html += "<span class='title'>" + _object.ISSUE_SUBJECT + "</span> "
				obj_html += red_value;
				
			}else if(color_value == "#1ab394" && color_value != null){
				
				var green_value = "<span class='status_lec statusColor_green'></span>";
				obj_html += "<li><a href='/clientSatisfaction/selectClientIssueDetail.do?pkNo=" + _object.ISSUE_ID + "'><div class='top'>"
				obj_html += "<span class='title'>" + _object.ISSUE_SUBJECT + "</span> "
				obj_html += green_value;
				
			}else if(color_value == "#ffc000" && color_value != null){
				
				var yellow_value = "<span class='status_lec statusColor_yellow'></span>";
				obj_html += "<li><a href='/clientSatisfaction/selectClientIssueDetail.do?pkNo=" + _object.ISSUE_ID + "'><div class='top'>"
				obj_html += "<span class='title'>" + _object.ISSUE_SUBJECT + "</span> "
				obj_html += yellow_value;
			};
			
			obj_html += "</div>";
			obj_html += "<div class='cont'>";
			obj_html += "<span class='fc_gray_light'>책임자 : </span> <span class='fc_black'>" + _object.SALES_REPRESENTIVE_NAME + "</span><br/>";
			obj_html += "<span class='fc_gray_light'>목표일 : </span> <span class='fc_black'>" + _object.ISSUE_DATE + "</span> / ";
			obj_html += "<span class='fc_gray_light'>완료일 : </span> <span class='fc_black'>" + _object.DUE_DATE + "</span>";
			obj_html += "</div></a></li>";
			
			return obj_html;
		},
		
		fncShowMore : function(_cate){
        params = $.param({
            pageStart : issueTab.curCnt,
            rowCount : issueTab.rowCount,
            numberPagingUseYn : "Y",
            companyId : "${companyId}",
						searchPKArray : "${companyId}", 
						datatype : 'json'
        });
        
        $.ajax({
            type : "POST",
            data : params,
            async: false,
            url: "/clientManagement/selectCompanyIssue.do",
            success:function(data){
                var list = data.clientIssue;
                var list_html = '';
                
                if(list && list.length > 0){
                	for (var i = 0; i < list.length; i++){
                      list_html += issueTab.fncGetItemHtml(list[i]);
                  }
                
                  $('.essue_list ul').append(list_html);

                  // 카운트
                  issueTab.totalCnt = data.totalCnt;
                  issueTab.curCnt += list.length;
                }else{
                	$(".essue_list ul").html("<li><div class='top ta_c'><span class='essue_type r2 va_m'>No data</span></div></li>");
                }  
                
                if (parseInt(issueTab.curCnt) >= parseInt(issueTab.totalCnt)){
                    $('#issue_btn_more').hide();
                } else {
                    var cnt_html = '더보기 '+issueTab.curCnt+' of ' + issueTab.totalCnt;
                    $('#issue_span_more').html(cnt_html);
                }
            }
        });
    }
}

</script>