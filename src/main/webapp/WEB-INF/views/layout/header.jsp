<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
	
	<title>찜 : 여기어때 - 국내 1위 숙박어플!</title>

	
	<!-- 공통 CSS  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/files/default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/files/owl.css">
	
	<!-- 공통 JS  -->
	<script src="${pageContext.request.contextPath}/resources/files/1602931226643913.js" async=""></script>
	<script async="" src="${pageContext.request.contextPath}/resources/files/fbevents.js"></script>
	<script async="" src="${pageContext.request.contextPath}/resources/files/analytics.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/files/jquery-1.js"></script>

	<script src="${pageContext.request.contextPath}/resources/files/common.js"></script>	
</head>



<!-- 헤더 시작부분 -->

<div id="allWrap">
	
	<!-- HeaderWrap -->
	<header id="headerWrap">
		<input id="resizeurl" value="https://img.goodchoice.kr" type="hidden">

		<section class="row header_area">
<!-- 헤더 로고 -->			<h1 class="header_logo">
				<a href="https://www.goodchoice.kr/" class="btn_home"><img src="${pageContext.request.contextPath}/resources/files/img_logo.png" alt=""></a>
			</h1>
			<a href="#" class="btn_menu">메뉴</a>
			<a href="#" class="btn_m_srch">검색</a>																																																																																																						

			<!-- PC -->
			<div id="mainNavPC">
<!-- 로고 옆 검색 -->				<a href="#" class="btn_search">검색</a>

				<!-- 검색 카테고리 -->
				<div class="nav_list">
					<div class="srch_pop_wrap">
						<div class="pop_bg"></div>
						<div class="srch_pop">
							<ul>
								<li class="srch_around">
									<a href="https://www.goodchoice.kr/search/around">
										<span>내주변 검색</span>
										<strong>위치를 허용하시면 내 주변 업체를 찾을 수 있습니다.</strong>
									</a>
								</li>
								<li class="srch_area">
									<a><span>지역별 검색</span></a>
									<a href="https://www.goodchoice.kr/search/area/" class="area_item dummy" style="display:none"></a>
									<div class="area_list"><a href="https://www.goodchoice.kr/search/area/1" class="area_item" style="">서울</a><a href="https://www.goodchoice.kr/search/area/2" class="area_item" style="">경기</a><a href="https://www.goodchoice.kr/search/area/3" class="area_item" style="">인천</a><a href="https://www.goodchoice.kr/search/area/4" class="area_item" style="">강원</a><a href="https://www.goodchoice.kr/search/area/12" class="area_item" style="">부산</a><a href="https://www.goodchoice.kr/search/area/10" class="area_item" style="">경남</a><a href="https://www.goodchoice.kr/search/area/9" class="area_item" style="">대구</a><a href="https://www.goodchoice.kr/search/area/8" class="area_item" style="">경북</a><a href="https://www.goodchoice.kr/search/area/11" class="area_item" style="">울산</a><a href="https://www.goodchoice.kr/search/area/7" class="area_item" style="">대전</a><a href="https://www.goodchoice.kr/search/area/6" class="area_item" style="">충남</a><a href="https://www.goodchoice.kr/search/area/5" class="area_item" style="">충북</a><a href="https://www.goodchoice.kr/search/area/47" class="area_item" style="">광주</a><a href="https://www.goodchoice.kr/search/area/48" class="area_item" style="">전남</a><a href="https://www.goodchoice.kr/search/area/49" class="area_item" style="">전북</a><a href="https://www.goodchoice.kr/search/area/51" class="area_item" style="">제주</a></div>
								</li>
								<li class="srch_new">
									<a href="https://www.goodchoice.kr/search/renewal"><span>신축 / 리모델링</span></a>
								</li>
							</ul>
						</div>
					</div>
				</div>

								<!-- 로그인후 -->
				<nav class="nav_sub">
					<ul>
						<li class="nav_nick">	
							<div class="my_info">
								<span class="my_nick nickname">이미있는닉넴혜진 님</span>
								<span class="my_img"><img src="${pageContext.request.contextPath}/resources/files/ic_menu_user_default.png" alt=""></span>
															</div>
						</li>
						<li class="link_04"><a href="https://www.goodchoice.kr/service/noticeList">고객센터</a></li>

					</ul>
				</nav>
				
