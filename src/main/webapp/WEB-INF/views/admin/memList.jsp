<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>이메일</th>
				<th>이름</th>
				<th>연락처</th>
				<th>가입일</th>
				<th>인증여부</th>
				<th>강제 탈퇴</th>
			</tr>
		</thead>
		
		<tbody>
					<c:forEach items="${memberList }" var="row">
						<tr height="40px">
							<td>${row.no }</td>
							<td>${row.email }</td>
							<td>${row.name }</td>
							<td>${row.phone }</td>
							<td><fmt:formatDate value="${row.reg }" pattern="yyyy.MM.dd"/></td>
							<td>${row.auth }</td>
							<td><a href="#this" id="delete">삭제</a></td>
						</tr>
					</c:forEach>

		</tbody>
	</table>
	
	<script type="text/javascript">	
	$(document).ready(function(){
		
		$("#delete").on("click", function(e){ //삭제하기 버튼
			e.preventDefault();
			fn_deleteBoard();
		});
		
	});
	
	
	function fn_deleteBoard(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adminmemberDelete.gh' />");
		comSubmit.addParam("no", $("#no").val());
		comSubmit.submit();
		
	}
</script>	
</body>
</html>