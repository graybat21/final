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
		<li><a href="#" class="a_room ">객실정보</a></li>
		<li><a href="#" class="a_reserve on">예약</a></li>
		<li><a href="#" class="a_review">리뷰</a></li>
	</ul>
</div>			<!-- //업체 요약정보 -->

			<div class="ad_info_wrap">
				<!-- 예약 -->
				<a id="bookmark2"></a>
<div class="reserve_wrap row" style="display: block;">
	<div class="info_title">
		<h4>예약</h4>
	</div>
	<div class="reserve">
		
<!-- 예약 -->
<script>
    ///////3분타이머 문제로 주석
    var limit = true;
    //////
    var do_no = "";                    //주문번호
    var todaycnt = "0";                //금일 예약수
    var roomcnt = "0";        //객실수
    var armgno = "";                  //객실번호
    var total_price = Number("0");          //결제금액

    //정규식 모음
    var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi
    var regExp_hp = /^01([016789])([1-9]{1})([0-9]{2,3})([0-9]{4})$/
    var nameExp = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/

    //객실 미선택 진입시 결제금액 초기화
    if(armgno == ''){
        total_price = 0;
    }

    //이전 데이터 시작
    var orderInfo = "";                      //주문정보
    var do_pay_type = "";     //결제방법
    var do_cpnis_no = "";     //쿠폰번호

    var do_use_point = "0"; //사용 포인트
    var do_use_point_coupon = "0";    //사용 쿠폰 포인트

    var do_from_name = "";   //예약자 이름
    var do_from_tel = "";     //예약자연락처

    var do_parking_type = ""; //방문방법
	var do_parking_use = "N";						//주차장 만차


</script>
<script src="https://mup.mobilians.co.kr/js/ext/ext_inc_comm.js"></script>
<script src="/js/app/daily_order_inicis.js?rand=1476499599"></script>
<script src="/js/app/daily_order_view_web.js"></script>
<script src="/js/app/jquery.total-storage.min.js"></script>

<script src="/js/app/iscroll.js?rand=1476499599"></script>
<link rel="stylesheet" href="/css/app/owl.carousel.css?rand=1476499599">
<script src="/js/app/owl.carousel.min.js?rand=1476499599"></script>
<!-- Left Content -->
<div class="left">

	<!-- 리턴 URL -->
    
<input name="returnUrl" value="/search/detailView/1987" type="hidden">

    <!-- 예약정보 폼 -->
<form action="/dailyorderweb/setPayDailyOrder" method="post" accept-charset="utf-8" id="pay_form">
    
<input name="do_no" value="" type="hidden">
    
<input name="dop_no" value="" type="hidden">
    
<input name="do_uno" value="" type="hidden">
    
<input name="do_pay_type2" value="" type="hidden">
    
<input name="do_os_type2" value="" type="hidden">
    </form>
	<form action="/dailyorderweb/setPayDailyOrder" method="post" accept-charset="utf-8" id="order_form">
    
<input name="uno" value="" type="hidden">
    
<input name="deviceid" value="" type="hidden">
    
<input name="ano" value="1987" type="hidden">
    
<input name="do_no" value="" type="hidden">
    
<input name="dop_qty" value="1" type="hidden">
 <!-- 예약수량 -->
    
<input name="do_use_point_coupon" value="0" type="hidden">
    
<input name="do_original_price" value="0" type="hidden">
    
<input name="do_total_price" value="0" type="hidden">
    
<input name="do_save_point" value="" type="hidden">
    
<input name="do_cpnis_no" value="" type="hidden">
    
<input name="do_pay_type" value="6" type="hidden">
    
<input name="do_os_type" value="W" type="hidden">
    
<input name="do_parking_type" value="" type="hidden">
    
<input name="do_pay_commission" value="1" type="hidden">
    
<input name="do_coupon_max_price" value="0" type="hidden">
    
<input name="dpod_sale_type" value="2" type="hidden">
    
<input name="dpod_chkin_date" value="" type="hidden">
    
<input name="dpod_chkout_date" value="" type="hidden">
    
<input name="dpod_dayuse_time" value="" type="hidden">
    
<input name="sel_date" value="2017-05-12" type="hidden">
    
<input name="chkin_time" value="" type="hidden">

	
<input name="iot_type" value="" type="hidden">

    
<input name="cpn_benefit" value="" type="hidden">
    
