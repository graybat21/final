<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>QnA문의 게'하!</title>
</head>
<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">

	<div id="allWrap">
		<script>
			$(document)
			$(".inq_btn .btn_inq_reg")
					.click(
							function() {
								if ($("select[name='uiqcate']").val() == "") {
									alert("문의 유형을 선택해 주세요.");
									$("select[name='uiqcate']").focus();
									return false;
								}
								if ($("textarea[name='uiqcont']").val() == "") {
									alert("문의 내용을 입력해 주세요.");
									$("textarea[name='uiqcont']").focus();
									return false;
								}
								$
										.ajax({
											type : 'POST',
											async : false,
											cache : false,
											url : '/service/setInquiryRegData',
											dataType : 'json',
											data : $('#inquiryform')
													.serialize(),
											success : function(result) {
												//                  console.log(result);
												if (result == -1) {
													alert("유형유형 및 내용을 입력해주세요.");
												} else if (result == true) {
													alert("문의하신 내용이 접수되었습니다.\n빠른 시일내 답변드리겠습니다.\n감사합니다.");
													location.href = "/qnaList.gh";
													//                     dataClean();
												} else if (result == false) {
													alert("문의하신 내용이 접수되지 않았습니다.\n관리자에게 문의하세요.");
												}
											},
											complete : function(e) {
												//                  console.log('end ==>> '+e);
											},
											error : function(e) {
												console.log(e);
												alert('다시 시도하여 주세요.');
											}
										});
							});

			function dataClean() {
				$("select[name='uiqcate']").val('');
				$("textarea[name='uiqcont']").val('');
				$("input[name='uiqcontac']").val('');
			}
		</script>
	</div>

	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">문의사항</h2>

		<!-- 서비스 wrap -->
		<div class="svc_allwrap">


			<!-- <div class="bg_left"></div>
         <div class="bg_right"></div> -->

			<div class="svc_wrap row row_cont">
				<div class="svc_menu" style="display: none;">

					<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>

				</div>
				<!-- 서비스 콘텐츠 -->
				<div class="svc_contents">
					<div class="svc_title svc_notice">
						<h4>QnA</h4>
					</div>
					<!-- svc_cont_wrap -->
					<div class="svc_cont_wrap">
						<div class="svc_tab svc_inquiry svc_inq_reg">
							<form action="qnaWrite.gh" method="post" accept-charset="utf-8">
								<div class="svc_inquiry_reg">

									<div class="inq_tel">
										<p>
											<label> <c:if test="${mem != null }">
													<input class="ipt_inq_tel numOnly" name="writer"
														value="${session_mem_name}" maxlength="50" readonly>
												</c:if> <c:if test="${host != null }">
													<input class="ipt_inq_tel numOnly" name="writer"
														value="${session_host_name}" maxlength="50" readonly>
												</c:if>
											</label>
									</div>
									<div class="inq_tel">
										<p>

											<label><input class="ipt_inq_tel numOnly"
												name="subject" placeholder="제목을 입력해주세요" maxlength="11">
											</label>
									</div>
									<div class="inq_input">
										<textarea name="content" placeholder="문의하실 내용을 입력해주세요."></textarea>
									</div>



									<div class="inq_btn">
										<input type="submit" class="btn_inq_reg" value="문의하기">
										<span onclick="history.go(-1);"><input type="button"
											class="btn_inq_reg" value="뒤로가기"></span>
									</div>

								</div>

							</form>
						</div>
					</div>
					<!-- //svc_cont_wrap -->


				</div>
				<!-- //서비스 콘텐츠 -->
			</div>

		</div>
		<!-- //서비스 wrap -->
	</article>
	<!-- //(공통)contentsWrap -->

</body>
</html>