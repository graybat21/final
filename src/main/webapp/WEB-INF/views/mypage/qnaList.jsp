<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
	
	<title>1:1문의 : 여기어때 - 국내 1위 숙박어플!</title>

	
	<!-- 공통 CSS  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/qna_files/default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/qna_files/owl.css">
	
	<!-- 공통 JS  -->
	<script src="${pageContext.request.contextPath}/resources/qna_files/1602931226643913.js" async=""></script><script async="" src="${pageContext.request.contextPath}/resources/qna_files/fbevents.js"></script><script async="" src="${pageContext.request.contextPath}/resources/qna_files/analytics.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/qna_files/jquery-1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/qna_files/jquery_004.js"></script>
	<script src="${pageContext.request.contextPath}/resources/qna_files/owl.js"></script>
	<script src="${pageContext.request.contextPath}/resources/qna_files/masonry.js"></script>
	<script src="${pageContext.request.contextPath}/resources/qna_files/jquery_002.js"></script>
	<script src="${pageContext.request.contextPath}/resources/qna_files/imgliquid.js"></script>
	<script src="${pageContext.request.contextPath}/resources/qna_files/iscroll.js"></script>
	<script src="${pageContext.request.contextPath}/resources/qna_files/jquery_003.js"></script>
	<script src="${pageContext.request.contextPath}/resources/qna_files/common.js"></script>	
</head>

<body class="pcweb" oncontextmenu="return false" ondragstart="return false">


<div id="allWrap">
	
	
	<!-- 페이지별 화면 load -->
		<!-- 페이지별 호출 소스 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/qna_files/service.css">
	<script src="${pageContext.request.contextPath}/resources/qna_files/service.js"></script>
	<!-- //페이지별 호출 소스 -->

	<script>
		var uno = "4197344";
		var imgurl = "https://img.goodchoice.kr/images/web_v2";

		$(document).ready(function(){
			$(".inq_cont").click(function(e){
				e.preventDefault();
				
				var idx = $(this).index(".inq_cont");
				
				$(".reply_cont").each(function(index){
					var uiqno = $(".inq_cate").eq(idx).data('uiqno');
					var state = $(".inq_cate").eq(idx).data('state');

					if(idx == index){

						offsetTop = $(".inq_state").eq(idx).offset().top;
						
						$("html, body").scrollTop(offsetTop-150);
						//$("html, body").animate({scrollTop: offsetTop-150}, 1000);

						if(state == 'A'){
							$.ajax({
								type: 'POST',
								async: false,
								cache: false,
								url: '/service/userInquiryShow',
								dataType: 'json',
								data: { 'uiqno': uiqno, 'uno' : uno },
								success: function(data) {
									//console.log(data);
									var inq_type = data.inquiry_type;
									if(inq_type == "Q" || inq_type == "A" ){
										$("#inquiry_type").html('<img class="ic_new" src="' + imgurl + '/common/ic_' + inq_type.toLowerCase() + '.png">');
									}else{
										$("#inquiry_type").html('');
									}
								},
								error: function(e) {
									//console.log(e);
								}
							});
						}else {
						}
					}else{
					}
				});
			});

		});
	</script>

	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">문의사항</h2>
		
		<!-- 서비스 wrap -->
		<div class="svc_allwrap">
			
			<!-- <div class="bg_left"></div>
			<div class="bg_right"></div> -->
			
			<div class="svc_wrap row row_cont">
				<!-- 서비스 메뉴 -->
				<div class="svc_menu" style="display:none">
	<h3>마이페이지</h3>
					<ul>
						<li><a href="wishList.gh">찜</a></li>

						<li><a href="https://www.goodchoice.kr/mypage/myReserve">예약내역</a></li>

						<li><a href="https://www.goodchoice.kr/mypage/myInfo" class="active">내정보수정</a></li>
						
						<li><a href="https://www.goodchoice.kr/mypage/myInfo">문의사항</a></li>
					</ul>
</div>				<!-- //서비스 메뉴 -->
				
				<!-- 서비스 콘텐츠 -->
				<div class="svc_contents">
					<div class="svc_title svc_inquiry">
						<h4>QNA</h4>
					</div>
					
					<!-- svc_cont_wrap -->
					<div class="svc_cont_wrap">		
						<div class="svc_tab svc_inquiry">
							<ul>
								<li class="tab_inq_reg"><a href="https://www.goodchoice.kr/service/inquiryReg">문의하기</a></li>
								<li class="tab_inq_list active"><a href="https://www.goodchoice.kr/service/inquiryList">나의 문의 내역</a></li>
							</ul>
						</div>

						<div class="svc_inquiry_list">
							<ul>
																<li class="list_none">
									<strong>게스트하이에 궁금한 모든 질문을 QNA문의로 해결하세요.</strong> <br><br>
									신속하고 정확하게 답변해드리겠습니다.
								</li>
								
															</ul>
						</div>
						
						<!-- 페이징 -->
						<div class="svc_paging">
														<!--<p class="cnt_page"><span class="current">1</span> / <span class="total">1</span>page</p>-->
						</div>
						<!-- //페이징 -->
					</div>
					<!-- //svc_cont_wrap -->
					
					
						
				</div>
				<!-- //서비스 콘텐츠 -->
			</div>
			
		</div>
		<!-- //서비스 wrap -->

	</article>
	<!-- //(공통)contentsWrap -->


	

	<!-- //페이지별 화면 load -->

</body></html>