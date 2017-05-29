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

<script src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" rel="stylesheet">
<script type="text/javascript">

//Slick controls
$('#popup-image-gallery').on('shown.bs.modal', function() {
  $('.popup-slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    fade: true,
    asNavFor: '.popup-slider-nav',
    // adaptiveHeight: true,
  });
  $('.popup-slider-nav').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    asNavFor: '.popup-slider-for',
    dots: false,
    arrows: false,
    focusOnSelect: true,
    variableWidth: true,
    centerMode: true,
    infinite: true,
  });
});
// Slick.js: Get current and total slides (ie. 3/5)
var $status = $('.pagingInfo');
var $slickElement = $('.popup-slider-for');

$slickElement.on('init reInit afterChange', function(event, slick, currentSlide, nextSlide) {
  //currentSlide is undefined on init -- set it to 0 in this case (currentSlide is 0 based)
  var i = (currentSlide ? currentSlide : 0) + 1;
  $status.text(i + '/' + slick.slideCount);
});

// Slick slider sync situation
var slides = $(".popup-slider-for .slick-track > .slick-slide").length;
$('.popup-slider-for').on('afterChange', function(event, slick, currentSlide, nextSlide) {
  var inFocus = $('.popup-slider-for .slick-current').attr('data-slick-index');
  $('.popup-slider-nav .slick-current').removeClass('slick-current');
  $('.popup-slider-nav .slick-slide[data-slick-index="' + inFocus + '"]').trigger('click');
});

</script>

<style type="text/css">

body.modal-open {
  overflow: hidden;
  position: fixed;
  width: 100%;
}

.btn {
  margin: 20px 0;
}

.btn-danger {
  font-size: 16px;
}

.modal-backdrop.in {
  filter: alpha(opacity=80);
  opacity: .8;
}

.popup-image-gallery .modal-dialog {
  width: 100%;
}

.popup-image-gallery .modal-content {
  -webkit-box-shadow: none;
  box-shadow: none;
  background-color: transparent;
  border: 0;
  border-radius: 0;
}

.popup-slider-for {
  position: relative;
  min-height: 300px;
  z-index: 2;
}

@-webkit-keyframes spin {
  0% {
    -webkit-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

@keyframes spin {
  0% {
    -webkit-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

.popup-slider-for:after {
  content: "\e030";
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-animation: spin 1s linear infinite;
  animation: spin 1s linear infinite;
  z-index: -1;
  color: #fff;
  opacity: .75;
}

.popup-slider-for,
.main-image {
  text-align: center;
  margin-bottom: 60px;
  padding-top: 60px;
}

.popup-slider-for .slick-slide img {
  display: inline-block;
  max-width: 100%;
  vertical-align: middle;
}

.popup-slider-nav .thumbnail-image {
  position: relative;
  margin: 20px 20px;
  cursor: pointer;
}

.popup-slider-nav .thumbnail-image,
.popup-slider-nav .thumbnail-image img {
  display: block;
  width: 140px;
  height: 100px;
}

.popup-slider-nav .thumbnail-image:after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  background-color: rgba(0, 0, 0, 0.6);
  -webkit-transition: all 0.2s linear;
  -moz-transition: all 0.2s linear;
  transition: all 0.2s linear;
}

.popup-slider-nav .thumbnail-image:hover:after {
  background-color: rgba(0, 0, 0, 0.4);
}

.popup-slider-nav .slick-current:after,
.popup-slider-nav .slick-current:hover:after,
.popup-slider-nav .slick-center:after,
.popup-slider-nav .slick-center:hover:after {
  background-color: transparent;
}

.pagingInfo {
  color: #fff;
  text-align: center;
  margin: 20px 0;
}

.popup-slider-for .slick-next,
.popup-slider-for .slick-prev {
  width: auto;
  height: auto;
  z-index: 1;
}

.popup-slider-for .slick-prev {
  left: 0;
}

.popup-slider-for .slick-prev:before,
.popup-slider-for .slick-next:before,
.popup-slider-for:after {
  font: normal normal 30px/1 'Glyphicons Halflings';
}

.popup-slider-for .slick-prev:before {
  content: "\e257";
}

.popup-slider-for .slick-next:before {
  content: "\e258";
}

.popup-slider-for .slick-next {
  right: 0;
}

.popup-image-gallery .close-icon {
  top: 0;
}

.slick-slide {
  outline: 0;
}

.close-btn {
  background-color: transparent;
  padding-top: 100px;
  color: #fff;
  position: absolute;
  right: 30px;
  z-index: 3;
  font-size: 24px;
  margin: 0;
  opacity: .75;
}

.close-btn:hover,
.close-btn:focus {
  color: #fff;
  opacity: 10;
}

.popup-image-gallery .modal-dialog {
  margin: 0;
}

@media (max-width: 767px) {
  .popup-image-gallery .modal-body {
    padding: 0;
  }
  .popup-image-gallery .modal-dialog {
    margin-top: 20px;
  }
  .popup-image-gallery .close-icon {
    top: -20px;
  }
  .popup-slider-for .slick-prev {
    left: 12px;
  }
  .popup-slider-for .slick-next {
    right: 12px;
  }
}

</style>
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
					<div class="info_cont container">
						<ul class="room_list">
						
						
							<c:forEach var="item" items="${roomList }" varStatus="status">
							<li>
					
								<a href="#" class="btn btn-info btn-lg btn-block" data-toggle="modal" data-target="#popup-image-gallery" tabindex="0">
								<div class="room_img">
								
							
									<div class="img_wrap imgLiquidFill">
										<span class="thumb_none"></span>
				
										<img src="./resources/upload/${item.filename }" style="display: block;">
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
							
							
								
<div class="modal popup-image-gallery" id="popup-image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="btn close-btn" title="Close" data-dismiss="modal" aria-label="Close">&#10006;</span></button>
        <div class="popup-slider-for">
          
          <div class="main-image">
            <img src="./resources/upload/${item.filename }"/>
          </div>
          
        </div>
			<c:forEach var="image" items="${bigImage }">
        <h5 class="pagingInfo"></h5>
        <div class="popup-slider-nav hidden-xs">
          <div class="thumbnail-image">
            <img src="./resources/upload/${image.filename }"/>
          </div>
          
			</c:forEach>				
        </div>
        
      </div>
    </div>
  </div>
</div>
						
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