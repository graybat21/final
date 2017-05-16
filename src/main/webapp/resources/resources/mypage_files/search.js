



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







	var positionList = getGeoPosition();








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




});