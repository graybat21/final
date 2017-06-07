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
<script>	
	function deleteMem() {
		return confirm("선택한 기업 회원을 탈퇴시키겠습니까?");
	}
</script>	
</head>

<body>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>기업 회원 목록</h1>
    </section>

    <!-- Main content -->
    <section class="content">
    	<div class="row">
			<div class="col-xs-12">
				<div class="box">
				<div class="box-header">
			        <form action="adminhostList.gh">
					<select name="o">
						<option value="email" ${param.o eq "email" ? "selected" : "" }>email</option>
						<option value="name" ${param.o eq "name" ? "selected" : "" }>name</option>
						<option value="tel" ${param.o eq "tel" ? "selected" : "" }>tel</option>
						<option value="biz_no" ${param.o eq "biz_no" ? "selected" : "" }>biz_no</option>
						<option value="addr1" ${param.o eq "addr1" ? "selected" : "" }>address</option>
					</select>
					<input type="text" name="k" value="${searchKeyword }">
					<input type="submit" value="검색">
					</form>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
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
								<c:url var="detail" value="/ghDetail.gh">
									<c:param name="host_no" value="${host.no }" />
								</c:url>
						<tr height="50px">
							<td>${host.no }</td>
							<td>
							<a href="${detail }">${host.email }</a>
							</td>
							<td>
							<a href="${detail }">${host.name }</a>
							</td>
							<td>${host.tel }</td>
							<td><fmt:formatDate value="${host.reg }" pattern="yyyy.MM.dd"/></td>
							<td>${host.bizno}</td>
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
</div>
 		<!-- 페이징 -->
		<div class="box-footer clearfix">
			<ul class="pagination pagination-sm no-margin pull-right">
			<c:if test="${pageMaker.prev }">
				<c:if test="${searchKeyword != null }">
					<c:url var="adminHostList" value="adminhostList.gh">
						<c:param name="page" value="${pageMaker.start - 1}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminHostList" value="adminhostList.gh">
						<c:param name="page" value="${pageMaker.start - 1}" />
					</c:url>
				</c:if>
				<li><a href="${adminHostList }">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.start }"
				end="${pageMaker.end}" var="idx">
				<c:if test="${searchKeyword != null }">
					<c:url var="adminHostList" value="adminhostList.gh">
						<c:param name="page" value="${idx}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminHostList" value="adminhostList.gh">
						<c:param name="page" value="${idx}" />
					</c:url>
				</c:if>
				<li class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
					<a href='${adminHostList }'>${idx}</a>
				</li>
				
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<c:if test="${searchKeyword != null }">
					<c:url var="adminHostList" value="adminhostList.gh">
						<c:param name="page" value="${pageMaker.end + 1}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminHostList" value="adminhostList.gh">
						<c:param name="page" value="${pageMaker.end + 1}" />
					</c:url>
				</c:if>
				<li><a href="${adminHostList }">다음</a></li>
			</c:if>
		</ul>
		</div></div></div></div>
    </section>
    <!-- /.content -->
  <!-- /.content-wrapper -->
</div>
</body>
</html> 