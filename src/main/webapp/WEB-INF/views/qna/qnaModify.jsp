<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymosus">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
</head>
<body>
		<div class="container">
			<table class="table table-bordered">
				<thead>
				<caption>글쓰기</caption>
				</thead>
				<tbody>
					<form action="qnaModify.gh" method="post">
						<input type="hidden" name="no" value="${qnaVO.no }" />
						<tr>
							<th>작성자:</th>

							<td><input type="text" name="writer"
								value="${qnaVO.writer }" readonly /></td>
						</tr>
						<tr>
							<th>제목:</th>
							<td><input type="text" name="subject"
								value="${qnaVO.subject }" /></td>
						</tr>
						<tr>
							<th>내용:</th>
							<td><textarea cols="40" name="content">${qnaVO.content }</textarea></td>
						</tr>


						<tr>
							<td colspan="2"><input type="submit" value="글작성" /> <input
								type="button" value="다시입력" /> <input type="button" value="취소 " />
							</td>
						</tr>
					</form>
				</tbody>
			</table>
		</div>
</body>
</html>