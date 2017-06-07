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
<script type="text/javascript">	
	function deleteRoom() {
		return confirm("선택한 방을 삭제시키겠습니까?");
	}
</script>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	게스트하우스 방 목록
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
    
    	<div class="row">
			<div class="col-xs-12">
				<div class="box">
				<div class="box-header">
					<form action="adminroomList.gh">
						<select name="o">
							<option value="name" ${param.o eq "name" ? "selected" : "" }>name</option>
						</select>
						<input type="text" name="k" value="${searchKeyword }">
						<input type="submit" value="검색">
					</form>
    			</div>
    			<div class="box-body">
<table>
		<thead>
			<tr height="30px">
				<th>방 번호</th>
				<th>호스트 번호</th>
				<th>썸네일</th>
				<th>방 이름</th>
				<th>최대 인원</th>
				<th>가격</th>				
				<th>강제 삭제</th>				
			</tr>
		</thead>
		
		<tbody>
					<c:forEach items="${roomList }" var="room">
								<c:url var="detail" value="/ghDetail.gh">
									<c:param name="host_no" value="${room.hostno }" />
								</c:url>
						<tr height="50px">
							<td width="80px">${room.no }</td>
							<td width="110px">${room.hostno }</td>
							<td><a href="${detail}"><img src="./resources/upload/${room.filename }" width="100px" height="100px"/></td>
							<td>
							<a href="${detail}">${room.name }</a></td>
							<td>${room.max }</td>
							<td>${room.price}</td>
							<td>
								<c:url var="deleteRoom" value="/adminRoomDelete.gh">
									<c:param name="no" value="${room.no }" />
								</c:url>
								
							<a href="${deleteRoom }"><input type="button" value="삭 제" onclick="return deleteRoom()"></a></td>
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
					<c:url var="adminRoomList" value="adminroomList.gh">
						<c:param name="page" value="${pageMaker.start - 1}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminRoomList" value="adminroomList.gh">
						<c:param name="page" value="${pageMaker.start - 1}" />
					</c:url>
				</c:if>
				<li><a href="${adminRoomList }">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.start }"
				end="${pageMaker.end}" var="idx">
				<c:if test="${searchKeyword != null }">
					<c:url var="adminRoomList" value="adminroomList.gh">
						<c:param name="page" value="${idx}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminRoomList" value="adminroomList.gh">
						<c:param name="page" value="${idx}" />
					</c:url>
				</c:if>
				<li class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
					<a href='${adminRoomList }'>${idx}</a>
				</li>
				
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<c:if test="${searchKeyword != null }">
					<c:url var="adminRoomList" value="adminroomList.gh">
						<c:param name="page" value="${pageMaker.end + 1}" />
						<c:param name="o" value="${searchOption }"></c:param>
						<c:param name="k" value="${searchKeyword }"></c:param>
					</c:url>
				</c:if>
				<c:if test="${searchKeyword == null }">
					<c:url var="adminRoomList" value="adminroomList.gh">
						<c:param name="page" value="${pageMaker.end + 1}" />
					</c:url>
				</c:if>
				<li><a href="${adminRoomList }">다음</a></li>
			</c:if>
		</ul>
		</div></div></div></div>
		
 
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</body>
</html> 