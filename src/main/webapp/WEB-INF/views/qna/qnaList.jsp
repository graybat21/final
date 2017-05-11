<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<meta http-equiv="Content-Type">


</head>


<!-- (공통)contentsWrap -->
<article id="contentsWrap">
	<h2 class="hide">QnA</h2>

	<!-- 페이지 navi -->

	<script src="js/jquery.js"></script>

	<script>
		$(document).ready(function() {
			$('.bxslider').bxSlider({
				mode : 'vertical',
				auto : true,
				controls : false,
				pager : false

			});
		});
	</script>
	<!-- 네비게이션 -->
	홈 &gt; 마이페이지 &gt; <strong>QnA</strong>
	<!-- //페이지 navi -->
	<!-- 서비스 wrap -->
	<div class="svc_allwrap">
		<div class="bg_left"></div>
		<div class="bg_right"></div>
		<div class="svc_wrap row row_cont">
			<!-- 서비스 메뉴 -->
			<div class="svc_menu" style="display: none; min-height: 1530px;">
			</div>
			<!-- //서비스 메뉴 -->

			<!-- 서비스 콘텐츠 -->
			<div class="svc_contents">
				<div class="svc_title svc_notice">
					<h4>QnA</h4>
				</div>

				<!-- svc_cont_wrap -->
				<div class="svc_cont_wrap" style="min-height: 1127px;">
					<div class="svc_list">
						<table>
							<tbody>
								<c:forEach var="list" items="${list}">
									<c:url var="viewURL" value="qnaView.gh">
										<c:param name="no" value="${list.no }" />
									</c:url>
									<tr>
										<ul>
											<li>
												<p class="list_title">
													${list.no }
													<c:if test="${list.restep==1}">&nbsp;<img src="">
													</c:if>
													<a href="${viewURL }"><span>${list.subject }</span>
														${list.writer }</a>
												</p>
												<p class="list_date">
													<fmt:formatDate value="${list.reg }" pattern="yyyy.MM.dd" />
												</p>

											</li>
										</ul>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="">
						<a href="qnaWrite.gh" class=""><strong>글쓰기</strong> </a>
					</div>
					<!-- 페이징 -->
					<div class="svc_paging">
						<ul>
							<li class="page_num active"><a>1</a></li>
							<li class="page_num"><a
								href="https://www.goodchoice.kr/service/noticeList/20">2</a></li>
							<li class="page_num"><a
								href="https://www.goodchoice.kr/service/noticeList/40">3</a></li>
							<li class="page_next"><a
								href="https://www.goodchoice.kr/service/noticeList/20"></a></li>
							<li class="page_last"><a
								href="https://www.goodchoice.kr/service/noticeList/400"></a></li>
						</ul>
						<!--<p class="cnt_page"><span class="current">1</span> / <span class="total">21</span>page</p>-->
					</div>
					<!-- //페이징 -->
				</div>
				<!-- //svc_cont_wrap -->
			</div>
			<!-- //서비스 콘텐츠 -->
		</div>
	</div>
	<!-- //서비스 wrap -->
</body>
</html>