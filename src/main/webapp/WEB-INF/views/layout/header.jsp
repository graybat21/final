<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- 공통 CSS  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/owl.css">
<!-- 공통 JS  -->
<script	src="${pageContext.request.contextPath}/resources/files/1602931226643913.js"></script>
<script src="${pageContext.request.contextPath}/resources/files/fbevents.js"></script>
<script src="${pageContext.request.contextPath}/resources/files/analytics.js"></script>
<script	src="${pageContext.request.contextPath}/resources/files/jquery-1.js"></script>
<script	src="${pageContext.request.contextPath}/resources/files/common.js"></script>

<!-- <script src="//code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-latest.js"></script> -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<style>
.mw_layer{display:none;position:fixed;_position:absolute;top:0;left:0;z-index:10000;width:100%;height:100%}
.mw_layer.open{display:block}
.mw_layer .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
#layer{
	position:absolute;width:250px;top:25%;left:40%;margin:0px auto;padding:0px 28px 0 28px;
	border:2px solid #1e90ff;background:#fff;font-size:12px;font-family:Tahoma, Geneva, sans-serif;
	color:#767676;line-height:normal;white-space:normal; 
}
.login_line{margin:10px 0 0;height:80px;}
.box_in{float:left;margin:0 10px 0; }
.box_in input{width:120px;height:24px;display:block;margin:3px 0 0;}
.btn_login{
			width:72px;height:60px;background:#363636;color:#a6a6a6;float:left;
			line-height:60px;text-align:center;margin-top:5px;
			cursor: pointer;
			}
#layer h2{color:#636363;font-size:24px;line-height:40px;}
.close { margin-bottom:10px; text-decoration: none; width:100%; text-align:right; cursor: pointer}
.close a { color: #ff3300; }
#loginTbl tr td{
	font-size:11px;
	font-family : 'NanumGothic';
}
</style>

<script>
	jQuery(function($) {
		var layerWindow = $('.mw_layer');
		var layer = $('#layer');
		// Show Hide
		$('.layer_trigger').click(function() {
			layerWindow.addClass('open');
		});
		$('#layer .close').click(function() {
			layerWindow.removeClass('open');
		});
		// ESC Event
		$(document).keydown(function(event) {
			if (event.keyCode != 27)
				return true;
			if (layerWindow.hasClass('open')) {
				layerWindow.removeClass('open');
			}
			return false;
		});
		// Hide Window
		layerWindow.find('>.bg').mousedown(function(event) {
			layerWindow.removeClass('open');
			return false;
		});
	});

	function loginCheck() {
		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요.");
			return;
		} else if ($("#pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		} else {
			document.loginForm.submit();
		}
	}
</script>

</head>

