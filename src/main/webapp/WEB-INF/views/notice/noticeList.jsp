<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>게하 공지사항</title>
	<!-- 공통 CSS  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.css">
			<!-- 페이지별 호출 소스 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/service.css">
</head>
<body>

		<!-- 서비스 wrap -->
		<div class="svc_allwrap">
			<div class="bg_left"></div>
			<div class="bg_right"></div>
			<div class="svc_wrap ">
				<div class="svc_contents">
					<div class="svc_title svc_notice">
					<h4>공지사항</h4>
					</div>
					<!-- svc_cont_wrap -->
					<div class="svc_cont_wrap" style="min-height: 1127px;">
						<div class="svc_list">


<table border="1"> 
<thead> <tr> <th>번호</th> <th>이름</th> <th>제목</th> <th>조회</th> <th>작성일</th> </tr> </thead> 
<tbody> 
<c:forEach var="item" items="${noticeList}">
 <tr>
  <td>${item.no}</td> <td>${item.name}</td> <td>${item.subject}</td> <td>${item.readCount}</td> <td>${item.reg}</td> </tr> </c:forEach> </tbody> </table>


	
						</div>
					</div>
					<!-- //svc_cont_wrap -->	
				</div>
				<!-- //서비스 콘텐츠 -->
			</div>
		</div>
</body>
</html>