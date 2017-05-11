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

<!-- 헤더 시작부분 -->

<div id="allWrap">
	
	<!-- 페이지별 화면 load -->
		<!-- 페이지별 호출 소스 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/mypage.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/search.css">
<!-- ★★★ -->	<!-- <script src="${pageContext.request.contextPath}/resources/mypage_files/mypage.js"></script> -->
	<!-- <script src="${pageContext.request.contextPath}/resources/mypage_files/search.js"></script> -->
	<script type="text/javascript">
		$(document).ready(function(){

			// 찜해제
			$('.delzzim_btn').click(function(e){
				e.preventDefault();
				e.stopPropagation();

				var $parent = $(this).parent().parent();

				if(confirm("찜을 해제하시겠습니까?")){
					$.ajax({
						type : 'POST',
						async : false,
						cache : false,
						url : '/search/userAdFavorSet',
						data : {'uno' : '4197344', 'ano' : $(this).data('ano'), 'userfavor' : 'Y'},
						dataType : 'json',
						success : function(data){
							if(data.rtv == true){
								alert("해제되었습니다.");
								//$parent.remove();
								location.reload();				
							}else{
								alert("관리자에게 문의하여주세요.");
							}
							
						},
						error : function(e){							
							console.log(e);
						}
					});
				}
			});
		});		
	</script>
	<!-- //페이지별 호출 소스 -->

	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">마이페이지</h2>
		
		<!-- 페이지 navi -->
		
<script src="${pageContext.request.contextPath}/resources/mypage_files/jquery_002.js"></script>

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
		

<!-- 진정한 마이페이지의 시작 -->	
		
		<!-- 마이페이지 wrap -->
		<div class="my_allwrap">
			
			
			<!-- <div class="bg_left"></div> -->
<!-- 바깥으로 빠져나가는 회색 선 없어짐. -->
			<!-- <div class="bg_right"></div> -->
			
			<div class="my_wrap row row_cont">
				<!-- 마이페이지 메뉴 -->
