<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
	
	<!-- 공통 CSS  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/owl.css">
	
	<!-- 공통 JS  -->
	<script src="${pageContext.request.contextPath}/resources/mypage_files/1602931226643913.js" async=""></script><script async="" src="${pageContext.request.contextPath}/resources/mypage_files/fbevents.js"></script><script async="" src="${pageContext.request.contextPath}/resources/mypage_files/analytics.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/mypage_files/jquery-1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/jquery_004.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/owl.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/masonry.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/imgliquid.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/iscroll.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/jquery_003.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/common.js"></script>	
</head>

<body class="pcweb" oncontextmenu="return false" ondragstart="return false">


<div id="allWrap">
	
	<!-- 페이지별 화면 load -->
		<!-- 페이지별 호출 소스 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/mypage.css">
	<script src="${pageContext.request.contextPath}/resources/mypage_files/mypage.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mypage_files/jquery-ui-1.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){

		//탈퇴하기
		$('#userOutBtn').click(function(e){
			e.preventDefault();

			if($('#password_chk').val() != 'Y'){
				alert('비밀번호 확인을 해주세요.');
				return false;
			}
						
			if($('#argeeBtn:checked').val() != 'argee'){
				alert('탈퇴 유의사항에 동의해 주세요.');
				return false;
			}

			if(!confirm('정말 탈퇴하시겠습니까?\n탈퇴 후, 재가입시 제한을 받을 수 있습니다.')) return false;

			var rs_type = $('.reason input[name=reason_type]:checked').val();
			var rs_txt = $('.reason input[name=reason_type]:checked').parent().text();

			if(rs_type == '6'){
				rs_txt = $('#reason_txt').val();
			}

			$.ajax({
				type: 'POST',
				async: false,
				cache: false,
				url: '/mypage/userOut',
				dataType: 'json',
				data: { 
					'reason_type' : rs_type
					,'reason_txt' : rs_txt
				},
				success: function(data) {
					if(data.rtv == false){
						alert(confirm_msg['ajax_fail']);
						location.reload(true);
					}else {
						alert('탈퇴처리가 완료되었습니다.');
						location.replace('/user/logout');
					}
					
				},
				error: function(e) {
					alert(confirm_msg['ajax_fail']);
					location.reload(true);
				}
			});
		});
	});
	</script>
	
	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">마이페이지</h2>
		
		<!-- 마이페이지 wrap -->
		<div class="my_allwrap">
			
			
<!-- 			<div class="bg_left"></div>
			<div class="bg_right"></div> -->
			
			<div class="my_wrap row row_cont">
				<!-- 마이페이지 메뉴 -->
				
				<div class="my_menu" style="display:none">
					<h3>마이페이지</h3>
					<ul>
						<li><a href="https://www.goodchoice.kr/mypage/myZzim">찜</a></li>


						<li><a href="https://www.goodchoice.kr/mypage/myReserve">예약내역</a></li>

						<li><a href="https://www.goodchoice.kr/mypage/myInfo">내정보수정</a></li>
					</ul>
				</div>

								<!-- //마이페이지 메뉴 -->
				
				<!-- 마이페이지 콘텐츠 -->
				<div class="my_contents">

					<!-- my_cont_wrap -->
					<div class="my_cont_wrap withdraw_wrap">

						<!-- 회원탈퇴 -->
						<div class="withdraw">
							<h4>회원 탈퇴하기</h4>
							<strong>여기어때 회원 탈퇴시 아래의 사항을 반드시 확인하시기 바랍니다.</strong>
							<div class="txt_top">
								<ul>
									<li><span>1.</span>현재 사용하고 계신 계정 정보는 복구가 불가합니다.</li>
									<li><span>2.</span>탈퇴후 회원정보 및 개인 서비스 이용 기록은 모두 삭제됩니다.<br>(업체 혜택받기 내역, 포인트 적립내역, 쿠폰 적립내역, 메시지함, 친구초대 내역)</li>
									<li>
										<span>3.</span>적립된 포인트는 모두 소멸됩니다. 소멸된 포인트는 어떠한 경우에도 복구 할 수 없습니다.
										<!-- 잔여포인트-->
										<div><b>잔여포인트</b>0원</div>
									</li>
<!-- 									<li><span>4.</span>탈퇴 후, 이용후기 및 게시판형 서비스에 등록하신 게시물은 삭제되지 않고 유지됩니다.<br/>     게시물 삭제를 원하시는 경우 반드시 삭제 후 회원탈퇴를 진행해 주세요.</li> -->
									<li><span>4.</span>탈퇴후, 기존 가입 휴대기기로 재 가입 시 첫 혜택을 받을 수 없습니다. (신규 회원 쿠폰, 첫 혜택받기 1000 포인트, 첫 리뷰 작성 1000 포인트 등)</li>
								</ul>
							</div>

							
							<strong>비밀번호 확인<b>본인확인 및 보안을 위해 비밀번호 확인을 해주세요.</b></strong>
							<div class="m_pw">
								<b>본인확인 및 보안을 위해 비밀번호 확인을 해주세요.</b>
								<div class="pw_box">
									<input id="password" placeholder="비밀번호를 입력해주세요" type="password">
									<input id="password_chk" value="N" type="hidden">
									<a id="passChk" href="">확인</a>
								</div>
							</div>
							<script type="text/javascript">
							$(document).ready(function(){
								//비밀번호 확인
								$('#passChk').click(function(e) {
									e.preventDefault();
									if ( $('#password').val() == '' )
									{
										alert('비밀번호를 입력해주세요.');
										$('#password').focus();
										return;
									}
								
									$.ajax({
										type: 'POST',
										async: false,
										cache: false,
										url: '/mypage/chkPW',
										dataType: 'json',
										data: { 'upw': $('#password').val() },
										success: function(data) {
											//console.log(data);
											if ( data.rtv == true )
											{
												alert('확인되었습니다.');
												$('#password_chk').val('Y');

												$('#passChk').hide();
												$('#password').attr('readonly',true);
											}
											else
											{
												alert('비밀번호가 일치하지 않습니다.');
												$('#password').focus();
												return;
											}
										},
										error: function(e) {
											console.log(e);
											alert(confirm_msg['ajax_fail']);
											//location.reload(true);
										}
									});
								});
							});
							</script>
							<div class="agree">
								<label>
									<input id="argeeBtn" value="argee" type="checkbox">유의사항을 모두 확인하였으며, 해당 내용에 동의합니다.
								</label>
							</div>

							<div class="btn_center">
								<a id="userOutBtn" href="">탈퇴하기</a>
							</div>

						</div>
						<!-- //회원탈퇴 -->

					</div>						
					
				</div>
				<!-- //마이페이지 콘텐츠 -->
			</div>
			
		</div>
		<!-- //마이페이지 wrap -->
		
		
		
	</article>
	<!-- //(공통)contentsWrap -->

<!-- //레이어 : 본인인증 -->	<!-- //페이지별 화면 load -->


</body></html>