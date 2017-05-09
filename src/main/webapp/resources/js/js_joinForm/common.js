var common_msg = {
	'search' : {
		'keyword_empty' : '검색어를 입력해주세요.'
	}
};

$(document).ready(function() {
	
	//메뉴 닉네임 정보 레이어
	$('.my_nick').click(function(e) {
		e.preventDefault();
		if ( $('.my_info_detail_wrap').css('display') == 'none' ) {
			$('.my_info_detail_wrap').fadeIn(200);			
		} else {
			$('.my_info_detail_wrap').fadeOut(200);
		}
	});

	//메뉴 닉네임 레이어 닫기
	$('.my_info_detail .btn_ly_close, .my_info_detail_wrap .pop_bg').click(function(e) {
		e.preventDefault();
		e.stopPropagation();
		if ( $('.my_info_detail_wrap').css('display') == 'none' ) {
			$('.my_info_detail_wrap').fadeIn(200);
		} else {
			$('.my_info_detail_wrap').fadeOut(200);
		}
	});
	
	//검색메뉴 레이어 오픈 // 16.06.30 KYH 수정
	gnbData();
	function close_srchPop(){
		$('.btn_search').removeClass('active');
		$('.srch_pop_wrap').stop().hide();
		$('.srch_pop').stop().hide();
		$('.srch_pop_wrap .pop_bg').stop().hide();
	}
	$('.btn_search').click(function(e){
		e.preventDefault();
		if($(this).hasClass('active'))
		{
			close_srchPop();
			console.log('1');
		}
		else{
			$(this).addClass('active');
			$('.srch_pop_wrap').stop().show();
			$('.srch_pop').stop().show();
			$('.srch_pop_wrap .pop_bg').stop().show();
			console.log('2');
		}
	});

	$('.pop_bg').click(function(){
		close_srchPop()
	});

	$('.area_list').hover(
		function(){ $('.srch_area > a').addClass('hover') },
		function(){ $('.srch_area > a').removeClass('hover') }
	);
	
	// 모바일 검색 160714 KYH
	$('.btn_m_srch').click(function(e){
		e.preventDefault();
		var parent = $(this).parent().parent();

		if ($(this).hasClass('icon_close'))
		{
			if (parent.hasClass('pc_srch'))
			{
				null;
			}
			else{
				$('.srch_top_area').stop().fadeOut();
				$(this).removeClass('icon_close');
			}
		}
		else{
			$('.srch_top_area').stop().fadeIn();
			$(this).addClass('icon_close');
		}
	});

	// 모바일 검색 반응형 대응 160714 KYH 
	$(window).resize(function(){ 
		var win_w = $(window).width();
		if (win_w > 786)
		{
			$('.btn_m_srch').removeClass('icon_close');
			$('.srch_top_area').removeClass('m_srch');
			$('.srch_top_area').addClass('pc_srch').show();
		}
		else{
			if (!$('.btn_m_srch').hasClass('icon_close'))
			{

				if (win_w > 768)
				{
					$('.srch_top_area').show();
				}
				else{
					$('.srch_top_area').hide();
				}
			}
			else if ($('.btn_m_srch').hasClass('icon_close'))
			{
				$('.srch_top_area').show();
			}

			$('.srch_top_area').removeClass('pc_srch');
			$('.srch_top_area').addClass('m_srch');

		}
	});

	// 레프트메뉴
	var handler = function(e){e.preventDefault();}

	function navOpen(){ // NAV OPEN
		var win_top = $(window).scrollTop();
		var win_h = $(window).height();
		$("body").css("overflow-y","hidden");
		$("#gnb").css("min-height",win_h);
		$("#gnb").css("padding-bottom","500px");
		$("#gnb .menu").css("min-height",win_h);
		$("#gnb .menu").css("padding-bottom","500px");
		$("#gnb").css("top",win_top);
		$(".bg_opacity").css("top",win_top);
		$(".bg_opacity").css("min-height",win_h);
		$(".bg_opacity").css("padding-bottom","500px");
		$("#gnb").show();
		$("#gnb .menu").stop().animate({left:0},'100');
		$(".bg_opacity").fadeIn(200);

		var myScroll;

		function loaded () {
			myScroll = new IScroll('#gnb', {
				mouseClick: true,
				mouseWheel: true,
				bounce:false, 
				click: true
			});
		}
		$(window).bind('touchmove', handler);

		loaded();
	}

	$(window).resize(function(){
		if ($(".bg_opacity").css("display") == "block")
		{
			var win_top = $(window).scrollTop();
			var win_h = $(window).height();
			$("body").css("overflow-y","hidden");
			$("#gnb").css("min-height",win_h);
			$("#gnb").css("padding-bottom","500px");
			$("#gnb .menu").css("min-height",win_h);
			$("#gnb .menu").css("padding-bottom","500px");
			$("#gnb").css("top",win_top);
			$(".bg_opacity").css("top",win_top);
			$(".bg_opacity").css("min-height",win_h);
			$(".bg_opacity").css("padding-bottom","500px");

			var myScroll;

			function loaded () {
				myScroll = new IScroll('#gnb', {
					mouseClick: true,
					mouseWheel: true,
					bounce:false, 
					click: true
				});
			}
			$(window).bind('touchmove', handler);
			loaded();
		}
	});

	function navClose(){ // NAV CLOSE
		$(".bg_opacity").hide();
		$(".btn_gnbclose").hide();
		$("#gnb .menu").stop().animate({left:-1000},'100');
		$("#gnb").stop().fadeOut(500);
		$("body").css("overflow-y","auto");
		$(window).unbind('touchmove', handler);
	}

	$(".btn_menu a").click(function(e){ //GNB 오픈
		e.preventDefault();
		 navOpen();
	});

	$(".bg_opacity, .btn_menuclose").bind("click touchstart",function(){ // BG 닫기
		navClose();
		return false;
	});

	$(".btn_menu").click(function(e){
		e.preventDefault();
		navOpen();
	});

	//고객센터
	$(document).on('click','.mweb .info_tel',function(){
		$.ajax({
			type: 'POST',
			async: true,
			cache: false,
			url: '/search/customerCenterCheck',
			dataType: 'json',
			success: function(result) {
				if(result.rtv == false){
					alert(result.msg);
				}else{
					location.href = 'tel:1544-4087';
				}
			},
			error: function(e) {
				//console.log(e);
				alert(search_msg['ajax_fail']);
				location.reload(true);
			}
		});
	});
	
	//검색영역
	$('.btn_srch_open').click(function(e) {
		e.preventDefault();

		var headerHeight = $('.header_logo').outerHeight();

		if( $('.header_srch .srch_area').css('display') == 'none') {
			$('.header_srch .srch_area').show();
			$(this).find('img').attr('src',$(this).data('close'));
			$(this).css('top','18px');
			$('#allWrap').css('padding-top', headerHeight + 'px');			
		} else {
			$('.header_srch .srch_area').hide();
			$(this).find('img').attr('src',$(this).data('open'));
			$(this).css('top','15px');
			$('#allWrap').css('padding-top', headerHeight + 'px');
		}
	});

	//키워드 검색
	var keywordsearch = function(){
		//여러 공백 하나로
		var search_word = $('.ipt_srch').val().trim().replace(/[ ]+/g,' ');
		if(search_word == '' ) {
			alert(common_msg['search']['keyword_empty']);
			$('.ipt_srch').focus();
			return;
		}
		//rawurlencode
		location.href = "/search/keyword?word=" + rawurlencode(search_word);
	}
	$('.btn_srch').click(function(){keywordsearch()});

	$('.ipt_srch').keyup(function(e){
		e.preventDefault();
		if($(this).val() == '') $('.ipt_delete').hide();
		else $('.ipt_delete').show();

		var re = /[~!@\#$%^&*\()\-=+_<>\\\/?']/gi; 
		var temp=$(this).val();
		if(re.test(temp)){ //특수문자가 포함되면 삭제하여 값으로 다시셋팅
			alert('특수문자 검색은 지원하지 않습니다.');
			$(this).val(temp.replace(re,""));
		}

	}).keydown(function(e){
		if (e.keyCode == 13) keywordsearch();
	});


	//키워드 제거
	$('.ipt_delete').click(function(){
		$('.ipt_srch').val('');
		$(this).hide();
	});
	
	//맨위로
    $('.btn_gotop').click(function(e){
        e.preventDefault();
        $(window).scrollTop(0);
       // $('body').animate({scrollTop:0}, '100');
    });
	$('.btn_gotop').hide();


	//포커스 - 안드로이드
	if(/android/.test(navigator.userAgent.toLowerCase())){				
		$('.ad_review_reg textarea, .layer_allwrap input').on('focusin',function(){ 	
			$(".noneblock").css('padding','100px');
			$(".btn_gotop").css('opacity', '0');
		});
		
		//작성중 포커스아웃
		$(".ad_review_reg textarea, .layer_allwrap input").on('focusout, blur',function(e){		
			$(".noneblock").stop(true, true).animate({ padding: 0 }, 500);
			$(".btn_gotop").css('opacity', '1');
		});
	}

	mwebChk();
	$(window).resize();
});


$(window).load( function(){
	mwebChk();
});

$(window).resize(function() {
	
	mwebChk();

	// GNB 오픈시 768이상이면 숨김
	var win_w = $(window).width(); 
	if (win_w > 768) 
	{
		if ($('#gnb').css('display') == 'block')
		{
			$('#gnb').hide();
			$('.bg_opacity').hide();
			$(window).unbind("touchmove");
			$('body').css('overflow-y','auto');
		}
	}

	$('.layer_wrap').each(function(){
		if ($(this).outerHeight() < $(document).height() ) $(this).css('margin-top', '-'+$(this).outerHeight()/2+'px');
		else $(this).css('top', '0px');
		if ($(this).outerWidth() < $(document).width() ) $(this).css('margin-left', '-'+$(this).outerWidth()/2+'px');
		else $(this).css('left', '0px');
	});	
});

$(window).scroll(function(){
    var y = $(this).scrollTop();
    if(y == 0){
        $('.btn_gotop').stop().fadeOut(450);
    }else{
        $('.btn_gotop').stop().fadeIn(900);
    }
	$('.bg_nav').css('min-height', $.windowHeight());
});


//검색 정보 (GNB)
function gnbData(){
	getSearchData('gnb',function(data){
		$('.srch_pop_wrap .srch_around strong').text(data.area_desc);
		$('.srch_pop_wrap .srch_area strong').text(Number(data.total_ad_cnt).format());
		$('.srch_pop_wrap .srch_new strong').text(Number(data.renewal_cnt).format());

		$('.srch_pop_wrap .area_list').empty();
		$.each(data.areaList,function(){
			$clone = $('.srch_pop_wrap .dummy').clone().removeClass('dummy');
			$clone.attr('style','');
			$clone.attr('href','/search/area/'+this.arino);
			$clone.text(this.ariname);
			$('.srch_pop_wrap .area_list').append($clone);
		});
	});
}

//검색 데이터 가져오기
function getSearchData(type,callback){
	var data = null;
	$.ajax({
		type: 'POST',
		async: true,
		cache: false,
		url: '/search/searchData',
		dataType: 'json',
		data: {'type':type},
		success: function(data) {
			callback(data);
		},
		error: function(e) {
			//console.log(e);
			alert(search_msg['ajax_fail']);
			location.reload(true);
		}
	});
	return data;
}

//윈도우 width값 체크
function mwebChk() {

	winWidth = $(document).outerWidth();
	
	if( winWidth < 769 ) {
		$('body').addClass('mweb').removeClass('pcweb');
		$('#mainNavMweb').show();
		$('#mainNavPC, .page_navi').hide();
	}else {
		$('body').addClass('pcweb').removeClass('mweb nav_open');
		$('#mainNavMweb .nav_side').css('left','-1000px');
		$('#mainNavMweb .bg_nav').css('display','none');
		$('#mainNavMweb').hide();
		$('#mainNavPC, .page_navi').show();
		
	}

}

//박스높이 맞추기
function equalheight(container) {

	var currentTallest = 0,
		currentRowStart = 0,
		rowDivs = new Array(),
		$el,
		topPosition = 0;
	
	$(container).each(function() {

		$el = $(this);
		$($el).height('auto')
		topPostion = $el.position().top;

		if (currentRowStart != topPostion) {
			for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
				rowDivs[currentDiv].height(currentTallest);
			}
			rowDivs.length = 0; // empty the array
			currentRowStart = topPostion;
			currentTallest = $el.height();
			rowDivs.push($el);
		} else {
			rowDivs.push($el);
			currentTallest = (currentTallest < $el.height()) ? ($el.height()) : (currentTallest);
		}
		for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
			rowDivs[currentDiv].height(currentTallest);
		}
	});
}

