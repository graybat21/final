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
		$(document).ready(function(){
			//시간, 가격 타입 숫자만 필터링
			$('.numOnly').on('keyup', function() {
				$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
			});	

			$(".inq_btn .btn_inq_reg").click(function(){

				if($("select[name='uiqcate']").val() == ""){
					alert("문의 유형을 선택해 주세요.");
					$("select[name='uiqcate']").focus();
					return false;
				}

				if($("textarea[name='uiqcont']").val() == ""){
					alert("문의 내용을 입력해 주세요.");
					$("textarea[name='uiqcont']").focus();
					return false;
				}

				if($('#rolechk').prop('checked') != true){
					alert("[서비스 이용약관]에 동의해 주세요.");
					return false;
				}

				$.ajax({
					type: 'POST',
					async: false,
					cache: false,
					url: '/service/setInquiryRegData',
					dataType: 'json',
					data: $('#inquiryform').serialize(),
					success: function(result) {
//						console.log(result);
						if(result == -1){
							alert("유형유형 및 내용을 입력해주세요.");
						}else if(result == true){
							alert("문의하신 내용이 접수되었습니다.\n빠른 시일내 답변드리겠습니다.\n감사합니다.");
							location.href = "/service/inquiryList";
//							dataClean();
						}else if(result == false){
							alert("문의하신 내용이 접수되지 않았습니다.\n관리자에게 문의하세요.");
						}
					},
					complete : function(e) {
//						console.log('end ==>> '+e);
					},
					error: function(e) {
						console.log(e);
						alert('다시 시도하여 주세요.');
					}
				});

			});
		});

		function dataClean(){
			$("select[name='uiqcate']").val('');
			$("textarea[name='uiqcont']").val('');
			$("input[name='uiqcontac']").val('');
		}
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
						<li><a href="https://www.goodchoice.kr/mypage/myZzim">찜</a></li>

						<li><a href="https://www.goodchoice.kr/mypage/myReserve">예약내역</a></li>

						<li><a href="https://www.goodchoice.kr/mypage/myInfo" class="active">내정보수정</a></li>
						
						<li><a href="https://www.goodchoice.kr/mypage/myInfo">문의사항</a></li>
					</ul>
</div>				<!-- //서비스 메뉴 -->
				
				<!-- 서비스 콘텐츠 -->
				<div class="svc_contents">
					<div class="svc_title svc_inquiry">
						<h4>1:1 문의</h4>
					</div>
					
					
					<!-- svc_cont_wrap -->
					<div class="svc_cont_wrap">	
						<div class="svc_tab svc_inquiry svc_inq_reg">
							<ul>
								<li class="tab_inq_reg active"><a href="https://www.goodchoice.kr/service/inquiryReg">문의하기</a></li>
								<li class="tab_inq_list"><a href="https://www.goodchoice.kr/service/inquiryList">나의 문의 내역</a></li>
							</ul>
						</div>
						
						<form action="http://www.goodchoice.kr/service/setInquiryRegData" method="post" accept-charset="utf-8" id="inquiryform">						
<input name="uno" value="4197344" type="hidden">
						
<input name="uiqostype" value="P" type="hidden">
						
<input name="uiqgubn" value="W" type="hidden">
						
<input name="uiqdevice" value="Firefox" type="hidden">
						
<input name="uiqversion" value="53.0" type="hidden">

						<div class="svc_inquiry_reg">
							<div class="inq_cate_sel">
								<label>
									<span>작성자</span>
									<select id="inq_type" name="uiqcate">
										<option value="" selected="selected">선택하세요</option>
																				<option value="1">이용문의</option>
																				<option value="2">혜택받기</option>
																				<option value="3">이용후기</option>
																				<option value="4">회원계정</option>
																				<option value="5">본인인증</option>
																				<option value="6">포인트몰</option>
																			</select>
								</label>
							</div>
							
							<div class="inq_input">
								<textarea id="inq_cont" name="uiqcont" placeholder="문의하실 내용을 입력해주세요."></textarea>
							</div>
							
							<div class="inq_tel">
								<p>
									<label class="agree_chk">
										<input class="ipt_chk" name="rolechk" id="rolechk" type="checkbox"> <strong>개인정보 수집 이용</strong> 동의
									</label>
									<span>문의하신 내용에 대한 정확한 원인 파악을 위해 휴대폰 정보를 수집하고 있습니다. </span>
									<span>자세한 답변을 받고 싶으신 분은 휴대폰 번호를 입력해 주세요. </span>
									<span>수집된 정보는 문의 답변 완료 후, 자동 삭제됩니다.</span>
								</p>
								<label>
									<span>휴대폰정보</span>
									<input class="ipt_inq_tel numOnly" id="inq_tel" name="uiqcontac" placeholder="휴대폰 번호를 입력해주세요." maxlength="11" type="tel">
								</label>
							</div>
							
							<div class="inq_btn">
								<a href="javascript:;" class="btn_inq_reg">문의완료</a>
							</div>
							
						</div>
						
					</form></div>
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