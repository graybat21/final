
var confirm_msg = {
	'ajax_fail' : '다시 시도하여 주세요.'
}

$(document).ready(function() {
	
	//마이페이지 2depth메뉴
	$('.my_title h4').click(function(e) {
		e.preventDefault();
		if ( $('.mweb .my_menu').css('display') == 'none' ) {
			$('.mweb .my_menu').slideDown();
			$(this).addClass('active');
		} else {
			$('.mweb .my_menu').slideUp();
			$(this).removeClass('active');
		}
	});
});