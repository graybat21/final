<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

</head>

<body>

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


</body>
</html>