<!DOCTYPE html>
<html lang="ko">
<%@page pageEncoding="UTF-8"%>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
<title>게스트하우스리뷰</title>

<!-- 공통 CSS  -->
<link rel="stylesheet" type="text/css"
	href="/howaboutthis/folder/default.css">
<link rel="stylesheet" type="text/css"
	href="/howaboutthis/folder/owl_003.css">
</head>
<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
	<!-- 페이지별 화면 load -->
	<link rel="stylesheet" type="text/css" href="/folder/lightgallery.css">
 	<!-- 페이지별 호출 소스 -->
	<link rel="stylesheet" type="text/css"	href="/folder/search.css">
	<link rel="stylesheet" type="text/css" href="/folder/default_002.css"> 
	<!-- //페이지별 호출 소스 -->
	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">업체상세페이지</h2>
		<!-- 페이지 navi -->
		<script src="/folder/jquery_003.js"></script>
		<div class="addetail_wrap" style="text-align: left;">
			<!-- 업체 요약정보 -->
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=7bb679d6838e419407a3f6e04c77eead&amp;libraries=services"></script>
			<script charset="UTF-8" src="https://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/3.5.16/1486533804955/open.js"></script>
			<script charset="UTF-8" src="https://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/libs/1441176450396/services.js"></script>
<script>
	var alat = "37.70929718";
	var alng = "127.1109074";

	$(document).ready(function(){
		var uno = "";
		var ano = "1987";
		var userfavor = "N";

		// 지도노출
		showMap();

		// 찜하기
		$(".btn_zzim").click(function() {

			if ( !uno )
			{
				location.href = '/user/login?refer=search/detailview/'+ano;
				return;
			}

			$.ajax({
				type: 'POST',
				async: false,
				cache: false,
				url: '/search/userAdFavorSet',
				dataType: 'json',
				data: { 'uno': uno, 'ano': ano , 'userfavor' : userfavor},
				success: function(data) { 
					var zzim_cnt = Number($("#top_zzim").text());

					if(data.rtv == true){
						if(data.mode == "I"){
							$(".btn_zzim").addClass("active");
							//$(".btn_zzim span").text("찜");
							$(".top_zzim").html(zzim_cnt+1);
							userfavor = "Y";
						}else{
							$(".btn_zzim").removeClass("active");
							//$(".btn_zzim span").text("찜하기");
							$(".top_zzim").html(zzim_cnt-1);
							userfavor = "N";
						}
					}
				},
				error: function(e) {
					console.log(e);
					alert('다시 시도하여 주세요.');
				}
			});

		});

		// 이용후기 영역 이동
		$("#goReview").click(function(){
			var ad_info_review = document.getElementById("reivew_area");

			if(ad_info_review){
				var offsetTop = getOffsetTop(ad_info_review)-150;
				$("html, body").animate({scrollTop: offsetTop}, 1000);
			}
			
		});

	});

	
	$(window).resize(function() {
		// 지도노출
		showMap();
	});

	var map = null;

	function showMap(){
		document.getElementById('maparea').innerHTML = '';
		//document.getElementById('staticMap').innerHTML = '';

		var container = document.getElementById('maparea'); //지도를 담을 영역의 DOM 레퍼런스

		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(alat, alng), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new daum.maps.Marker({ 
			// 지도 중심좌표에 마커를 생성합니다 
			position: map.getCenter(),
			clickable: false
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			window.open('http://map.daum.net/link/map/남양주 골드 호텔,' +  alat + ',' +  alng + '');
		});
		//  중심 좌표, 확대수준 변경
		daum.maps.event.addListener(map, 'idle', function() {
			// 이동할 위도 경도 위치를 생성합니다 
			//var moveLatLon = new daum.maps.LatLng(alat, alng);
			
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			//map.panTo(moveLatLon);  
		});


	}
</script>


