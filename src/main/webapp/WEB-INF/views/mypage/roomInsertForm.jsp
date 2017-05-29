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
			 /* else if (($("#file2").val() == "" || $("#file2").val() == null)) {
												alert("파일 두 번째가 없습니다."); } */
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
						alert("성공성공성공");
						/* location.reload(); */
						/* console.log(response); */
					},
					error : function(jqXHR) {
						alert("실패했지만 올라가 ㅎㅎㅎㅎ");
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
	/* 업로드폼 */
	function fileFields() {
		var x = document.getElementById('imageUpload');
		x.onclick = function() {
			var i = parseFloat(this.lastChild.id) + 1;

			input = document.createElement("input");

			input.setAttribute("type", "file");
			input.setAttribute("name", 'file'); /* input name */
			input.setAttribute("id", 'file' + i);

			this.appendChild(input);
		}
	}
	// Multiple onload function created by: Simon Willison
	// http://simonwillison.net/2004/May/26/addLoadEvent/
	function addLoadEvent(func) {
		var oldonload = window.onload;
		if (typeof window.onload != 'function') {
			window.onload = func;
		} else {
			window.onload = function() {
				if (oldonload) {
					oldonload();
				}
				func();
			}
		}
	}
	addLoadEvent(function() {
		fileFields();
	});
</script>
</head>

<body>
	<article id="contentsWrap">
		<div class="my_wrap row row_cont">
			<div class="my_menu" style="display: none">
				<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
			</div>

			<div class="my_contents">
				<!-- my_cont_wrap  얘가 오른쪽 페이지 줄짧게 만드는?애 없애면 길어짐 -->
				<div class="my_cont_wrap">
					<!-- 내정보 수정 -->
					<div class="myinfo_title">
						<strong>방등록</strong>
						<!-- <span>회원정보를 수정할 수 있습니다.</span> -->
					</div>
					<div class="myinfo_table ">

						<form name="infoform" id="uploadForm"
							enctype="multipart/form-data" method="POST"
							action="${pageContext.request.contextPath}/roomInsert.gh">
							<input type="hidden" name="host_no" value="${h_no}">
							<table>
								<tr>
									<th>방이름</th>
									<td><input type="text" id="name" name="name"
										required="required" size="15" maxlength="11" /></td>
								</tr>
								<tr>
									<th>최대인원</th>
									<td><input type="text" id="max" name="max"
										required="required" size="15" maxlength="11" /></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><input type="text" id="price" name="price"
										required="required" size="15" maxlength="11" /></td>
								</tr>
								<tr>
									<th>사진</th>
									<td><a href="#" id="imageUpload"><input type="file"
											name="file" id="file1" /></a></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="myinfo_table ">
						<table>
							<tr>
								<td>
									<button id="btn-upload" type="submit">방 등록</button> <br>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</article>

</body>
</html>