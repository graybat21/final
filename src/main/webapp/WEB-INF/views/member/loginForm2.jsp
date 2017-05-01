<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- <a data-toggle="modal" href="#myModal">
	LOGIN</a> -->
	<!-- Button trigger modal -->
	<a data-toggle="modal" href="#myModal">Open Modal</a>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<form:form commandName="memberVO" action="login.gh" method="post"
						name="joinform">
						<div class="login">
							<fieldset>
								<legend>회원로그인</legend>
								<label class="email">email <form:input id="email"
										name="email" class="inputTypeText" type="text" path="email" />
								</label> <label class="pw">pw <form:input id="pw" name="pw"
										type="password" path="pw" />
								</label>
							</fieldset>
						</div>
						<div class="login_btn">
							<form:button type="submit">LOGIN</form:button>
						</div>
					</form:form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<%-- ${contextPath}/ --%>

</body>


</html>