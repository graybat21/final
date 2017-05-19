<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
    $(function(){
        $(".DatePicker").datepicker({});
    });
</script>


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
	type="text/css"/>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
	height: 400px;
	width: 100%;
	margin-bottom: 30px;
	align-items: center;
	justify-content: center;
	display: flex;
	float: left;
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
</style>


</head>
<body>

	
	<div class="inner-body">
		<!-- <div class="wrapper-index"> -->
		<img class="wrapper-index"
			src="${pageContext.request.contextPath}/resources/image/plane-beach.jpg">
		<!-- 좌우로 넘기는 스크립트?.? -->
		<!-- <div class="wrapper-inner">
			<div class="row scroll-text hidden-xs">
				<div class="col-sm-12">
					<div class="text-box">
						<h3>
							<i class="fa fa-plane"></i> <span>Flights</span> <br> WHERE
							YOU WANT TO GO? <br> Fly With Us
						</h3>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="text-box hidden-xs">
						<h3>
							<span>Travel</span> <br> THE WORLD YOU <br> NEVER SEEN
							<i class="fa fa-car"></i> <br>

						</h3>

					</div>
				</div>
				<div class="col-sm-12">
					<div class="text-box">
						<h3>
							<span>Hotels</span> <br> We Provide best <span><i
								class="fa fa-globe"></i> </span> quality?
						</h3>
					</div>
				</div>
			</div>




		</div> -->


		<!-- 추가: 검색 -->
		<!-- 	<div class="wrapper-index"
			style="background: transparent url(&quot;image/plane-beach.jpg&quot;) repeat scroll 0% 0%;"> -->
		<div class="wrapper-inner">
			<!--text-box-->

			<br /> <br /> <br /> <br /> <br />
			<div class="row scroll-text hidden-xs slick-initialized slick-slider">
				<div aria-live="polite" class="slick-list draggable">
					<!-- <div class="slick-track"
							style="opacity: 1; width: 4360px; transform: translate3d(-1472px, 0px, 0px);"
							role="listbox">
							<div class="col-sm-12 slick-slide slick-cloned"
								data-slick-index="-1" aria-hidden="true" style="width: 472px;"
								tabindex="-1">
								<div class="text-box">
									<h3>
										<span>Hotels</span> <br> We Provide best <span><i
											class="fa fa-globe"></i> </span> quality?
									</h3>
								</div>
							</div>
							<div class="col-sm-12 slick-slide slick-current slick-active"
								data-slick-index="0" aria-hidden="false" style="width: 472px;"
								tabindex="-1" role="option" aria-describedby="slick-slide00">

							</div>
							<div class="col-sm-12 slick-slide" data-slick-index="1"
								aria-hidden="true" style="width: 472px;" tabindex="-1"
								role="option" aria-describedby="slick-slide01">
								<div class="text-box hidden-xs">
									<h3>
										<span>Travel</span> <br> THE WORLD YOU <br> NEVER
										SEEN <i class="fa fa-car"></i> <br>

									</h3>

								</div>
							</div>
							<div class="col-sm-12 slick-slide" data-slick-index="2"
								aria-hidden="true" style="width: 472px;" tabindex="-1"
								role="option" aria-describedby="slick-slide02">
								<div class="text-box">
									<h3>
										<span>Hotels</span> <br> We Provide best <span><i
											class="fa fa-globe"></i> </span> quality?
									</h3>
								</div>
							</div>
							<div class="col-sm-12 slick-slide slick-cloned"
								data-slick-index="3" aria-hidden="true" style="width: 472px;"
								tabindex="-1">
								<div class="text-box">
									<h3>
										<i class="fa fa-plane"></i> <span>Flights</span> <br>
										WHERE YOU WANT TO GO? <br> Fly With Us
									</h3>
								</div>
							</div>
						</div> -->
				</div>


			</div>
			<div class="container">
				<!--main-fill-->
				<div class="main-fill ">
					<!--tabs-->
					<div class="panel">
						<div class="panel-heading">
							<ul class="nav nav-tabs">

								<li><a href="#tabhotel" data-toggle="tab"> <i
										class="fa fa-hotel"></i> Hotel
								</a></li>

							</ul>
						</div>
						<!--panel-body-->
						<div class="panel-body">
							<!--tab-content-->
							<div class="tab-content">


<!-- <script>
function searchSubmit(){
	$('#searchForm').submit();
}
</script>
 -->

								<!--tabhotel-->
								<div class="tab-pane fade in" id="tabhotel">
									<form action="ghList.gh" id="searchForm" name="searchForm"
									 accept-charset="utf-8">
									<h3>Search and Book Hotels</h3>
									<ul class="list-inline list-unstyled">
										<li><select class="select-one" name="area">
												<option selected="selected">지역</option>
												<option value="seoul">서울</option>
												<option>경기</option>
												<option>부산</option>
												<option>제주도</option>
										</select></li>
										<li>
											<div class="form-group">
												<input class="datepicker1"
													placeholder="Check In" id="datepicker1" name="from" type="text">
												<!-- 
													<img
													class="ui-datepicker-trigger" src="image/icon-calendar.png"
													alt="Select date" title="Select date"> -->
											</div>
										</li>
										<li>
											<div class="form-group">
												<input class="datepicker2"
													placeholder="Check Off" id="datepicker2" name="to" type="text">
												<!-- 	<input type="text" id="datepicker4"> -->
												<!-- <img
													class="ui-datepicker-trigger" src="image/icon-calendar.png"
													alt="Select date" title="Select date"> -->
											</div>
										</li>
										<li><select class="select-one" name="participant">
												<option selected="selected">인원</option>
												<option value="1">1 Guest</option>
												<option value="2">2 Guest</option>
												<option value="3">3 Guest</option>
										</select></li>
										<li>
											<div class="form-group">
												<input class="form-control"
													placeholder="최대가격" type="text" name="max_price">
											</div>
										</li>
										<!--   search now -->
										<li><!-- <a
											href="javascript:searchSubmit()"
											class="btn btn-search-travel">검   색</a> --><input type="submit" value="검색"></li>
									</ul>
									</form>
								</div>


							</div>
						</div>
						<!--end panel body-->
					</div>
					<!--end tabs-->
				</div>
			</div>
		</div>
	</div>
	</div>















	<!-- 


<div class="image">
  <img alt="" src="http://www.kavoir.com/img/text-over-image.jpg" />
  <div class="text">
    <p>This lovely image gladly demonstrates how I (this text) can be flying over her face.</p>
    <p>It's very kind of her but don't you agree that this place needs a camp fire and a little love?</p>
  </div>
</div>

	
 -->
	<!-- 가로 16 세로 7 -->
	<table border=1>
		<tr height="200px" >
			<td width="300px">특가상품1</td>
			<td width="1px"></td>
			<td width="300px">특가상품1</td>
			<td width="300px">특가상품3</td>
			<td width="300px">특가상품4424444</td>
		</tr>
		<tr height="200px">
			<td width="300px">특가상품5</td>
			<td width="1px"></td>
			<td width="300px">특가상품6</td>
			<td width="300px">특가상품73</td>
			<td width="300px">특가상품8</td>
		</tr>



	</table>


	<br />

	<table border=1>
		<tr height="200">
			<td width="300">게하1</td>
			<td width="300">게하2</td>
			<td width="300">게하3</td>
			<td width="300">게하4</td>
		</tr>
		<tr height="200">
			<td width="300">게하5</td>
			<td width="300">게하6</td>
			<td width="300">게하7</td>
			<td width="300">게하8</td>
		</tr>



	</table>









</body>
