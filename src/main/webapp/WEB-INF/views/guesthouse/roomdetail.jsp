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
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" rel="stylesheet">

<!-- 추가 -->
<script src="${pageContext.request.contextPath}/resources/index_data/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26.js"></script>
<script src="${pageContext.request.contextPath}/resources/index_data/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/index_data/slick.js"></script>
<script src="${pageContext.request.contextPath}/resources/index_data/bootstrap.js"></script>
<%-- <link rel="stylesheet prefetch" href="${pageContext.request.contextPath}/resources/index_data/bootstrap.css"> --%>
<link rel="stylesheet prefetch" href="${pageContext.request.contextPath}/resources/index_data/slick.css">
<link rel="stylesheet prefetch" href="${pageContext.request.contextPath}/resources/index_data/slick-theme.css">

<script type="text/javascript">

//Slick controls
$('#popup-image-gallery').on('shown.bs.modal', function() {
  $('.popup-slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    //Hye 추가
    /* autoplay: true,
    autoplaySpeed: 1000, */
    //Hye 여기까지
    arrows: true,
    fade: true,
    asNavFor: '.popup-slider-nav'
    // adaptiveHeight: true,
  });
  $('.popup-slider-nav').slick({
    slidesToShow: 8,
    slidesToScroll: 1,
    asNavFor: '.popup-slider-for',
    dots: false,
    arrows: false,
    focusOnSelect: true,
    variableWidth: true,
    centerMode: true,
    infinite: true
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
  margin: auto;
  margin-bottom: 30px;
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
				<div class="ad_info_room">
					<div class="info_title margin_align">
						<h4>객실정보</h4>
						<p class="room_detail info_title_sub txt_option">
						선택하신 날짜 객실 정보 입니다. 
						<span class="info_title_group">(<span class="txt_default">일반가</span>, <span class="txt_spacial">특별가</span>)</span>
						</p>	
					</div>
					<div class="info_cont container">
						<ul class="room_list">
						
					<script>
						function detailShot(room_no,status){

							$.ajax({
							url:"RoomImage.gh",
							type: "post",
							dataType:"text",
							data:{room_no:room_no},
							success: function(data){
								var array = data.split(",");
								var mimg = '';
								var src = '';
										$("#imgthumbnail").html("");
								for( var i in array){
									mimg = '<img src="./resources/upload/'+array[0]+'"/>';
									if(i!=0 && i!=(array.length-1)){
										var imgsrc = '<div class="thumbnail-image slick-slide slick-cloned"><img id="isrc"';
											imgsrc += 'src="./resources/upload/'+array[i]+'"/></div>';
										
											src += imgsrc;
									}
								}
								$("#imgthumbnail").html("");
								$("#imgthumbnail").html(src);
								$(".main-image").html("");
									$(".main-image").html(mimg);
							},
							error: function(data){
								alert(data.Status);
								alert(data.readyState);
							}
						});
						
						
						
					}
					</script>
							<c:forEach var="item" items="${roomList }" varStatus="status">
							<li>
								<a href="#" class="btn btn-info btn-lg btn-block" data-toggle="modal" data-target="#popup-image-gallery" tabindex="0" onclick='detailShot("${item.no}","${status.index}")'>
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
        <button type="button" class="btn close-btn" title="Close" data-dismiss="modal" aria-label="Close">x</button>

<!-- 추가 -->
        <div class="popup-slider-for slick-initialized slick-slider">
       <!--  <button type="button" data-role="none" class="slick-prev slick-arrow" aria-label="Previous" role="button" style="display: block;"> Previous</button> -->
          <div aria-live="polite" class="slick-list draggable">
          <div class="slick-track" style="opacity: 1; width: 15210px;" role="listbox">
          	
<!-- //추가 -->
        <!-- <div class="popup-slider-for"> -->
          
          <!-- <div class="main-image"> -->
          <div class="main-image slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 100%; position: relative; left: 400px; top: 0px; z-index: 999; opacity: 1;" tabindex="-1" role="option" aria-describedby="slick-slide00">
          <!-- 팝업 중간 큰이미지 위치 -->
          </div>
        </div>
        </div>
        
      <!-- <button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next" role="button" style="display: block;"> Next</button> -->
      
      </div>
      <!-- 전체 이미지 수 / 현재 이미지 수 -->
    	<div class="popup-slider-nav hidden-xs slick-initialized slick-slider">
    	<div aria-live="polite" class="slick-list draggable" style="padding: 0px 50px;">
    	<div class="slick-track" style="opacity: 1; width: 100%; margin:0  auto;" role="listbox">
    	
        <div id="imgthumbnail">
          <!-- 아래 슬라이더 이미지 위치 -->
          
        </div>
      </div>
      
<!-- 추가 -->
    </div>
  </div>
</div>
</div>
</div>
</div>
</li>
							</c:forEach>
						</ul>
					</div>
<!-- <div class="modal-backdrop in"></div> -->
				
				<!-- //객실정보 -->
					<div class="info_cont">
						<div data-selenium="abouthotel-panel" id="abouthotel-panel"
							class="section about-hotel scrollTo">
							<div id="property-about-root" class="about-hotel-root">
								<div data-reactroot="">
									<div class="sub-section about-hotel-new"
										id="abouthotel-description" style="padding: 0px;">
										<div class="sub-section-left">
											<div class="line-seperator"></div>
											<h2 class="sub-section-header" data-abouthotel-header="true">체크인 / 체크아웃</h2>
										</div>
										<div class="sub-section-right">
											<div class="line-seperator"></div>
											<div class="collapsed" style="max-height: 100px; padding: 0 10px 10px 0">
												<div>
													<div class="hotel-desc">
														
														
<font style="size: 12pt; text-decoration: underline; "><strong>체크인  </strong></font>&nbsp; &nbsp; &nbsp; &nbsp; 
15:00~ (얼리체크인은 호스트에게 문의 바랍니다.)<br><br>
<font style="size: 12pt; text-decoration: underline; "><strong>체크아웃  </strong></font>&nbsp; &nbsp; &nbsp; &nbsp; 
11:00 이전<br><br>
														
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
											<h2 class="sub-section-header" data-abouthotel-header="true">유의사항</h2>
										</div>
										<div class="sub-section-right">
											<div class="line-seperator"></div>
											<div class="collapsed">
												<div data-abouthotel-detail="true">
													<div class="sub-section no-margin" style="padding: 0px;">
														<h3 class="sub-section-right-header">
														<font style="size: 12pt; text-decoration: underline; "><strong>취소 / 선결제  </strong></font>&nbsp; &nbsp; &nbsp; &nbsp; 게스트하우스 운영정책에 따라 취소 및 선결제 정책이 달라집니다. 취소 및 선결제를 원하실 시 호스트에게 직접 문의바랍니다.<br><br>
														<font style="size: 12pt; text-decoration: underline; "><strong>현금 결제  </strong></font>&nbsp; &nbsp; &nbsp; &nbsp; 모든 숙박 업체에서는 현금 결제시 현금영수증 처리가 가능합니다.<br><br></h3>
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
										id="abouthotel-usefulinfo" style="padding: 0 0 20px 0;">
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
														<div>
															<span class="useful-info-icon"><i
																class="ficon ficon-18 ficon-express-check-in-check-out"></i></span>
															<font style="size: 12pt; text-decoration: underline; "><strong>어린이 요금  </strong></font>&nbsp; &nbsp; &nbsp; &nbsp; 게스트하우스 운영정책에 따라 숙박 가능 연령이 달라집니다. 어린이 동반 고객은 예약 전에 호스트에게 직접 문의바랍니다.<br><br>
															<font style="size: 12pt; text-decoration: underline; "><strong>반려동물  </strong></font>&nbsp; &nbsp; &nbsp; &nbsp; 반려 동물과 함께 숙박하시길 원하신다면 예약 전에 반드시 반려 동물 동반 가능 유무를 호스트에게 직접 문의해주세요.<br><br>
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