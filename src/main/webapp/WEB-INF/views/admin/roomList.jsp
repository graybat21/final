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
        	게스트하우스 방 목록
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
    
    <c:if test="${adminRoomList.size()<=0}">
    	<h3 align="center">등록된 방이 없습니다.</h3>
    </c:if>
    <br><br>
    
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
					<c:forEach items="${adminRoomList }" var="room">
						<tr height="50px">
							<td>${room.no }</td>
							<td>${room.host_no }</td>
							<td>${room }
							<td>${room.name }</td>
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
	
	<script type="text/javascript">	
	
	function deleteRoom() {
		return confirm("선택한 방을 삭제시키겠습니까?");
	}
</script>	
 
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</body>
</html> 