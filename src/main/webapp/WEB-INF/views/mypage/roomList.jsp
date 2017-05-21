<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

</head>

<body>

	<table border=1>
		<tr>
			<td>이름</td>
			<td>${sessionScope.session_host_name }</td>
			<td>번호</td>
			<td>${sessionScope.session_host_no }</td>
			<td>이메일</td>
			<td>${sessionScope.session_host_email }</td>
			<td>주소1</td>
			<td>${sessionScope.session_addr1 }</td>
			<td>이미지</td>
			<td>
			이미지 :<c:forEach var="item" items="${image}">
 <img src="./resources/upload/${item.}" width="100px" height="100px" />
 ${item.image}
				</c:forEach></td>
		</tr>

	</table>
	<%-- ${ImageSession}
	${room}
	<br /> ${image} --%>

	<%-- 
	여기!!!!!!!!!
	
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
	</c:forEach>/
	끝ㅌㅌㅌㅌ
 --%>


	<%-- ${sessionScope.ImageSession} --%>

	<%-- 	<c:forEach var="Image" items="${imageSession}">
   이미지 : <img src="./resources/upload/${image}" />

	</c:forEach> --%>


</body>
</html>