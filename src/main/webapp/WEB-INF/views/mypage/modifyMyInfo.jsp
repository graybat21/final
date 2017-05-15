<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>

	
</head>

<body class="pcweb" oncontextmenu="return false" ondragstart="return false"> <!--<![endif]-->
	
	<!-- 페이지별 화면 load -->
		<!-- 페이지별 호출 소스 -->
	<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		//로그아웃
		$('.btn_logout').click(function(){
			if(!confirm(confirm_msg['logout_confirm'])) return false;
			location.replace('/user/logout');
		});

		//비밀번호 변경 레이어
		$('.btn_change_pw').click(function(){
			$('#upw, #nupw, .pw_chk').val('');
			$('html').css('overflow','hidden');
			layer_open('changePw');
		});

		//비밀번호 변경
		$('#change_pw').click(function(){
			var chk_pw_msg = confirm_msg['password']['chk'];
			var chk_obj = {'.ori_pw':'','.pw':'','.pw_chk':''};

			var pw_chk = true;
			$.each(chk_obj,function(obj){
				if ( $(obj).val() == '' )
				{
					alert(chk_pw_msg[obj]);
					$(obj).focus();
					pw_chk = false;
					return false;
				}else{

					if( ! password_chk($(obj).val()) )
					{
						$(obj).focus();
						pw_chk = false;
						return false;
					}
				}
			});
			if(pw_chk == false) return false;
			
			if ( $('.pw').val() != $('.pw_chk').val() )
			{
				alert(confirm_msg['password']['missmatch']);
				$('.pw_chk').focus();
				return;
			}

			$.ajax({
				type: 'POST',
				async: false,
				cache: false,
				url: '/mypage/userPasswordReset',
				dataType: 'json',
				data: { 'upw' : $('#upw').val(), 'nupw' : $('#nupw').val() },
				success: function(data) {
					if(data.rtv == false){
						alert(data.errmsg);
						$('#upw').select();
						//location.reload(true);
					}else {
						alert(confirm_msg['password']['ok']);
						location.replace('/user/logout/login');
					}
					
				},
				error: function(e) {
					alert(confirm_msg['ajax_fail']);
					location.reload(true);
				}
			});
		});

		//본인인증 레이어		
		$('.btn_certify').click(function(){
			layer_open('certifyUser');
		});

		var CBA_window;
		
		//휴대폰 인증
		$('#phone_auth').click(function(){
			CBA_window = window.open('', 'PCCWindow', 'width=430, height=560, resizable=1, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );

			if(CBA_window == null){ 
				 alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
			}

			document.phone_reqCBAForm.action = 'https://pcc.siren24.com/pcc_V3/jsp/pcc_V3_j10.jsp';
			document.phone_reqCBAForm.target = 'PCCWindow';
			document.phone_reqCBAForm.submit();
		});

		//아이핀 인증
		$('#ipin_auth').click(function(){
			CBA_window = window.open('', 'IPINWindow', 'width=450, height=500, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );

			if(CBA_window == null){ 
				alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
			}

			document.reqCBAForm.action = 'https://ipin.siren24.com/i-PIN/jsp/ipin_j10.jsp';
			document.reqCBAForm.target = 'IPINWindow';
			document.reqCBAForm.submit();
		});
	});
	</script>
	<!-- //페이지별 호출 소스 -->

	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">마이페이지</h2>
		
		<!-- 페이지 navi -->
		
<script src="${pageContext.request.contextPath}/resources/mypage_files/jquery_003.js"></script>

<script>
	$(document).ready(function(){
		$('.bxslider').bxSlider({
			mode: 'vertical',
			auto: true,
			controls : false,
			pager : false

		});
	});
</script>

		<!-- 마이페이지 wrap -->
<!-- 해봄 위에 얇은줄만 없어짐 --><div class="my_allwrap">
	<!-- 해봄 왼쪽메뉴바 사라짐 -->		<div class="my_wrap row row_cont">
				<!-- 마이페이지 메뉴 -->
<!-- 해봄 왼쪽메뉴바 망가짐 -->				
<div class="my_menu" style="display:none">
					<h3>마이페이지</h3>
					<ul>
						<li><a href="">찜</a></li>

						<li><a href="">예약내역</a></li>

						<li><a href="" class="active">내정보수정</a></li>
					</ul>
				</div>
				
				<!-- 마이페이지 콘텐츠 -->
<!-- 해봄  -->				<div class="my_contents">
					
					<!-- my_cont_wrap  얘가 오른쪽 페이지 줄짧게 만드는?애 없애면 길어짐 -->
					<div class="my_cont_wrap">
						
						
						<!-- 내정보 수정 -->
						<div class="myinfo_title">
							<strong>내정보 수정</strong>
							<span>회원정보를 수정할 수 있습니다.</span>
						</div>
						
						<div class="myinfo_table ">
								<table>
									<tr>
										<th>이메일</th>
										<td>
											이메일주소 가져오																						
											<a class="btn_logout">로그아웃</a>
										</td>
									</tr>
									
									<tr>
										<th>본인인증</th>
										<td>
																						인증필요
											<a class="btn_certify">본인인증</a>
																					</td>
									</tr>


									<tr>
										<th>비밀번호</th>
										<td>
											******
											<a class="btn_change_pw">변경</a>
										</td>
									</tr>
								</table>

							
						</div>

						<div class="btn_withdraw">
							<a href="https://www.goodchoice.kr/mypage/withdraw">회원탈퇴</a>
						</div>

						<style type="text/css">
						.btn_withdraw{text-align:right;margin-top:20px;}
						@media all and (max-width:768px){
							.btn_withdraw{margin-top:200px;}
						}
						</style>

						<!-- //내정보 수정 -->

					</div>
					<!-- //my_cont_wrap -->
						
				</div>
				<!-- //마이페이지 콘텐츠 -->
			</div>