<!-- 헤더의 닉네임 누르면 나타나는 팝업 창 -->
				
				<!-- 마이페이지 플로팅 팝업 -->
				<div class="my_info_detail_wrap">
					<div class="pop_bg"></div>
					<div class="pop_cont">
						<div class="my_info_detail">
							<div class="info_detail">
								<span class="my_img"><img src="${pageContext.request.contextPath}/resources/files/epilp_24.png" class="profile_150x150" alt="user_profile" style="border-radius: 150px;" onerror="this.src = 'https://img.goodchoice.kr/images/web_v2/mypage/img_user_default.png'"></span>
								<span class="my_lv">LV 0</span>
								<span class="my_nick nickname">이미있는닉넴혜진</span>
								<!-- span class="my_nick nickname">이미있는닉넴혜진</span -->
								<span class="btn_ly_close"><img src="${pageContext.request.contextPath}/resources/files/icon_gnb_clse.gif" alt="닫기"></span>
							</div>
							<ul class="info_list">
								<li><a href="https://www.goodchoice.kr/mypage">마이페이지 <span class="btn_go">바로가기</span></a></li>
								<li><a href="https://www.goodchoice.kr/mypage/myZzim">찜<span class="detail_cnt"><span id="top_zzim" class="top_zzim">3</span> 개</span></a></li>
								<li><a href="https://www.goodchoice.kr/mypage/myPoint">포인트 <span class="detail_cnt">0 원</span></a></li>
								<li><a href="https://www.goodchoice.kr/mypage/myCoupon">쿠폰함 <span class="detail_cnt"><strong>0</strong> 개</span></a></li>										
								<li><a href="https://www.goodchoice.kr/mypage/myMsg">메시지 <span class="detail_cnt"><strong class="nmsgcnt">0</strong> / 0 개</span></a></li>

								<li><a href="https://www.goodchoice.kr/mypage/myReserve">예약내역<span class="detail_cnt"><span id="top_order" class="top_order"><strong>0</strong></span> 개</span></a></li>
							</ul>
							<a href="https://www.goodchoice.kr/user/logout" class="btn_logout">로그아웃</a>
						</div>
					</div>
				</div>

			</div>
			<!-- //PC -->

			<!-- 검색 -->
			<div class="srch_top_area pc_srch">
				<div>
					<input class="ipt_srch" placeholder="업체/지역/테마 검색 가능합니다." type="text">
					<a class="btn_srch">검색</a>
				</div>
			</div>
			<!-- //검색 -->

		</section>
	</header>
	<!-- //HeaderWrap -->
	<!-- //(공통)headerWrap -->
	



=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>

	<!-- 공통 CSS  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/files/default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/files/owl.css">
	
	<!-- 공통 JS  -->
	<script src="${pageContext.request.contextPath}/resources/files/1602931226643913.js" async=""></script>
	<script async="" src="${pageContext.request.contextPath}/resources/files/fbevents.js"></script>
	<script async="" src="${pageContext.request.contextPath}/resources/files/analytics.js"></script>
	<script src="${pageContext.request.contextPath}/resources/files/jquery-1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/files/common.js"></script>
		
</head>




<!-- 헤더 시작부분 -->

<div id="allWrap">
	
	<!-- HeaderWrap -->
	<header id="headerWrap">
		<input id="resizeurl" value="https://img.goodchoice.kr" type="hidden">

		<section class="row header_area">
<!-- 헤더 로고 -->			<h1 class="header_logo">
				<a href="https://www.goodchoice.kr/" class="btn_home"><img src="${pageContext.request.contextPath}/resources/files/img_logo.png" alt=""></a>
			</h1>
			<a href="#" class="btn_menu">메뉴</a>
			<a href="#" class="btn_m_srch">검색</a>																																																																																																						

			<!-- PC -->
			<div id="mainNavPC">
