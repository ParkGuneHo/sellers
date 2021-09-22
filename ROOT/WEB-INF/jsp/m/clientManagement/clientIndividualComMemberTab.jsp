<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<ul class="com_member_list">
	<!-- <li>
		<div class="form1"></div>
		<div class="form2"></div>
		<div class="form3"></div>
	</li> -->
</ul>

<a href="#" onclick="comMemberTab.fncShowMore();" class="btn_pg_more r2" id="com_member_btn_more">
	<span class="va_m"></span> <span id="com_member_span_more">더보기</span>
</a>

<script>

var comMemberTab = {
		totalCnt : 0,
		rowCount : 10,
		pkArray : '',
		curCnt : 0,
		
		fncShowMore : function(){
			var params = $.param({
        datatype : 'json',
        jsp : '/clientManagement/clientIndividualInfoListDetail'
     	});
	
     	$.ajax({
         url : "/clientManagement/selectCustomerCompanyList.do",
         datatype : 'json',
         data : {
             companyId : "${companyId}", 
             pageStart : comMemberTab.curCnt,
   	     		 rowCount : comMemberTab.rowCount,
             numberPagingUseYn : 'Y',
             //textSearchClient : "${searchDetail}",
             datatype : "json"
         },
         cache : false,
         method : 'POST',
         beforeSend : function(xhr){
             xhr.setRequestHeader("AJAX", true);
         },
         success : function(data){        	 
         	var companyInfo = data.clientCompany;
         	console.log(companyInfo);
         	if(companyInfo.length > 0){
         		for(var i= 0 ; i < companyInfo.length; i++) {
         			
         			var number = companyInfo[i].CELL_PHONE;
         			var cellPhone = number.substring(0,3) +'-'+ number.substring(3,7) +'-'+ number.substring(7,11);         
         			
         			var list_html = '';
         			list_html += "<li><a href='/clientManagement/viewClientIndividualInfoDetail.do?company_id=" + companyInfo[i].COMPANY_ID +  "&customer_id=" + companyInfo[i].CUSTOMER_ID + "';>";
         			list_html += "<span class='custom_name'>" + companyInfo[i].CUSTOMER_NAME + " <span class='custom_position'>" + companyInfo[i].POSITION +"</span></span>";
         			list_html += "<span class='org'>"+ companyInfo[i].TEAM +"</span></a>";
         			
         			if(number){
         				list_html += "<a href='" + number + "' class='phone'>" + cellPhone + "</a></li>";
         			}
         			
          		$(".com_member_list").append(list_html);
         		}
          	
          	// 카운트
	        	comMemberTab.totalCnt = data.totalCnt;
	        	comMemberTab.curCnt += companyInfo.length;
         	
	     		}else{
	     			$(".com_member_list").html("<li><span class='customer_name'>No data</span><span class='org'>No data</span></li>");
	     		}
         	
         	if (parseInt(comMemberTab.curCnt) >= parseInt(comMemberTab.totalCnt)){
            $('#com_member_btn_more').hide();
          } else {
         		var cnt_html = '더보기 '+comMemberTab.curCnt+' of ' + comMemberTab.totalCnt;
          	$('#com_member_btn_more').html(cnt_html);
          }
	     		
         },
         complete : function(){
         }
     });
	}
}

</script>