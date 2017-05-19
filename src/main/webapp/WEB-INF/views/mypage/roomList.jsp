<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

</head>

<body>
	<%-- ${ImageSession}
	${room}
	<br /> ${image} --%>

	<br /> 이름 : ${sessionScope.session_host_name }
	<br /> 번호 : ${sessionScope.session_host_no}
	<br />
	<!-- 16 -->
	이메일 : ${sessionScope.session_host_email}
	<br />
	<br /> 주소1 : ${sessionScope.session_addr1}
	<c:forEach var="item" items="${image}">
	<br /> 이미지 : <img src="./resources/upload/${item}" />
	<br />
	</c:forEach>

 

	<%-- ${sessionScope.ImageSession} --%>

<%-- 	<c:forEach var="Image" items="${imageSession}">
   이미지 : <img src="./resources/upload/${image}" />

	</c:forEach> --%>


</body>
</html>