<!-- 로고 옆 검색 -->				<a href="#" class="btn_search">검색</a>

				<!-- 검색 카테고리 -->
				<div class="nav_list">
					<div class="srch_pop_wrap">
						<div class="pop_bg"></div>
						<div class="srch_pop">
							<ul>
								<li class="srch_around">
									<a href="https://www.goodchoice.kr/search/around">
										<span>내주변 검색</span>
										<strong>위치를 허용하시면 내 주변 업체를 찾을 수 있습니다.</strong>
									</a>
								</li>
								<li class="srch_area">
									<a><span>지역별 검색</span></a>
									<a href="https://www.goodchoice.kr/search/area/" class="area_item dummy" style="display:none"></a>
									<div class="area_list"><a href="https://www.goodchoice.kr/search/area/1" class="area_item" style="">서울</a><a href="https://www.goodchoice.kr/search/area/2" class="area_item" style="">경기</a><a href="https://www.goodchoice.kr/search/area/3" class="area_item" style="">인천</a><a href="https://www.goodchoice.kr/search/area/4" class="area_item" style="">강원</a><a href="https://www.goodchoice.kr/search/area/12" class="area_item" style="">부산</a><a href="https://www.goodchoice.kr/search/area/10" class="area_item" style="">경남</a><a href="https://www.goodchoice.kr/search/area/9" class="area_item" style="">대구</a><a href="https://www.goodchoice.kr/search/area/8" class="area_item" style="">경북</a><a href="https://www.goodchoice.kr/search/area/11" class="area_item" style="">울산</a><a href="https://www.goodchoice.kr/search/area/7" class="area_item" style="">대전</a><a href="https://www.goodchoice.kr/search/area/6" class="area_item" style="">충남</a><a href="https://www.goodchoice.kr/search/area/5" class="area_item" style="">충북</a><a href="https://www.goodchoice.kr/search/area/47" class="area_item" style="">광주</a><a href="https://www.goodchoice.kr/search/area/48" class="area_item" style="">전남</a><a href="https://www.goodchoice.kr/search/area/49" class="area_item" style="">전북</a><a href="https://www.goodchoice.kr/search/area/51" class="area_item" style="">제주</a></div>
								</li>
								<li class="srch_new">
									<a href="https://www.goodchoice.kr/search/renewal"><span>신축 / 리모델링</span></a>
								</li>
							</ul>
						</div>
					</div>
				</div>

								<!-- 로그인후 -->
				<nav class="nav_sub">
					<ul>
						<li class="nav_nick">	
							<div class="my_info">
								<span class="my_nick nickname">이미있는닉넴혜진 님</span>
								<span class="my_img"><img src="${pageContext.request.contextPath}/resources/files/ic_menu_user_default.png" alt=""></span>
															</div>
						</li>
						<li class="link_04"><a href="https://www.goodchoice.kr/service/noticeList">고객센터</a></li>

					</ul>
				</nav>
				
<!-- 헤더의 닉네임 누르면 나타나는 팝업 창 -->
				
				<!-- 마이페이지 플로팅 팝업 -->
				<div class="my_info_detail_wrap">
					<div class="pop_bg"></div>
					<div class="pop_cont">
						<div class="my_info_detail">
							<div class="info_detail">
								<span class="my_img"><img src="${pageContext.request.contextPath}/resources/files/epilp_24.png" class="profile_150x150" alt="user_profile" style="border-radius: 150px;" onerror="this.src = 'https://img.goodchoice.kr/images/web_v2/mypage/img_user_default.png'"></span>
								<span class="my_lv">LV 0</span>
								<span class="my_nick nickname">이미있는닉넴혜진</span>
								<!-- span class="my_nick nickname">이미있는닉넴혜진</span -->
								<span class="btn_ly_close"><img src="${pageContext.request.contextPath}/resources/files/icon_gnb_clse.gif" alt="닫기"></span>
							</div>
							<ul class="info_list">
								<li><a href="https://www.goodchoice.kr/mypage">마이페이지 <span class="btn_go">바로가기</span></a></li>
								<li><a href="https://www.goodchoice.kr/mypage/myZzim">찜<span class="detail_cnt"><span id="top_zzim" class="top_zzim">3</span> 개</span></a></li>

								<li><a href="https://www.goodchoice.kr/mypage/myReserve">예약내역<span class="detail_cnt"><span id="top_order" class="top_order"><strong>0</strong></span> 개</span></a></li>
							</ul>
							<a href="https://www.goodchoice.kr/user/logout" class="btn_logout">로그아웃</a>
						</div>
					</div>
				</div>

			</div>
			<!-- //PC -->

			<!-- 검색 -->
			<div class="srch_top_area pc_srch">
				<div>
					<input class="ipt_srch" placeholder="업체/지역/테마 검색 가능합니다." type="text">
					<a class="btn_srch">검색</a>
				</div>
			</div>
			<!-- //검색 -->

		</section>
	</header>
	<!-- //HeaderWrap -->
	<!-- //(공통)headerWrap -->
	



>>>>>>> 45a4d7fb8888dda9b0fcb786e575ddc6e1af3b30
</body></html>