<input name="coupon_use_rate" value="" type="hidden">

    
<input name="pay_process" value="N" type="hidden">

    
<input name="ad_park_state" value="Y" type="hidden">
	<!-- Change Room -->
	<div id="chg_room">
				<div id="armgno24019" class="chg_room" data-armgname="room1" data-dpod_no="9381178" data-chkin="2017.05.12 (금) 17:00" data-chkout="2017.05.13 (토) 12:00" data-refund_time="14:00" data-sale-type="2" data-armg-no="24019">
					<a href="javascript:;">
					<input name="armgno" value="24019" type="radio" class="room" > 방1
						<strong>
							<b>100,000원</b>
						</strong>
					</a>
				</div>
				
				<div id="armgno5831" class="chg_room" data-armgname="room2" data-dpod_no="9380901" data-chkin="2017.05.12 (금) 17:00" data-chkout="2017.05.13 (토) 12:00" data-refund_time="14:00" data-sale-type="2" data-armg-no="5831">
					<a href="javascript:;">
					<input name="armgno" value="5831" type="radio" class="room">방2
						<strong>
							<b>100,000원</b>
						</strong>
					</a>
				</div>
						</div>
</form></div>
<!-- Right Content -->
<div id="reserve_detail_view" class="right">

	<!-- 예약자  -->
	<div class="wrap_div">
		<div class="list_inp bd_none">
			<h5>예약자 이름</h5>
			<div class="bd_b">
				<input class="inp_txt" name="do_from_name" placeholder="이름자동입력" maxlength="20" value="" type="text" readonly="readonly">
			</div>
		</div>
		<div class="list_inp bd_none">
			<h5>휴대폰 번호</h5>
			<div class="bd_b">
				<input class="inp_txt" name="do_from_tel" id="do_from_tel" placeholder="휴대폰 번호 자동입력" maxlength="13" value="" type="tel" readonly="readonly">
			</div>
		</div>

				
		
	</div>

	<!-- 할인 -->
	 <!-- 비회원 -->
	<div class="wrap_div">
		<div class="list_inp">
			<h5>입금 계좌</h5>
			<div>
			<input class="inp_txt" name="do_from_name" placeholder="호스트계좌번호" maxlength="20" value="" type="text" readonly="readonly">
			</div>
		</div>
		<div class="list_inp bd_none">
			<h5>은행 및 예금주</h5>
			<div>
				<input class="inp_txt" name="do_from_name" placeholder="신한은행 / 예금주" maxlength="20" value="" type="text" readonly="readonly">
			</div>
		</div>
	</div>
    
	<!-- 입실구분,시간,가격,결제 -->
	<div class="wrap_div info">

		<!-- 앱 HTML 그대로 가져옴 by.KYH -->
		<div class="info_txt">
			<p class="first_pd">총 주문금액<span class="total_price">0원</span></p>
			<!-- 유저 일때만 출력 2016-08-31 by.sim-->
			<p class="total_dc"><b>총 할인금액</b><span class="org" id="show_total_price">- 0원</span></p>
			<p><b class="org">최종 결제 금액</b><span class="total_val">0원</span></p>
		</div>
	</div>

	<div class="agree">
		<input id="chk_agree4" name="chk_agree4" class="inp_chk chk_agree1" value="Y" type="checkbox">
		<label for="chk_agree4" class="chk-label">본인은 <a href="/info/agreeUser" target="_blank" style="margin-right:0;">이용약관</a> 및 <a href="/info/privateUser" target="_blank" style="margin-right:0;">개인정보처리방침</a>을 읽었으며 이에 동의합니다.</label>
	</div>
	
	<div class="pay_btn">
		<a href="javascript:;" id="go_pay">결제하기</a>
	</div>
</div>

<div class="clear">&nbsp;</div>

</div>

<form action="http://localhost/dailyorderweb/dailyOrderV271" method="post" id="inicis_pay" name="inicis_pay" accept-charset="euc-kr">
    
<input name="P_MID" value="" type="hidden">
    
<input name="P_NEXT_URL" value="" type="hidden">
    
<input name="P_HPP_METHOD" value="" type="hidden">
    
<input name="P_OID" value="" type="hidden">
    
<input name="P_GOODS" value="" type="hidden">
    
<input name="P_AMT" value="" type="hidden">
    
<input name="P_UNAME" value="" type="hidden">
    
<input name="P_MNAME" value="" type="hidden">
    
<input name="P_MOBILE" value="" type="hidden">
    
<input name="P_EMAIL" value="" type="hidden">
    
