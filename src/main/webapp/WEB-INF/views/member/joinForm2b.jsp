<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">


<title>기업회원가입폼</title>

<meta name="keywords" content="여기어때,회원가입,회원혜택">
<meta name="description"
	content="숙박 어플 이용자 및 제휴점 1위! 숙박 검색 및 예약, 할인, 적립 제공 ">
<meta name="author" content="">
<meta name="robots" content="index,follow">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-title"
	content="이메일 회원가입 : 여기어때 - 국내 1위 숙박어플!">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">

<meta name="format-detection" content="telephone=no,address=no,email=no">

<meta name="naver-site-verification"
	content="27e1bd094d2f12af942addbf4afdb3f479ad0273">

<link rel="canonical" href="https://goodchoice.kr/">


<!-- 공통 CSS  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.css">

<!-- 공통 JS  -->
<script src="${pageContext.request.contextPath}/resources/js/1602931226643913.js" async=""></script>
<script async="" src="${pageContext.request.contextPath}/resources/js/fbevents.js"></script>
<script async="" src="${pageContext.request.contextPath}/resources/js/analytics.js"></script>
<script type="text/javascript">
	function get_version_of_IE () {

		 var word;
		 var version = "N/A";

		 var agent = navigator.userAgent.toLowerCase();
		 var name = navigator.appName;

		 // IE old version ( IE 10 or Lower )
		 if ( name == "Microsoft Internet Explorer" ) word = "msie ";

		 else {
			 // IE 11
			 if ( agent.search("trident") > -1 ) word = "trident/.*rv:";

			 // IE 12  ( Microsoft Edge )
			 else if ( agent.search("edge/") > -1 ) word = "edge/";
		 }

		 var reg = new RegExp( word + "([0-9]{1,})(\\.{0,}[0-9]{0,1})" );

		 if (  reg.exec( agent ) != null  ) version = RegExp.$1 + RegExp.$2;

		 return version;
	}
	/* if(Number(get_version_of_IE()) < 9){
		if(confirm("'여기어때'에서 지원하지 않는 브라우저로 접속하셨습니다.\n\n안전한 접속을 위해서 최신 브라우저로 접속해주세요.\n\n※ '확인'을 누르시면 최신 브라우저 다운로드 페이지로 이동합니다.\n※ '취소'를 누르시면 현재 페이지를 종료합니다.")){
			location.replace('http://browsehappy.com/?locale=ko_KR');
		}else{
			window.open("about:blank","_self").close();
		} 
	}*/
	</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/masonry.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_002.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/imgliquid.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/iscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_003.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>