//레이어 오픈 이벤트
function layer_open(el,hashpass){

	var temp = $('#' + el);
	var tempWrap = $('#' + el).parent();

	tempWrap.fadeIn().addClass('open_layer');

	var layer_event = function(e){
		e.preventDefault();
	}

	// 화면 보다는 작게 설정
	if($('body').hasClass('mweb')) temp.find('.layer_cont').css('height', $.windowHeight() - (temp.find('.layer_title').outerHeight()));
	else {
		if(temp.find('.layer_cont').outerHeight() > $.windowHeight()) temp.find('.layer_cont').css('height', $.windowHeight() - (temp.find('.layer_title').outerHeight()) - 50);		
	}
		
	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');

	$('body').css('overflow','hidden');
	$('body').css('-webkit-overflow-scrolling', 'touch');
	$('.layer_title').on('touchmove', function(e){e.preventDefault();});

	//레이어닫기
	tempWrap.find('.layer_close').off().click(function(e){
		e.preventDefault();
		layer_closes(tempWrap);
		$(window).unbind("touchmove"); // 모바일 스크롤 해제			
	});
	
	//배경 클릭시, 레이어 닫기
	$('.layer_allwrap .layer_bg').off().click(function(e){
		$('.layer_allwrap').fadeOut().removeClass('open_layer');
		layer_closes(tempWrap);
		$(window).unbind("touchmove"); // 모바일 스크롤 해제			
	});

	// 뒤로가기 버튼 제어
	if(hashpass != 'pass') history.pushState(null, null, "#noback");
	$(window).off().bind("hashchange", function(){
		layer_closes(tempWrap,'hashback');
	});

	$(window).bind("touchmove",function(e){e.preventDefault()	}); // 모바일 스크롤 억제
}

