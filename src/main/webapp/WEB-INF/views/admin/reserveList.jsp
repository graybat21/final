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
	function deleteReserve() {
		return confirm("선택한 내역을 삭제하시겠습니까?");
	}
</script>	
</head>

<body>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
		<h1>
        	예약 내역 목록
		</h1>
		
    </section>

    <!-- Main content -->
    <section class="content">
    	<div class="row">
			<div class="col-xs-12">
				<div class="box">
				<div class="box-header">
					<form action="adminReserveList.gh">
						<select name="o">
							<option value="room_no" ${param.o eq "room_no" ? "selected" : "" }>방번호</option>
							<option value="count" ${param.o eq "count" ? "selected" : "" }>숙박 인원</option>
							<option value="mem_no" ${param.o eq "mem_no" ? "selected" : "" }>회원번호</option>
						</select>
						<input type="text" name="k" value="${searchKeyword }">
						<input type="submit" value="검색">
					</form>
    			</div>
    			<div class="box-body">
    <table>
		<thead>
			<tr height="30px">
				<th>회원번호</th>
				<th>방 번호</th>
				<th>숙박 인원</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>예약한 날짜</th>
				<th>강제 삭제</th>
			</tr>
		</thead>
		
		<tbody>
					<c:forEach items="${adminReserveList }" var="r">
						<tr height="40px">
							<td>${r.memno }</td>
							<td>${r.roomno }</td>
							<td>${r.count}</td>
							<td><fmt:formatDate value="${r.checkin }" pattern="yyyy.MM.dd"/></td>
							<td><fmt:formatDate value="${r.checkout }" pattern="yyyy.MM.dd"/></td>
							<td><fmt:formatDate value="${r.reg }" pattern="yyyy.MM.dd"/></td>
							<td>
								<c:url var="deleteReserve" value="/adminReserveDelete.gh">
									<c:param name="no" value="${r.no }" />
								</c:url>
								
							<a href="${deleteReserve }"><input type="button" value="탈 퇴" onclick="return deleteReserve()"></a></td>
						</tr>
					</c:forEach>

		</tbody>
	</table>
	</div>
	
 	<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			<c:if test="${pageMaker.prev }">
				<c:if test="${searchKeyword != null }">
					<c:url var="adminReserveList" value="adminReserveList.gh">
						<c:param name="page" value="${pageMaker.start - 1}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminReserveList" value="adminReserveList.gh">
						<c:param name="page" value="${pageMaker.start - 1}" />
					</c:url>
				</c:if>
				<li><a href="${adminReserveList }">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.start }"
				end="${pageMaker.end}" var="idx">
				<c:if test="${searchKeyword != null }">
					<c:url var="adminReserveList" value="adminReserveList.gh">
						<c:param name="page" value="${idx}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminReserveList" value="adminReserveList.gh">
						<c:param name="page" value="${idx}" />
					</c:url>
				</c:if>
				<li class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
					<a href='${adminReserveList }'>${idx}</a>
				</li>
				
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<c:if test="${searchKeyword != null }">
					<c:url var="adminReserveList" value="adminReserveList.gh">
						<c:param name="page" value="${pageMaker.end + 1}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminReserveList" value="adminReserveList.gh">
						<c:param name="page" value="${pageMaker.end + 1}" />
					</c:url>
				</c:if>
				<li><a href="${adminReserveList }">다음</a></li>
			</c:if>
		</ul>
		</div></div></div></div>
 	</section>
 	
  </div>
</body>
</html> 