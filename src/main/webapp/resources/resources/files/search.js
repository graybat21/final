
var resize_ratio = 1;

if(resize_ratio > 0) resize_ratio = Math.floor(window.devicePixelRatio);

if(resize_ratio > 2) resize_ratio = 2;

var resize = {	
	'list_ui_premium' : (resize_ratio * 473)+'x'+(resize_ratio * 196) // 프리미엄 광고
	,'list_ui_normal' : (resize_ratio * 255)+'x'+(resize_ratio * 133) // 일반형
	,'list_ui_renewal' : (resize_ratio * 473)+'x'+(resize_ratio * 196) // 신축/리모델링 
	,'detail_main' : (1200)+'x'+(540) // 상세 메인이미지
	,'detail_room' : (resize_ratio * 294)+'x'+(resize_ratio * 150) // 상세 객실
	,'detail_theme' : (resize_ratio * 294)+'x'+(resize_ratio * 150) // 상세 테마
	,'detail_review' : (resize_ratio * 116)+'x'+(resize_ratio * 78) //  이용후기
	
	,'detail_thum' : (resize_ratio * 130)+'x'+(resize_ratio * 80) // 슬라이드 섬네일
}

var search_msg = {
	'ajax_fail' : '다시 시도하여 주세요.'

	,'geolocation' : {
		'notsupport_brower' : '사용하시는 브라우저가 위치정보를 지원하지 않습니다.'
		,'fail_msg' : {
			0 : '위치 정보를 알 수 없습니다.'
			,1 : '위치정보를 사용할 수 없습니다.\n브라우저의 위치사용을 허용해 주세요.'
			,2 : '위치 확인에 실패하였습니다.\n재시도 해주세요.'
			,3 : '위치 확인에 실패하였습니다.\n재시도 해주세요.'
		}
		,'fail_msg_footer' : '\n\n위치를 찾을 수 없기 때문에 직접 위치를 설정하여 주시기 바랍니다.'
	}
}

//위치 정보(대기시간 10초)
function geoFindMe(setCookie,reload,showMsg) {
	
	if (!navigator.geolocation){
		alert(search_msg['geolocation']['notsupport_brower']);
		location.reload(true);
	}

	var geoOption = {
		maximumAge : 1 * 60 * 1000
		,timeout: 10 * 1000
		,enableHighAccuracy: false //정밀한 위치 (모바일 성능 고려 on/off)
	}


	//위치검색 허용 안함
	function error(e) {
		
		// (1)권한 없음(permission denied), (2) 위치확인 불가(position unavailable), (3) 시간초과(timeout)
		if(showMsg == true) alert(search_msg['geolocation']['fail_msg'][e.code]);
		//권한 문제시 리로드안함
		if(e.code != 1 && e.code != 2) location.reload(true);


	};	
	
	//위치검색 허용
	function success(position) {
		var lat  = position.coords.latitude; //위도
		var lon = position.coords.longitude; //경도

		if(setCookie == true) setGeoPosition(lat,lon);

		if(reload == true) {
			//location.reload(true);
			if(confirm('위치 정보를 기반으로 새로고침 하시겠습니까?')) location.replace(window.location.origin + window.location.pathname);
		}

		if($('body').hasClass('pcweb')) aroundRefresh();
	};
	navigator.geolocation.getCurrentPosition(success, error, geoOption);
}


//위치정보 쿠키 저장 (주소값 변환)
var geoList = $.fn.cookieList("geoList");
function setGeoPosition(lat,lon){
	
	var obj = new Object();
	
	$.ajax({
		type: 'POST',
		async: false,
		cache: false,
		url: '/search/daumDetailAddress',
		dataType: 'json',
		data: { 'lat': lat, 'lon' : lon },
		success: function(data) {
			obj.adr = data.adr;
		},
		error: function(e) {
			//console.log(e);
			alert(search_msg['ajax_fail']);
			location.reload(true);
		}
	});
	obj.lat = lat;
	obj.lon= lon;
	
	geoList.add(obj);
}

//위치정보 쿠키 불러오기
function getGeoPosition(){
	return geoList.items();
}


//내주변 정보 교체 (메인)
function aroundRefresh(){
	getSearchData('main',function(data){
		$('.around .area_info .area_cnt').hide();
		$('.around .area_info .area_desc').html('&nbsp;');
		if(data != undefined){	
			$('.around .area_info span').hide();
			if(data.area_cnt > 0){
				$('.around .area_info .area_cnt').html(data.area_cnt_desc).show();
			}else{
				$('.around .area_info .cnt_zero').show();		
			}
			$('.around .area_info .area_desc').html(data.area_desc);

			$('.renewal .area_cnt').html(data.renewal_cnt);
		}
	});
}