var layer_closes = function(target,hash){
	$('body').unbind('touchmove');
	$('html').css('overflow','visible');
	$('body').css('overflow','auto');	
	$('body').css('-webkit-overflow-scrolling', 'none');
	$(window).unbind("touchmove"); // 모바일 스크롤 해제			

	// 뒤로가기 버튼 제어
	if(hash != 'hashback') history.back();

	target.fadeOut().removeClass('open_layer');
};

//레이어 닫기
function layer_close(el,hash){
	var temp = $('#' + el);
	var tempWrap = $('#' + el).parent();
	layer_closes(tempWrap,hash);
}

//레이어 모두 닫기
function layer_all_close(){
	$('html').css('overflow','visible');	
	$('body').css('overflow','auto');	
	$('body').css('-webkit-overflow-scrolling', 'none');
	$('body').unbind('touchmove');
	$('.layer_allwrap').fadeOut().removeClass('open_layer');
	$(window).unbind("touchmove"); // 모바일 스크롤 해제			
}


//javascript rawurlencode
function rawurlencode(str) {
  //       discuss at: http://phpjs.org/functions/rawurlencode/
  //      original by: Brett Zamir (http://brett-zamir.me)
  //         input by: travc
  //         input by: Brett Zamir (http://brett-zamir.me)
  //         input by: Michael Grier
  //         input by: Ratheous
  //      bugfixed by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  //      bugfixed by: Brett Zamir (http://brett-zamir.me)
  //      bugfixed by: Joris
  // reimplemented by: Brett Zamir (http://brett-zamir.me)
  // reimplemented by: Brett Zamir (http://brett-zamir.me)
  //             note: This reflects PHP 5.3/6.0+ behavior
  //             note: Please be aware that this function expects to encode into UTF-8 encoded strings, as found on
  //             note: pages served as UTF-8
  //        example 1: rawurlencode('Kevin van Zonneveld!');
  //        returns 1: 'Kevin%20van%20Zonneveld%21'
  //        example 2: rawurlencode('http://kevin.vanzonneveld.net/');
  //        returns 2: 'http%3A%2F%2Fkevin.vanzonneveld.net%2F'
  //        example 3: rawurlencode('http://www.google.nl/search?q=php.js&ie=utf-8&oe=utf-8&aq=t&rls=com.ubuntu:en-US:unofficial&client=firefox-a');
  //        returns 3: 'http%3A%2F%2Fwww.google.nl%2Fsearch%3Fq%3Dphp.js%26ie%3Dutf-8%26oe%3Dutf-8%26aq%3Dt%26rls%3Dcom.ubuntu%3Aen-US%3Aunofficial%26client%3Dfirefox-a'

  str = (str + '')
    .toString();

  // Tilde should be allowed unescaped in future versions of PHP (as reflected below), but if you want to reflect current
  // PHP behavior, you would need to add ".replace(/~/g, '%7E');" to the following.
  return encodeURIComponent(str)
    .replace(/!/g, '%21')
    .replace(/'/g, '%27')
    .replace(/\(/g, '%28')
    .
  replace(/\)/g, '%29')
    .replace(/\*/g, '%2A');
}


//Jquery 쿠키 JSON list
(function ($) {
    $.fn.extend({
        cookieList: function (cookieName) {
        
            return {
                add: function (val) {
                    var array    = this.items();

                    if(typeof(this.hasitem(val))== "undefined"){
                        array.push(val);
                        
                        var inStr = JSON.stringify(array);
                        $.cookie(cookieName, inStr, { expires:360, path: '/' });
                        
                        
                    }else{
						this.setFirst(this.hasitem(val));
                    }
					if(this.length() > 5) this.remove(0);
                },
				setFirst: function(index){
					var items = this.items();
					var new_item = items[index];
                     
					if (index != -1) {
                        items.splice(index, 1);
						items.push(new_item);
                        $.cookie(cookieName, JSON.stringify(items), { expires: 360, path: '/' });
                    }
				},
                remove: function (index) {
                    var items = this.items();
                    
                    if (index != -1) {
                        items.splice(index, 1);
                        $.cookie(cookieName, JSON.stringify(items), { expires: 360, path: '/' });
                    }
                },
                indexOf: function (val) {
                    return this.items().indexOf(val);
                },
                clear: function () {
                    $.cookie(cookieName, null, { expires: 0, path: '/' });
                },
                items: function () {
                    var cookie = $.cookie(cookieName);
                    return cookie ? JSON.parse(cookie):[];
                },
                hasitem: function (val){
                    for (var k in this.items()){
                        var entry1 = JSON.stringify(this.items()[k]['adr']);
                        var val1 = JSON.stringify(val['adr']);
                        if(val1 == entry1){
                            //console.log("key:"+k);
                            return k;
                        }
                    }
                },
                length: function () {
                    return this.items().length;
                },
            };
        }
    });
})(jQuery);

//숫자 메우기
function zeroFill( number, width )
{
  width -= number.toString().length;
  if ( width > 0 )
  {
    return new Array( width + (/\./.test( number ) ? 2 : 1) ).join( '0' ) + number;
  }
  return number + ""; // always return a string
}

// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};

// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
 
    return num.format();
};

