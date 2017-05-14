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

<table>
							<tbody>
								<c:forEach var="list" items="${list}">
									<c:url var="viewURL" value="noticeView.gh">
										<c:param name="no" value="${list.no }" />
									</c:url>
									<tr>
										<ul>
											<li>
												<p class="list_title">
													${list.no }
													<a href="${viewURL }"><span>${list.subject }</span>
														${list.name }</a>
												</p>
												<p class="list_date">
													<fmt:formatDate value="${list.reg }" pattern="yyyy.MM.dd" />
												</p>

											</li>
										</ul>
									</tr>
								</c:forEach>
							</tbody>
</table>

						</div>
						
<div class="">
			<c:if test="${session_name == '탱자' }">
						<a href="noticeWrite.gh" class=""><strong>글쓰기</strong> </a>
			</c:if>
</div>
						
					</div>
					<!-- //svc_cont_wrap -->	
				</div>
				<!-- //서비스 콘텐츠 -->
			</div>
		</div>
</body>
</html>