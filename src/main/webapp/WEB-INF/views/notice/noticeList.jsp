<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">
</head>
<body>

	<!-- 서비스 wrap -->
	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			
			<div class="svc_contents_notice">
				<div class="svc_title svc_notice">
					<h4>공지사항</h4>
				</div>
				<!-- svc_cont_wrap -->
				<div class="svc_cont_wrap" style="min-height: 1127px;">
					<div class="svc_list">
<table class="type07">
    
    <tbody>
  					  <c:forEach var="list" items="${noticeList}">
    <tr>
									<c:url var="viewURL" value="noticeView.gh">
										<c:param name="no" value="${list.no }" />
									</c:url>
									 		
												<td align="left"><strong><a href="${viewURL }">${list.subject }</a></strong></td>

												<td align="right"><gray><fmt:formatDate value="${list.reg }" pattern="yyyy.MM.dd" /></gray></td>
    </tr>
								</c:forEach>
        

    </tbody>
</table>

					</div>

					<div class="">
						<c:if test="${session_name != null }">
							<a href="noticeWrite.gh" class=""><strong>글쓰기</strong> </a>
						</c:if>
					</div>
						
					<!-- 페이징 -->
					<div class="svc_paging">
					<ul class="pageUL">
						<c:if test="${noticePageMaker.prev }">
							<li><a href='noticeList.gh?page=${noticePageMaker.start -1}'>이전</a></li>
						</c:if>
						<c:forEach begin="${noticePageMaker.start }" end="${noticePageMaker.end}"
							var="idx">
							<li
								class='<c:out value="${idx == noticePageMaker.page?'current':''}"/>'>
								<a href='noticeList.gh?page=${idx}'>${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${noticePageMaker.next }">
							<li><a href='noticeList.gh?page=${noticePageMaker.end +1}'>다음</a></li>
						</c:if>
					</ul>
					</div>
				</div>
				<!-- //svc_cont_wrap -->
			</div>
			<!-- //서비스 콘텐츠 -->
		</div>
	</div>
</body>
</html>