$(window).resize(function(){
	$(".srch_list:not(.list_g5) .imgLiquidFill").imgLiquid({fill:true});
});

$(document).ready(function() {

	// 상세 탭메뉴 160920 KYH
	$('.search_menu li a').each(function(){
		$(this).bind('click',function(e){
			e.preventDefault();
			var all_div = $('.ad_info_room, .reserve_wrap, .ad_info_price, .ad_info_notice, .ad_info_theme, .ad_info_review')
			$('.search_menu li a').removeClass('on');
			$(this).addClass('on');
			if ($(this).hasClass('a_room'))
			{
				all_div.hide();
				$('.ad_info_room').show();
			}
			else if ($(this).hasClass('a_reserve'))
			{
				all_div.hide();
				reserve_armg_call();
				$('.reserve_wrap').show();				
			}
			else if ($(this).hasClass('a_time'))
			{
				all_div.hide();
				$('.ad_info_price').show();
			}
			else if ($(this).hasClass('a_notice'))
			{
				all_div.hide();
				$('.ad_info_notice').show();
			}
			else if ($(this).hasClass('a_theme'))
			{
				all_div.hide();
				$('.ad_info_theme').show();
			}
			else if ($(this).hasClass('a_review'))
			{
				all_div.hide();
				$('.ad_info_review').show();
			}
		});
	});

	// 총 할인금액 노출 160921 KYH
    $('.info .total_dc').click(function(){
        if ($(this).hasClass('on'))
        {
            $('.dc_hide').slideUp(180);
            $(this).removeClass('on');
        }
        else{
            $('.dc_hide').slideDown(180);
            $(this).addClass('on');
        }
    });

	// 휴대폰 문자 알림 노출
    $('.pay_type div a').each(function(e){
        $(this).click(function(){
		    $('.pay_type div a').removeClass('on');
			if ($(this).hasClass('on'))
			{
				null;
			}
            else if(e == 1)
            {
				$(this).addClass('on');
                $('.pay_alert').addClass('on');
            }
//			else if ($(this).hasClass('naver_pop'))
//			{
//				if ($(this).hasClass('on_pop'))
//				{
//					$(this).addClass('on');
//	                $('.pay_alert').removeClass('on');
//				}
//				else{
//	                $('.pay_alert').removeClass('on');
//					$('.pop_naverpay').fadeIn();
//					$(".bg_opacity_rsv").fadeIn();
//					$(this).addClass('on');
//					$(this).addClass('on_pop');
//				}
//			}
            else{
				$(this).addClass('on');
                $('.pay_alert').removeClass('on');
            }
        });
    });

	// 광고 노출 팝업 160929 KYH
	$('.ad_poptxt').each(function(){
		$(this).bind('touchstart',function(){
			$('.ad_pop',this).fadeIn(150);
			$(this).addClass('opend');
			$(this).addClass('over');
			setTimeout(function(){
				$('.ad_pop').fadeOut(150);
				$('.ad_poptxt').removeClass('over');
			},3000);
		});
		$(this).bind('mouseenter',function(){
			if ($(this).hasClass('opend'))
			{
				null;
			}
			else{
				$('.ad_pop',this).fadeIn(150);
				$(this).addClass('over');
			}
		});
		$(this).bind('mouseleave',function(){
			setTimeout(function(){
				$('.ad_pop').fadeOut(150);
				$('.ad_poptxt').removeClass('over');
			},3000);
		});
	});

	var positionList = getGeoPosition();

	if(positionList.length == 0) {
//		if($('#type').val() == 'around') geoFindMe(true,true,true);
//		else geoFindMe(true,true,false);
		geoFindMe(true,false,false);
	}else{
		//alert(positionList.length);
		if(positionList.length > 0){
			//geoFindMe(false,false,false);
			//navigator.geolocation.getCurrentPosition(function(){},function(){});

			//위치검색기록
			$('.reset_history').show();
			$.each(positionList,function(idx,obj){
				var $history = $('#areaReset .history_dummy').clone().removeClass('history_dummy').show();
				$history.find('a').data('lat',obj.lat).data('lon',obj.lon).data('idx',idx);
				$history.find('span.adr').text(obj.adr);
				$('.reset_history').prepend($history);
			});
		}
	}

	//검색기록 삭제
	$('#areaReset').on('click','.del',function(e){
		e.preventDefault();
		e.stopPropagation();
		geoList.remove($(this).parent().data('idx'));
		$(this).parent().remove();
		if($('#areaReset li:not(.history_dummy) .del').length == 0) $('.reset_history').hide();
	});

	//검색기록 사용
	$('#areaReset').on('click','.pos_history',function(e){
		e.preventDefault();
		e.stopPropagation();
		geoList.setFirst($(this).data('idx'));
		//location.reload(true);
		location.replace(window.location.origin + window.location.pathname);
	});

	//위치 재설정
	$('.btn_around').click(function(){
		layer_open('areaReset');
	});

	//위경도 자동 검색
	$('.btn_reset_auto').click(function(){
		//검색기록이 없을 경우
		if(positionList.length == 0) {
			//setTimeout(function(){
			//	layer_all_close();
			//	layer_open('areaAgree');
			//	return;
			//},25);
			geoFindMe(true,true,true);
		}else {
			geoFindMe(true,true,true);
		}
	});

	//위경도 지도 검색 (다음 api)
	$('.btn_reset_map').click(function(){
		layer_close('areaReset','hashback');
		layer_open('areaResetMap','pass');
		$('#areaResetMap .layer_btn').css('border-top', '0');
		
		if($('body').hasClass('mweb')) {
			$(window).resize();
			$('#area_map').height(($('#areaResetMap .layer_cont').outerHeight()) - $('#areaResetMap .area_current').outerHeight());
		}
		
		daum.maps.load(function() {
			//#area_map
			var mapContainer = document.getElementById('area_map'), // 지도를 표시할 div 
			mapOption = {
				center: new daum.maps.LatLng($('#lat').val(), $('#lon').val()), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();

			// 중심점을 표시할 마커입니다
			var marker = new daum.maps.Marker({ 'position' : map.getCenter()}); 
			marker.setMap(map);

			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);

			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'center_changed', function() {
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);
				marker.setPosition(map.getCenter());
			});

			function searchAddrFromCoords(coords, callback) {			
				// 좌표로 행정동 주소 정보를 요청합니다
				//geocoder.coord2addr(coords, callback);     
				// 좌표로 법정동 상세 주소 정보를 요청합니다
				geocoder.coord2detailaddr(coords, callback); 
				
			}

			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(status, result) {
				if (status === daum.maps.services.Status.OK) {
					var infoDiv = document.getElementById('area_current');
					//infoDiv.innerHTML = result[0].fullName;
					if(result[0].jibunAddress.name == ''){
						infoDiv.innerHTML = '주소 정보가 없습니다.';
						document.getElementById('getDaumInfo').style.display = 'none';
					}else{
						infoDiv.innerHTML = result[0].jibunAddress.name;
						document.getElementById('getDaumInfo').style.display = 'inline-block';
					}
				}    
			}

			//지도정보 얻어오기
			$('#getDaumInfo').click(function(){
				var position = map.getCenter();
				setGeoPosition(position.getLat(),position.getLng());
				//location.reload(true);
				location.replace(window.location.origin + window.location.pathname);
			});
		});
	});

	//상세 이동
	$('.srch_result').on('click','li:not(.fill_box) .link',function(){
		var hash_str = '';
		if(document.location.hash == '') hash_str = '#1';
		else hash_str = "#" + $('#page').val();

		var query_data = $('#filter_form').serialize();

		query_data += '&'+ $.param({
				'log_ano' : $(this).data('ano')
				,'log_adr_str': $(this).find('.ad_addr').text()
				,'log_od_view_type' : $(this).data('viewtype') 
				,'log_od_ad_type' : $(this).data('adtype') 
				,'log_order' : $('.srch_result').find('.link').index($(this))
		});

		var $this = $(this);

		$.ajax({
			type: 'POST',
			async: false,
			cache: false,
			url: '/search/setDetailViewLog',
			dataType: 'json',
			data: query_data,
			success: function(data) {
				//console.log(data);
				
				window.replaceHash(hash_str + '^'+ $this.data('ano'));
				//document.location.hash = hash_str + '^'+ $this.data('ano');
				location.href = '/search/detailView/' + $this.data('ano');
			},
			error: function(e) {
				//console.log(e);
				alert(search_msg['ajax_fail']);
				location.reload(true);
			}
		});
	});
});