<div id="allWrap">
	<!-- HeaderWrap -->
	<header id="headerWrap">
		<input id="resizeurl" value="https://img.goodchoice.kr" type="hidden">
		<section class="row header_area">
			<!-- 헤더 로고 -->
			<h1 class="header_logo">

				<a href="/GuestHi/" class="btn_home"><img
					src="${pageContext.request.contextPath}/resources/files/img_logo.png"
					alt=""></a>
			</h1>
			<a href="#" class="btn_menu">메뉴</a> <a href="#" class="btn_m_srch">검색</a>

			<!-- PC -->


			<!-- 로그인전 -->
			<c:if test="${session_member_email == null }">
				<nav class="nav_sub">
					<ul>
						<li class="link_01">
							<a href="#layer" class="layer_trigger">로그인</a>
							</li>
						<li class="link_02"><a
							href="${contextPath}/GuestHi/member/member.gh">회원가입</a></li>
						<!-- <li class="link_03"><a href="#"
                     onclick="guest_reserve_open();return false;" class="m_reserve">예약내역</a></li> -->
						<li class="link_04"><a href="">고객센터</a></li>
					</ul>
				</nav>
			</c:if>

			<!-- 로그인후 -->
			<c:if test="${session_member_email != null }">
				<nav class="nav_sub">
					<ul>
						<li class="nav_nick">
							<div class="my_info">
								<span class="my_nick nickname">${session_member_name}&nbsp;님</span> <span
									class="my_img"><img
									src="${pageContext.request.contextPath}/resources/files/ic_menu_user_default.png"
									alt=""></span>
							</div>
							
						</li>
						<li class="link_01">
							<a href="logout.gh" class="layer_trigger">로그아웃</a>
						</li>
						<li class="link_04"><a href="">고객센터</a></li>
					</ul>
				</nav>
			</c:if>
			<!-- 헤더의 닉네임 누르면 나타나는 팝업 창 -->

			<!-- 마이페이지 플로팅 팝업 -->
			<%-- <div class="my_info_detail_wrap">
            <div class="pop_bg"></div>
            <div class="pop_cont">
               <div class="my_info_detail">
                  <div class="info_detail">
                     <span class="my_img"><img
                        src="${pageContext.request.contextPath}/resources/files/epilp_24.png"
                        class="profile_150x150" alt="user_profile"
                        style="border-radius: 150px;"
                        onerror="this.src = 'https://img.goodchoice.kr/images/web_v2/mypage/img_user_default.png'"></span>
                     <span class="my_lv">LV 0</span> <span class="my_nick nickname">이미있는닉넴혜진</span>
                     <!-- span class="my_nick nickname">이미있는닉넴혜진</span -->
                     <span class="btn_ly_close"><img
                        src="${pageContext.request.contextPath}/resources/files/icon_gnb_clse.gif"
                        alt="닫기"></span>
                  </div>
                  <ul class="info_list">
                     <li><a href="https://www.goodchoice.kr/mypage">마이페이지 <span
                           class="btn_go">바로가기</span></a></li>
                     <li><a href="https://www.goodchoice.kr/mypage/myZzim">찜<span
                           class="detail_cnt"><span id="top_zzim" class="top_zzim">3</span>
                              개</span></a></li>
                     <li><a href="https://www.goodchoice.kr/mypage/myPoint">포인트
                           <span class="detail_cnt">0 원</span>
                     </a></li>
                     <li><a href="https://www.goodchoice.kr/mypage/myCoupon">쿠폰함
                           <span class="detail_cnt"><strong>0</strong> 개</span>
                     </a></li>
                     <li><a href="https://www.goodchoice.kr/mypage/myMsg">메시지
                           <span class="detail_cnt"><strong class="nmsgcnt">0</strong>
                              / 0 개</span>
                     </a></li>

                     <li><a href="https://www.goodchoice.kr/mypage/myReserve">예약내역<span
                           class="detail_cnt"><span id="top_order"
                              class="top_order"><strong>0</strong></span> 개</span></a></li>
                  </ul>
                  <a href="https://www.goodchoice.kr/user/logout" class="btn_logout">로그아웃</a>
               </div>
            </div>
         </div> --%>

<!-- 로그인 jquery폼 -->
<form method="post" action="login.gh" name="loginForm">
		<div class="mw_layer">
			<div class="bg"></div>
			<div id="layer">
				<h2 style="border-bottom: 1px solid black;">LOGIN</h2>
				<div class="login_line">
					<div class="box_in">
						<input type="text" name="email" id="email" size="23"
							placeholder="이메일" value="a@a"> <!-- 이메일 자동입력 -->
						<input type="password" name="pw"
							id="pw" size="23" placeholder="비밀번호" value="1"><!-- 비번 자동입력 -->
					</div>

					<input type="submit" class="btn_login" onclick="loginCheck()"
						value="LOGIN">
				</div>

				<div class="close">
					<table width="100%" id="loginTbl">
						<tr>
							<td width="30%" align="left" onclick="">회원가입</td>
							<td width="50%;" align="left">아이디/비밀번호 찾기</td>
							<td width="20%" align="right"><a href="#layer_anchor"
								title="레이어 닫기" class="close">닫기</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
<!-- 검색 -->
<!-- <div class="srch_top_area pc_srch">
	<div>
		<input class="ipt_srch" placeholder="업체/지역/테마 검색 가능합니다." type="text">
		<a class="btn_srch">검색</a>
	</div>
</div> -->
<!-- //검색 -->

</section>
</header>
<!-- //HeaderWrap -->
<!-- //(공통)headerWrap -->
</div>
</body>
</html>