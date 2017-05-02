<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">


<title>게하(Guest Hi)</title>

<link rel="canonical" href="https://goodchoice.kr/">


<!-- 공통 CSS  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/user.css">

<!-- 공통 JS  -->
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/1602931226643913.js" async=""></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/fbevents.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/analytics.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/jquery-1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/owl.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/masonry.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/jquery_002.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/imgliquid.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/iscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/jquery_003.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/user.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/js.joinForm/check.js"></script>
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
	
	</script>
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


</head>

<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
	<!-- //주메뉴 영역(mWeb용) -->

	<div id="allWrap">
		<!-- (공통)contentsWrap -->
		<article id="contentsWrap">


			<!-- user wrap -->
			<div class="user_wrap row row_cont">

				<!-- user_cont_wrap -->
				<div class="user_cont_wrap">
					<form action="https://www.goodchoice.kr/user/userJoinInput"
						method="post" accept-charset="utf-8" id="joinform">

						<input name="step" value="3" type="hidden"> <input
							name="utype" value="1" type="hidden"> <input
							name="duplidchk" value="" type="hidden"> <input
							name="duplnickchk" value="" type="hidden">

						<!-- 회원가입 입력 -->
						<div class="join_email">
							<p class="join_item item_1">
								<label>이메일</label> <input class="ipt ipt_email" size="50"
									maxlength="50" placeholder="이메일 입력" name="uid"
									onkeypress="$.duplidreset()" type="email"> <a
									onclick="return false;" class="btn_overlap_chk" id="chkid">중복확인!</a>
							</p>
							<p class="join_item item_2">
								<label>비밀번호</label> <input class="ipt ipt_password"
									placeholder="영문,숫자 포함 6~20자" name="upw" maxlength="20"
									type="password">
							</p>
							<p class="join_item item_3">
								<label>비밀번호 확인</label> <input class="ipt ipt_password"
									placeholder="비밀번호 확인" name="upwchk" maxlength="20"
									type="password">
							</p>
							<p class="join_item item_4">
								<label>닉네임</label> <input class="ipt ipt_nick"
									placeholder="한글,영문,숫자 포함 2~10자" name="unick" maxlength="10"
									onkeypress="$.duplnickreset()" type="text"> <a
									class="btn_overlap_chk" id="chknick" onclick="return false;">중복확인!</a>
							</p>

							<!-- Agree Area -->
							<div class="agree_area">
								<!-- 서비스 이용약관 동의 -->
								<label class="agree_chk"> <input class="ipt_chk"
									name="rolechk" id="rolechk" type="checkbox"> <strong>서비스
										이용약관</strong> 동의
								</label>
								<div class="agree_txt">
									<div class="ag_wrap"></div>
									<p class="join_info">
										<span>14세 미만 아동은 서비스 사용이 불가합니다</span>
									</p>
								</div>
								<div class="btn_area">
									<a href="" onclick="$.joinok(); return false;"
										class="btn_confirm">회원가입!</a>
								</div>
								<p class="join_info">
									<span>비밀번호 분실시 이메일을 통해 확인하므로,</span> <span>정확하게 입력해주세요.</span>
								</p>
							</div>
							<!-- 회원가입 입력 -->
					</form>
				</div>
			</div>
		</article>
	</div>
</body>
</html>