<!-- 좌측 네비게이션 -->					
				<div class="my_menu" style="display:none">
					<h3>마이페이지</h3>
					<ul>
						<li><a href="https://www.goodchoice.kr/mypage/myZzim" class="active">찜</a></li>


						<li><a href="https://www.goodchoice.kr/mypage/myReserve">예약내역</a></li>

						<li><a href="https://www.goodchoice.kr/mypage/myInfo">내정보수정</a></li>
					</ul>
				</div>

								<!-- //마이페이지 메뉴 -->
				
				<!-- 마이페이지 콘텐츠 -->
				<div class="my_contents">				
					
					<!-- my_cont_wrap -->
					<div class="my_cont_wrap">
						
						
						<!-- 찜 리스트 -->
						<div class="my_count">
							<p>
								<strong class="cnt_title">찜한모텔</strong>
								<span class="cnt_num"><em>3</em>개</span>
							</p>
						</div>
						<div class="my_zzim_list">
							
							
							<div class="srch_list_wrap">	
								
							<div class="srch_list ">
							<!-- 리스트 TYPE1 -->
							<ul>
																	<li>
										<a class="link" data-ano="5913" data-uitype="" data-adtype="2" data-viewtype="" href="https://www.goodchoice.kr/search/detailView/5913">
											<div class="ad_thumb">
												<div class="img_wrap imgLiquidFill" style="overflow: hidden; background-image: none;">
																										<span class="top1000">Top1000</span><!-- TOP 1000 --> 													<span class="thumb_none"></span>
													<img src="${pageContext.request.contextPath}/resources/image/00e2fd6aac7074a4a9fd019bf26de81a.jpg" alt="HOTEL 여기어때 - 잠실" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'" style="opacity: 1; visibility: visible; max-width: none; max-height: none; width: auto; height: 100%; display: block; image-rendering: auto; margin-left: -69px; margin-top: 0px;">
													<span class="opacity"></span><!-- 그라데이션 배경 -->
												</div>
											</div>

											<div class="txt">
												<p class="name">
													HOTEL 여기어때 - 잠실													<span>방이동 12.9km</span>&nbsp;

																										 <b>신축</b> 													 <b>TOP1000</b> 												</p>
												<p class="score">추천해요 9 (2899)</p>
												<p class="distance">12.9km 방이동</p>

																																							<!--도보가-->
														<p class="price col_fff">대실 25,000원</p>
																									
																																																					<!--예약가-->
																													<p class="price">숙박예약 60,000원~</p>
																																							
												<p class="icon">
																										 <span class="box_red">TOP1000</span> 																									</p>
																									<p class="bene">#최저가보장 #예약취소가능 #회원가보장 #적립카드 </p>
																								
												<p></p>
											</div>
										</a>
									</li>
								<!-- G4, 키워드 검색 -->
																	<li>
										<a class="link" data-ano="749" data-uitype="" data-adtype="5" data-viewtype="" href="https://www.goodchoice.kr/search/detailView/749">
											<div class="ad_thumb">
												<div class="img_wrap imgLiquidFill" style="overflow: hidden; background-image: none;">
																																							<span class="thumb_none"></span>
													<img src="${pageContext.request.contextPath}/resources/image/02.jpg" alt="신촌 파르페" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'" style="opacity: 1; visibility: visible; max-width: none; max-height: none; width: auto; height: 100%; display: block; image-rendering: auto; margin-left: -69px; margin-top: 0px;">
													<span class="opacity"></span><!-- 그라데이션 배경 -->
												</div>
											</div>

											<div class="txt">
												<p class="name">
													신촌 파르페													<span>노고산동 4.0km</span>&nbsp;

																																																			</p>
												<p class="score">만족해요 8 (2053)</p>
												<p class="distance">4.0km 노고산동</p>

																									
																											<!--예약가-->
																													<p class="price">대실예약 15,000원~</p>
																																							
																																																					<!--예약가-->
																													<p class="price">숙박예약 <b>35,000~</b> <strong>30,000원~</strong><span class="box_org">특가</span></p>
																																							
												<p class="icon">
																																																			</p>
																									<p class="bene">#최저가보장 #예약취소가능 </p>
																								
												<p></p>
											</div>
										</a>
									</li>
								<!-- G4, 키워드 검색 -->
																	<li>
										<a class="link" data-ano="4471" data-uitype="" data-adtype="3" data-viewtype="" href="https://www.goodchoice.kr/search/detailView/4471">
											<div class="ad_thumb">
												<div class="img_wrap imgLiquidFill" style="overflow: hidden; background-image: none;">
													<span class="ad_img">50%쿠폰</span><!-- 50프로쿠폰 --> 													<span class="top1000">Top1000</span><!-- TOP 1000 --> 													<span class="thumb_none"></span>
													<img src="${pageContext.request.contextPath}/resources/image/650ddac45f0cd66c9fea33778dceadf2.jpg" alt="태릉 마가렛" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'" style="opacity: 1; visibility: visible; max-width: none; max-height: none; width: auto; height: 100%; display: block; image-rendering: auto; margin-left: -69px; margin-top: 0px;">
													<span class="opacity"></span><!-- 그라데이션 배경 -->
												</div>
											</div>

											<div class="txt">
												<p class="name">
													태릉 마가렛													<span>묵동 10.1km</span>&nbsp;

																																							 <b>TOP1000</b> 												</p>
												<p class="score">추천해요 9 (572)</p>
												<p class="distance">10.1km 묵동</p>

																									
																											<!--예약가-->
																													<p class="price">대실예약 25,000원~</p>
																																							
																																																					<!--예약가-->
																													<p class="price">숙박예약 50,000원~</p>
																																							
												<p class="icon">
																										 <span class="box_red">TOP1000</span> 																									</p>
																									<p class="bene">#최저가보장 #예약취소가능 #회원가보장 </p>
																								
												<p></p>
											</div>
										</a>
									</li>
								<!-- G4, 키워드 검색 -->
																</ul>
								</div>
								</div>
							
							
							<!-- //리스트 TYPE1 -->
													</div>
						<!-- //찜 리스트 -->	
						
						<!-- 페이징 -->
						<div class="svc_paging">
														
						</div>
						<!-- //페이징 -->
					
					</div>
					<!-- //my_cont_wrap -->
						
				</div>
				<!-- //마이페이지 콘텐츠 -->
			</div>
			
		</div>
		<!-- //마이페이지 wrap -->
		
		
		
	</article>
	<!-- //(공통)contentsWrap -->
	

	<!-- //페이지별 화면 load -->
</div>		

</body></html>