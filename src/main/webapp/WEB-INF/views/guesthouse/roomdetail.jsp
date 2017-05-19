<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/detail.css">
</head>
<body class="pcweb" ondragstart="return false">
 	<!-- 페이지별 호출 소스 -->
	<!-- //페이지별 호출 소스 -->
	<!-- (공통)contentsWrap -->


				<!-- 객실정보 -->
				<a id="bookmark1"></a>
				<div class="ad_info_room row">
					<div class="info_title margin_align">
						<h4>객실정보</h4>
						<p class="room_detail info_title_sub txt_option">
						선택하신 날짜 객실 정보 입니다. 
						<span class="info_title_group">(<span class="txt_default">일반가</span>, <span class="txt_spacial">특별가</span>)</span>
						</p>	
					</div>
					<div class="info_cont">
						<ul class="room_list">
							<c:forEach var="item" items="${roomList }" varStatus="status">
							<li>
								<a href="javascript:showLayerImg('thum', 0,'/adimg_new/1667/27820/bcf79b3068d1372f1395eea640ba16bd.jpg');">
								<div class="room_img">
									<div class="img_wrap imgLiquidFill">
										<span class="thumb_none"></span>
										<img src="http://placehold.it/588x300" style="display: block;">
										<!-- <img src="http://placehold.it/588x300" data-src="http://placehold.it/588x300" class="" data-original="http://placehold.it/588x300" style="display: block;"> -->
									</div>
								</div>
								<p class="room_name">
									${item.name }
									<!-- 예약가능 버튼 -->
									<span class="reserve_ok">예약가능</span>
								</p>
								<div class="room_txt">
								<p class="room_info"><span>요금&nbsp;&nbsp;</span><strong>${item.price }</strong>원<i>|</i>1인 요금</p>								
								<p class="room_info"><strong style="color:#000">잔여 인원</strong><i>|</i>3명</p>		
								</div>

								</a>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				<!-- //객실정보 -->
				<div class="ad_info_room row">
					<div class="info_title margin_align">
						<h4>객실정보</h4>
						<p class="room_detail info_title_sub txt_option">
							선택하신 날짜 객실 정보 입니다. <span class="info_title_group">(<span
								class="txt_default">일반가</span>, <span class="txt_spacial">특별가</span>)
							</span>
						</p>
					</div>
					<div class="info_cont">
						<div data-selenium="abouthotel-panel" id="abouthotel-panel"
							class="section about-hotel scrollTo">
							<div id="property-about-root" class="about-hotel-root">
								<div data-reactroot="">
									<div class="sub-section about-hotel-new"
										id="abouthotel-description" style="padding: 0px;">
										<div class="sub-section-left">
											<div class="line-seperator"></div>
											<h2 class="sub-section-header" data-abouthotel-header="true">숙소
												설명</h2>
										</div>
										<div class="sub-section-right">
											<div class="line-seperator"></div>
											<div class="collapsed" style="max-height: 63px;">
												<div>
													<div class="hotel-desc">
														후쿠오카 방문 시, 양질의 숙박과 훌륭한 서비스를 제공하는 본 숙소(게스트하우스 나카이마)에서 집과 같은
														편안함을 느껴보시기 바랍니다. 이 곳에서 생동감 넘치는 도시의 많은 것을 최대로 즐길 수 있습니다.
														숙소가 하카타 마치야 후루사토-칸, 쿠시다 쉬라인, 쿠시다-진자 등과 인접한 위치에 있기에 지역의 관광
														명소와 볼거리를 구경하기 위해 멀리 갈 필요가 없습니다.<br>
														<br> 본 숙소는 최고의 시설과 서비스 제공을 통해 투숙객이 편안함을 느끼도록 최선의 노력을
														다하고 있습니다. 본 숙소는 최상의 편안함을 위해 세탁실, Wi-Fi (무료/전 객실), 일일 청소
														서비스, 24시간 경비 서비스, Wi-Fi (공공 장소) 등을 제공합니다.<br>
														<br> 본 숙소에는 멋스럽게 꾸며진 총 4개의 객실이 있으며, 대부분의 객실에 라커, 무선
														인터넷(무료), 에어컨, 난방, 발코니/테라스 등이 구비되어 있습니다. 본 숙소 투숙 기간 다양한 여가
														시설 등을 이용할 수 있습니다. 이상적인 위치와 시설이 잘 어우러진 본 숙소(게스트하우스 나카이마)는
														여러모로 제격입니다.
													</div>
													<div></div>
												</div>
											</div>
										</div>
									</div>
									<div class="sub-section about-hotel-new"
										id="abouthotel-features" style="padding: 0px;">
										<div class="sub-section-left">
											<div class="line-seperator"></div>
											<h2 class="sub-section-header" data-abouthotel-header="true">숙소
												시설 및 서비스</h2>
										</div>
										<div class="sub-section-right">
											<div class="line-seperator"></div>
											<div class="collapsed">
												<div data-abouthotel-detail="true">
													<div class="sub-section no-margin" style="padding: 0px;">
														<h3 class="sub-section-right-header">인터넷</h3>
														<ul class="non-bullet-list no-margin">
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-wifi-in-public-areas"></i><span>Wi-Fi
																		(공용 공간)</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-free-wifi-in-all-rooms"></i><span>Wi-Fi
																		(무료/전 객실)</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
														</ul>
													</div>
													<div class="sub-section no-margin"
														style="padding: 20px 0px 0px;">
														<h3 class="sub-section-right-header">이동 편의 시설/서비스</h3>
														<ul class="non-bullet-list no-margin">
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-bicycle-rental"></i><span>자전거
																		대여</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-car-park"></i><span>주차장</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
														</ul>
													</div>
													<div class="sub-section no-margin"
														style="padding: 20px 0px 0px;">
														<h3 class="sub-section-right-header">식음료 시설/서비스</h3>
														<ul class="non-bullet-list no-margin">
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-shared-kitchen"></i><span>공용
																		주방</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
															<li class="list-item three-column features-item">&nbsp;</li>
														</ul>
													</div>
													<div class="sub-section no-margin"
														style="padding: 20px 0px 0px;">
														<h3 class="sub-section-right-header">서비스 및 편의 시설</h3>
														<ul class="non-bullet-list no-margin">
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-laundry-service"></i><span>세탁
																		서비스</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-daily-housekeeping"></i><span>일일
																		청소 서비스</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-laundromat"></i><span>세탁실</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-smoking-area unavailable-feature-icon"></i><span
																	class="unavailable-feature">흡연 공간</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
														</ul>
													</div>
													<div class="sub-section no-margin"
														style="padding: 20px 0px 0px;">
														<h3 class="sub-section-right-header">출입/접근 서비스</h3>
														<ul class="non-bullet-list no-margin">
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-24hour-security"></i><span>24시간
																		경비 서비스</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-pets-allowed unavailable-feature-icon"></i><span
																	class="unavailable-feature">반려동물 동반가능</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
														</ul>
													</div>
													<div class="sub-section no-margin"
														style="padding: 20px 0px 0px;">
														<h3 class="sub-section-right-header">모든 객실에서 이용 가능</h3>
														<ul class="non-bullet-list no-margin">
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-bathrooms"></i><span>공동
																		욕실</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-complimentary-bottled-water unavailable-feature-icon"></i><span
																	class="unavailable-feature">무료 생수</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-microwave"></i><span>전자레인지</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-heating"></i><span>난방</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-wifi"></i><span>무선
																		인터넷(무료)</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-lockers"></i><span>라커</span></span></li>
															<li class="list-item three-column features-item"><span><i
																	class="ficon ficon-18 ficon-air-conditioning"></i><span>에어컨</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
														</ul>
													</div>
													<div class="sub-section no-margin"
														style="padding: 20px 0px 0px;">
														<h3 class="sub-section-right-header">숙소에서 사용 가능한 언어</h3>
														<ul class="non-bullet-list no-margin">
															<li class="list-item three-column features-item"><span><i
																	class="flag flag-18 flag-18-jp"></i><span
																	class="ah-available-feature">일본어</span></span></li>
															<li class="list-item three-column features-item">&nbsp;</li>
															<li class="list-item three-column features-item">&nbsp;</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="sub-section about-hotel-new"
										id="abouthotel-description" style="padding: 0px;">
										<div class="sub-section-left">
											<div class="line-seperator"></div>
											<h2 class="sub-section-header" data-abouthotel-header="true">숙소
												정책</h2>
										</div>
										<div class="sub-section-right">
											<div class="line-seperator"></div>
											<div class="collapsed" style="max-height: 63px;">
												<div>
													<div class="hotel-desc">
														침대는 사용 후 정리해 주시기 바라며 체크아웃 시 침대 시트를 치워주시기 바랍니다.
														객실 열쇠 및 타월은 제공되지 않습니다. 
													</div>
													<div></div>
												</div>
											</div>
										</div>
									</div>
									<div class="sub-section about-hotel-new"
										id="abouthotel-usefulinfo" style="padding: 0px;">
										<div class="sub-section-left">
											<div class="line-seperator"></div>
											<h2 class="sub-section-header" data-abouthotel-header="true">이용
												정보</h2>
										</div>
										<div class="sub-section-right">
											<div class="line-seperator"></div>
											<div class="collapsed" style="max-height: 116px;">
												<div>
													<div class="sub-section no-margin" style="padding: 0px;">
														<h3 class="sub-section-right-header">체크인/체크아웃</h3>
														<div>
															<span class="useful-info-icon"><i
																class="ficon ficon-18 ficon-express-check-in-check-out"></i></span>
															<!-- react-text: 168 -->
															체크인 시작시간
															<!-- /react-text -->
															<!-- react-text: 169 -->
															:&nbsp;
															<!-- /react-text -->
															<strong>03:00 PM</strong>
														</div>
														<div>
															<span class="useful-info-icon"><i
																class="ficon ficon-18 ficon-express-check-in-check-out"></i></span>
															<!-- react-text: 174 -->
															체크인 마감시간
															<!-- /react-text -->
															<!-- react-text: 175 -->
															:&nbsp;
															<!-- /react-text -->
															<strong>09:00 PM</strong>
														</div>
														<div>
															<span class="useful-info-icon"><i
																class="ficon ficon-18 ficon-express-check-in-check-out"></i></span>
															<!-- react-text: 180 -->
															체크아웃 마감시간
															<!-- /react-text -->
															<!-- react-text: 181 -->
															:&nbsp;
															<!-- /react-text -->
															<strong>11:00 AM</strong>
														</div>
														<div>
															<span class="useful-info-icon"><i
																class="ficon ficon-18 ficon-24hour-frontdesk"></i></span>
															<!-- react-text: 186 -->
															리셉션 종료 시간
															<!-- /react-text -->
															<!-- react-text: 187 -->
															:&nbsp;
															<!-- /react-text -->
															<strong>09:00 PM</strong>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="line-seperator" style="padding: 0px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

</body>
</html>