</div>
		<!-- //마이페이지 wrap -->
	</article>
	<!-- //(공통)contentsWrap -->
	
<!-- 레이어 : 비밀번호 변경 -->
<div class="layer_allwrap">
<div class="layer_bg"></div>
<div class="layer_wrap" id="changePw" style="margin-top: 0px; margin-left: 0px;">
	
	<div class="layer_title">
		<h3>비밀번호 변경</h3>
		<a href="" class="layer_close">X</a>
	</div>
	<div class="layer_cont">
		<h4>기존 비밀번호</h4>
		<p class="ipt_txt"><input placeholder="기존 비밀번호 입력" id="upw" class="ori_pw" type="password"></p>
		<h4>새로운 비밀번호 입력</h4>
		<p class="ipt_txt"><input placeholder="영문, 숫자 포함 6~20자" id="nupw" class="pw" type="password"></p>
		<p class="ipt_txt"><input placeholder="비밀번호 확인" class="pw_chk" type="password"></p>
		<div class="noneblock" style="padding: 0px;"></div>
	</div>
	<div class="layer_btn">
		<a id="change_pw" class="ly_btn">확인</a>
	</div>
	
</div>
</div>
<!-- //레이어 : 비밀번호 변경 -->

<!-- 레이어 : 본인인증 -->
<form name="phone_reqCBAForm" method="post">
	<input name="reqInfo" value="A9B446CC19D7CD2546B4FE5D78D321A625F4EE5B7FA37EC21D80FA87FBFD303444136020A56C420E4892D22C04A2369D5ACAB1F4245040D88A22FA9759AFE060C800DC6D2EB7B758E0A695D479C7AF79D741D92C07A50C0C4BE151F98D0ACE39F319DD430BAA712BC6CBC1A8A7466C54DD65942E19C489E1EA29C6E8E9C8019082DA98884118D8C8B89E2F6F97B6949B9BB61ED1D83B1AF09E65C6469B0CC4EF6000750EA4DB53BC9D0E6A6BBB0FC3BC698AD41007ACD5CA444E072900407E0A2FCFD95D14B4B0A9813D63592E3A8A679C54BB7C89EAD3ABCA6EAFA42D1BF720A791B7F6B39B7947CE376FF71478C69EB400A07715D034D1B97F27ED19C2B1237CEB2E7762EBF4D7B56E4A9E6CD36A2B93727C67A55B1F6D5F12E8B7F9D73BDF" type="hidden">
	<input name="retUrl" value="31http://www.goodchoice.kr/credit/phoneresult" type="hidden">
	<!--<input type="submit" id="phoneok" value="본인확인서비스 요청" >-->
</form>
<form name="reqCBAForm" method="post">
	<input name="reqInfo" value="7C5077E40880E85E9ACE278D0BFF12EB1707A99486E9FAB0C6A73FFD29B9713E9F730C170617ABE99784616CD688B973C02428ECE354271813FC9DB899D59552574E75CAC5BDBDD7D967B58FEBD7A8BC18F2971AC4441EB82168567FC741F5657E042BB8663F5F7039EB7E9DF69D4389E8A09FEAC6D22B40432A7F3B73DE610C36FCC2F27119830D14C318E7AD1C566251386A4F261CB5474602D238305FA8A9D5F1291BCFA7D51650E965E10587ED437F23BF277BE7CA8D52EE12187CA88B89" type="hidden">
	<input name="retUrl" value="24http://www.goodchoice.kr/credit/ipinresult?mode=R&amp;uno=4197344&amp;uid=taejin2533@naver.com&amp;type=&amp;postno=" type="hidden">
	<!--<input type="submit" id="ipinok" value="아이핀서비스 요청">-->
</form>

<div class="layer_allwrap">
<div class="layer_bg"></div>
<div class="layer_wrap" id="certifyUser" style="margin-top: 0px; margin-left: 0px;">
	
	<div class="layer_title">
		<h3>본인인증</h3>
		<a class="layer_close">X</a>
	</div>
	<div class="layer_cont">
		<div class="certify_info">
			<p><span>여기어때</span><span>본인인증시 제공되는 정보는</span><span>인증기관에서 수집하며,</span><span>인증 수단 이외의 용도로</span><span>사용하지 않습니다.</span></p>
		</div>
	</div>
	<div class="layer_btn btn_type_2">
		<a class="ly_btn btn_1" id="phone_auth">휴대폰 인증</a>
		<a class="ly_btn btn_2" id="ipin_auth">아이핀 인증</a>
	</div>
	
</div>
</div>
</body></html>