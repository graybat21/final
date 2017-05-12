<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
<title><tiles:getAsString name="title"/></title>

<!-- 공통 CSS  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/folder/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/folder/owl_003.css">
</head>
<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
	<!-- 페이지별 화면 load -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/folder/lightgallery.css">
 	<!-- 페이지별 호출 소스 -->
	<link rel="stylesheet" type="text/css"		href="${pageContext.request.contextPath}/resources/folder/search.css">
	<link rel="stylesheet" type="text/css"
		href="/howaboutthis/folder/default_002.css"> 
	<!-- //페이지별 호출 소스 -->
	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">업체상세페이지</h2>
		<!-- 페이지 navi -->
		<script src="${pageContext.request.contextPath}/resources/folder/jquery_003.js"></script>
		<style type="text/css">
#eventSlide_02 {
	position: relative;
}

#eventSlide_02 li {
	display: none;
}

#eventSlide_02 li:first-child {
	display: block;
}

#eventSlide_02 .owl-controls {
	position: absolute;
	bottom: 10px;
	left: 10px;
	width: auto;
	height: 8px;
}

#eventSlide_02 .owl-controls .owl-dot {
	display: inline-block;
}

#eventSlide_02 .owl-controls .owl-dot span {
	display: inline-block;
	width: 8px;
	height: 8px;
	margin-right: 8px;
	background: #fff;
	border-radius: 100%
}

#eventSlide_02 .owl-controls .owl-dot.active span {
	background: #e62a4a;
}

#eventSlide_02 .owl-nav {
	display: none;
}
</style>

<style type="text/css">
.pop_noally p {
	display: block !important;
	text-align: left;
	padding: 0 24px;
}

.pop_noally p:first-child {
	margin: 30px 0;
	color: #ff8a01;
}

.pop_in_naver {
	height: 210px !important;
}

.pop_in_naver .txt {
	height: 95px !important;
}

@media all and (max-width:768px) {
	.pop_noally p:first-child {
		margin: 15px 0 5px 0
	}
	.pop_in_naver {
		height: 165px !important;
	}
	.pop_in_naver .txt {
		height: 60px !important;
	}
}
</style>
		<!-- Menu (search.js 138참고 )-->
		<div class="search_menu">
			<ul>
				<li><a href="#" class="a_room">객실정보</a></li>
				<li><a href="#" class="a_reserve">예약</a></li>
				<li><a href="#" class="a_time">요금 및 시간</a></li>
				<li><a href="#" class="a_notice">공지사항</a></li>
				<li><a href="#" class="a_theme">테마</a></li>
				<li><a href="#" class="a_review on">리뷰</a></li>
			</ul>
		</div>
		
			<a id="bookmark6"></a>
			<div class="ad_info_review row" id="reivew_area"
				style="display: block;">
				<div class="info_title">
					<h4 onclick="javascript:scrollLink('bookmark1', 1000);">
						리뷰 <em>(count개)</em>
					</h4>
				</div>
				<div class="info_cont">
					<div class="review_score">
						<ul class="score_list">
							<li class="score_average"><strong>평균</strong>
								<div class="score_wrap">
									<p class="score_star star_50"></p>
									<span class="score_num">9.8</span>
								</div></li>
							<li class="top"><strong>시설</strong>
								<div class="score_wrap">
									<p class="score_star star_50"></p>
									<span class="score_num">9.8</span>
								</div></li>
							<li><strong>서비스</strong>
								<div class="score_wrap">
									<p class="score_star star_50"></p>
									<span class="score_num">9.8</span>
								</div></li>
							<li class="bottom"><strong>청결</strong>
								<div class="score_wrap">
									<p class="score_star star_50"></p>
									<span class="score_num">9.9</span>
								</div></li>
						</ul>
					</div>

					<div id="review_text" style="display: none;"></div>

					<div class="review_list">
						<ul id="review_list">
							<li>
								<div class="review_user_img">
									<!--리얼리뷰 일때... 2016-03-04 by.심정우-->
									<p>
										<img
											src="${pageContext.request.contextPath}/resources/image/epilp_21.png"
											onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_user_default.png'">
									</p>
									<span>리얼리뷰</span>
								</div>
								<div class="review_user_info">
									<span class="user_name">여기어때회원1445436588</span> <span
										class="user_reg_date">2017.04.25</span>
								</div>

								<div class="score_wrap">
									<p class="score_star star_50"></p>
									<span class="score_num">10.0</span>
								</div>

								<div class="review_cont">
									깨씃하고 고급스러운 디자인 너무 좋아요<br> 로비도 호텔분위기 이곳만 오게 되네요~
								</div> <!-- 이용후기 당첨자 아이콘 --> <!-- //이용후기 당첨자 아이콘 -->
							</li>

							<li class="review_oner">
								<div class="review_user_img">
									<img
										src="${pageContext.request.contextPath}/resources/image/owner_defaultprofile_20160414.png"
										alt="">
								</div>
								<div class="review_user_info">
									<span class="user_name">태릉 호텔 드씨엘사장님</span> <span
										class="user_reg_date">2017.04.25</span>
								</div>

								<div class="review_cont">
									여기어때회원1445436588님 안녕하세요.<br> 드씨엘을 이용해 주셔서 감사드립니다^^ 앞으로도
									만족하실 수 있는 <br> 서비스 제공해 드리도록 노력하겠습니다~ 소중한 후기 감사드립니다 ㅎㅎ
								</div>
							</li>
						</ul>
						 <div class="btn_wrap">
							<a href="javascript:;" class="btn_review_more">더 많은 리뷰보기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- //이용후기 -->
	</article>

</body>
</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
