<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
	
</head>

<body class="pcweb" oncontextmenu="return false" ondragstart="return false">

<div id="allWrap">

	<script type="text/javascript">
	function godelete(){

		if($('#argeeBtn:checked').val() != 'agree'){
				alert('탈퇴 유의사항에 동의해 주세요.');
				return false;
			}

			if(confirm('정말 탈퇴하시겠습니까?\n탈퇴 후, 재가입시 제한을 받을 수 있습니다.') == false){
				return false;
			}
	}
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
					<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
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
<!-- 									<li><span>4.</span>탈퇴 후, 이용후기 및 게시판형 서비스에 등록하신 게시물은 삭제되지 않고 유지됩니다.<br/>     게시물 삭제를 원하시는 경우 반드시 삭제 후 회원탈퇴를 진행해 주세요.</li> -->
									<li><span>3.</span>탈퇴후, 기존 가입 휴대기기로 재 가입 시 첫 혜택을 받을 수 없습니다. (신규 회원 쿠폰, 첫 혜택받기 1000 포인트, 첫 리뷰 작성 1000 포인트 등)</li>
								</ul>
							</div>

							
							<strong>비밀번호 확인<b>본인확인 및 보안을 위해 비밀번호 확인을 해주세요.</b></strong>
							<div class="m_pw">
								<b>본인확인 및 보안을 위해 비밀번호 확인을 해주세요.</b>
								<div class="pw_box">
									<input id="pass" placeholder="비밀번호를 입력해주세요" type="password">
									<a id="passChk2" href="javascript:;" onclick='return checkdeletechk("${sessionScope.session_mem_no}")'>확인</a>
								</div>
							</div>
							<script type="text/javascript">
							function checkdeletechk(session_mem_no){
								var pass = $("#pass").val();
								
								if ( $('#pass').val() == '' )///
								{
									alert('비밀번호를 입력해주세요.');
									$('#password_chk2').focus();
									return false;
								}
								
								
									$.ajax({
										url: 'chkPW.gh',
										type: 'POST',
										dataType: 'text',
										data: { password: pass, session_mem_no: session_mem_no },
										success: function(data) {
											if(data=='1'){
												alert("확인되었습니다.");
												str = '<a id="userOutBtn" href="delete.gh?no='+ session_mem_no +'" onclick="return godelete()">탈퇴하기</a>';
												$(".btn_center").html(str);
												agree = '<input id="argeeBtn" value="agree" type="checkbox">유의사항을 모두 확인하였으며, 해당 내용에 동의합니다.';
												$(".agree > label").html(agree);
											}else if(data=='0'){
												alert("비밀번호가 일치하지 않습니다.");
												$(".btn_center").html("");
											}
											
										},
										error: function(e) {
											alert(e.status);//404경로 500오타나  400 값 (일반적으로 파라미터나 요청값) 200//성공 문제없다 
											alert(e.readyState);//1 = 요청 실패? 2=요청 보넀는데 응답 없다 3= 지금 응답 일부분 받고 끝  4= 응답전부다받았다
											alert(confirm_msg['ajax_fail']);
											//location.reload(true);
										}
									});
								}
							</script>
							<div class="agree">
								<label>
								</label>
							</div>
							<div class="btn_center">
							</div>

						</div>
						<!-- //회원탈퇴 -->

					</div>						
					
				</div>
				<!-- //마이페이지 콘텐츠 -->
			</div>
			
		</div>
		<!-- //마이페이지 wrap -->
		
		<!-- 
		비밀번호 틀리면 0 주고 비밀번호 일치하면 1을 주고
		0이면 틀렸다고 알림창, 탈퇴버튼 비활성화
		1이면 확인되었습니다.알림창, 탈퇴버튼 활성화
		 -->
		
	</article>
	<!-- //(공통)contentsWrap -->

<!-- //레이어 : 본인인증 -->	<!-- //페이지별 화면 load -->


</body></html>