<input name="P_RESERVED" value="" type="hidden">
    
<input name="P_NOTI" value="" type="hidden">


</form>
<form action="http://localhost/dailyorderweb/dailyOrderV271" method="post" id="mobilians_pay" name="mobilians_pay" accept-charset="euc-kr">
    
<input name="CASH_GB" value="" type="hidden">
    
<input name="MC_SVCID" value="" type="hidden">
    
<input name="Prdtprice" value="" type="hidden">
    
<input name="PAY_MODE" value="" type="hidden">
    
<input name="LOGO_YN" value="" type="hidden">
    
<input name="Okurl" value="" type="hidden">
    
<input name="Prdtnm" value="" type="hidden">
    
<input name="Siteurl" value="" type="hidden">
    
<input name="Tradeid" value="" type="hidden">
    
<input name="Notiurl" value="" type="hidden">
    
<input name="Closeurl" value="" type="hidden">
    
<input name="Failurl" value="" type="hidden">
    
<input name="MC_No" value="" type="hidden">
    
<input name="Payeremail" value="" type="hidden">
    
<input name="Userid" value="" type="hidden">
    
<input name="CALL_TYPE" value="" type="hidden">
    
<input name="MC_AUTHPAY" value="" type="hidden">
    
</form>
<form action="http://localhost/dailyorderweb/dailyOrderV271" accept-charset="utf-8" id="kakao_pay_form" name="kakao_pay_form" method="POST">    
<input name="FORM_ACTION" value="" type="hidden">
    
<input name="cancel_url" value="" type="hidden">

        
<input name="PayMethod" value="KAKAOPAY" type="hidden">
    
<input name="GoodsName" value="" type="hidden">
    
<input name="Amt" value="" type="hidden">
    
<input name="SupplyAmt" value="" type="hidden">
    
<input name="GoodsVat" value="" type="hidden">
    
<input name="ServiceAmt" value="" type="hidden">
    
<input name="GoodsCnt" value="1" type="hidden">
    
<input name="MID" value="" type="hidden">
    
<input name="AuthFlg" value="10" type="hidden">
    
<input name="EdiDate" value="" type="hidden">
    
<input name="EncryptData" value="" type="hidden">
    
<input name="BuyerEmail" value="" type="hidden">
    
<input name="BuyerName" value="" type="hidden">

        
<input name="OFFER_PERIOD_FLAG" value="N" type="hidden">
    
<input name="OFFER_PERIOD" value="" type="hidden">
    
<input name="CERTIFIED_FLAG" value="CN" type="hidden">
    
<input name="currency" value="KRW" type="hidden">
    
<input name="merchantEncKey" value="" type="hidden">
    
<input name="merchantHashKey" value="" type="hidden">
    
<input name="requestDealApproveUrl" value="" type="hidden">
    
<input name="prType" value="MPM" type="hidden">
    
<input name="channelType" value="2" type="hidden">
    
<input name="merchantTxnNum" value="" type="hidden">

        
<input name="possiCard" value="" type="hidden">
    
<input name="blockCard" value="" type="hidden">
    
<input name="fixedInt" value="" type="hidden">
    
<input name="maxInt" value="" type="hidden">
    
<input name="noIntYN" value="" type="hidden">
    
<input name="pointUseYn" value="" type="hidden">
    
<input name="blockBin" value="" type="hidden">

    <!-- getTxnId 응답 -->
    <input id="resultCode" value="" type="hidden">
    <input id="resultMsg" value="" type="hidden">
    <input id="txnId" value="" type="hidden">
    <input id="prDt" value="" type="hidden">

    <!-- DLP호출에 대한 응답 -->
    <input name="SPU" value="" type="hidden">
    <input name="SPU_SIGN_TOKEN" value="" type="hidden">
    <input name="MPAY_PUB" value="" type="hidden">
    <input name="NON_REP_TOKEN" value="" type="hidden">

</form>
<form action="http://localhost/dailyorderweb/dailyOrderNicePayReturn" id="nice_card_pay_form" name="nice_card_pay_form" method="POST" accept-charset="euc-kr">    
<input name="MID" value="" type="hidden">
    
<input name="EncryptData" value="" type="hidden">
    
<input name="ediDate" value="" type="hidden">

    
<input name="ReturnURL" value="" type="hidden">
    
<input name="RetryURL" value="" type="hidden">
    
