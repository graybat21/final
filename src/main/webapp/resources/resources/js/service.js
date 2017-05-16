$(document).ready(function() {

	// 고객센터 세로 높이 맞추기
	var Menu = $('.svc_menu');
	var Content = $('.svc_cont_wrap');
	var Menu_H = Menu.height();
	var Content_H = Content.height();	

	if (Menu_H > Content_H){
		Content.css('min-height',Menu_H);
	}else{
		Menu.css('min-height',Content_H);
		Content.css('min-height',Menu_H);
	}

	//고객센터 2depth메뉴
	$('.svc_title h4').click(function(e) {
		e.preventDefault();
		if ( $('.mweb .svc_menu').css('display') == 'none' ) {
			$('.mweb .svc_menu').slideDown();
			$(this).addClass('active');
		} else {
			$('.mweb .svc_menu').slideUp();
			$(this).removeClass('active');
		}
	});
	
	//1:1문의 리스트
	$(".svc_inquiry_list .inq_cont").click(function(e){
		e.preventDefault();
		var thisReply = $(this).siblings('.reply_cont');
		
		if ( $(thisReply).css('display') == 'none') {
			$('.reply_cont').hide();
			$(".inq_cont").removeClass("active");
			$(thisReply).show();
			$(this).addClass("active");
		} else {
			$(thisReply).hide();
			$(".inq_cont").removeClass("active");
		}
	});
	
	//faq 리스트
	$(".svc_faq_list li .faq_title").click(function(e){
		e.preventDefault();
		var idx = $(this).index(".svc_faq_list li .faq_title");
		$(".svc_faq_list .faq_cont").each(function(index){
			if(idx == index){
				if($(this).css('display') != 'none'){
					$(this).hide();
					$(".svc_faq_list li .faq_title").eq(idx).removeClass("active");
				}else{
					$(this).show();
					$(".svc_faq_list li .faq_title").eq(idx).addClass("active");
				}
			}else{
				$(this).hide();
				$(".svc_faq_list li .faq_title").eq(index).removeClass("active");
			}
		});
	});
	
	//공략집 리스트
	$(".tip_title").click(function(e){
		e.preventDefault();
		var tipCont = $(this).parent().find('.tip_content');
		if ( $(tipCont).css("display" )=="none" ){
			$('.tip_content').hide();
			$(".tip_title").removeClass('up');
			$(tipCont).show();
			$(this).addClass('up');
			//$("html, body").animate({ scrollTop: $(this).offset().top }, 500);
		} else {
			$(tipCont).hide();
			$(this).removeClass('up');
		}
	});
	
	//고객센터 2depth메뉴
	$('.info_title h4').click(function(e) {
		e.preventDefault();
		if ( $('.mweb .info_menu').css('display') == 'none' ) {
			$('.mweb .info_menu').slideDown();
			$(this).addClass('active');
		} else {
			$('.mweb .info_menu').slideUp();
			$(this).removeClass('active');
		}
	});
	
});