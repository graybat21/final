<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<head>
<link href="${pageContext.request.contextPath}/css/search1.css" rel="stylesheet">
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resources/image/favicon.png">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/image/favicon.png">
</head>
<div class="srch_keyword_area">
	<div class="srch_keyword row">
		<p>${search.area}</p>
		<br>
		<p>체크인 : ${search.from}</p>
		<br>
		<p>체크아웃 : ${search.to}</p>
		<br>
		<p>${search.participant}명</p>
		<p>${search.max_price}원</p>
	</div>
</div>
<hr>
<div class="srch_list_wrap">
	<div id="toppreloader" class="preloader" style="display: none;">
	</div>
	<div class="srch_result">
		<div class="srch_group ui_0">
			<div class="srch_list ">
				<ul>
					<li><c:forEach var="item" items="${reserve }">
					<c:url var="viewURL" value="ghDetail.gh">
					<c:param name="host_no" value="${item.host_no }"/>
					</c:url>
				<!--  썸네일 이미지 -->
							<a class="link" data-ano="4343" data-uitype="1" data-adtype="3"
								data-viewtype="9">
								<div class="ad_thumb">
									<div class="img_wrap imgLiquidFill"
										style="overflow: hidden; background-image: none;">
										<span class="thumb_none"></span> <img src=""
											alt="${item.NAME}"
											onerror="this.src=''"
											style="opacity: 1; visibility: visible; max-width: none; max-height: none; width: auto; height: 100%; display: block; image-rendering: auto; margin-left: -69px; margin-top: 0px;">
										<span class="opacity"></span>
										<!-- //썸네일 이미지 -->
									</div>
								
								
								</div> 
								<div class="txt">
								<p class="name">${item.NAME}
								<p class="distance">${item.ADDR1}</p>
								<p class="price">${item.PRICE}원</p>
								<p class="score">Checkin : ${item.CHECKIN}</p>
								<p class="score">Checkout : ${item.CHECKOUT}</p>
								<p class="bene">최대인원  :${item.MAX}명</p> 
							</div>
							</a>
							
						</c:forEach>
						<hr>