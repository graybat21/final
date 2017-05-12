<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>qna상세보기</title>
</head>
<body>
	<table>
		<tbody>
			<tr>
				<th scope="row">작성자</th>
				<td>${qnaVO.writer}</td>
			</tr>
			<tr>
				<th scope="row">작성일</th>
				<td><fmt:formatDate value="${qnaVO.reg}" pattern="yyyy.MM.dd" />
				</td>
			</tr>
			<tr>
				<th scope="row">글제목</th>
				<td>${qnaVO.subject}</td>
			</tr>

			<tr>
				<th scope="row">글내용</th>
				<td>${qnaVO.content}</td>
			</tr>
		</tbody>
	</table>
	<a href="qnaModify.gh?no=${qnaVO.no }"><span>수정</span></a>
	<a href="qnaDelete.gh?no=${qnaVO.no }"><span>삭제</span></a>
	<a href="qnaList.gh"><span>목록으로</span></a>
</body>
</html>


