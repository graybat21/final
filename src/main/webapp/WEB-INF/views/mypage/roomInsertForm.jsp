<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
<script src="<c:url value="/js/jquery-3.1.0.min.js"/>"></script>
<script src="<c:url value="/js/jquery.form.min.js"/>"></script>
<script type="text/javascript">
	//<![CDATA[
	$(function() {
		$("#btn-upload").on("click", function() {
			if (($("#file1").val() == "" || $("#file1").val() == null)) {
				alert("파일 첫 번째가 없습니다.");
			} else if (($("#file2").val() == "" || $("#file2").val() == null)) {
				alert("파일 두 번째가 없습니다.");
			} else {

				var form = new FormData(document.getElementById('uploadForm'));
				$.ajax({
					url : "${pageContext.request.contextPath}/roomInsert.gh", //컨트롤러 URL
					data : form,
					dataType : 'json',
					processData : false,
					contentType : false,
					type : 'POST',
					success : function(response) {
						alert("success");
						console.log(response);
					},
					error : function(jqXHR) {
						alert(jqXHR.responseText);
					}
				});
				/*

				 $('#uploadForm').ajaxSubmit({
				 url: "/pentode/upload.do", //컨트롤러 URL
				 dataType: 'json',
				 processData: false,
				 contentType: false,
				 type: 'POST',
				 success: function (response) {
				 alert("success");
				 console.log(response);
				 },error: function (jqXHR) {
				 alert(jqXHR.responseText);
				 }
				 });
				 */
			}
		});
	});
	//]]>
</script>
</head>

<body>
	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>

			<div class="svc_contents">
				<div class="svc_title svc_notice">
					<h4>방등록</h4>
				</div>
				<form id="uploadForm" enctype="multipart/form-data" method="POST"
					action="${pageContext.request.contextPath}/roomInsert.gh">

					<label for="file1">파일 첫 번째</label>
					<div>
						<input type="file" id="file1" name="file" required="required" />
					</div>
					<label for="file2">파일 두 번째</label>
					<div>
						<input type="file" id="file2" name="file" required="required" />
					</div>

					<label for="file2">name</label>
					<div>
						<input type="text" id="name" name="name" required="required" />
					</div>
					<label for="file2">max</label>
					<div>
						<input type="text" id="max" name="max" required="required" />
					</div>
					<label for="file2">price</label>
					<div>
						<input type="text" id="price" name="price" required="required" />
					</div>

					<input type="text" id="host_no" name="host_no" value="${host_no}"
						required="required" />

				</form>
				<div>
					<button id="btn-upload" type="submit"
						onclick="location.href='roomList.gh'">파일 업로드</button>
					<!-- <button id="btn-upload">파일 업로드</button> -->
					<%-- <a href="resources/upload/${filename}">${filename}</a><br/> --%>
				</div>
			</div>


		</div>
	</div>



</body>
</html>