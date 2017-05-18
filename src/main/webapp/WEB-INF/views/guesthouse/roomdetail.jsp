<!DOCTYPE html>
<html lang="ko">
<%@page pageEncoding="UTF-8"%>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
<title>게스트하우스리뷰</title>
</head>
<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
 	<!-- 페이지별 호출 소스 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/detail.css">
	<!-- //페이지별 호출 소스 -->
	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">업체상세페이지</h2>
		<!-- 페이지 navi -->
		<script src="/folder/jquery_003.js"></script>
		<div class="addetail_wrap" style="text-align: left;">
			<!-- 업체 요약정보 -->
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=87795&libraries=services,clusterer,drawing"></script>
			<script charset="UTF-8" src="https://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/3.5.16/1486533804955/open.js"></script>
			<script charset="UTF-8" src="https://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/libs/1441176450396/services.js"></script>
<script>
	var alat = "37.70929718";
	var alng = "127.1109074";
	showMap();

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
            minDate: 1, // 오늘 이전 날짜 선택 불가
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
        $("#datepicker2").datepicker().datepicker("setDate", new Date().valueOf());

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
				<!-- 객실정보 -->
				<a id="bookmark1"></a>
				<div class="ad_info_room row">
					<div class="info_title margin_align">
						<h4>객실정보</h4>
						<p class="room_detail info_title_sub txt_option">선택하신 날짜 객실 정보 입니다. <span class="info_title_group">(<span class="txt_default">일반가</span>, <span class="txt_spacial">특별가</span>)</span></p>	
					</div>
										<div class="info_cont">
						<ul class="room_list">
									</div>
								</div>
								<p class="room_name">
								2인실									
								<!-- 예약가능 버튼 -->
									<span class="reserve_ok">예약가능</span>
								</p>
								<div class="room_txt">
								<p class="room_info"><span>요금&nbsp;&nbsp;</span><strong>45,000</strong>원<i>|</i>1인 요금</p>								
								<p class="room_info"><strong style="color:#000">잔여 인원</strong><i>|</i>3명</p>		
								</div>
								<!-- 
								<div id="info_text0" style="display:none">
									<h4>특실 트윈</h4>
									<p>
										대실&nbsp;&nbsp;<strong>20,000</strong>원~<i>|</i>12시간 <br>										숙박&nbsp;&nbsp;<strong>45,000</strong>원~<i>|</i>21:00시부터									</p>
								</div> -->
								<!--//imgpopup  -->

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
									4인실									
									<!-- 예약가능 버튼 -->
										<span class="reserve_ok">예약가능</span></p>
								<div class="room_txt">
									<p class="room_info"><span>요금&nbsp;&nbsp;</span><strong>35,000</strong>원<i>|</i>1인 요금</p>								
									<p class="room_info"><strong style="color:#000">잔여 인원</strong><i>|</i>8명</p>										
								<!-- <div id="info_text1" style="display:none">
									<h4>일반 더블</h4>
									<p>
										대실&nbsp;&nbsp;<strong>15,000</strong>원~<i>|</i>12시간 <br>										숙박&nbsp;&nbsp;<strong>40,000</strong>원~<i>|</i>21:00시부터									</p>
								</div> -->
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
									12인실(여성)							
									<!-- 예약가능 버튼 -->
									<span class="reserve_ok">예약가능</span>
								</p>
								<div class="room_txt">
								<p class="room_info"><span>요금&nbsp;&nbsp;</span><strong>15,000</strong>원<i>|</i>1인 요금</p>								
								<p class="room_info"><strong style="color:#000">잔여 인원</strong><i>|</i>20명</p>	
								<!-- <div id="info_text2" style="display:none">
									<h4>일반 트윈</h4>
									<p>
										대실&nbsp;&nbsp;<strong>15,000</strong>원~<i>|</i>12시간 <br>										숙박&nbsp;&nbsp;<strong>40,000</strong>원~<i>|</i>21:00시부터									</p>
								</div> -->
								</div>
								</a>
							</li>
							<li>
								<a href="javascript:showLayerImg('thum', 3,'/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg');">
								<div class="room_img">
									<div class="img_wrap imgLiquidFill">
										<span class="thumb_none"></span>
										<img src="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg" data-src="/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg" alt="" class="" data-original="https://img.goodchoice.kr/resize_588x300/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg" style="display: block;">
										<!-- img src="" data-src="/adimg_new/1667/27818/781e91d6fdfc3a29697dc6724d3c9637.jpg" alt="" onerror="this.src='https://img.goodchoice.kr/images/web_v2/search/img_blank.png'"/ -->
									</div>
								</div>
								<p class="room_name">
									12인실(남성)									
									<!-- 예약가능 버튼 -->
									<span class="reserve_ok">예약가능</span>
								</p>
								<div class="room_txt">
								<p class="room_info"><span>요금&nbsp;&nbsp;</span><strong>15,000</strong>원<i>|</i>1인 요금</p>								
								<p class="room_info"><strong style="color:#000">잔여 인원</strong><i>|</i>30명</p>	
								<!-- <div id="info_text2" style="display:none">
									<h4>일반 트윈</h4>
									<p>
										대실&nbsp;&nbsp;<strong>15,000</strong>원~<i>|</i>12시간 <br>										숙박&nbsp;&nbsp;<strong>40,000</strong>원~<i>|</i>21:00시부터									</p>
								</div> -->
								</div>
								</a>
							</li>
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

			</div>
</body>
</html>