//특수문자 제거
function specialCharRemove(value) {
	var pattern = /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9)]/gi;   // 특수문자 제거
	 
	//var pattern = /[^(0-9)]/gi;   // 숫자이외는 제거
	 
	if(pattern.test(value)){
		return value.replace(pattern,"");
	}
	return false;
}


//애드블록 감지	
function adchk(selector)
{
	
	setTimeout(function(){
		$(selector).each(function(){
			if ($(this).attr('style') != undefined && $(this).attr('style').indexOf('visibility') < 1  && $(this).attr('style').indexOf('visible') < 1 && $(this).attr('style').indexOf('none') > 0) {
				alert('페이지 내부의 컨텐츠가 차단되었습니다.\n\n애드블록을 해제해주세요.');
				return false;
			}
		});
	},500);
	
}

function getOffsetTop(el) {
var top = 0;
	if (el.offsetParent) {
		do {
			top += el.offsetTop;
		} while (el = el.offsetParent);
		return [top];
	}
}

// Should be executed BEFORE any hash change has occurred.
(function(namespace) { // Closure to protect local variable "var hash"
    if ('replaceState' in history) { // Yay, supported!
        namespace.replaceHash = function(newhash) {
            if ((''+newhash).charAt(0) !== '#') newhash = '#' + newhash;
            history.replaceState('', '', newhash);
        }
    } else {
        var hash = location.hash;
        namespace.replaceHash = function(newhash) {
            if (location.hash !== hash) history.back();
            location.hash = newhash;
        };
    }
})(window);