<input name="CharSet" value="" type="hidden">

    
<input name="WapUrl" value="" type="hidden">
    
<input name="IspCancelUrl" value="" type="hidden">

    
<input name="PayMethod" value="" type="hidden">
    
<input name="GoodsCl" value="" type="hidden">
    
<input name="Moid" value="" type="hidden">
    
<input name="GoodsCnt" value="" type="hidden">
    
<input name="Amt" value="" type="hidden">
    
<input name="GoodsName" value="" type="hidden">
    
<input name="BuyerName" value="" type="hidden">
    
<input name="BuyerTel" value="" type="hidden">
    
<input name="BuyerEmail" value="" type="hidden">
    
<input name="BuyerAddr" value="" type="hidden">

    
<input name="VbankExpDate" value="" type="hidden">
    
<input name="MallReserved" value="" type="hidden">

	
<input name="TransType" value="0" type="hidden">
	
<input name="OptionList" value="" type="hidden">
	
<input name="EncodeParameters" value="" type="hidden">
</form>
<form action="http://localhost/dailyorderweb/dailyOrderV271" accept-charset="utf-8" id="payco_pay_form" name="payco_pay_form" method="POST">
    
<input name="customerOrderNumber" value="" type="hidden">
    
<input name="cartNo" value="" type="hidden">
    
<input name="orderQuantity" value="1" type="hidden">
    
<input name="productUnitPrice" value="" type="hidden">
    
<input name="productUnitPaymentPrice" value="" type="hidden">
    
<input name="iOption" value="" type="hidden">
    
<input name="sortOrdering" value="0" type="hidden">
    
<input name="productName" value="" type="hidden">
    
<input name="orderConfirmUrl" value="" type="hidden">
    
<input name="orderConfirmMobileUrl" value="" type="hidden">
    
<input name="productImageUrl" value="" type="hidden">
    
<input name="sellerOrderProductReferenceKey" value="ITEM_100001" type="hidden">
    
<input name="taxationType" value="TAXATION" type="hidden">
    
<input name="orderTitle" value="" type="hidden">



    <!-- callPaycoUrl 응답 -->
    <input id="uno" name="uno" value="" type="hidden">
    <!--input type="hidden" id="version" name="version" value="272"/-->
    <input id="order_num" name="order_num" value="" type="hidden">
    <input id="order_url" name="order_url" value="" type="hidden">
</form>
<form action="http://localhost/dailyorderweb/dailyOrderV271" accept-charset="utf-8" id="naver_pay_form" name="naver_pay_form" method="POST">    
<input name="merchantPayKey" value="" type="hidden">
    
<input name="merchantUserKey" value="" type="hidden">
    
<input name="productName" value="" type="hidden">
    
<input name="productCount" value="1" type="hidden">
    
<input name="totalPayAmount" value="" type="hidden">
    
<input name="deliveryFee" value="0" type="hidden">
    
<input name="taxScopeAmount" value="" type="hidden">
</form>
<!-- TODO :  LayerPopup의 Target DIV 생성 -->
<iframe name="txnIdGetterFrame" id="txnIdGetterFrame" src="" style="display:none" width="0" height="0"></iframe>

<script>
$(document).ready(function() {
    //예약정보 에러
    		set24hour2('2017-05-12 17:00:00');
});

// 24시 보정 (입실시간기준 예약시간으로 날짜계산) ::  예약최종확인(숙박)
var set24hour2 = function(chkin_hour){
	if(chkin_hour == '') return false;

	//객실 입퇴실 날짜
	var chkin_arr = chkin_hour.split(' ');
	var chkin_date_arr = chkin_arr[0].split('-');
	var chkin_time_arr = chkin_arr[1].split(':');

	//시간만 사용
	var chkin_date = new Date(chkin_date_arr[0],(chkin_date_arr[1]-1),chkin_date_arr[2],chkin_time_arr[0],chkin_time_arr[1]);

	     //사전예약
		var dt = new Date(chkin_date);
		var dt2=new Date(Date.parse(dt) - 1 * 1000 * 60 * 60 * 24); //하루전
		var dt3=output_date(dt2, 'view');
		var dt3_arr=dt3.split(')');

		var caledmonth, caledday, caledYear;
		 if( dt2.getMonth() < 9 ){
		  caledmonth = '0'+(dt2.getMonth()+1);
		 }else{
		  caledmonth = dt2.getMonth()+1;
		 }
		 if( dt2.getDate() < 9 ){
		  caledday = '0'+dt2.getDate();
		 }else{
		  caledday = dt2.getDate();
		 }
		//$('.chkin2').text(caledmonth+"월 "+caledday+"일 ");
//		console.log(dt3_arr[0]);
//		console.log(dt3_arr[1]);
		$('.chkin2').text(dt3_arr[0]+")");

	};
