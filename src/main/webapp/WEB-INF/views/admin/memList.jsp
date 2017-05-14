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
			<tr height="30px">
				<th width="15%">회원번호</th>
				<th width="20%">이메일</th>
				<th width="10%">이름</th>
				<th width="15%">연락처</th>
				<th width="15%">가입일</th>
				<th width="10%">인증여부</th>
				<th width="15%">강제 탈퇴</th>
			</tr>
		</thead>
		
		<tbody>
					<c:forEach items="${memberList }" var="mem">
						<tr height="40px">
							<td>${mem.no }</td>
							<td>${mem.email }</td>
							<td>${mem.name }</td>
							<td>${mem.phone }</td>
							<td><fmt:formatDate value="${mem.reg }" pattern="yyyy.MM.dd"/></td>
							<td>${mem.auth }</td>
							<td>
								<c:url var="deleteMem" value="/adminmemberDelete.gh">
									<c:param name="no" value="${mem.no }" />
								</c:url>
								
							<a href="${deleteMem }"><input type="button" value="탈 퇴" onclick="return deleteMem()"></a></td>
						</tr>
					</c:forEach>

		</tbody>
	</table>
	
	<script type="text/javascript">	
/* 	$(document).ready(function(){
		
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
		
	} */
	
	function deleteMem() {
		return confirm("선택한 회원을 탈퇴시키겠습니까?");
	}
</script>	
</body>
</html>