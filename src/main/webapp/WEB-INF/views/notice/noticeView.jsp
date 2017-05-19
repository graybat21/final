<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">


</head>

<body>


<!-- 서비스 wrap  -->
	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			
			<div class="svc_contents_notice">
				<div class="svc_title svc_notice">
					<h4>공지사항</h4>
				</div>

<table class="type05">
    <tr>
        <th height="30px">제목</th>
        <td>${noticeVO.subject }</td>
    </tr>

    <tr>
        <th height="300px">내용</th>
        <td>${noticeVO.content }</td>
    </tr>
</table>

			<input type="hidden" name="${noticeVO.no }" />
			<%-- <input type="hidden" name="seq" value="${item.seq }" /> --%>

			<c:if test="${session_name != null }">
			<button type="button" onclick="onModify()" class="btn btn-primary">수정</button>
			<button type="button" onclick="onDelete()" class="btn btn-primary">삭제</button>
			</c:if>
			<button type="button" onclick="onList()" class="btn btn-primary">목록</button>




			</div>

		</div>
	</div>

</body>
<script type="text/javascript">

	var onList = function(){
		location.href='noticeList.gh';
	};
	var onModify = function(){
		location.href='noticeModify.gh?no=${noticeVO.no }';
	};
	var onDelete = function(){
		location.href='noticeDelete.gh?no=${noticeVO.no }';
	};
</script>
</html>