<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
	<!-- //주메뉴 영역(mWeb용) -->

	<div id="allWrap">


		<!-- 페이지별 호출 소스 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/user.css">
		<script src="js/user.js"></script>

		<script src="js/check.js"></script>

		<script>
	(function($) {
		$(document).ready(function() {
			$('#chkid').click(function() {
				if ( $('input[name="uid"]').val() == '' )
				{
					alert(confirm_msg['joinEmail']['email_chk']);
					$('input[name="uid"]').focus();
					return;
				}

				if ( ! email_chk($('input[name="uid"]').val()))
				{
					$('input[name="uid"]').select();
					return;
				}
			
				$.ajax({
					type: 'POST',
					async: false,
					cache: false,
					url: '/user/userIdDuplChk',
					dataType: 'json',
					data: { 'uid': $('input[name="uid"]').val() },
					success: function(data) {
						console.log(data);
						if ( data.result == 'ok' )
						{
							alert(confirm_msg['joinEmail']['email_ok']);
							$('input[name="duplidchk"]').val('Y');
							$('input[name="upw"]').focus();
						}
						else if ( data.result == 'fail' )
						{
							alert(confirm_msg['joinEmail']['email_used']);
							return;
						}
					},
					error: function() {
						alert(confirm_msg['ajax_fail']);
						location.reload(true);
					}
				});
			});

			$('#chknick').click(function() {

				if ( $('input[name="unick"]').val() == '' )
				{
					alert(confirm_msg['nickname']['null']);
					$('input[name="unick"]').focus();
					return;
				}
				
				if ( ! nick_chk($('input[name="unick"]').val()) )
				{
					$('input[name="unick"]').focus();
					return;
				}

				$.ajax({
					type: 'POST',
					async: false,
					cache: false,
					url: '/user/userNickDuplChk',
					dataType: 'json',
					data: { 'unick': $('input[name="unick"]').val() },
					success: function(data) {
						if ( data.result == 'ok' )
						{
							alert(confirm_msg['joinEmail']['nick_ok']);
							$('input[name="duplnickchk"]').val('Y');
						}
						else if ( data.result == 'fail' )
						{
							alert(confirm_msg['joinEmail']['nick_used']);
						}
					},
					error: function() {
						alert(confirm_msg['ajax_fail']);
						location.reload(true);
					}
				});
			});

			$('.body_wrapper').css({'margin-bottom': '0'});
			$('.login_wrap').css({'height': $(document).height()-48});


//			$('input[name=uid]').focus();
			$('.join_email input').keydown(function(e){
				if (e.keyCode == 13) $('.btn_confirm').click();
			});

			$('.agree_btn').click(function(){
				layer_open('agree_layer');
			
			});

			$('.private_btn').click(function(){
				layer_open('private_layer');
			
			});
		});

		$.duplidreset = function () {
			$('input[name="duplidchk"]').val('');
		};
		$.duplnickreset = function () {
			$('input[name="duplnickchk"]').val('');
		};

		$.joinok = function () {

			if ( $('input[name="uid"]').val() == '' )
			{
				alert(confirm_msg['joinEmail']['email_chk']);
				$('input[name="uid"]').focus();
				return;
			}
			if ( $('input[name="duplidchk"]').val() == '' )
			{
				alert(confirm_msg['joinEmail']['duplidchk']);
				return;
			}
			
			if ( ! email_chk($('input[name="uid"]').val()))
			{
				$('input[name="uid"]').select();
				return;
			}
		
			if ( $('input[name="upw"]').val() == '' )
			{
				alert(confirm_msg['joinEmail']['pw_null']);
				$('input[name="upw"]').focus();
				return;			
			}
			if ( ! password_chk($('input[name="upw"]').val()) )
			{				
				$('input[name="upw"]').focus();
				return;
			}
			
			if ( $('input[name="upwchk"]').val() == '' )
			{
				alert(confirm_msg['joinEmail']['pwchk_null']);
				$('input[name="upwchk"]').focus();
				return;
			}

			if ( $('input[name="upw"]').val() != $('input[name="upwchk"]').val() )
			{
				alert(confirm_msg['joinEmail']['pwmissmatch']);
				$('input[name="upwchk"]').focus();
				return;
			}

			if ( $('input[name="unick"]').val() == '' )
			{
				alert(confirm_msg['nickname']['null']);
				$('input[name="unick"]').focus();
				return;
			}

			if ( ! nick_chk($('input[name="unick"]').val()) )
			{
				$('input[name="unick"]').focus();
				return;
			}

			if ( $('input[name="duplnickchk"]').val() == '' )
			{
				alert(confirm_msg['joinEmail']['duplnickchk']);
				return;
			}
			if ( $('#rolechk').prop('checked') != true ) 
			{
				alert(confirm_msg['joinEmail']['rolechk']);
				return 
			}
			if ( $('#rolechk2').prop('checked') != true ) 
			{
				alert(confirm_msg['joinEmail']['rolechk2']);
				return 
			}

			$('#joinform').submit();
		};
	})(jQuery);
	</script>
		<!-- //페이지별 호출 소스 -->
		
		<!-- 다음 우편번호  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>

		<!--// 다음 우편번호  -->


		<!-- (공통)contentsWrap -->
		<article id="contentsWrap">
	

			<!-- user wrap -->
			<div class="user_wrap row row_cont">

				<!-- user_cont_wrap -->
				<div class="user_cont_wrap">
					<form action="${pageContext.request.contextPath}/join/joinB.gh"
						method="post" accept-charset="utf-8" id="joinform">

						<!-- 회원가입 입력 -->
						<div class="join_email">
							<p class="join_item item_1">
								<label>이메일</label> <input class="ipt ipt_email" size="50"
									maxlength="50" placeholder="이메일 입력" name="email"
									onkeypress="$.duplidreset()" type="email"> <a
									onclick="return false;" class="btn_overlap_chk" id="chkid">중복확인</a>
							</p>
							<p class="join_item item_2">
								<label>비밀번호</label> 
								<input class="ipt ipt_password"	placeholder="영문,숫자 포함 6~20자" name="pw" maxlength="20" type="password">
							</p>
							<p class="join_item item_3">
								<label>비밀번호 확인</label> 
								<input class="ipt ipt_password" placeholder="비밀번호 확인" name="hpwchk" maxlength="20" type="password">
							</p>
							<p class="join_item item_5">
								<label>업체명</label> <input class="ipt ipt_nick"
									placeholder="한글,영문,숫자 포함 2~10자" name="name" maxlength="10"
									onkeypress="$.duplnickreset()" type="text"> 
									<!-- <a class="btn_overlap_chk" id="chknick" onclick="return false;">중복확인</a> -->
							</p>
							<p class="join_item item_6">
								<label>사업자번호</label> <input class="ipt ipt_bizno"
									placeholder="사업자 등록번호" name="biz_no" maxlength="10" onkeypress="$.duplnickreset()" type="text"> 
									<a class="btn_overlap_chk" id="chkbizno" onclick="return false;">중복확인</a>
							</p>
							<p class="join_item item_7">
								<label>우편번호</label> 
								<input class="ipt ipt_add" placeholder="우편번호" id="postcode" name="zip" type="text" readonly="readonly"> 
									 <a class="btn_overlap_chk" id="chkzip" onclick="execDaumPostcode()">우편번호 찾기</a>
							</p>
							<p class="join_item item_7">
								<label>주소</label> 
								<input class="ipt ipt_add" type="text" name="addr1" id="address1" placeholder="주소" readonly="readonly"> 
							</p>
							<p class="join_item item_7">
								<label>상세주소</label> 
								<input class="ipt ipt_add" type="text" name="addr2" id="address2" placeholder="상세주소"> 
							</p>
							<p class="join_item item_7">
								<label>업체번호</label> 
								<input class="ipt ipt_add" type="text" name="tel" id="tel" placeholder="업체번호"> 
							</p>

							<!-- image 입력폼 필요, 임시로 값을 넣음. -->
							<input name="imagename" type="hidden" value="imagename">
							<input name="imagesize" type="hidden" value="imagesize">
							
							<!-- Agree Area -->
							<div class="agree_area">
								<!-- 서비스 이용약관 동의 -->
								<label class="agree_chk"> <input class="ipt_chk"
									name="rolechk" id="rolechk" type="checkbox"> <strong>서비스
										이용약관</strong> 동의
								</label>
								<div class="agree_txt">
									<div class="ag_wrap">
										<!-- 3.0 약관 -->

