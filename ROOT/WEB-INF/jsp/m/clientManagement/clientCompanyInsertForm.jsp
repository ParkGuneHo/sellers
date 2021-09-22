<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsp/m/common/cache.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport">
<title><c:choose><c:when test="${mode eq 'ins'}">고객사 추가</c:when><c:otherwise>고객사정보 수정페이지</c:otherwise></c:choose></title>

<link href="${pageContext.request.contextPath}/css/m/style.css" rel="stylesheet">

</head>

<body class="white_bg" onload="tabmenuLiWidth();">

<div class="container_pg">

    <jsp:include page="../templates/header.jsp" flush="false"/>

    <!-- location -->
    <div class="location">
        <a href="#" class="home"><img src="${pageContext.request.contextPath}/images/m/icon_home.svg" /></a>
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <a href="">고객사 및 고객개인정보</a> 
        <img src="${pageContext.request.contextPath}/images/m/icon_arrow_gray.svg"/>
        <span>고객사정보</span>
    </div>

    <article class="">
        <div class="title_pg ta_c">
            <c:choose>
                <c:when test="${mode eq 'ins'}">
                    <h2>고객사 신규 등록</h2>
                </c:when>
                <c:otherwise>
                    <h2 class="">${detail.COMPANY_NAME}</h2>
                </c:otherwise>
            </c:choose>        
        
            <a href="javascript:void(0);" class="btn_back" onclick="window.history.back(); return false;">back</a>
        </div>
        <c:if test="${mode eq 'I'}">
            <div class="author" name="divModalNameAndCreateDate" id="divModalNameAndCreateDate">
                <span>2016-08-10</span>
            </div>
        </c:if>

        <div class="pg_cont">
            <form method="post" id="formModalData" class="form-horizontal" enctype="multipart/form-data">
                <div class="cont1 pd_t20">
                    <div class="form_input mg_b20">
                        <label class="">고객사명</label>
                        <input type="text" id="textModalCompanyName" name="textModalCompanyName" class="form_control" />
                    </div>
                    <div class="form_input mg_b20 off">
                        <label class="">고객사 아이디</label>
                        <input type="text" class="form_control" id="textModalCompanyId" name="textModalCompanyId" readonly="readonly"/>
                    </div>
                    <!-- 스탠다드 PC 버전에서 미사용 항목
                    <div class="form_input mg_b20">
                        <label class="">CEO</label>
                        <input type="text" class="form_control"  id="textModalCeoName" name="textModalCeoName" autocomplete="off"/>
                    </div>
                    <div class="form_input mg_b20">
                        <label class="">CIO</label>
                        <input type="text" class="form_control"  id="textModalCioName" name="textModalCioName" autocomplete="off"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label class="">CTO</label>
                        <input type="text" class="form_control"  id="textModalCtoName" name="textModalCtoName" autocomplete="off"/>
                    </div>
                     -->

                    <div class="form_input mg_b20">
                        <label>대표전화</label>
                        <input type="text" class="form_control" id="textModalCompanyTelno" name="textModalCompanyTelno"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label>주소</label>
                        <input type="text" class="form_control" id="textModalPostalAddress" name="textModalPostalAddress"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label>산업분류</label>
                        <select class="form_control" id="selectModalSegmentCode" name="selectModalSegmentCode"></select>
                    </div>

                    <div class="form_input mg_b20">
                        <label>사업자등록번호</label>
                        <input type="text" class="form_control" id="textModalBusinessNumber" name="textModalBusinessNumber"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label>ERP 등록번호</label>
                        <input type="text" class="form_control" id="textModalErpRegCode" name="textModalErpRegCode"/>
                    </div>
                    
                    <div class="form_input mg_b20">
                        <label>홈페이지 주소</label>
                        <input type="text" class="form_control" id="textModalCompanySite" name="textModalCompanySite"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label>업태</label>
                        <input type="text" class="form_control" id="textModalBusinessType" name="textModalBusinessType"/>
                    </div>

                    <div class="form_input mg_b20">
                        <label>종목</label>
                        <input type="text" class="form_control" id="textModalBusinessSector" name="textModalBusinessSector"/>
                    </div>

                    <div class="h_line pd_t10"></div>
                    
                    <% /****************** PC버전에서 조직도 등록 오류가 나서 주석으로 막음  filePK가 null값이 넘어가서 오류 남. 
                        * 2017.06.13 comgyver@dunet.co.kr
                    <!-- 
                    <div class="form_input mg_b20">
                        <label class="">로고 첨부(촬영)</label>
                        <a href="" class="btn lg btn-gray ds_b r5 ta_c">사진첨부 및 촬영</a> <!- 사진첨부 또는 촬영사진 첨부 ->
                        <div class="photo_input ">
                            <img src="${pageContext.request.contextPath}/images/namecard.png" alt="샘플사진" />
                        </div>
                    </div>
                    -->
                    <div class="form_input mg_b20">
                        <label class="">조직도 첨부(촬영)</label>
                        <input type="file" name="fileModalUploadPhoto" id="fileModalUploadPhoto" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#divModalUploadPhoto'))" />
                        <!-- <a href="" class="btn lg btn-gray ds_b r5 ta_c">사진첨부 및 촬영</a>--> <!-- 사진첨부 또는 촬영사진 첨부 --> 
                        <div class="photo_input" id="divModalUploadPhoto">
                            <img id="imgModalInsertPhoto" src="${pageContext.request.contextPath}/images/m/namecard.png" alt="샘플사진" />
                        </div>
                    </div>
                    ******************************/ %>

                </div>
                <input type="hidden" name="hiddenModalPK"          id="hiddenModalPK"        value=""/>
                <input type="hidden" name="hiddenModalItInfoId"          id="hiddenModalItInfoId"        value="0"/>
                <input type="hidden" name="hiddenModalCreatorId"   id="hiddenModalCreatorId" value="${userInfo.MEMBER_ID_NUM}"/>
                <input type="hidden" name="hiddenModalCompanyId"   id="hiddenModalCompanyId"/>
                <input type="hidden" name="hiddenModalSegmentCode" id="hiddenModalSegmentCode"/>
            </form>
        </div>

        <div class="pg_bottom_func">
            <ul>
                <li><a href="#" class="" id="clientCompanyList"> <img src="${pageContext.request.contextPath}/images/m/icon_list.png" /> <span>목록</span></a></li>
                <li><a href="#" class="" id="insertClientCompany"> <img src="${pageContext.request.contextPath}/images/m/icon_edit.png" /> <span>저장</span></a></li>
            </ul>
        </div>

    </article>   

    
