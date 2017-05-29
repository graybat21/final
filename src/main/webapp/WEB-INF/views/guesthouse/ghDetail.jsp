<!DOCTYPE html>
<html lang="ko">
<%@page pageEncoding="UTF-8"%>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
</head>
<body class="pcweb" ondragstart="return false">
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
	<div id="map" style="width: 350px; height: 200px; float: right;"></div>
		<div class="cont">
			<h3>${hostinfo.name}</h3>
			<p class="address btn_copy">${hostinfo.addr1 }&nbsp; ${hostinfo.addr2 } &nbsp;${hostinfo.zip }</p>
			<p class="tel">☎ ${hostinfo.tel }</p>
			<a href="wishAdd.gh?session_mem_no=${sessionScope.session_mem_no}&session_host_no=${sessionScope.session_host_no}" class="btn_zzim ">찜하기</a>
		</div>
		
		<!-- 주소 -->

					<div style="position: absolute; z-index: 1; left: 0px; top: 0px;">
						<div style="position: absolute;">
							<div style="position: absolute; z-index: 1; left: 0px; top: 0px;">

								<script type="text/javascript"
									src="//apis.daum.net/maps/maps3.js?apikey=777b98fd0553ecb180492b79d3bd2d7c&libraries=services"></script>
								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new daum.maps.LatLng(
												33.450701, 126.570667), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};

									// 지도를 생성합니다    
									var map = new daum.maps.Map(mapContainer,
											mapOption);

									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new daum.maps.services.Geocoder();

									// 주소로 좌표를 검색합니다
									geocoder
											.addr2coord(
													'${hostinfo.addr1 }',
													function(status, result) {

														// 정상적으로 검색이 완료됐으면 
														if (status === daum.maps.services.Status.OK) {

															var coords = new daum.maps.LatLng(
																	result.addr[0].lat,
																	result.addr[0].lng);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new daum.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new daum.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">${hostinfo.name}</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								</script>
							</div>
						</div>
					</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
		<!-- <div id="maparea" class="map" style="overflow: hidden; background: transparent url(&quot;https://i1.daumcdn.net/dmaps/apis/loading_n.png&quot;) repeat scroll 0% 0%;">
		<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; cursor: url(&quot;https://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;), default;">
		<div style="position: absolute;"><div style="position: absolute; z-index: 1; left: 0px; top: 0px;">
		 --><!-- <img src="https://map3.daumcdn.net/map_2d_hd/23i/L4/1030/467.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -63px; top: 28px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false">
		<img src="https://map0.daumcdn.net/map_2d_hd/23i/L4/1030/468.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 193px; top: 28px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map1.daumcdn.net/map_2d_hd/23i/L4/1030/469.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 449px; top: 28px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map3.daumcdn.net/map_2d_hd/23i/L4/1031/467.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -63px; top: -228px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map0.daumcdn.net/map_2d_hd/23i/L4/1031/468.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 193px; top: -228px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"><img src="https://map1.daumcdn.net/map_2d_hd/23i/L4/1031/469.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 449px; top: -228px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;" draggable="false"></div><div style="position: absolute; z-index: 0; left: 0px; top: 0px;"><img src="https://map3.daumcdn.net/map_2d_hd/23i/L3/2061/935.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 64.5px; top: 28.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map0.daumcdn.net/map_2d_hd/23i/L3/2061/936.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 192.5px; top: 28.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map1.daumcdn.net/map_2d_hd/23i/L3/2061/937.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 320.5px; top: 28.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map3.daumcdn.net/map_2d_hd/23i/L3/2062/935.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 64.5px; top: -99.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map0.daumcdn.net/map_2d_hd/23i/L3/2062/936.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 192.5px; top: -99.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"><img src="https://map1.daumcdn.net/map_2d_hd/23i/L3/2062/937.png" alt="" style="position: absolute; -moz-user-select: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 320.5px; top: -99.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;" draggable="false"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 500px; height: 200px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; position: absolute; left: -1000px; top: -400px; width: 2500px; height: 1000px;" viewBox="0 0 2500 1000"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px;"><div style="position: absolute; margin: -39px 0px 0px -13px; z-index: 0; left: 274px; top: 95px;"><img style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px none; display: block; position: absolute; -moz-user-select: none; clip: rect(0px, 40px, 42px, 0px); top: 0px; left: 0px; width: 40px; height: 42px;" draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/default_marker.png" alt=""><img src="https://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px none; display: block; position: absolute; -moz-user-select: none; width: 40px; height: 42px;" draggable="false" usemap="#daum.maps.Marker.Area:6"><map id="daum.maps.Marker.Area:6" name="daum.maps.Marker.Area:6"><area href="javascript:void(0)" alt="" shape="poly" coords="13,42,9,27,7,23,0,16,0,10,4,4,9,0,17,0,22,4,26,10,26,16,19,23,17,27" title=""></map></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; white-space: nowrap; font: 11px tahoma,sans-serif; color: rgb(85, 85, 85); left: 7px; bottom: 5px;"><a target="_blank" href="http://map.daum.net/" style="float: left; width: 38px; height: 17px; cursor: pointer;" title="Daum 지도로 보시려면 클릭하세요."><img src="https://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/m_bi.png" alt="Daum 지도로 이동" style="width: 37px; height: 18px; border: medium none;"></a><div style="color: rgb(0, 0, 0); text-align:center; font-size: 10px; margin: 0px 2px; float: left; width: 52px;"><div style="color: rgb(0, 0, 0);">100m</div><div style="position: relative; overflow: hidden; height: 8px; margin-top: -4px;"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/scalebar.png" alt="" style="position: absolute; width: 164px; height: 40px; max-width: none; top: 0px; left: -82px;"></div></div><div style="font: 11px tahoma,sans-serif; float: left; margin: 3px 2px 0px;">© Kakao<span></span></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div></div> -->
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
<script>

function searchRoom(){
/* var from = document.getElementById("datepicker1").value;
var to = document.getElementById("datepicker2").value;
 */
 var from = $("#datepicker1").val();
 var to = $("#datepicker2").val();
 alert(from);
	alert(to);
	tabView(1);
}
</script>
<div class="reserve_select">
	<div class="row">
		<div class="date">
			<div>
				<span>
				<input id="datepicker1" class="datepicker picker__input" placeholder="" 
				aria-haspopup="true" aria-expanded="false" aria-readonly="false" aria-owns="newdatepic_01_root" type="text">
				<input id="from" name="from" value="from" type="hidden">
				</span>
			</div>
		</div>
		<div class="date">
			<div>
				<span>
				<input id="datepicker2" class="datepicker picker__input" value="" readonly="" 
				aria-haspopup="true" aria-expanded="false" aria-readonly="false" aria-owns="newdatepic_01_root" type="text">
				<input id="to" name="to" value="to" type="hidden">
				</span>
			</div>
		</div>
			<a id="btn_reservego" class="btn_reservego" href="javascript:searchRoom()">방 검색</a>
		</div>
</div>
<!-- Menu (search.js 138참고 )-->

<script>
$(document).ready(function(){
	var tab= "${tab}";
	if(tab == ''){
		tab = 1;
	}
	tabView(tab);
});


	function tabView(tab) {
		var host_no = $("#host_no").val();
		var from = $("#datepicker1").val();
		 var to = $("#datepicker2").val();
		 
		$(".search_menu *").removeClass('on');

		if(tab == 1){
			$.ajax({
				url:"/GuestHi/tabRoomDetail.gh",
				type: "post",
				data: {host_no: host_no, from: from, to: to},
				success: function(data){
					$(".ad_info_wrap").html(data);
				},
				error: function(data){
					alert(data.status);//404 , 500 , 400
					alert(data.readyState);//3 = 일부분 응답, 4= 통신 2=보넀는데 응답이 없다 1=요청이안간다
				}
			});
			
			/* $(".ad_info_wrap").load("/GuestHi/tabRoomDetail.gh",{host_no: no},function(){},function(){alert("?");}); */
			
			$("#tabRoom").addClass('on');
		}
		if(tab == 2){
			$.ajax({
				url:"/GuestHi/tabReserve.gh",
				type: "post",
				data: {host_no: host_no},
				success: function(data){
					$(".ad_info_wrap").html(data);
				},
				error: function(data){
					alert(data.status);//404 , 500 , 400
					alert(data.readyState);//3 = 일부분 응답, 4= 통신 2=보넀는데 응답이 없다 1=요청이안간다
				}
			});
			
			$("#tabReserve").addClass('on');
		}
		if(tab == 3){
			$.ajax({
				url:"/GuestHi/tabReview.gh",
				type: "post",
				data: {host_no: host_no},
				success: function(data){
					$(".ad_info_wrap").html(data);
				},
				error: function(data){
					alert(data.status);//404 , 500 , 400
					alert(data.readyState);//3 = 일부분 응답, 4= 통신 2=보넀는데 응답이 없다 1=요청이안간다
				}
			});
			$("#tabReview").addClass('on');
		}
	//★	
	}
</script>
<div class="search_menu">
	<ul>
		<li><a id="tabRoom" href="javascript:tabView(1)" class="a_room">객실정보</a></li>
		<li><a id="tabReserve" href="javascript:tabView(2)" class="a_reserve">예약</a></li>
		<li><a id="tabReview" href="javascript:tabView(3)" class="a_review">리뷰</a></li>
	</ul>
</div>			

	<div class="ad_info_wrap"></div>
	
	<form name="value">
	<input type="hidden" id="host_no" value="${host_no}">
	<input type="hidden" id="tab" value="${tab }">
	</form>
</body>
</html>