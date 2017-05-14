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
				<th width="10%">회원번호</th>
				<th width="10%">이메일</th>
				<th width="10%">이름</th>
				<th width="15%">연락처</th>
				<th width="5%">가입일</th>
				<th width="10%">사업자번호</th>
				<th width="15%">주소1</th>
				<th width="5%">주소2</th>
				<th width="5%">우편번호</th>
				<th width="5%">인증여부</th>
				<th width="10%">강제탈퇴</th>
				
			</tr>
		</thead>
		
		<tbody>
					<c:forEach items="${hostList }" var="host">
						<tr height="50px">
							<td>${host.no }</td>
							<td>${host.email }</td>
							<td>${host.name }</td>
							<td>${host.tel }</td>
							<td><fmt:formatDate value="${host.reg }" pattern="yyyy.MM.dd"/></td>
							<td>${host.biz_no}</td>
							<td>${host.addr1 }</td>
							<td>${host.addr2 }</td>
							<td>${host.zip }</td>
							<td>${host.auth }</td>
							<td>
								<c:url var="deleteMem" value="/adminhostDelete.gh">
									<c:param name="no" value="${host.no }" />
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
		return confirm("선택한 기업 회원을 탈퇴시키겠습니까?");
	}
</script>	
</body>
</html>