<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">
<style type="text/css">
.button {
    background-color: #E32E4E; /* 여기어때컬러 */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style>

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
								 		
								<td align="left"><a href="${viewURL}"><strong><p style="color:#000000; text-decoration: none; !important;">${list.subject }</p></strong></a></td>
								
								<td align="right"><gray><fmt:formatDate value="${list.reg }" pattern="yyyy.MM.dd" /></gray></td>
								</tr>
								</c:forEach>
						     </tbody>
						</table>
					</div>
				<div align="right" >
					<c:if test="${session_mem_no == '1'&& session_mem_email == 'admin' }">
						<a href="noticeWrite.gh" class="button"><strong>글쓰기</strong></a>
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