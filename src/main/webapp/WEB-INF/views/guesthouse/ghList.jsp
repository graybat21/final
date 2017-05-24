<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	
	<title>서울 : 여기어때 - 국내 1위 숙박어플!</title>

</head>
<!-- 조건 검색 폼에 사용되는 JS, CSS -->
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">			<!-- 객실 / 인원 외의 박스의 CSS -->
	<link href="${pageContext.request.contextPath}/resources/css/jqx.css" rel="stylesheet">			
	<link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/select2.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/slick.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/date-picker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/isotope-docs.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/select2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/parallax.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/scrollreveal.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<!-- <body class="pcweb" oncontextmenu="return false" ondragstart="return false"> -->


<!-- <div id="allWrap"> -->
	
	<!-- 페이지별 화면 load -->

	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">지역별 검색 결과</h2>
		
	<!-- 검색 조건 폼 -->
	
		<div class="wrapper-inner">
			
			<div class="container">
				<!--main-fill-->
				<div class="main-fill ">
					<!--tabs-->
					<div class="panel">
						
						<!--panel-body-->
						<div class="panel-body">
						
							<!--tab-content-->
							<div class="tab-content">

								<!--tabhotel-->
								<div class="tab-pane fade in active" id="tabhotel">
									<h3>Search and Book Hotels</h3>
									<ul class="list-inline list-unstyled">
										<li>
											<div class="form-group">
												<input class="form-control" placeholder="GuestHi!" type="text">
											</div>
										</li>
										<li>
											<div class="form-group">
												<input class="form-control hasDatepicker" placeholder="Check In" id="datepicker3" type="text"><img class="ui-datepicker-trigger" src="/ghtest/image/icon-calendar.png" alt="Select date" title="Select date">
											</div>
										</li>
										<li>
											<div class="form-group">
												<input class="form-control hasDatepicker" placeholder="Check Off" id="datepicker4" type="text"><img class="ui-datepicker-trigger" src="/ghtest/image/icon-calendar.png" alt="Select date" title="Select date">
											</div>
										</li>
										<li><select class="select-one">
												<option selected="selected">1 Room</option>
												<option>2 Room</option>
												<option>3 Room</option>
												<option>4 Room</option>

										</select></li>

										<li><select class="select-one">
												<option>1 Guest</option>
												<option selected="selected">1 Guest</option>
												<option>2 Guest</option>
												<option>No One</option>

										</select></li>
										
										
										<!-- <li><select class="select-one">
												<option>1 Children</option>
												<option selected="selected">1 Children</option>
												<option>2 Children</option>
												<option>3 Children</option>
												<option>No One</option>

										</select></li> -->
										
										
										<li>
											<div class="form-group">
												<input class="form-control" placeholder="Max budget (Optional)" type="text">
											</div>
										</li>
										<!--   search now -->
										<li><a href="http://teamworktec.com/demo/travel-gateway/html/hotel/hotels_list_one/left_sidebar.html" class="btn btn-search-travel">Search Now!!!!!</a></li>
									</ul>
								</div>

							</div>
						</div>
						<!--end panel body-->
					</div>
					<!--end tabs-->
				</div>
			</div>
		</div>
		
		
<!-- 위에까지 -->

<!-- 상세 조건 검색 -->
<link href="${pageContext.request.contextPath}/resources/css/checkbox.css" rel="stylesheet">
	<div class="options">

		
		<table class="check" width="1060">
		
		<tr>
			<th><div class="h5">상세 조건 검색</div></th>
		</tr>
			<tr>
				<td>객실 유형</td>
				<td><input type="checkbox" name="options" value="1"> 여성전용</td>
				<td><input type="checkbox" name="options" value="1"> 남성전용</td>
				<td><input type="checkbox" name="options" value="1"> 혼성</td>
			</tr>
			
			<tr height="10">
			</tr>
			
			<tr>
				<td>부가 시설</td>
				<td><input type="checkbox" name="options" value="1"> 객실 안 화장실</td>
				<td><input type="checkbox" name="options" value="1"> 객실 안 샤워실</td>
				<td></td>
			</tr>
			
			<tr height="10">
			</tr>
			
			<tr>
				<td colspan="4" align="right">검 색</td>
			</tr>
		</table>

	</div>
	
	
		<!-- 검색 wrap -->
		<div class="search_allwrap">
			
