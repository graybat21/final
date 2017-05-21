<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>qna상세보기</title>
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
	
	<c:if test="${session_mem_name != null }">
	<button type="button" onclick="qnaModify()" class="btn btn-primary">수정</button>
	<button type="button" onclick="qnaDelete()" class="btn btn-primary">삭제</button>
	</c:if>
	<c:if test="${session_mem_name =='1'}">
	<button type="button" onclick="qnaRepl()" class="btn btn-primary">답변</button>
	</c:if>
	<button type="button" onclick="qnaList()" class="btn btn-primary">목록</button>
	
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