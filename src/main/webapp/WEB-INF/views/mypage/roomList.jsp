<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">
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
			<div class="svc_menu" style="display: none;"><!-- min-height: 1530px; -->
			<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
			</div>
			<!-- //서비스 메뉴 -->

			<!-- 서비스 콘텐츠 -->
			<div class="svc_contents">
				<div class="svc_title svc_notice">
				<h4>등록한 방 목록</h4>
				</div>
				<!-- svc_cont_wrap -->
				<div class="svc_cont_wrap" style="min-height: 1127px;">
					<div class="svc_list">					
				<table class="type07">
				    <tbody>
				    <tr style="text-align: left;">
			    		<td><strong>방이름</strong></td>
						<td><strong>최대인원</strong></td>
						<td><strong>인당가격</strong></td>
						<td><strong>방번호</strong></td>
						<td align="center"><strong>이미지</strong></td>
					</tr>
					  <c:forEach var="item" items="${room}" varStatus="status">
					    <tr>
					 		    <td align="left">${item.name}</td>
								<td align="left">${item.max }</td>
								<td align="left">${item.price}</td>
				                <td align="left">${item.no}</td>
				                <td><img src="./resources/upload/${image[status.count].filename}" width="100px" height="100px"/></td>
					    </tr>
					</c:forEach>
					<tr>
						<td></td><td></td>
						<td style="vertical-align: middle; height: 70px;">
							<button id="btn-upload" type="submit" style="width: 100%; " onclick="location.href='roomInsertForm.gh'">새로운 방 등록하기</button>
						</td><td></td><td></td>
					</tr>
				    </tbody>
				</table>
				</div>
				</div>
				<!-- //svc_cont_wrap -->
			</div>
			<!-- //서비스 콘텐츠 -->
		</div>
	</div>
	<!-- //서비스 wrap -->
	
</body>
</html>