<!-- 업체 정보 -->
<div class="ad_new_info">
	<div class="new_info row">
		<div class="cont">
			<h3>게스트하우스 이름</h3>
			<p class="address btn_copy">주소 블라블라</p>
			<p class="tel">☎ 1234567899</p>
			<a class="btn_zzim ">찜하기</a>
		</div>
		<div id="maparea" class="map" style="overflow: hidden; background: transparent url(&quot;https://i1.daumcdn.net/dmaps/apis/loading_n.png&quot;) repeat scroll 0% 0%;"><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; cursor: url(&quot;https://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute;"><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="https://map3.daumcdn.net/map_2d_hd/23i/L4/1030/467.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -63px; top: 28px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map0.daumcdn.net/map_2d_hd/23i/L4/1030/468.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 193px; top: 28px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map1.daumcdn.net/map_2d_hd/23i/L4/1030/469.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 449px; top: 28px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map3.daumcdn.net/map_2d_hd/23i/L4/1031/467.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -63px; top: -228px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map0.daumcdn.net/map_2d_hd/23i/L4/1031/468.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 193px; top: -228px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map1.daumcdn.net/map_2d_hd/23i/L4/1031/469.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 449px; top: -228px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"></div><div style="position: absolute; z-index: 0; left: 0px; top: 0px;"><img src="https://map3.daumcdn.net/map_2d_hd/23i/L3/2061/935.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 64.5px; top: 28.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map0.daumcdn.net/map_2d_hd/23i/L3/2061/936.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 192.5px; top: 28.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map1.daumcdn.net/map_2d_hd/23i/L3/2061/937.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 320.5px; top: 28.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map3.daumcdn.net/map_2d_hd/23i/L3/2062/935.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 64.5px; top: -99.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map0.daumcdn.net/map_2d_hd/23i/L3/2062/936.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 192.5px; top: -99.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map1.daumcdn.net/map_2d_hd/23i/L3/2062/937.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 320.5px; top: -99.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 500px; height: 200px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; position: absolute; left: -1000px; top: -400px; width: 2500px; height: 1000px;" viewBox="0 0 2500 1000"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px;"><div style="position: absolute; margin: -39px 0px 0px -13px; z-index: 0; left: 274px; top: 95px;"><img style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px none; display: block; position: absolute; -moz-user-select: none; clip: rect(0px, 40px, 42px, 0px); top: 0px; left: 0px; width: 40px; height: 42px;" draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/default_marker.png" alt=""><img src="https://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px none; display: block; position: absolute; -moz-user-select: none; width: 40px; height: 42px;" draggable="false" usemap="#daum.maps.Marker.Area:6"><map id="daum.maps.Marker.Area:6" name="daum.maps.Marker.Area:6"><area href="javascript:void(0)" alt="" shape="poly" coords="13,42,9,27,7,23,0,16,0,10,4,4,9,0,17,0,22,4,26,10,26,16,19,23,17,27" title=""></map></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; white-space: nowrap; font: 11px tahoma,sans-serif; color: rgb(85, 85, 85); left: 7px; bottom: 5px;"><a target="_blank" href="http://map.daum.net/" style="float: left; width: 38px; height: 17px; cursor: pointer;" title="Daum 지도로 보시려면 클릭하세요."><img src="https://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/m_bi.png" alt="Daum 지도로 이동" style="width: 37px; height: 18px; border: medium none;"></a><div style="color: rgb(0, 0, 0); text-align:center; font-size: 10px; margin: 0px 2px; float: left; width: 52px;"><div style="color: rgb(0, 0, 0);">100m</div><div style="position: relative; overflow: hidden; height: 8px; margin-top: -4px;"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/scalebar.png" alt="" style="position: absolute; width: 164px; height: 40px; max-width: none; top: 0px; left: -82px;"></div></div><div style="font: 11px tahoma,sans-serif; float: left; margin: 3px 2px 0px;">© Kakao<span></span></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div></div>
	</div>
</div>
<!-- datepicker-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
    $(function() {
     	// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
        // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
        //시작일.
        $('#datepicker1').datepicker({
            dateFormat: "yy-mm-dd",             // 날짜의 형식
            changeMonth: false,                  // 월을 이동하기 위한 선택상자 표시여부
            minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#datepicker2").datepicker( "option", "minDate", selectedDate);
            }                
        });
        //종료일
        $('#datepicker2').datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: false,
            minDate:1, // 오늘 이전 날짜 선택 불가
            onClose: function( selectedDate ) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
            }                
        });
       //날짜포맷 
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy-mm-dd'
        });
	//(디폴트 ) 시작일-오늘/종료일-내일
        $("#datepicker1").datepicker().datepicker("setDate", new Date());
        $("#datepicker2").datepicker().datepicker("setDate", new Date().valueOf()+ (24*60*60*1000));

    });
    
