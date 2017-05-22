<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">

table {
	width: 100%;
	margin: auto;
}

th {
	text-align: center;
	border-bottom: 1px solid #e32e4e;
	border-top: 1px solid #e32e4e;
	padding: 15px;
}

td {
	text-align: center;
	padding-top: 15px;
}


</style>

</head>
<div class="my_wrap row row_cont">
<body class="pcweb" oncontextmenu="return false" ondragstart="return false">
	
<div class="my_menu" style="display: none;">

<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>	
	
</div>
<div class="my_contents">


	<%-- ${ImageSession}
	${room}
	<br /> ${image} --%>
	
	<c:if test="${room.size()<=0}">
    	<h3 align="center">등록된 방이 없습니다.</h3>
    </c:if>
    <br /> <br>
    
    <table>
		<thead>
			<tr height="30px">
				<th>방 번호</th>
				<th>방 이름</th>
				<th>이미지</th>
				<th>최대 인원</th>
				<th>가 격</th>
				<th>등록 일</th>
			</tr>
		</thead>
		
		<tbody>
					<c:forEach items="${roommList }" var="room">
						<tr height="40px">
							<td>${room.no }</td>
							<td>${room.name }</td>
							<td>
							<%-- <c:forEach var="image1" items="${image}"> --%>
							${image }
							<%-- <img width="80px" src="./resources/upload/${image}" /> --%>
							<%-- </c:forEach> --%>
							</td>
							<td>${room.max }</td>
							<td>${room.price }</td>
							<td><fmt:formatDate value="${room.reg }" pattern="yyyy.MM.dd" /></td>
							<%-- <td>
								<c:url var="deleteMem" value="/adminmemberDelete.gh">
									<c:param name="no" value="${mem.no }" />
								</c:url>
								
							<a href="${deleteMem }"><input type="button" value="탈 퇴" onclick="return deleteMem()"></a></td> --%>
						</tr>
					</c:forEach>

		</tbody>
	</table>

<%-- 	<br /> 이름 : ${sessionScope.session_host_name }
	<br /> 번호 : ${sessionScope.session_host_no}
	<br />
	<!-- 16 -->
	이메일 : ${sessionScope.session_host_email}
	<br />
	<br /> 주소1 : ${sessionScope.session_addr1}
	<c:forEach var="item" items="${image}">
	<br /> 이미지 : <img src="./resources/upload/${item}" />
	<br />
	</c:forEach> --%>

 

	<%-- ${sessionScope.ImageSession} --%>

<%-- 	<c:forEach var="Image" items="${imageSession}">
   이미지 : <img src="./resources/upload/${image}" />

	</c:forEach> --%>

</div>
</body>
</div>
</html>