</script>

	</div>
<script type="text/javascript">

var cancelOk = function() {
	var f = document.reserve_mov;
	f.dpod_sale_type.value = '';
	f.armgno.value = '';
	f.sel_date.value = "2017-05-12";
	f.submit();
};

// 기본 팝업 오픈
function open_pop(el){ // 기본 팝업 오픈
	var temp = $('.' + el);
	$(temp).fadeIn();
	$('.bg_opacity_rsv').fadeIn();
	$(window).bind("touchmove",function(e){e.preventDefault()	}); // 모바일 터치 잠금
	//	common_layer_open2("정말 취소하시겠습니까?", "javascript:cancelOk();", "javascript:close_pop();");
}

function cancel_pop() {
	$(".test_02").fadeIn();
	$('.bg_opacity_rsv').fadeIn();
	$(window).bind("touchmove",function(e){e.preventDefault()	}); // 모바일 터치 잠금
	common_layer_open2("정말 취소하시겠습니까?", "javascript:cancelOk();", "javascript:close_pop();");
}

// 쿠폰 팝업 오픈
function open_cpPop(obj){
	if($(obj).hasClass("has_cp_cncl")) {
		return false;
	}

	$('.pop_cp').fadeIn();
	$('.bg_opacity_rsv').fadeIn();
}

function close_pop(){ // 팝업 닫기
	$('.lpop').fadeOut();
	$('.bg_opacity_rsv').fadeOut();
	$(window).unbind("touchmove"); // 모바일 터치 해제
}

$(function(){ // 팝업 닫기 (배경)
	$('.bg_opacity_rsv').bind('touchstart click',function(e){
		e.preventDefault();
		close_pop();
	});
});

//2016-07-11 : 예약 객실 리스트 by KJS
function reserve_armg_call() {	
	var frm = document.reserve_mov;
	frm.dpod_sale_type.value = $("input[name='sel_reserve0']:checked").val();
	frm.mode.value = "Reserve";
	//frm.armgno.value = 0;
	//alert($("input[name='armgno']:checked").val());
	//frm.sel_date.value = $("#datepic_02").val();
	frm.submit();
}

function scrollLink(obj, speed){
	$(".bookmark_title").removeClass("on");
	$("#"+obj+"_title").addClass("on");

	var position = $("#"+obj).offset();
	if(position != undefined) {
		$('html, body').animate({scrollTop : position.top-120}, speed);
	}
}

$(function(){ // 팝업 닫기 (배경)
	$(".chg_room a").on('click', function() {
		$(".chg_room a").removeClass('active');
		$(this).addClass('active');
	});

	$('.bg_opacity_rsv').bind('touchstart',function(){
		close_pop();
	});


			$("#sel_dayuse, #sel_night").click(function() {
			var frm = document.reserve_mov;
			$("input[name='sel_reserve']").val($("input[name='sel_reserve0']:checked").val());
			$('#datepic_02').val($("#datepic_01").val());
			
			$("#btn_reservego").unbind("click").click(function() {
				
				reserve_armg_call();
			});
		});
		$("#sel_dayuse_02, #sel_night_02").click(function(){
			if(!$('.search_menu li a').hasClass('a_reserve on'))return;
			reserve_armg_call();
			
	});
	
	
			//2016-07-13 : 숙박예약, 대실예약, 날짜 선택시 예약탭에 스크롤 고정 by KJS
		scrollLink("bookmark2", 0);

		spe_pop_chk(sel_date);
	
});
	var all_div = $('.ad_info_room, .reserve_wrap, .ad_info_price, .ad_info_notice, .ad_info_theme, .ad_info_review');
	all_div.hide();
	$('.reserve_wrap').show();
</script>
<form name="reserve_mov" action="/search/detailView/1987" method="POST">
	<input name="dpod_sale_type" value="2" type="hidden">
	<input name="armgno" value="" type="hidden">
	<input name="mode" value="" type="hidden">
	<input name="sel_date" value="2017-05-12" type="hidden">
	<input name="selected" value="1" type="hidden">
</form>				<!-- //예약 -->
				
			</div>
		</div>
</body>
</html>