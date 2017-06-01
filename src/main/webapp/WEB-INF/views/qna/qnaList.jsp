<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${pageContext.request.contextPath}/css/board.css"
	rel="stylesheet">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<meta http-equiv="Content-Type">

</head>
<body>
	<!-- (공통)contentsWrap -->
	<!-- 서비스 wrap -->
	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			<!-- 서비스 메뉴 -->
			<div class="svc_menu" style="display: none;">
				<!-- min-height: 1530px; -->

				<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
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


						<table class="type07">
						
							<tbody>
							
								<c:forEach var="list" items="${qnaList}">

									<tr>
										<c:url var="viewURL" value="qnaView.gh">
											<c:param name="no" value="${list.no }" />
											
										</c:url>

										<td align="left"><strong><a href="${viewURL }">${list.no }</a></strong></td>
										<td align="left"><strong><a href="${viewURL }">
													<c:if test="${list.restep==1}">&nbsp;
													<img
															src="${pageContext.request.contextPath}/image/answer.png">
													</c:if> ${list.subject }
											</a></strong></td>
											
										<td align="left"><strong><a href="${viewURL }">${list.writer }</a></strong></td>
										<td align="right"><gray>
											<fmt:formatDate value="${list.reg }" pattern="yyyy.MM.dd" /></gray></td>
									</tr>
									<input type="hidden" name="ref" value="${list.ref}">
									<input type="hidden" name="restep" value="${list.restep}">
								</c:forEach>
						
			
							</tbody>
						</table>
						
					</div>
					<div class="">
						<a href="qnaWrite.gh" class=""><strong>글쓰기</strong> </a>
					</div>

					<!-- 페이징 -->
					<div class="svc_paging">
						<ul class="pageUL">
							<c:if test="${qnaPageMaker.prev }">
								<li><a href='qnaList.gh?page=${qnaPageMaker.start -1}'>이전</a></li>
							</c:if>
							<c:forEach begin="${qnaPageMaker.start }"
								end="${qnaPageMaker.end}" var="idx">
								<li
									class='<c:out value="${idx == qnaPageMaker.page?'current':''}"/>'>
									<a href='qnaList.gh?page=${idx}'>${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${qnaPageMaker.next }">
								<li><a href='qnaList.gh?page=${qnaPageMaker.end +1}'>다음</a></li>
							</c:if>
						</ul>
					</div>
					<!-- <div class="svc_paging">
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
						<p class="cnt_page"><span class="current">1</span> / <span class="total">21</span>page</p>
					</div> -->
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
