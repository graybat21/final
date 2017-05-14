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
        	기업 회원 목록
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
				<th>사업자번호</th>
				<th>주소1</th>
				<th>주소2</th>
				<th>우편번호</th>
				<th>인증여부</th>
				<th>강제탈퇴</th>
				
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
	
	function deleteMem() {
		return confirm("선택한 기업 회원을 탈퇴시키겠습니까?");
	}
</script>	
 
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</body>
</html> 