<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="form-group">
	<div class="col-sm-12" style="text-align:center;">
		<h4>해당 고객사 조회 및 수정 가능한 직원을 선택해 주세요.</h4>
	</div>
	<div class="col-sm-12" style="height:250px; overflow:auto;">
		<ul class="checktree">
			<li>
		    	<input id="all" type="checkbox" /><label for="all">전체선택</label>
		    	<ul id="treeLv1">
		    	
		    	</ul>
		  	</li>
		</ul>
		
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		//$("ul.checktree input[type='checkbox']").prop("checked",false);
		groupLv1();
	});
	
	(function($){
	    $.fn.checktree = function(){
	        $(':checkbox').on('click', function (event){
	            event.stopPropagation();
	            var clk_checkbox = $(this),
	            chk_state = clk_checkbox.is(':checked'),
	            parent_li = clk_checkbox.closest('li'),
	            parent_uls = parent_li.parents('ul');
	            parent_li.find(':checkbox').prop('checked', chk_state);
	            parent_uls.each(function(){
	                parent_ul = $(this);
	                parent_state = (parent_ul.find(':checkbox').length == parent_ul.find(':checked').length); 
	                parent_ul.siblings(':checkbox').prop('checked', parent_state);
	            });
	         });
	    };
	}(jQuery));
	
	function groupLv1(){
		var teamList = "";
		var params = {
				datatype : 'json',
				use_yn : "Y"
		}
		$.ajax({
			url : '/clientManagement/infoMemberManage.do',
			datatype : 'json',
			method: 'POST',
			data : $.param(params),
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data){
				var divisionList = data.selelctAllInfoDivisionList;
				teamList = data.selelctAllInfoTeamList;
				for(i=0; i<divisionList.length; i++){
					var html = "";
					html += '<li>';
					html += '<input id="'+divisionList[i].DIVISION_NO+'" type="checkbox" /> <label for="'+divisionList[i].DIVISION_NO+'">'+divisionList[i].DIVISION_NAME+'</label>'
					html += '<ul data-lv="1" id="'+divisionList[i].DIVISION_NO+'"></ul>';
					html += '</li>';
					$("#treeLv1").append(html);
				}
			},
			complete: function(){
				groupLv2(teamList, groupLv3);
			}
		});
	}
	
	function groupLv2(teamList, callback){
		for(i=0; i<teamList.length; i++){
			var html = "";
			html += '<li>';
			html += '<input id="'+teamList[i].TEAM_NO+'" type="checkbox"/> <label for="'+teamList[i].TEAM_NO+'">'+teamList[i].TEAM_NAME+'</label>'
			html += '<ul data-lv="2" id="'+teamList[i].TEAM_NO+'"></ul>';
			html += '</li>';
			$("ul[data-lv='1'][id='"+teamList[i].DIVISION_NO+"']").append(html);
		}
		callback();
	}
	
	function groupLv3(){
		$.ajax({
			url : "/common/searchMemberInfo.do",
			datatype : 'json',
			method: 'POST',
			data : {
				memberName : "" 
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data){
				var memberList = data.list;
				for(i=0; i<memberList.length; i++){
					var html = "";
					html += '<li>';
					html += '<input id="'+memberList[i].MEMBER_ID_NUM+'" data-lv="3" type="checkbox" /> <label for="'+memberList[i].MEMBER_ID_NUM+'">'+memberList[i].HAN_NAME+'</label>'
					html += '</li>';
					$("ul[data-lv='2'][id='"+memberList[i].MEMBER_TEAM+"']").append(html);
				}
			},
			complete: function(){
				setTimeout(function(){
					$("ul.checktree").checktree();	
				},400);
			}
		});
	}
</script>