function guest_reserve_open(){ // 비회원 예약조회 오픈
	$('.guest_reserve').fadeIn();
}

function guest_reserve02_open(){ // 비회원 예약조회 오픈
	$('.guest_reserve_02').fadeIn();
}
function guest_reserve_close(){ // 비회원 예약조회 닫기
	$('#guest_reserve').fadeOut();
	$('#guest_reserve_02').fadeOut();
}

//2016-07-25 : 비회원 예약내역 조회 by KJS
function guest_reserve_view() {
	if($.trim($("#guest_reserve_number").val()) == '') {
		alert("예약번호를 입력해주세요.");
		return false;
	} else if($.trim($("#guest_reserve_name").val()) == '') {
		alert("예약자명을 입력해주세요.");
		return false;
	}

	var do_no = $.trim($("#guest_reserve_number").val());
	var do_from_name = $.trim($("#guest_reserve_name").val());

	$.ajax({
		type: 'POST',
		async: true,
		cache: false,
		url: '/user/guestReserveList',
		dataType: 'json',
		data: {'do_from_name':do_from_name, 'do_no':do_no},
		success: function(data) {
			if(!data.rtv) {
				alert("예약 내역이 존재하지 않습니다.");
				return false;
			}

			var d = data.ret.Info;
			var dpod_sale_type;
			if(d.dpod_sale_type == '1') {
				dpod_sale_type = '대실';
			} else {
				dpod_sale_type = '숙박';
			}

			var appendHtml = '<ul>' + 
				'<li><span>이용방식</span>'+dpod_sale_type+'</li>' + 
				'<li><span>객실 명</span>'+d.do_name+'</li>' + 
				'<li><span>입실시간</span>'+d.dpod_chkin_date+'</li>' + 
				'<li><span>퇴실시간</span>'+d.dpod_chkout_date+'</li>' + 
			'</ul>' + 
			'<ul class="last">' + 
				'<li><span>예약날짜</span>'+d.do_paydate+'</li>' +
				'<li><span>예약자 이름</span>'+d.do_from_name+'</li>' +
				'<li><span>휴대폰 번호</span>'+d.do_from_tel+'</li>' +
				'<li><span>결제금액</span>'+Number(d.do_total_price).format()+'원 ('+d.do_pay_type+')</li>' +
				'<li><span>예약상태</span>'+d.dop_state_txt+'</li>' +
			'</ul>';

			$("#guest_reserve_02_detail")
			.html(appendHtml);

			$("#guest_reserve_02").fadeIn();
		},
		error: function(e) {
			//console.log(e);
			alert(search_msg['ajax_fail']);
			location.reload(true);
		}
	});
}