//광고 복제
var ad_clone = function(data, $ori){
	$clone = $ori.clone().removeClass('dummy').removeAttr('id').show();

	$clone.find('.link').data('ano',data.ano).data('uitype',data.od_view_type).data('adtype',data.od_ad_type).addClass('ano_'+data.ano);
	$clone.find('.img_wrap img').attr('src', data.imgpath);

	if(data.aicon > 0) $clone.find('.ad_icon.ic_new').show();

	$clone.find('p.ad_name').text(data.aname);
	
	if(data.epilcnt > 0){
		$clone.find('.score').show();
		$clone.find('.noscore').hide();
		$clone.find('.score_star').addClass('star_' + zeroFill(Math.round((data.rate/2)/5)*5,2));
		$clone.find('.score_num em').text(data.epilcnt);
	}else{
		$clone.find('.score').hide();
		$clone.find('.noscore').show();
	}

	$clone.find('.ad_price span').css('visibility','hidden');
	if(Number(data.lowrentprice) > 0) {
		$clone.find('.ad_price .d').text(Number(data.lowrentprice).format() + '원~');
		$clone.find('.ad_price span').eq(0).css('visibility','visible');
	}else{
		$clone.find('.ad_price .d').text(0);
		$clone.find('.ad_price span').eq(0).addClass('disabled');
	}
	if(Number(data.lowstayprice) > 0) {
		$clone.find('.ad_price .s').text(Number(data.lowstayprice).format() + '원~');
		$clone.find('.ad_price span').eq(1).css('visibility','visible');
	}else{
		$clone.find('.ad_price .d').text(0);
	}
	
	$clone.find('.ad_info .ad_addr').text(data.adr);
	var distance = data.distance < 1.000 ? (data.distance * 1000) + 'm' : Number(data.distance).toFixed(1) + 'km';
	$clone.find('.ad_info .ad_distance').text(distance);

	if(data.psaletype == 'Y') $clone.find('.ad_benefit .bene_discount').addClass('bene_on');
	if(data.taddtype1 == 'Y' || data.taddtype2 == 'Y') $clone.find('.ad_benefit .bene_plus').addClass('bene_on');
	if(data.acouptype == 'Y') $clone.find('.ad_benefit .bene_free').addClass('bene_on');

	
	$clone.find('.ad_benefit .bene_zone').hide();

	//둘다
	if(data.abenefittype == 'Y' && data.tablettype == 'Y') $clone.find('.ad_benefit .bene_zone.room').css('display','inline-block').addClass('bene_on');
	//타블렛
	else if(data.tablettype == 'Y') $clone.find('.ad_benefit .bene_zone.table').css('display','inline-block').addClass('bene_on');
	//혜택
	else if(data.abenefittype == 'Y') $clone.find('.ad_benefit .bene_zone.room').css('display','inline-block').addClass('bene_on');
	
	else $clone.find('.ad_benefit .bene_zone.normal').css('display','inline-block');

	return $clone;
}

