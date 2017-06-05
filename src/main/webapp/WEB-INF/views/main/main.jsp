<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function() {
		$(".DatePicker").datepicker({});
	});
</script>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jssor.slider-23.1.6.mini.js"
	type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/jqx.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/select2.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/slick.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/date-picker.js"></script>
<script src="${pageContext.request.contextPath}/js/isotope-docs.js"></script>
<script src="${pageContext.request.contextPath}/js/select2.js"></script>
<script src="${pageContext.request.contextPath}/js/slick.js"></script>
<script src="${pageContext.request.contextPath}/js/parallax.js"></script>
<script src="${pageContext.request.contextPath}/js/scrollreveal.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

$(function() {
	$("#searchSubmit()").on("click", function() {
		if (($("#area").val() == "" || $("#area").val() == "지역")) {
			alert("지역 입력해주세요.");
		}else if (($("#datepicker1").val() == "" || $("#datepicker1").val() == null)) {
			alert("시작날짜를 입력해주세요");
		}else if (($("#datepicker2").val() == "" || $("#datepicker2").val() == null)) {
			alert("마지막 날짜를 입력해 주세요");
		}else if (($("#participant").val() == "" || $("#participant").val() == "인원")) {
			alert("인원을 입력해 주세요.");
		}else if (($("#max_price").val() == "" || $("#max_price").val() == null)) {
			alert("최대가격을 입력해주세요.");

</script>
<script>
	$(function() {
		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
		//시작일.
		$('.datepicker1').datepicker(
				{
					dateFormat : "yy-mm-dd", // 날짜의 형식
					changeMonth : false, // 월을 이동하기 위한 선택상자 표시여부
					minDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
					onClose : function(selectedDate) {
						// 시작일(fromDate) datepicker가 닫힐때
						// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
						$("#datepicker2").datepicker("option", "minDate",
								selectedDate);
					}
				});
		//종료일
		$('.datepicker2').datepicker(
				{
					dateFormat : "yy-mm-dd",
					changeMonth : false,
					minDate : 1, // 오늘 이전 날짜 선택 불가
					onClose : function(selectedDate) {
						// 종료일(toDate) datepicker가 닫힐때
						// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
						$("#datepicker1").datepicker("option", "maxDate",
								selectedDate);
					}
				});
		//날짜포맷 
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		//(디폴트 ) 시작일-오늘/종료일-내일
		$("#datepicker1").datepicker().datepicker("setDate", new Date());
		$("#datepicker2").datepicker().datepicker("setDate",
				new Date().valueOf() + (24 * 60 * 60 * 1000));

	});
	
	

		

	/* 추가 */

	jQuery(document).ready(function($) {

		var jssor_1_SlideoTransitions = [ [ {
			b : 900,
			d : 2000,
			x : -379,
			e : {
				x : 7
			}
		} ], [ {
			b : 900,	
			d : 2000,
			x : -379,
			e : {
				x : 7
			}
		} ], [ {
			b : -1,
			d : 1,
			o : -1,
			sX : 2,
			sY : 2
		}, {
			b : 0,
			d : 900,
			x : -171,
			y : -341,
			o : 1,
			sX : -2,
			sY : -2,
			e : {
				x : 3,
				y : 3,
				sX : 3,
				sY : 3
			}
		}, {
			b : 900,
			d : 1600,
			x : -283,
			o : -1,
			e : {
				x : 16
			}
		} ] ];

		var jssor_1_options = {
			$AutoPlay : 1,
			/* 뀨 */
			$SlideDuration : 8000000000000000,
			$SlideEasing : $Jease$.$OutQuint,
			$CaptionSliderOptions : {
				$Class : $JssorCaptionSlideo$,
				$Transitions : jssor_1_SlideoTransitions
			},
			$ArrowNavigatorOptions : {
				$Class : $JssorArrowNavigator$
			},
			$BulletNavigatorOptions : {
				$Class : $JssorBulletNavigator$
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		/*responsive code begin*/
		/*remove responsive code if you don't want the slider scales while window resizing*/
		function ScaleSlider() {
			var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
			if (refSize) {
				refSize = Math.min(refSize, 1920);
				jssor_1_slider.$ScaleWidth(refSize);
			} else {
				window.setTimeout(ScaleSlider, 30);
			}
		}
		ScaleSlider();
		$(window).bind("load", ScaleSlider);
		$(window).bind("resize", ScaleSlider);
		$(window).bind("orientationchange", ScaleSlider);
		/*responsive code end*/
	});
	

	

		
</script>


<style>
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

.wrapper-index {
	background-repeat: no-repeat !important;
	background-position: center !important;
	background-size: cover !important;
	background-attachment: fixed !important;
	height: 600px;
	width: 100%;
	margin-bottom: 30px;
	align-items: center;
	justify-content: center;
	display: flex;
	float: 500px;
	transition: all linear 0.3s;
	url:
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
}

.wrapper-inner {
	float: left;
	width: 100%;
	position: relative;
}

.slick-slider {
	padding: 0;
	position: relative;
	text-align: center;
	padding: 10px 0px;
	display: block;
	box-sizing: border-box;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-touch-callout: none;
	-khtml-user-select: none;
	-ms-touch-action: pan-y;
	touch-action: pan-y;
	-webkit-tap-highlight-color: transparent;
}

.slick-slider .slick-track, .slick-slider .slick-list {
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	-o-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.slick-track {
	position: relative;
	top: 0;
	left: 0;
	display: block;
}

.slick-list {
	width: 95%;
	position: relative;
	display: block;
	overflow: hidden;
	margin: 0;
	padding: 0;
}

.row {
	margin-right: -15px;
	margin-left: -15px;
}

.wrapper-inner .main-fill {
	text-align: center;
}

.wrapper-inner .main-fill .panel {
	background-color: transparent;
	border-radius: 0;
	margin-bottom: 0;
}

.wrapper-inner .main-fill .panel .nav-tabs {
	border: none;
}

.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.nav-tabs {
	border-bottom: 1px solid #ddd;
}

.panel-heading {
	padding: 10px 15px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.nav {
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
}

ul {
	margin: 0;
}

.wrapper-inner .main-fill .panel .panel-body {
	padding: 0px 10px;
}

.wrapper-inner .main-fill .panel .panel-body .tab-content ul {
	margin: 0;
	position: relative;
	text-align: left;
}

.wrapper-inner .main-fill .panel .panel-body .tab-content ul li {
	text-align: left;
	float: left;
	position: relative;
	width: 20%;
}

.wrapper-inner .main-fill .panel .panel-body .tab-content ul li .form-group
	{
	position: relative;
	float: left;
	width: 100%;
}

.wrapper-inner .main-fill .panel .panel-body .tab-content ul li .form-group input
	{
	border-radius: 0;
	background-color: transparent;
	color: #ff6c26;
	font-family: "Raleway", sans-serif;
	font-size: 12px;
	position: relative;
	font-weight: 400;
}

.form-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

input {
	line-height: normal;
}

button, input, select, textarea {
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

button, input, optgroup, select, textarea {
	margin: 0;
	font: inherit;
	color: inherit;
}

.form-group {
	margin-bottom: 15px;
}

.list-inline {
	padding-left: 0;
	margin-left: -5px;
	list-style: none;
}

.list-inline>li {
	display: inline-block;
	padding-right: 5px;
	padding-left: 5px;
}

.inner-body {
	position: relative;
	float: left; /* optional */
}

.inner-body .wrapper-inner {
	position: absolute;
	top: 10px;
	/* in conjunction with left property, decides the text position */
	left: 10px;
	width: 300px; /* optional, though better have one */
}

/* 추가 */
.jssorb05 {
	position: absolute;
}

.jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
	position: absolute;
	/* size of bullet elment */
	width: 16px;
	height: 16px;
	background: url('image/b05.png') no-repeat;
	overflow: hidden;
	cursor: pointer;
}

.jssorb05 div {
	background-position: -7px -7px;
}

.jssorb05 div:hover, .jssorb05 .av:hover {
	background-position: -37px -7px;
}

.jssorb05 .av {
	background-position: -67px -7px;
}

.jssorb05 .dn, .jssorb05 .dn:hover {
	background-position: -97px -7px;
}

/* jssor slider arrow navigator skin 22 css */
/*
        .jssora22l                  (normal)
        .jssora22r                  (normal)
        .jssora22l:hover            (normal mouseover)
        .jssora22r:hover            (normal mouseover)
        .jssora22l.jssora22ldn      (mousedown)
        .jssora22r.jssora22rdn      (mousedown)
        .jssora22l.jssora22lds      (disabled)
        .jssora22r.jssora22rds      (disabled)
        */
.jssora22l, .jssora22r {
	display: block;
	position: absolute;
	/* size of arrow element */
	width: 40px;
	height: 58px;
	cursor: pointer;
	background: url('image/a22.png') center center no-repeat;
	overflow: hidden;
}

.jssora22l {
	background-position: -10px -31px;
}

.jssora22r {
	background-position: -70px -31px;
}

.jssora22l:hover {
	background-position: -130px -31px;
}

.jssora22r:hover {
	background-position: -190px -31px;
}

.jssora22l.jssora22ldn {
	background-position: -250px -31px;
}

.jssora22r.jssora22rdn {
	background-position: -310px -31px;
}

.jssora22l.jssora22lds {
	background-position: -10px -31px;
	opacity: .3;
	pointer-events: none;
}

.jssora22r.jssora22rds {
	background-position: -70px -31px;
	opacity: .3;
	pointer-events: none;
}
</style>
<script>
function searchSubmit(){
	$('#searchForm').submit();
}
</script>

</head>
<body
	style="padding: 0px; margin: 0px; background-color: #fff; font-family: 'Open Sans', sans-serif, arial, helvetica, verdana">


	<div id="jssor_1"
		style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 1300px; height: 500px; overflow: hidden; visibility: hidden;">
		<!-- Loading Screen -->
		<div data-u="loading"
			style="position: absolute; top: 0px; left: 0px; background: url('image/loading.gif') no-repeat 50% 50%; background-color: rgba(0, 0, 0, 0.7);"></div>
		<div data-u="slides"
			style="cursor: default; position: relative; top: 0px; left: 0px; width: 1300px; height: 500px; overflow: hidden;">
			<div>
<%-- 				  <img data-u="image" src="${pageContext.request.contextPath}/resources/image/red.jpg" />
 --%>


				<div class="inner-body">
					<!-- <div class="wrapper-index"> -->
					<img class="wrapper-index" src="${pageContext.request.contextPath}/resources/image/red2.jpg">


					<div class="wrapper-inner">
						<!--text-box-->

						<br /> <br /> <br /> <br /> <br />
						<div class="container">
							<!--main-fill-->
							<div class="main-fill ">
								<!--tabs-->
								<div class="panel">
								<!-- 여기 클릭하면 뛰어나옴 -->
									<div class="panel-heading">
										<ul class="nav nav-tabs">

											<li><a href="#tabhotel" data-toggle="tab"> GuestHouse
											</a></li>

										</ul>
									</div>
									<!--panel-body-->
									<div class="panel-body">
										<!--tab-content-->
										<div class="tab-content">

											<!--tabhotel-->
											<div class="tab-pane fade in" id="tabhotel">
									<form action="ghList.gh" id="searchForm" name="searchForm">
									<h3>Search and Book GuestHouse</h3>
									<ul class="list-inline list-unstyled">
										<li><select class="select-one" name="area">
												<option selected="selected">지역</option>
												<option value="서울">서울</option>
												<option value="경기">경기</option>
												<option value="강원">강원</option>
												<option value="충청">충청</option>
												<option value="경상">경상</option>
												<option value="전라">전라</option>
												<option value="인천">인천</option>
												<option value="광주">광주</option>
												<option value="대전">대전</option>
												<option value="대구">대구</option>
												<option value="울산">울산</option>
												<option value="부산">부산</option>
												<option value="제주">제주</option>
										</select></li>
										<li>
											<div class="form-group">
												<input class="datepicker1"
													placeholder="Check In" id="datepicker1" name="from" type="text">
											</div>
										</li>
										<li>
											<div class="form-group">
												<input class="datepicker2"
													placeholder="Check Off" id="datepicker2" name="to" type="text">
											</div>
										</li>
										<li><select class="select-one" name="participant">
												<option selected="selected">인원</option>
												<option value="1">1 Guest</option>
												<option value="2">2 Guest</option>
												<option value="3">3 Guest</option>
												<option value="4">4 Guest</option>
												<option value="5">5 Guest</option>
										</select></li>
										<li>
											<div class="form-group">
												<input class="form-control"
													placeholder="최대가격" type="text" name="max_price">
											</div>
										</li>
										<!--   search now -->
										<li><a
											href="javascript:searchSubmit()"
											class="btn btn-search-travel">검   색</a></li>
									</ul>
									</form>
								</div>


										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
					<!--end tabs-->
				</div>


			</div>
			<div>
				<img data-u="image"
					src="${pageContext.request.contextPath}/resources/image/purple.jpg" />
					
					
					
					
			</div>
			<div>
				<img data-u="image"
					src="${pageContext.request.contextPath}/resources/image/blue.jpg" />
			</div>
			<a data-u="any" href="https://www.jssor.com/wordpress.html"
				style="display: none">wordpress gallery</a>
		</div>
		<!-- Bullet Navigator -->
		<div data-u="navigator" class="jssorb05"
			style="bottom: 16px; right: 16px;" data-autocenter="1">
			<!-- bullet navigator item prototype -->
			<div data-u="prototype" style="width: 16px; height: 16px;"></div>
		</div>
		<!-- Arrow Navigator -->
		<span data-u="arrowleft" class="jssora22l"
			style="top: 0px; left: 8px; width: 40px; height: 58px;"
			data-autocenter="2"></span> <span data-u="arrowright"
			class="jssora22r"
			style="top: 0px; right: 8px; width: 40px; height: 58px;"
			data-autocenter="2"></span>
	</div>



	

<br/>
<br/>
<br/>

<!-- 게하리스트 -->
<c:forEach items="${list}" var="list">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 filter recent">
		<div class="srch_list_wrap">
				<div class="srch_result">
					<div class="srch_group ui_0">
						<div class="srch_list list_g5">
							<ul>
								<li>
<!-- 								<a class="link">
 -->											<div class="img_wrap imgLiquidFill">
												<img
													src="${pageContext.request.contextPath}/resources/upload/${list.IMAGENAME}"
													
													onclick="javascript:location.href='ghDetail.gh?host_no=${list.NO}'" width="330px" >
											</div>
											
									<br/>
										<div class="txt">
											<p class="name">
								&nbsp;&nbsp;&nbsp;&nbsp;　　	${list.NAME}<span></span>&nbsp;
<!-- .srch_list.list_g5 .txt .price -->
	
											</p>
											<!--예약가-->
										<p class="price">　　　　${list.TEL}</p>

										</div>
								<!-- </a> -->
								</li>
							</ul>

						</div>
					</div>
				</div>
			</div>
			</div>
			</c:forEach>


</body>
