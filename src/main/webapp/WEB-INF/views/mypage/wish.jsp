<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
	<!-- 헤더 시작부분 -->
	<div id="allWrap">
		<!-- 페이지별 호출 소스 -->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/mypage_files/mypage.css">
	
		<!-- //페이지별 호출 소스 -->
		<!-- (공통)contentsWrap -->
		<article id="contentsWrap">
			<h2 class="hide">마이페이지</h2>

			<!-- 페이지 navi -->

			<script
				src="${pageContext.request.contextPath}/resources/mypage_files/jquery_002.js"></script>

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
			<!-- 진정한 마이페이지의 시작 -->
			<!-- 마이페이지 wrap -->
			<div class="my_allwrap">
				<!-- <div class="bg_left"></div> -->
				<!-- 바깥으로 빠져나가는 회색 선 없어짐. -->
				<!-- <div class="bg_right"></div> -->
				<div class="my_wrap row row_cont">
					<!-- 마이페이지 메뉴 -->
					<!-- 좌측 네비게이션 -->
					<div class="my_menu" style="display: none">
						<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
					</div>
					<!-- //마이페이지 메뉴 -->
					<!-- 마이페이지 콘텐츠 -->
					<div class="my_contents">
						<!-- my_cont_wrap -->
						<div class="my_cont_wrap">
							<!-- 찜 리스트 -->
							<div class="my_count">
								<p>
									<strong class="cnt_title">찜목록</strong> 
									<span class="cnt_num"><em></em></span>
								</p>
							</div>
							<div class="my_zzim_list">

								<div class="srch_list_wrap">

									<div class="srch_list ">
										<c:forEach var="list" items="${list}">
											<c:url var="viewURL" value="wishView.gh">
												<c:param name="host_no" value="${list.HOST_NO }" />
												<c:param name="mem_no" value="${list.MEM_NO }" />
											</c:url>
											<!-- 리스트 TYPE1 -->
											<ul>
												<li><a class="link" data-ano="5913" data-uitype=""
													data-adtype="2" data-viewtype=""
													href="">
														<div class="ad_thumb">
															<div class="img_wrap imgLiquidFill"
																style="overflow: hidden; background-image: none;">
																<span class="thumb_none"></span> 
																<img src="${pageContext.request.contextPath}/resources/upload/${list.IMAGENAME}"
																	alt="${list.NAME }"
																	style="opacity: 1; visibility: visible; max-width: none; max-height: none; width: auto; height: 100%; display: block; image-rendering: auto; margin-left: -69px; margin-top: 0px;">
																<span class="opacity"></span>
																<!-- 그라데이션 배경 -->
															</div>
														</div>
														<div class="txt">
															<p class="name">
															<h4>${list.NAME }</h4>&nbsp;
																<!--도보가-->
															<p class="score">${list.ADDR1 }</p>
															<p class="score">${list.ADDR2 }</p>
															<p class="score">${list.ZIP }</p>
															<p class="price">${list.TEL }</p>
															
														</div>
															<a href="wishDelete.gh?mem_no=${list.MEM_NO}&host_no=${list.HOST_NO}" >
															<strong>X</strong> </a>
												</a></li>
												<!-- G4, 키워드 검색 -->
											</ul>
										</c:forEach>
									</div>
								</div>
								<!-- //리스트 TYPE1 -->
							</div>
							<!-- //마이페이지 wrap -->
							
			<c:if test="${empty list }">
				<div class="my_zzim_list">
				<div class="list_none">
					<h5>찜한 게스트하우스가 없습니다</h5>
					<p>관심 있는 게스트하우스를 찜해놓으세요 더욱 빠르게 찾으실 수 있습니다</p>
				</div>
				</div>
			</c:if>
							<!-- //찜 리스트 -->
							<!-- 페이징 -->
							<!-- //페이징 -->
						</div>
						<!-- //my_cont_wrap -->
					</div>
					<!-- //마이페이지 콘텐츠 -->
				</div>
			</div>
			
		</article>
		<!-- //(공통)contentsWrap -->
		<!-- //페이지별 화면 load -->
	</div>
</body>
</html>