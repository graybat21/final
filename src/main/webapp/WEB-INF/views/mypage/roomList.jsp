<%@ page language="java" contentType="text/html; charset=UTF-8"
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