<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>






<html lang="ko">
<head>

<title>서울 : 여기어때 - 국내 1위 숙박어플!</title>
<script>
	$(function() {
		$(".DatePicker").datepicker({});
	});
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


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
<script>
	function searchSubmit() {
		$('#searchForm').submit();
	}
</script>
</head>
<!-- 조건 검색 폼에 사용되는 JS, CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
<!-- 객실 / 인원 외의 박스의 CSS -->
<link href="${pageContext.request.contextPath}/resources/css/jqx.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/select2.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/slick.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/date-picker.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/isotope-docs.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/select2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/parallax.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/scrollreveal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<!-- <body class="pcweb" oncontextmenu="return false" ondragstart="return false"> -->

<body>



	<br> ${search.area}
	<br> from : ${search.from}
	<br> to : ${search.to}
	<br> ${search.max_price}
	<br> ${search.participant}
	<hr>
	


	<!-- <div id="allWrap"> -->

	<!-- 페이지별 화면 load -->

	<!-- (공통)contentsWrap -->

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
									<form action="ghList.gh" id="searchForm" name="searchForm">
										<h3>Search and Book Hotels</h3>
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
													<option value="제주도">제주도</option>
											</select></li>
											<li>
												<div class="form-group">
													<input class="datepicker1" placeholder="Check In"
														id="datepicker1" name="from" type="text">
												</div>
											</li>
											<li>
												<div class="form-group">
													<input class="datepicker2" placeholder="Check Off"
														id="datepicker2" name="to" type="text">
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

											<li><div class="form-group">
													<input class="form-control" placeholder="최대가격" type="text"
														name="max_price">
												</div></li>


											<li><a href="javascript:searchSubmit()"
												class="btn btn-search-travel">검 색</a></li>
											<!--   search now -->
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


		<!-- 위에까지 -->
<div>
	</div>	
		<!-- 상세 조건 검색 -->

			<c:forEach items="${reserve}" var="item">
				<div class="srch_list_wrap">
					<div class="srch_result">
						<div class="srch_group ui_0">

							<div class="srch_list list_g5">



								<ul>
									<li><a class="link" >
											<div class="ad_thumb">
												<div class="img_wrap imgLiquidFill">
												<img
													src="${pageContext.request.contextPath}/resources/upload/${item.IMAGENAME}"
													onclick="javascript:location.href='ghDetail.gh?host_no=${item.HOST_NO}'" width="330px">
											
												</div>
											</div>

											<div class="txt">
												<p class="name">
													${item.NAME }<span>${item.ADDR1 }</span>&nbsp;

												</p>
												<!--예약가-->
												
												<p class="price">숙박예약 : ${item.PRICE}</p>
												<p class="price">방의최대인원수 : ${item.MAX} </p>

												<p></p>
											</div>
									</a></li>
								</ul>

							</div>
</div>



						</div>





					</div>
				</div>
</c:forEach>
			<!-- //리스트 -->
		</div>
		<!-- //검색 wrap -->
	</article>
	<!-- //(공통)contentsWrap -->

	<script type="text/javascript">
		$(window).resize(function() {
			if ($('body').hasClass('pcweb')) {
				$('.area_sel').show();
			}
		});
		$(document)
				.ready(
						function() {
							var topSetting = $('.headerWrap').outerHeight()/* + $('.area_selected').height()*/;
							$('.mweb .area_srch_wrap .area_sel .sel_list').css(
									'top', topSetting);
							$('.area_selected .area_1').click(
									function(e) {
										e.preventDefault();
										if ($('.area_sel.sel_depth_1').css(
												'display') == 'none') {
											$('.mweb .area_sel.sel_depth_1')
													.slideDown();
											$(this).children().find('pop_bg')
													.show();
										} else {
											$('.mweb .area_sel.sel_depth_1')
													.slideUp();
											$(this).children().find('pop_bg')
													.hide();
										}
									});
							$('.area_selected .area_2').click(
									function(e) {
										e.preventDefault();
										if ($('.area_sel.sel_depth_2').css(
												'display') == 'none') {
											$('.mweb .area_sel.sel_depth_2')
													.slideDown();
											$(this).children().find('pop_bg')
													.show();
										} else {
											$('.mweb .area_sel.sel_depth_2')
													.slideUp();
											$(this).children().find('pop_bg')
													.hide();
										}
									});
							$('.pop_bg').click(function(e) {
								e.preventDefault();
								var test = $(this).parent();
								if ($(test).css('display') == 'none') {
									$(test).slideDown();
								} else {
									$(test).slideUp();
								}
							});

							$('.area_selected .area_1').text(
									$('.sel_depth_1 .selected').text());

							if ($('.sel_depth_2 .selected').length < 1) {
								$('.area_selected .area_1, .sel_depth_1').css(
										'width', '100%');
								$('.area_selected .area_2').hide();
							} else
								$('.area_selected .area_2')
										.text(
												$(
														'.sel_depth_2 .selected .area_detail')
														.text());
						});
	</script>
	<!-- //페이지별 화면 load -->


</body>
</html>