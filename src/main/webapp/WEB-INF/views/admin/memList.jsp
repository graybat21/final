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
    
	<c:if test="${memberList.size()<=0}">
    	<h3 align="center">가입한 회원이 없습니다.</h3>
    </c:if>
    <br /> <br>
    
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
 	<%-- <div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			<div class="svc_contents">
				<div class="svc_cont_wrap" style="min-height: 1127px;">
 	<!-- 페이징 -->
		<div class="svc_paging">
		<ul class="pageUL">
			<c:if test="${memberPageMaker.prev }">
				<li><a href='adminmemberList.gh?page=${memberPageMaker.start -1}'>이전</a></li>
			</c:if>
			<c:forEach begin="${memberPageMaker.start }" end="${memberPageMaker.end}"
				var="idx">
				<li
					class="${idx == memberPageMaker.page ? 'current' : ''}">
					<a href='adminmemberList.gh?page=${idx}'>${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${memberPageMaker.next }">
				<li><a href='adminmemberList.gh?page=${memberPageMaker.end +1}'>다음</a></li>
			</c:if>
		</ul>
		</div></div></div></div></div>
    </section>
    <!-- /.content -->
  </div> --%>
  <!-- /.content-wrapper -->

</body>
</html> 