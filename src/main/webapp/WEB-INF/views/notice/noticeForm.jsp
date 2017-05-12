<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>공지</title>

<!-- 공통 CSS  -->
</head>

<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">

	<div id="allWrap">


		<!-- (공통)contentsWrap -->
		<article id="contentsWrap">
			<h2 class="hide">공지사항</h2>

			<!-- 서비스 wrap -->
			<div class="svc_allwrap">


				<div class="svc_wrap row row_cont">


					<!-- 서비스 콘텐츠 -->
					<div class="svc_contents">
						<div class="svc_title svc_inquiry">
							<h4>공지</h4>
						</div>
						<!-- svc_cont_wrap -->
						<div class="svc_cont_wrap">
							<div class="svc_tab svc_inquiry svc_inq_reg">
								<form action="noticeWrite.gh" method="post" accept-charset="utf-8">
									<div class="svc_inquiry_reg">
										<div class="inq_cate_sel">
											<label> 
											<span>작성자:</span>
												<td>${session_name}<input type="hidden" name="name"
													value="${session_name}" /></td>
											</label>
										</div>
										<div class="inq_tel">
											<p>

												<label><input
													class="ipt_inq_tel numOnly" name="subject"
													placeholder="제목을 입력해주세요" maxlength="11">
												</label>
										</div>
										<div class="inq_input">
											<textarea name="content" placeholder="문의하실 내용을 입력해주세요."></textarea>
										</div>



										<div class="inq_btn">
											<input type="submit" class="btn_inq_reg" value="완료">
											<span  onclick="history.go(-1);"><input type="button" class="btn_inq_reg" value="취소"></span>
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

		<!-- //페이지별 화면 load -->
</body>
</html>