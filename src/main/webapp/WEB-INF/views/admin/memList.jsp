<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

table {
	width: 100%;
	margin: auto;
}

th {
	text-align: center;
	border-bottom: 1px solid #e32e4e;
	border-top: 1px solid #e32e4e;
	padding: 15px;
}

td {
	text-align: center;
	padding-top: 15px;
}
</style>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	일반 회원 목록
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
    
    <table>
		<thead>
			<tr height="30px">
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
	function deleteMem() {
		return confirm("선택한 회원을 탈퇴시키겠습니까?");
	}
</script>	
 
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</body>
</html> 