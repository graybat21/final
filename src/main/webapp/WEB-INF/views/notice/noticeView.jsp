<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="/pet/resources/admincss/bootstrap.min.css" rel="stylesheet">
<link href="/pet/resources/css/reset.css" rel="stylesheet">
<link href="/pet/resources/admincss/sb-admin-2.css" rel="stylesheet">
<style type="text/css"> 

	.contents-wrap{margin:30px 0 0 0;min-height: 500px;}
	.contents{ margin: 60px 0 0 0;}
	.recode-wrap{text-align: right; color: #888;}
	.hit-wrap{color:#888; margin: 10px 0;}
	.viewForm{margin: 20px 0 0 0;}
</style>

</head>

<body>


<div id="wrapper">
<div class="category_top">
	<ul>
	 	<li class="post1">커뮤니티</li><li>></li><li class="post2">공지사항</li>			
	</ul>
</div>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">NOTICE</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<!-- /.panel-heading -->

						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="danger">
										<th> ${noticeVO.subject }</th>
										
									</tr>
								</thead>
								<tbody>

							
									<tr>
										<td>${noticeVO.content }</td>

									</tr>

								</tbody>
							</table>
						</div>
			<form class="viewForm" method="post">
			<input type="hidden" name="${noticeVO.no }" />
			<%-- <input type="hidden" name="seq" value="${item.seq }" /> --%>

			<c:if test="${session_name != null }">
			<a href="noticeModify.gh?no=${noticeVO.no }"><span>수정</span></a>
			<a href="noticeDelete.gh?no=${noticeVO.no }"><span>삭제</span></a>
			</c:if>
			<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
		</form>	

					</div>

				</div>
			</div>
		</div>






</div>



	
</body>
<script type="text/javascript">

	var onList = function(){
		location.href='noticeList.gh';
	};
</script>
</html>