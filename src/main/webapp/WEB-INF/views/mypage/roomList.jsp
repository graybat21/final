<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

</head>

<body>

	${room}
	<br /> ${image}
	<br />

	<c:forEach var="image" items="${image}">
   이미지 : <img src="./resources/upload/${image}" />

	</c:forEach>


</body>
</html>