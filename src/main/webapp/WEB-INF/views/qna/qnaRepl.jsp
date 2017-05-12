<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>문의내용 수정</title>
<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
	<div id="allWrap">
		<script>
			$(document)
								$(".inq_btn .btn_inq_reg")
										.click(
												function() {

													if ($(
															"select[name='uiqcate']")
															.val() == "") {
														alert("문의 유형을 선택해 주세요.");
														$(
																"select[name='uiqcate']")
																.focus();
														return false;
													}

													if ($(
															"textarea[name='uiqcont']")
															.val() == "") {
														alert("문의 내용을 입력해 주세요.");
														$(
																"textarea[name='uiqcont']")
																.focus();
														return false;
													}

										

													$
															.ajax({
																type : 'POST',
																async : false,
																cache : false,
																url : '/service/setInquiryRegData',
																dataType : 'json',
																data : $(
																		'#inquiryform')
																		.serialize(),
																success : function(
																		result) {
																	//						console.log(result);
																	if (result == -1) {
																		alert("유형유형 및 내용을 입력해주세요.");
																	} else if (result == true) {
																		alert("문의하신 내용이 접수되었습니다.\n빠른 시일내 답변드리겠습니다.\n감사합니다.");
																		location.href = "/qnaList.gh";
																		//							dataClean();
																	} else if (result == false) {
																		alert("문의하신 내용이 접수되지 않았습니다.\n관리자에게 문의하세요.");
																	}
																},
																complete : function(
																		e) {
																	//						console.log('end ==>> '+e);
																},
																error : function(
																		e) {
																	console
																			.log(e);
																	alert('다시 시도하여 주세요.');
																}
															});

												});
							});

			function dataClean() {
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
					<div class="svc_menu" style="display: none">
						<h3>마이페이지</h3>
						<ul>
							<li><a href="https://www.goodchoice.kr/mypage/myZzim">찜</a></li>

							<li><a href="https://www.goodchoice.kr/mypage/myReserve">예약내역</a></li>

							<li><a href="https://www.goodchoice.kr/mypage/myInfo"
								class="active">내정보수정</a></li>

							<li><a href="https://www.goodchoice.kr/mypage/myInfo">문의사항</a></li>
						</ul>
					</div>
					<!-- //서비스 메뉴 -->

					<!-- 서비스 콘텐츠 -->
					<div class="svc_contents">
						<div class="svc_title svc_inquiry">
							<h4>문의글 답변</h4>
						</div>
						<!-- svc_cont_wrap -->
						<div class="svc_cont_wrap">
							<div class="svc_tab svc_inquiry svc_inq_reg">
								<form action="qnaRepl.gh" method="post" accept-charset="utf-8">
								<input type="hidden" name="no" value="${qnaVO.no}" /> 
									<div class="svc_inquiry_reg">
										<div class="inq_cate_sel">
											<label> 
											<span>작성자:</span>
												<td>${session_name }
												<input type="hidden" name="writer" value="${session_name }">
											</label>
										</div>
										<div class="inq_tel">
											<p>

												<label>
												<input
													class="ipt_inq_tel numOnly" name="subject"
													value="[답변]${qnaVO.subject }" maxlength="11">
												</label>
										</div>
										<div class="inq_input">
											<textarea name="content" >${qnaVO.content }
===========================================답변======================================================
											
											</textarea>
										</div>



										<div class="inq_btn">
											<input type="submit" class="btn_inq_reg" value="작성">
											<input type="reset" class="btn_inq_reg" value="다시입력">
										</div>

									</div>

								</form>
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
</body>
</html>