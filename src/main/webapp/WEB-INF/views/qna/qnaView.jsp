<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA 본문 내용 </title>
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

	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			<!-- 서비스 메뉴 -->
			<div class="svc_menu" style="display: none;">

<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>   
   
</div>   
			<!-- //서비스 메뉴 -->
			<div class="svc_contents">
				<div class="svc_title svc_notice">
					<h4>QnA</h4>
				</div>
				
	<table class="type05">
			<tr>
				<th height="30px">작성자</th>
				<td>${qnaVO.writer}</td>
			</tr>
			<tr>
				<th height="30px">작성일</th>
				<td><fmt:formatDate value="${qnaVO.reg}" pattern="yyyy.MM.dd" />
				</td>
			</tr>
			<tr>
				<th height="30px">글제목</th>
				<td>${qnaVO.subject}</td>
			</tr>

			<tr>
				<th height="300px">글내용</th>
				<td>${qnaVO.content}</td>
			</tr>
	</table>
	
	<c:if test="${session_mem_name != null&&session_mem_no =='1' }">
		<c:if test="${qnaVO.writer=='관리자'}">
		<a onclick="javascript:qnaModify()" class="button"><strong>수정</strong></a>
		</c:if>
	<a onclick="javascript:qnaDelete()" class="button"><strong>삭제</strong></a>
	<a onclick="javascript:qnaRepl()" class="button"><strong>답변</strong></a>
	<a onclick="javascript:qnaList()" class="button"><strong>목록</strong></a>
	</c:if>
	
				</div>

		</div>
	</div>
	
</body>
<script type="text/javascript">

	var qnaList = function(){
		location.href='qnaList.gh';
	};
	var qnaModify = function(){
		location.href='qnaModify.gh?no=${qnaVO.no }';
	};
	var qnaDelete = function(){
		location.href='qnaDelete.gh?no=${qnaVO.no }';
	};
	var qnaRepl = function(){
		location.href='qnaRepl.gh?no=${qnaVO.no }';
	};
</script>
</html>