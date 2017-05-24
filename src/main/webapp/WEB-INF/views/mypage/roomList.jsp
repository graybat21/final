<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

</head>

<body>
<article id="contentsWrap">
		<div class="my_wrap row row_cont">
			<div class="my_menu" style="display: none">
				<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
			</div>

			<div class="my_contents">
				<!-- my_cont_wrap  얘가 오른쪽 페이지 줄짧게 만드는?애 없애면 길어짐 -->
				<div class="my_cont_wrap">
					<!-- 내정보 수정 -->
					<div class="myinfo_title">
						<strong>방등록</strong>
						<!-- <span>회원정보를 수정할 수 있습니다.</span> -->
					</div>
					<div class="myinfo_table ">
	<table border=1 width="1200px">
		<thead>
			<tr>
			<th>방이름</th>
			<th>최대인원</th>
			<th>인당가격</th>
			<th>방번호</th>
			<th>이미지</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${room }" varStatus="status">
		<tr>
			<td>${item.name}</td>
			<td>${item.max }</td>
			<td>${item.price}</td>
			<td>${item.no}</td>
			<td><img src="./resources/upload/${image[status.count].filename}" width="100px" height="100px"/></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
					<div class="myinfo_table ">
						<table>
							<tr>
								<td>
									<button id="btn-upload" type="submit"
										onclick="location.href='roomList.gh'">방 등록</button> <br>
								</td>
							</tr>
						</table>
					</div>

				</div>
			</div>
		</div>
	</article>

</body>
</html>

 --%>

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
							<button id="btn-upload" type="submit" style="width: 100%; height: 110% " onclick="location.href='roomList.gh'">새로운 방 등록하기</button>
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