</script>
<div class="reserve_select">
	<div class="row">
				<div class="date">
			<div>
				<span><input id="datepicker1" class="datepicker picker__input" placeholder="" aria-haspopup="true" aria-expanded="false" aria-readonly="false" aria-owns="newdatepic_01_root" type="text"><input name="date1" value="날짜" type="hidden"></span>
			</div>
		</div>
		<div class="date">
			<div>
				<span><input id="datepicker2" class="datepicker picker__input" value="" readonly="" aria-haspopup="true" aria-expanded="false" aria-readonly="false" aria-owns="newdatepic_01_root" type="text"><input name="date2" value="날짜" type="hidden"></span>
			</div>
		</div>
			<a id="btn_reservego" class="btn_reservego">방 검색</a>
		</div>
</div>
<!-- Menu (search.js 138참고 )-->
<div class="search_menu">
	<ul>
		<li><a href="#" class="a_room on">객실정보</a></li>
		<li><a href="#" class="a_reserve">예약</a></li>
		<li><a href="#" class="a_review">리뷰</a></li>
	</ul>
</div>			<!-- //업체 요약정보 -->
				<div class="ad_info_wrap">

				<!-- 링크 탭 -->
				<!--div class="link_tab">
					<div>
						<ul>
						<li><a class="bookmark_title">객실정보</a></li>
						 <li><a class="bookmark_title">예약</a></li> 						<li><a class="bookmark_title">요금 및 시간</a></li>
						<li><a class="bookmark_title">공지사항</a></li>
												<li><a class="bookmark_title">리뷰</a></li>
						</ul>
					</div>
				</div-->

				<!-- 객실정보 -->
				<a id="bookmark1"></a>
				<div class="ad_info_room row">
					<div class="info_title margin_align">
						<h4>객실정보</h4>
						<p class="room_detail info_title_sub txt_option">선택하신 날짜 객실 정보 입니다. <span class="info_title_group">(<span class="txt_default">일반가</span>, <span class="txt_spacial">특별가</span>)</span></p>	
					</div>
										<div class="info_cont">
						<ul class="room_list">
														<li>
								<a href="javascript:showLayerImg('thum', 0,'/adimg_new/1667/27820/bcf79b3068d1372f1395eea640ba16bd.jpg');">
								<div class="room_img">
									<div class="img_wrap imgLiquidFill">
										<span class="thumb_none"></span>
										<img src="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/27820/bcf79b3068d1372f1395eea640ba16bd.jpg" data-src="/adimg_new/1667/27820/bcf79b3068d1372f1395eea640ba16bd.jpg" alt="" class="" data-original="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/27820/bcf79b3068d1372f1395eea640ba16bd.jpg" style="display: block;">
									</div>
								</div>
								<p class="room_name">
									특실 트윈									<!-- 예약가능 버튼 -->
																		<span class="reserve_ok">예약가능</span>
																	</p>
																<div class="room_txt">
								<p class="room_info"><span>대실&nbsp;&nbsp;</span><strong style="color:#000">20,000</strong>원~<i>|</i>12시간</p>								<p class="room_info"><span>숙박&nbsp;&nbsp;</span><strong>45,000</strong>원~<i>|</i>21:00시부터</p>								</div>
								
								<div id="info_text0" style="display:none">
									<h4>특실 트윈</h4>
									<p>
										대실&nbsp;&nbsp;<strong>20,000</strong>원~<i>|</i>12시간 <br>										숙박&nbsp;&nbsp;<strong>45,000</strong>원~<i>|</i>21:00시부터									</p>
								</div>

								</a>
							</li>
														<li>
								<a href="javascript:showLayerImg('thum', 1,'/adimg_new/1667/27816/c1e9b8dba451883be305e27f01bd4743.jpg');">
								<div class="room_img">
									<div class="img_wrap imgLiquidFill">
										<span class="thumb_none"></span>
										<img src="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/27816/c1e9b8dba451883be305e27f01bd4743.jpg" data-src="/adimg_new/1667/27816/c1e9b8dba451883be305e27f01bd4743.jpg" alt="" class="" data-original="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/27816/c1e9b8dba451883be305e27f01bd4743.jpg" style="display: block;">
										<!-- img src="" data-src="/adimg_new/1667/27816/c1e9b8dba451883be305e27f01bd4743.jpg" alt="" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'"/ -->
									</div>
								</div>
								<p class="room_name">
									일반 더블									<!-- 예약가능 버튼 -->
																		<span class="reserve_ok">예약가능</span>
																	</p>
																<div class="room_txt">
								<p class="room_info"><span>대실&nbsp;&nbsp;</span><strong style="color:#000">15,000</strong>원~<i>|</i>12시간</p>								<p class="room_info"><span>숙박&nbsp;&nbsp;</span><strong>40,000</strong>원~<i>|</i>21:00시부터</p>								</div>
								
								<div id="info_text1" style="display:none">
									<h4>일반 더블</h4>
									<p>
										대실&nbsp;&nbsp;<strong>15,000</strong>원~<i>|</i>12시간 <br>										숙박&nbsp;&nbsp;<strong>40,000</strong>원~<i>|</i>21:00시부터									</p>
								</div>

								</a>
							</li>
														<li>
								<a href="javascript:showLayerImg('thum', 2,'/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg');">
								<div class="room_img">
									<div class="img_wrap imgLiquidFill">
										<span class="thumb_none"></span>
										<img src="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg" data-src="/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg" alt="" class="" data-original="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg" style="display: block;">
										<!-- img src="" data-src="/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg" alt="" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'"/ -->
									</div>
								</div>
								<p class="room_name">
									일반 트윈									<!-- 예약가능 버튼 -->
																		<span class="reserve_ok">예약가능</span>
																	</p>
																<div class="room_txt">
								<p class="room_info"><span>대실&nbsp;&nbsp;</span><strong style="color:#000">15,000</strong>원~<i>|</i>12시간</p>								<p class="room_info"><span>숙박&nbsp;&nbsp;</span><strong>40,000</strong>원~<i>|</i>21:00시부터</p>								</div>
								
								<div id="info_text2" style="display:none">
									<h4>일반 트윈</h4>
									<p>
										대실&nbsp;&nbsp;<strong>15,000</strong>원~<i>|</i>12시간 <br>										숙박&nbsp;&nbsp;<strong>40,000</strong>원~<i>|</i>21:00시부터									</p>
								</div>

								</a>
							</li>
														<li>
								<a href="javascript:showLayerImg('thum', 3,'/adimg_new/1667/948/f4650ae5ec76cd93054b6e561a648583.jpg');">
								<div class="room_img">
									<div class="img_wrap imgLiquidFill">
										<span class="thumb_none"></span>
										<img src="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/948/f4650ae5ec76cd93054b6e561a648583.jpg" data-src="/adimg_new/1667/948/f4650ae5ec76cd93054b6e561a648583.jpg" alt="" class="" data-original="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/948/f4650ae5ec76cd93054b6e561a648583.jpg" style="display: block;">
										<!-- img src="" data-src="/adimg_new/1667/948/f4650ae5ec76cd93054b6e561a648583.jpg" alt="" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'"/ -->
									</div>
								</div>
								<p class="room_name">
									기타									<!-- 예약가능 버튼 -->
																	</p>
																<div class="room_txt"><p class="room_info"><span>제휴점 외관 및 시설 사진입니다.</span></p></div>
								
								<div id="info_text3" style="display:none">
									<h4>기타</h4>
									<p>
																													</p>
								</div>

								</a>
							</li>
													</ul>
					</div>
									</div>
				<!-- //객실정보 -->
				
		</div>
</body>
</html>