<script type="text/javascript">
$(function(){

	$('.last_policy').each(function(e){
		$(this).click(function(){
			if ($(this).hasClass('on')){
				$(this).removeClass('on');
				$('.agree_section').eq(e).hide();
				$('span',this).html('보기');
			}else{
				$(this).addClass('on');
				$('.agree_section').eq(e).show();
				$('span',this).html('닫기');
			}
			console.log(e);
		});
	});

});
</script>
									</div>

									<p class="join_info">
										<span>14세 미만 아동은 서비스 사용이 불가합니다</span>
									</p>
								</div>
								<!-- //Agree Area -->

								<div class="btn_area">
									<!-- <a href="" onclick="$.joinok(); return false;"
										class="btn_confirm">가입완료</a> -->
										<input class="btn_confirm" type="submit" value="JOIN">
								</div>
								<p class="join_info">
									<span>비밀번호 분실시 이메일을 통해 확인하므로,</span> <span>정확하게 입력해주세요.</span>
								</p>
							</div>
							<!-- 회원가입 입력 -->
						</div>
					</form>
				</div>
				<!-- //user_cont_wrap -->


			</div>
			<!-- //user wrap -->



		</article>
		<!-- //(공통)contentsWrap -->





		<!-- //레이어 : 내위치 재설정(지도) -->

		<!-- 비회원 예약조회 -->

		<script type="text/javascript">
function setCookie( name, value, expiredays ) { 
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
}

function closeWin() { 
	setCookie( "alertPop", "done" , 1 ); 
	$('.web_adppdown').hide();
} 

cookiedata = document.cookie;    

if ( cookiedata.indexOf("alertPop=done") < 0 ){      
	$('.web_adppdown').show();
} 
else { 
	$('.web_adppdown').hide();
} 
</script>
		<!-- //웹 노출 경고창 -->

		<script>
	 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	 (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	 })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

	 ga('create', 'UA-77719807-2', 'auto');
	 ga('send', 'pageview');
	</script>


		<script type="text/javascript" src="js/wcslog.js"> </script>
		<script type="text/javascript"> 
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_4540c185467c";
	if (!_nasa) var _nasa={};
	wcs.inflow();
	wcs_do(_nasa);
	</script>


		<script type="text/javascript">
	/* <![CDATA[ */
	var google_conversion_id = 964418007;
	var google_conversion_language = "en";
	var google_conversion_format = "3";
	var google_conversion_color = "ffffff";
	var google_conversion_label = "6YMHCM_i81wQ17PvywM";
	var google_remarketing_only = false;
	/* ]]> */
	</script>

	</div>

</body>
</html>