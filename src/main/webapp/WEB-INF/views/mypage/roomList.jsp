<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%-- <%
request.setCharacterEncoding("UTF-8");

out.print(request.getParameter("imagePath"));

%> --%>
</head>

<body>
	${room}
	<br /> ${image}

	<c:forEach var="image" items="${image}">
   이미지 : <img src="./resources/upload/${image}" />

	</c:forEach>




	<%-- 이미지로 img src 절대경로 포함해서 뽑아내기

<c:forEach var="roomlist" items="room">
		
		${roomlist.filename}
 --%>
</body>
</html>