<!-- 지역 설정 영역 종료 후 호텔 리스트 영역 시작 -->
			<!-- 검색 옵션/필터 설정 영역 -->
			<div class="srch_option_wrap">
				
				<form action="/search/area/18" id="filter_form" method="GET">
					<input name="word" id="word" value="" type="hidden">
					<input name="arino" id="arino" value="18" type="hidden">
					<input name="orderby" id="orderby" value="N,ASC" type="hidden">
					<input name="benefitroom" id="benefitroom" value="N,N" type="hidden">
					<input name="theme" id="theme" value="" type="hidden">
					<input name="usetype" id="usetype" value="" type="hidden">
					<input name="minprice" id="minprice" value="10000" type="hidden">
					<input name="maxprice" id="maxprice" value="300000" type="hidden">	
					<input name="type" id="type" value="area" type="hidden">
					<input name="page" id="page" value="1" type="hidden">
					<input name="limitcnt" id="limitcnt" value="999999" type="hidden">
				</form>

				<!-- 결과 상단 필터/소팅 영역 -->

				<!-- 결과 상단 필터/소팅 영역 -->
				<div class="option_wrap" id="filterArea">
					<div class="option_select row">
												
						
						<div class="option_sorting">
							<!-- 필터중일경우 filter_on 클래스 추가 -->
							<div class="srch_sorting">
								<select class="orderby">
																		<option value="N,ASC" selected="selected">기본순서로 보기</option>
																		<option value="D,ASC">대실 요금 낮은 순 ▼</option>
																		<option value="D,DESC">대실 요금 높은 순 ▲</option>
																		<option value="S,ASC">숙박 요금 낮은 순 ▼</option>
																		<option value="S,DESC">숙박 요금 높은 순 ▲</option>
																		<option value="R,DESC">평점 높은 순 ▲</option>
																		<option value="E,DESC">후기 많은 순 ▲</option>
																	</select>
							</div>
						</div>
					</div>
					<div class="option_filter_selected">
						<p></p>
					</div>
				</div>
				<!-- //결과 상단 필터/소팅 영역 -->
				
							</div>
			<!-- //검색 옵션/필터 설정 영역 -->
			
			<!-- 리스트 -->

			<div class="srch_list_wrap">
				<div id="toppreloader" class="preloader" style="display:none;"><img src="/ghtest/list_files/run.gif" class="loading_img"></div>

					<div class="srch_result">
						<div class="srch_group ui_0">
							<div class="list_header list_g5">								
								<h5><strong class="font_b">프리미엄 플러스</strong></h5>								
							</div>
							
					<style type="text/css">
					.ad_top{display:none;}
					</style>
					
				<div class="srch_list list_g5">
					
								
								
	<ul>
		<li>
			<a class="link" data-ano="4556" data-uitype="2" data-adtype="4" data-viewtype="4">
				<div class="ad_thumb">
					<div class="img_wrap imgLiquidFill">
						<img src="/ghtest/list_files/81c9376839ac91a6d0d3043fccd18453_002.jpg" alt="삼성 베드스테이션" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'">
						<span class="opacity"></span><!-- 그라데이션 배경 -->
					</div>
				</div>

			<div class="txt">
				<p class="name">
					삼성 베드스테이션					<span>삼성동 8.9km</span>&nbsp;

																			</p>
				<p class="score">만족해요 8 (271)</p>
				<p class="distance">8.9km 삼성동</p>

									
											<!--예약가-->
													<p class="price">대실예약 20,000원~</p>
															
																					<!--예약가-->
													<p class="price">숙박예약 50,000원~</p>
															
				<p class="icon">
																																	<span class="box_green">· 무한숙박 · 요금할인 · 무한대실</span>
															</p>
												<ul><li>· 15시 이전 도보이용시 익일 13시까지 이용</li><li>· 연박 사용 시 추가 요금 없이 종일 이용가능</li><li>· 대실조조 이벤트</li></ul>
				
					<p></p>
				</div>
			</a>
		</li>	
		
		<li>
			<a class="link" data-ano="2084" data-uitype="2" data-adtype="4" data-viewtype="4">
				<div class="ad_thumb">
					<div class="img_wrap imgLiquidFill">
						<img src="/ghtest/list_files/06_002.jpg" alt="역삼 컬리넌" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'">
						<span class="opacity"></span><!-- 그라데이션 배경 -->
					</div>
				</div>

			<div class="txt">
				<p class="name">
					역삼 컬리넌					<span>역삼동 9.3km</span>&nbsp;

																			</p>
				<p class="score">추천해요 9 (111)</p>
				<p class="distance">9.3km 역삼동</p>

									
											<!--예약가-->
													<p class="price">대실예약 <b>30,000~</b> <strong>25,000원~</strong><span class="box_org">특가</span></p>
															
																					<!--예약가-->
													<p class="price">숙박예약 <b>60,000~</b> <strong>49,000원~</strong><span class="box_org">특가</span></p>
															
				<p class="icon">
																																	<span class="box_green">· 적립</span>
															</p>
												<ul><li>· 결제금액의 최대 10%적립가능</li></ul>
				
					<p></p>
				</div>
			</a>
		</li>	
		
		
		<li>
			<a class="link" data-ano="4988" data-uitype="2" data-adtype="4" data-viewtype="4">
				<div class="ad_thumb">
					<div class="img_wrap imgLiquidFill">
					<img src="/ghtest/list_files/72faf834a2b190ded03b8a42fbed4f02_002.jpg" alt="강남 캠퍼스" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'">
					<span class="opacity"></span><!-- 그라데이션 배경 -->
				</div>
			</div>

			<div class="txt">
				<p class="name">
					강남 캠퍼스					<span>역삼동 9.1km</span>&nbsp;

																			</p>
				<p class="score">추천해요 9 (173)</p>
				<p class="distance">9.1km 역삼동</p>

															<!--도보가-->
						<p class="price col_fff">대실 30,000원</p>
									
																					<!--예약가-->
													<p class="price">숙박예약 80,000원~</p>
															
				<p class="icon">
																																	<span class="box_green">· 음식제공 · 당첨자발표 · 적립</span>
															</p>
									<p class="bene">#최저가보장 #예약취소가능 </p>
												<ul><li>· 조식제공 시작</li><li>· 사진후기 이벤트 당첨자 발표</li><li>· 회원카드 도입</li></ul>
				
					<p></p>
				</div>
			</a>
		</li>	
		
	</ul>
				
				</div>
						</div>
						
						
			<div class="srch_group ui_1">