$(document).ready(function(){

	aroundRefresh();

	//앱다운로드 버튼 높이 맞추기
	$('.pcweb .info_appdown').height( $('.area_info.area_info2').outerHeight() );
	
	//이벤트 롤링
	$("#eventSilde li").hide();
	if(typeof $.fn.owlCarousel == 'function'){
		$("#eventSilde li").show();
		$("#eventSilde").owlCarousel({
			navigation:true,
			slideSpeed : 300,
			lazyLoad : true,
			paginationSpeed : 400,
			singleItem:true,
			autoPlay : 3000
		});
	}else{
		$("#eventSilde li:first-child").show();
	}

	//이벤트 공략집 모바일 대응
	$(window).resize(function() {
		winWidth = $(document).outerWidth();
		if( winWidth < 769 ) {
			$('.list_tip img').attr('src','<?=IMGURL?>/main/banner_guide.png');
			$('#eventSilde li img').each(function(){
				$(this).attr('src',$(this).data('mpath'));
			});
		}else{
			$('.list_tip img').attr('src','<?=IMGURL?>/main/banner_guide_m.png');
			$('#eventSilde li img').each(function(){
				$(this).attr('src',$(this).data('path'));
			});
		}
	});
	$(window).resize();

	//애드블럭 감지
	$(document).on('mouseover',function(){
		$(document).off('mouseover');
		adchk('.section_join_banner img');
	});

	//네비 하단 라인
	$(window).scroll(function(){
		if($(window).scrollTop() >= $('#mainVisualWrap').outerHeight()){				
			$('#headerWrap').css('border-bottom','1px solid #e62a4a');
		}else{
			$('#headerWrap').css('border-bottom','');
		}
	});
});