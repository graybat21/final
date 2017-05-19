<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
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
/* paging */
	.svc_paging ul li a {min-width:50px}
	.svc_paging ul li.page_first a {background-size:auto 14px;}
	.svc_paging ul li.page_prev a {background-size:auto 14px}
	.svc_paging ul li.page_next a {background-size:auto 14px}
	.svc_paging ul li.page_last a {background-size:auto 14px;}

/* paging */
.svc_paging {padding:30px 0;text-align:center;}
.svc_paging ul {display:inline-block;border:1px solid #ccc;border-radius:5px;}
.svc_paging ul li {float:left;display:inline-block;border-right:1px solid #ddd;box-sizing:border-box;}
.svc_paging ul li a {display:inline-block;min-width:28px;height:38px;line-height:42px;font-weight:500;text-align:center;color:#707070;vertical-align:middle;}
.svc_paging ul li.page_first a {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_page_first.png') no-repeat 50% 50%;background-size:auto 10px;}
.svc_paging ul li.page_prev a {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_page_prev.png') no-repeat 50% 50%;background-size:auto 10px}
.svc_paging ul li.page_next a {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_page_next.png') no-repeat 50% 50%;background-size:auto 10px}
.svc_paging ul li.page_last a {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_page_last.png') no-repeat 50% 50%;background-size:auto 10px;}
.svc_paging ul li:last-child {border-right:none;}
.svc_paging ul li:last-child a {border-radius:0 5px 5px 0;}
.svc_paging ul li:first-child a {border-radius:5px 0 0 5px;}
.svc_paging ul li:hover a, .svc_paging ul li.active a {color:#e62a4a;background-color:#fff;}

</style>
<%-- <%
request.setCharacterEncoding("UTF-8");

out.print(request.getParameter("imagePath"));

%> --%>
</head>

<body>

	<c:if test="${roomList.size()<=0}">
    	<h3 align="center">등록된 방이 없습니다.</h3>
    </c:if>
    <br /> <br>
    
    <table>
		<thead>
			<tr height="30px">
				<th>방 번호</th>
				<th>방 이름</th>
				<th>이미지</th>
				<th>최대 인원</th>
				<th>가 격</th>
				<th>등록 일</th>
			</tr>
		</thead>
		
		<tbody>
					<c:forEach items="${roomList }" var="room">
						<tr height="40px">
							<td>${room.no }</td>
							<td>${room.name }</td>
							<td>${room.image }</td>
							<td>${room.max }</td>
							<td>${room.price }</td>
							<td><fmt:formatDate value="${room.reg }" pattern="yyyy.MM.dd"/></td>
							<%-- <td>
								<c:url var="deleteMem" value="/adminmemberDelete.gh">
									<c:param name="no" value="${mem.no }" />
								</c:url>
								
							<a href="${deleteMem }"><input type="button" value="탈 퇴" onclick="return deleteMem()"></a></td> --%>
						</tr>
					</c:forEach>

		</tbody>
	</table>
<%-- 	${room}
	<br /> ${image}

	<c:forEach var="image" items="${image}">
   이미지 : <img src="./resources/upload/${image}" />

	</c:forEach>
	세션값 뽑기 ${session_no }<br/>
	세션 이름뽑기 ${session_name }<br/>
	${session_id }<br/>
	

자바 세션 ${roomList.getno } --%>


	<%-- 이미지로 img src 절대경로 포함해서 뽑아내기

<c:forEach var="roomlist" items="room">
		
		${roomlist.filename}
 --%>
</body>
</html>