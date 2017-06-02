<!DOCTYPE html>
<html lang="ko">
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">

<link rel="stylesheet" type="text/css"
	href="/howaboutthis/folder/default.css">
<link rel="stylesheet" type="text/css"
	href="/howaboutthis/folder/owl_003.css">
<!-- 페이지별 화면 load -->
<link rel="stylesheet" type="text/css" href="/folder/lightgallery.css">
<!-- 페이지별 호출 소스 -->
<link rel="stylesheet" type="text/css" href="/folder/search.css">
<link rel="stylesheet" type="text/css" href="/folder/default_002.css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/spinner.js"></script> --%>
<script>

	var end = $('#roomEnd').val();
	
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
		
		
		for(var i=1; i<end+1; i++){
			var count = $('#count_'+i).val();
			var price = $('#price_'+i).val();
			$('#tprice_'+i).val(count * price);
			$('#check_'+i).val(count * price);
		}
	}
	
	$(function(){
		
		$('.room').on('click',function(){
			var total = 0;
			for(var i=1; i<= end ;i++ ){
				if($('#check_'+i).is(":checked")){
					total = total + parseInt($('#check_'+i).val());
					$('#totalPrice').val(total);
					$('#finalPrice').val(total);
				}
			}
			if($('.room').is(":checked") == false){
				$('#totalPrice').val(0);
				$('#finalPrice').val(0);
			}				
		});
		
	});
	
	
</script>
</head>
<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">


	<div class="ad_info_wrap">
		<!-- 예약 -->
		<a id="bookmark2"></a>
		<div class="reserve_wrap row" style="display: block;">
			<div class="info_title">
				<h4>예약(i.date - o.date)</h4>
			</div>
			<div class="reserve">

				<!-- 예약 -->
				<script src="https://mup.mobilians.co.kr/js/ext/ext_inc_comm.js"></script>
				<script src="/js/app/daily_order_inicis.js?rand=1476499599"></script>
				<script src="/js/app/daily_order_view_web.js"></script>
				<script src="/js/app/jquery.total-storage.min.js"></script>
				<script src="/js/app/iscroll.js?rand=1476499599"></script>
				<link rel="stylesheet"
					href="/css/app/owl.carousel.css?rand=1476499599">
				<script src="/js/app/owl.carousel.min.js?rand=1476499599"></script>
				<!-- Left Content -->
				<div class="left">

					<!-- Change Room -->
					<div id="chg_room">
						<!-- 반복 -->
						<c:forEach var="item" items="${roomList }" varStatus="status">
						<div id="armgno24019" class="chg_room" data-armgname="room1"
							data-dpod_no="9381178" data-chkin="2017.05.12 (금) 17:00"
							data-chkout="2017.05.13 (토) 12:00" data-refund_time="14:00"
							data-sale-type="2" data-armg-no="24019">
							<a href="javascript:totalPriceChange();"> <input id="check_${status.count }"
								type="checkbox" class="room" name="chk" > ${item.name } 
								<strong> <b>${item.price }
								<input type="hidden" id="price_${status.count }" value="${item.price }">
								원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="count_${status.count }" value="" width="3"
								onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' />명&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="tprice_${status.count }" value="" width="3" readonly/></b></strong>
								
							</a>
							<!-- <div class="wan-spinner wan-spinner-3">
								<a href="javascript:void(0)" class="minus">-</a> -->
								
								<!-- <a href="javascript:void(0)" class="plus">+</a>
							</div> -->
						</div>
						<c:if test="${status.last }">
							<input type="hidden" id="roomEnd" value="${status.count }">
						</c:if>
						</c:forEach>
						
						<!-- Right Content -->
						<div id="reserve_detail_view" class="right">
							<!-- 예약자  -->
					<div class="wrap_div">
						<div class="list_inp bd_none">
							<h5>예약자 이름</h5>
							<div class="bd_b">
								<input class="inp_txt" name="do_from_name" placeholder="이름자동입력"
									maxlength="20" value="${member.name }" type="text"
									readonly="readonly">
							</div>
						</div>
						<div class="list_inp bd_none">
							<h5>휴대폰 번호</h5>
							<div class="bd_b">
								<input class="inp_txt" name="do_from_tel" id="do_from_tel"
									placeholder="휴대폰 번호 자동입력" maxlength="13"
									value="${member.phone }" type="tel" readonly="readonly">
							</div>
						</div>
					</div>

					<!-- 할인 -->
					<!-- 비회원 -->
					<div class="wrap_div">
						<div class="list_inp">
							<h5>입금 계좌</h5>
							<div>
								<input class="inp_txt" name="do_from_name" placeholder="호스트계좌번호"
									maxlength="20" value="" type="text">
							</div>
						</div>
						<div class="list_inp bd_none">
							<h5>은행 및 예금주</h5>
							<div>
								<input class="inp_txt" name="do_from_name"
									placeholder="은행 / 예금주" maxlength="20" value="" type="text">
							</div>
						</div>
					</div>

					<!-- 입실구분,시간,가격,결제 -->
					<div class="wrap_div info">
						<!-- 앱 HTML 그대로 가져옴 by.KYH -->
						<div class="info_txt">
							<p class="first_pd">
								총 주문금액<span class="total_price">
								
								<input type="text" id="totalPrice">
								
								원</span>
							</p>
							<!-- 유저 일때만 출력 2016-08-31 by.sim-->
							<p class="total_dc">
								<b>총 할인금액</b><span class="org" id="show_total_price">- 0원</span>
							</p>
							<p>
								<b class="org">최종 결제 금액</b><span class="total_val">
								
								<input type="text" id="finalPrice">
								
								원</span>
							</p>
						</div>
					</div>
					<div class="agree">
						<input id="chk_agree4" name="chk_agree4"
							class="inp_chk chk_agree1" value="Y" type="checkbox"> <label
							for="chk_agree4" class="chk-label">본인은 <a
							href="/info/agreeUser" target="_blank" style="margin-right: 0;">이용약관</a>
							및 <a href="/info/privateUser" target="_blank"
							style="margin-right: 0;">개인정보처리방침</a>을 읽었으며 이에 동의합니다.
						</label>
					</div>

					<div class="pay_btn">
						<a href="javascript:;" id="go_pay">결제하기</a>
					</div>
				</div>

				<div class="clear">&nbsp;</div>

			</div>
		</div>
	</div>
</body>
</html>