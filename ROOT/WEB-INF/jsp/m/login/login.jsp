<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

<%-- <%
Authentication auth = (Authentication)request.getUserPrincipal();

if(auth == null){
     
}else{
    //로그인한 상태라면 권한별 페이지 이동
    //String principal = auth.getAuthorities().toString();
    response.sendRedirect(request.getContextPath() + "/salesActive/listClientContact.do");
}
%> --%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title>THE Seller's</title>
<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet" type="text/css">
</head>

<body class="primary_bg">

<div class="login_container">

    <header class="login ta_c">
        <hgroup>
            <h1 class="logo">THE Seller's</h1>
            <div class="slogan fc_white fs12">셀러들을 위한 소프트웨어입니다.</div>
        </hgroup>
    </header>

    <form id="formLogin" name="formLogin"  method="post"  action="/login"> 
        <article class="login_input ta_c">
            <form class="m-t" role="form" action="">
            	<input type="text" class="form-control" placeholder="회사코드" name="company_cd" id="company_cd" />
                <input type="text"     class="form-control" placeholder="아이디" class="mg_b10" name="member_id_num" id="member_id_num" value="" />
                <input type="password" class="form-control" placeholder="비밀번호" name="password_enc" id="password_enc" />
                <div class="pd_t20 pd_b20 ta_c fc_white">
                    <%-- <a href="#" class="btn_check">
                        <img src="${pageContext.request.contextPath}/images/m/icon_check_outline.svg" id="chk_off" />
                        <img src="${pageContext.request.contextPath}/images/m/icon_check_white.svg" id="chk_on" style="display:none;" />
                    </a> --%>
                    
                    <!-- 아이디 -->
					<%-- <label class="btn_check2">
		               <img src="${pageContext.request.contextPath}/images/m/icon_check_outline.svg" id="chk_off1" />
		                   <img src="${pageContext.request.contextPath}/images/m/icon_check_white.svg" id="chk_on1" style="display:none;" />
		               <input type="checkbox" id="keepLogin" name="keepLogin" style="display: none;"/> <span>로그인 유지</span>
		            </label> --%>
                </div>
                
                <div class="ta_c mg_b10">
                    <button id="login_btn" type="submit" class="btn_login r5"  onclick="mobile();" >로그인</button>
                </div>
                <!-- <a href="findId.do" class="fc_white">아이디/</a><a href="findPw.do" class="fc_white">비밀번호 찾기</a> -->
            </form>
        </article>   
    </form>

    <footer class="fc_white ta_c">
        <div class="mg_b10">Copyright (c) 2016, THE Seller's</div>
    </footer>
    
</div>


<div class="modal_screen"></div>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/common.js?v=1"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">

/* $(document).ready(function(){
	
   $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
           $('#chk_on').css('display', 'inline');
          $('#chk_off').css('display', 'none');
        }else{ // ID 저장하기 체크 해제 시,
           $('#chk_off').css('display', 'inline');
         $('#chk_on').css('display', 'none');
        }
    });
   
   $("#keepLogin").change(function(){ // 체크박스에 변화가 있다면,
       if($("#keepLogin").is(":checked")){ // 로그인 유지 체크했을 때,
          $('#chk_on1').css('display', 'inline');
         $('#chk_off1').css('display', 'none');
       }else{ // ID 저장하기 체크 해제 시,
          $('#chk_off1').css('display', 'inline');
        $('#chk_on1').css('display', 'none');
       }
   });
   
}); */

  function mobile(cc, id,pw){
	   var cc = document.getElementById('company_cd').value;
	   var id = document.getElementById('member_id_num').value;
	   var pw = document.getElementById('password_enc').value;
	   
	   Android.showToast(cc,id,pw);
	}
	
	 function fnSettingCc(cc){
	  	document.getElementById('company_cd').value = cc;
	 }
  
	function fnSettingMemberId(memberIdNum){
   		 document.getElementById('member_id_num').value = memberIdNum;
    }

	function fnSettingPass(pass){
    	document.getElementById('password_enc').value = pass;
   }
	
	function click(){
	   login_btn.click();
	}
</script>

</body>
</html>