<!-- list_header -> 흐린 회색빛 라인, 광고? 요거 말풍선 나오면서 설명 나오는 부분. -->
						<div class="list_header ">
								<h5><strong class="font_b">프리미엄</strong></h5>								
							</div>
							<style type="text/css">
							.ad_top{display:none;}
							</style>
<!-- srch_list 프리미엄의 전체적인 폼 -->
		<div class="srch_list ">
								
								<ul>
									<li>
		<a class="link" data-ano="1824" data-uitype="1" data-adtype="3" data-viewtype="3">
			<div class="ad_thumb">
				<div class="img_wrap imgLiquidFill" style="overflow: hidden; background-image: none;">
					<img src="/ghtest/list_files/02.jpg" alt="강남 리츠" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'" style="opacity: 1; visibility: visible; max-width: none; max-height: none; width: auto; height: 100%; display: block; image-rendering: auto; margin-left: -69px; margin-top: 0px;">
					<span class="opacity"></span><!-- 그라데이션 배경 -->
				</div>
			</div>

			<div class="txt">
				<p class="name">
					강남 리츠					<span>역삼동 9.0km</span>&nbsp;

																			</p>
				<p class="score">만족해요 8 (801)</p>
				<p class="distance">9.0km 역삼동</p>

									
											<!--예약가-->
													<p class="price">대실예약 15,000원~</p>
															
																					<!--예약가-->
													<p class="price">숙박예약 <b>40,000~</b> <strong>35,000원~</strong><span class="box_org">특가</span></p>
															
				<p class="icon">
																								</p>
									<p class="bene">#최저가보장 #예약취소가능 #혜택존 </p>
								
				<p></p>
			</div>
		</a>
	</li>	<li>
		<a class="link" data-ano="4556" data-uitype="1" data-adtype="3" data-viewtype="3">
			<div class="ad_thumb">
				<div class="img_wrap imgLiquidFill" style="overflow: hidden; background-image: none;">
					<img src="/ghtest/list_files/81c9376839ac91a6d0d3043fccd18453.jpg" alt="삼성 베드스테이션" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'" style="opacity: 1; visibility: visible; max-width: none; max-height: none; width: auto; height: 100%; display: block; image-rendering: auto; margin-left: -69px; margin-top: 0px;">
					<span class="opacity"></span><!-- 그라데이션 배경 -->
				</div>
			</div>

			<div class="txt">
				<p class="name">
					삼성 베드스테이션					<span>삼성동 8.9km</span>&nbsp;

																			</p>
				<p class="score">만족해요 8 (271)</p>
				<p class="distance">8.9km 삼성동</p>

									
											<!--예약가-->
													<p class="price">대실예약 20,000원~</p>
															
																					<!--예약가-->
													<p class="price">숙박예약 50,000원~</p>
															
				<p class="icon">
																																	<span class="box_green">· 무한숙박 · 요금할인 · 무한대실</span>
															</p>
												<ul><li>· 15시 이전 도보이용시 익일 13시까지 이용</li><li>· 연박 사용 시 추가 요금 없이 종일 이용가능</li><li>· 대실조조 이벤트</li></ul>
				
									<p></p>
								</div>
							</a>
						</li>	
		
	
									</ul>
							</div>
						</div>

												
				</div>			
			</div>
			<!-- //리스트 -->			
					</div>
		<!-- //검색 wrap -->
	</article>
	<!-- //(공통)contentsWrap -->

	<script type="text/javascript">
	$(window).resize(function(){
		if($('body').hasClass('pcweb')){
			$('.area_sel').show();
		}
	});
	$(document).ready(function(){
		var topSetting = $('.headerWrap').outerHeight()/* + $('.area_selected').height()*/;
		$('.mweb .area_srch_wrap .area_sel .sel_list').css('top', topSetting);
		$('.area_selected .area_1').click(function(e) {
			e.preventDefault();
			if ( $('.area_sel.sel_depth_1').css('display') == 'none' ) {
				$('.mweb .area_sel.sel_depth_1').slideDown();
				$(this).children().find('pop_bg').show();
			} else {
				$('.mweb .area_sel.sel_depth_1').slideUp();
				$(this).children().find('pop_bg').hide();
			}
		});
		$('.area_selected .area_2').click(function(e) {
			e.preventDefault();
			if ( $('.area_sel.sel_depth_2').css('display') == 'none' ) {
				$('.mweb .area_sel.sel_depth_2').slideDown();
				$(this).children().find('pop_bg').show();
			} else {
				$('.mweb .area_sel.sel_depth_2').slideUp();
				$(this).children().find('pop_bg').hide();
			}
		});
		$('.pop_bg').click(function(e) {
			e.preventDefault();
			var test = $(this).parent();
			if ( $(test).css('display') == 'none' ) {
				$(test).slideDown();
			} else {
				$(test).slideUp();
			}
		});

		$('.area_selected .area_1').text($('.sel_depth_1 .selected').text());
		
		if($('.sel_depth_2 .selected').length < 1) {
			$('.area_selected .area_1, .sel_depth_1').css('width','100%');
			$('.area_selected .area_2').hide();
		}else $('.area_selected .area_2').text($('.sel_depth_2 .selected .area_detail').text());
	});
	</script>	<!-- //페이지별 화면 load -->
		

</body></html>