</div>

<div class="modal_screen"></div>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/m/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/m/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.js"></script>
<link href="${pageContext.request.contextPath}/js/m/plugins/autocomplete/jquery.auto-complete.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/m/common.js"></script>
<script src="${pageContext.request.contextPath}/js/m/plugins/file/jQuery.MultiFile.min.js"></script>

<script type="text/javascript">

    $(document).ready(function(e){
        
        // 산업분류코드 
        fncTextModalSegmentCode();
        
        //유효성 체크
        validate();
        
        //자동완성 검색
        commonSearch.customer($("#formModalData #textModalCeoName"), $('#formModalData #hiddenModalCeoID'), '', $("#formModalData #textModalCompanyId"));
        commonSearch.customer($("#formModalData #textModalCioName"), $('#formModalData #hiddenModalCioID'), '', $("#formModalData #textModalCompanyId"));
        commonSearch.customer($("#formModalData #textModalCtoName"), $('#formModalData #hiddenModalCtoID'), '', $("#formModalData #textModalCompanyId"));
        
        //유효성 검사
        $("#textModalCompanyName, #selectModalSegmentCode").on("blur",function(e){
            $("#formModalData").find(e.target).valid();
        });
    
        
        //모달 초기화
        $("#divModalNameAndCreateDate").html("<span>작성일 : "+commonDate.year+"-"+commonDate.month+"-"+commonDate.day+"</span>");
        
        // 고객사 목록 조회 페이지 이동
        $("#clientCompanyList").on("click", function(e) {
            location.href = '/clientManagement/viewClientCompanyInfoGate.do';
            e.preventDefault();
        });    
        
        // 저장 
        $("#insertClientCompany").on("click", function(e) {
            insertClientCompany();
            e.preventDefault();
        });         
        
        <c:if test="${mode eq 'upd'}">
            updateDetail('${pkNo}');
        </c:if>          
        
    });

    
    function insertClientCompany(){
    	var browser = getIEVersionCheck();
        var url = "/clientManagement/insertClientCompanyInfo.do";
        <c:if test="${mode eq 'upd'}">
            url = "/clientManagement/updateClientCompanyInfo.do";
        </c:if>       
        try {
            $('#formModalData').ajaxForm({
                url : url,
                type: "POST", 
                async : true,
                data : {
                    datatype : "json",
                    browser : browser
                },
                beforeSubmit: function (data,form,option) {
                    if(!confirm("저장하시겠습니까?")) {
                        return false;
                    }
                },
                beforeSend : function(xhr){
                    xhr.setRequestHeader("AJAX", true);
                },
                success: function(data){
                    //성공후 서버에서 받은 데이터 처리
                    //console.log(data);
                    if(data.cnt > 0){
                        alert("저장하였습니다.");
                        location.href="/clientManagement/viewClientCompanyInfoGate.do";
                    }else{
                        alert("입력을 실패했습니다.\n관리자에게 문의하세요.");
                    }
                },
                complete: function() {
                },
                error: function(){
                    //에러발생을 위한 code페이지
                    alert("오류 발생. 입력을 실패했습니다.\n관리자에게 문의하세요.");
                }   
            });
            $('#formModalData').submit();
        } catch (err) {
            console.log("Error=" + err.message);
        }
        
    }
    
    // 산업분류코드 리스트 박스 생성
    function fncTextModalSegmentCode() {
        var params = $.param({
            datatype : 'json'
        });
        
        $.ajax({ //산업분류코드
            url : "/clientManagement/selectAllIndustrySegmentCode.do",
            async : false,
            datatype : 'json',
            method : 'POST',
            data : params,
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                $("#selectModalSegmentCode").html('<option value="">===선택===</option>');
                $("#selectModalSegmentCode option:eq(0)").attr("selected", "selected");
                if(data.rows.length > 0){
                    for(var i=0; data.rows.length>i; i++){
                        $("#selectModalSegmentCode").append('<option value="'+ data.rows[i].SEGMENT_CODE +'">'+ data.rows[i].SEGMENT_HAN_NAME +'</option>');
                    }
                }else{
                    alert("산업분류코드를 추가해 주세요.");
                }
            },
            complete: function(){
            }
        });
    }
    
    // 파일 첨부시 해당 파일 썸네일을 보여주는 함수.
    function getThumbnailPrivew(html, $target) {
        if (html.files && html.files[0]) {
            var reader = new FileReader();
            console.log(reader);
            console.log(html.files[0]);
            reader.onload = function (e) {
                //$target.html('<img id="imgModalInsertPhoto" border="0" alt="" src='+ e.target.result + ' no-repeat center center; background-size:cover;" />'); 
                $("#imgModalInsertPhoto").attr("src", e.target.result);
            }
            reader.readAsDataURL(html.files[0]);
        }
    }
    
      
    // 수정하기 위한 고객사 데이터 셋팅
    function updateDetail(_pkNo) {
        console.log("this is update detail.");
        console.log(_pkNo);
        
        var params = $.param({
            datatype : 'json',
            jsp : '/clientManagement/clientCompanyInfoTabAjax'
        });
        
        $.ajax({
            url : "/clientManagement/selectCompanyInfo.do",
            datatype : 'json',
            data : {
                "companyId" : _pkNo,
                "datatype" : "json"
            },
            cache : false,
            method : 'POST',
            beforeSend : function(xhr){
                xhr.setRequestHeader("AJAX", true);
            },
            success : function(data){
                var companyInfo = data.gridClientCompanyInfo[0];
                
                //console.log(companyInfo);
                
                $("#textModalCompanyId").val(companyInfo.COMPANY_ID);
                $("#textModalCompanyName").val(companyInfo.COMPANY_NAME);
                $("#textModalCeoName").val(companyInfo.CEO_NAME);
                $("#textModalCioName").val(companyInfo.CEO_NAME);
                $("#textModalCtoName").val(companyInfo.CEO_NAME);
                $("#textModalPostalAddress").val(companyInfo.POSTAL_ADDRESS);
                $("#textModalCompanyTelno").val(companyInfo.COMPANY_TELNO);
                //$("#selectModalSegmentCode").val(companyInfo.SEGMENT_HAN_NAME);
                $("#selectModalSegmentCode").val(companyInfo.SEGMENT_CODE).attr("selected", "selected");
                
                $("#textModalBusinessNumber").val(companyInfo.BUSINESS_NUMBER);
                $("#textModalErpRegCode").val(companyInfo.ERP_REG_CODE);
                $("#textModalCompanySite").val(companyInfo.COMPANY_SITE);
                $("#textModalBusinessType").val(companyInfo.BUSINESS_TYPE);
                $("#textModalBusinessSector").val(companyInfo.BUSINESS_SECTOR);

                $("#hiddenModalCompanyId").val(companyInfo.COMPANY_ID);
                
            },
            complete : function(){
            }
        });
    }
    
    function validate () {
        $("#formModalData").validate({ // joinForm에 validate를 적용
            ignore: '', 
            rules : {
                textModalCompanyName : {
                    required : true,
                    maxlength : 100
                },
                selectModalSegmentCode : {
                    required : true
                },
                selectModalClientCategory : {
                    required : true
                },
/*                      textareaModalContents : {
                    minlength : 1,
                    maxlength : 2000
                },
*/                     
            //pwdConfirm:{required:true, equalTo:"#pwd"}, 
            // equalTo : id가 pwd인 값과 같아야함
            //name:"required", // 검증값이 하나일 경우 이와 같이도 가능
            //personalNo1:{required:true, minlength:6, digits:true},
            // minlength : 최소 입력 개수, digits: 정수만 입력 가능
            //personalNo2:{required:true, minlength:7, digits:true},
            //email:{required:true, email:true},
            // email 형식 검증
            //blog:{required:true, url:true}
            // url 형식 검증
            },
            messages : { // rules에 해당하는 메시지를 지정하는 속성
                selectModalSegmentCode : {
                    required : "산업분류를 선택하세요.", // 이와 같이 규칙이름과 메시지를 작성
                //rangelength:"1글자 이상, 10글자 이하여야 합니다.",
                //digits:"숫자만 입력해 주세요."
                },
                textModalCompanyName : {
                    required : "고객사를 입력하세요."
                },
                selectModalClientCategory : {
                    required : "고객분류를 선택하세요."
                }
                /* textareaModalContents : {
                    maxlength : "2000글자 이하여야 합니다"
                //rangelength:"1글자 이상, 30글자 이하여야 합니다"
                } */
            },
            errorPlacement : function(error, element) {
                if($(element).prop("id") == "textModalCompanyName") {
                    $("#textModalCompanyName").after(error);
                    location.href = "#textModalCompanyName";
                }
                else {
                    error.insertAfter(element); // default error placement.
                }
            }
        });        
    }       
</script>

</body>
</html>