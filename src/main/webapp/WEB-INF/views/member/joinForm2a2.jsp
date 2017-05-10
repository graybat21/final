<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
  <script type="text/javascript" src="js/log.js"></script>
	<script type="text/javascript">
	function loadList() {
		log("loadList 시작");
		// 알맞은 작업
		log("loadList 종료");
	}
	window.onload = function() {
		log("window.onload 호출");
		loadList();
	}
	</script>
<!-- <script src="/resources/js/commonUser.js"></script> -->
<script>
function verifynotify(field1, field2, result_id, match_html, nomatch_html) 
{
  this.field1 = field1;
  this.field2 = field2;
  this.result_id = result_id;
  this.match_html = match_html;
  this.nomatch_html = nomatch_html;

  this.check = function() {
    // Make sure we don't cause an error
    // for browsers that do not support getElementById
    if (!this.result_id) { return false; }
    if (!document.getElementById){ return false; }
    r = document.getElementById(this.result_id);
    if (!r){ return false; }

    if (this.field1.value != "" && this.field1.value == this.field2.value) {
      r.innerHTML = this.match_html;
    } else {
      r.innerHTML = this.nomatch_html;
    }
  }
}
	function verifyInput() {
		verify = new verifynotify();
		verify.field1 = document.form_validate.pw;
		verify.field2 = document.form_validate.userPwCheck;
		verify.result_id = "password_result";
		verify.match_html = "<span style=\"color:blue\">패스워드가 일치합니다!<\/span>";
		verify.nomatch_html = "<span style=\"color:red\">귀하의 비밀번호가 일치하는지 확인하십시오!<\/span>";

		// Update the result message
		verify.check();
	}

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
		verifyInput();
	});

	function verifyOK() {
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		/* var pwReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/g; */
		var mailReg = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/g;

		if (!mailReg.test(document.form_validate.email.value)) {
			alert("올바른 메일주소 형식이 아닙니다. 다시 확인해주세요.");
			return false;
		} else if (document.form_validate.pw.value == '') {
			alert("비밀번호가 비었습니다. 비밀번호를 입력해주세요.");
			return false;
		} else if (document.form_validate.pw.value != document.form_validate.userPwCheck.value) {
			alert("비밀번호와 비밀번호 확인이 서로 일치하지 않습니다. 다시 확인해주세요.");
			return false;
		} else if ($("#duplicateResult").text() != '사용 가능한 이메일입니다.'
				&& $("#duplicateResult").text() != '') {
			alert("이미 해당 이메일로 가입된 회원이 있습니다. 다른 이메일을 입력해주세요.");
			return false;
		}
		/* else if ( !pwReg.test(document.form_validate.password.value) ) 
		{
			alert("패스워드는 6~20자의 영문 대소문자, 숫자, 특수문자로 이루어져야 하며, 최소 한개의 숫자 혹은 특수문자가 포함되어야 합니다.");
			return false;
		} */
		else
			return true;
	}
	function isExistEmail() // use keyup event -> To check id
	{
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		/* var mailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; */

		$("#email").keyup(function() {
			if ($("#email").val().length >= 3) {
				$.ajax({
					url : "/emailCheck.gh",
					type : "POST",
					contentType : 'application/json; charset=utf-8',
					//data : JSON.stringify({ username : $("#username").val() }),
					data : $("#email").val(),
					//dataType: "json",
					success : function(data) {
						if (data) {
							$("#duplicateResult").text("이미 해당 이메일로 가입된 회원이 있습니다. 다른 이메일을 입력해주세요.");
						} else {
							$("#duplicateResult").text("");
						}
					},
					error : function(error) {
						alert(error.statusText);
					}
				});
			}
			return false;
		});
	}
</script>
<style>
span.error {
	font-size: 8pt;
	color: red;
	padding-left: 1%;
}
</style>
</head>

<body>


<form method="post" id="form_validate" name="form_validate" action="${pageContext.request.contextPath}/join/joinA.gh" onsubmit="return verifyOK()">
<h3>회원가입</h3>
	<spring:hasBindErrors name="MemberVO"/>
	<form:errors path="MemberVO"/>
		<fieldset>
			<label for="email">메일주소 : </label>
			<input type="text" id="email" name="email" class="loginInput"/>
			<span class="error"><form:errors path="MemberVO.email"/></span><br>
			<span id="duplicateResult"></span><br>
			
			<label for="pw">비밀번호 : </label>
			<input type="password" id="pw" name="pw" class="loginInput"/>
			<span class="error"><form:errors path="MemberVO.pw"/></span><br>
			
			<label for="userPwCheck">비밀번호 확인: </label>
			<input type="password" id="userPwCheck" name="userPwCheck" class="loginInput"/><br>
			
			<label for="name">회원 이름: </label>
			<input type="text" id="name" name="name" class="loginInput"/>
			<span class="error"><form:errors path="MemberModel.name"/></span><br><br>
			
			<label for="phone">핸드폰 : </label>
			<input type="text" id="phone" name="phone" class="loginInput"/>
			<span class="error"><form:errors path="MemberVO.phone"/></span><br><br>
			
			<input type="submit" value="확인" class="submitBt"/>
			<input type="reset" value="재작성" class="submitBt"/><br><br>
		</fieldset>
</form>
		
<div id="debugConsole" style="border: 1px solid #000"></div>
	
	<%-- <div class="wrapper">

		<div class="page one-column">
			<div class="em-wrapper-main">
				<div class="container container-main">
					<div class="em-inner-main">
						<div class="em-wrapper-area02"></div>
						<div class="em-main-container em-col1-layout">
							<div class="row">
								<div class="em-col-main col-sm-24">
									<div class="account-create">
										<div class="page-title">
											<h1>개인회원 가입 폼</h1>
										</div>
										<form:form commandName="member" method="post"
											id="form_validate" name="form_validate" 
											action="${pageContext.request.contextPath}/join/joinA.gh"
											onsubmit="return verifyOK()">
											<spring:hasBindErrors name="member">
												<font color="red"> <c:forEach
														items="${errors.globalErrors}" var="error">
														<spring:message code="${error.code}" />
													</c:forEach>
												</font>
											</spring:hasBindErrors>
											<input type="hidden" name="success_url" value="" />
											<input type="hidden" name="error_url" value="" />
											<ul class="form-list">
												<li class="fields">
													<div class="customer-name-middlename">

														<div class="field name-username">
															<label for="email" class="required"><em>*</em>Email</label>
															<div class="input-box">
																value="${member.email}" 
																<input type="text" id="email" name="email" title="Email"
																	maxlength="50" class="input-text required-entry"
																	onkeyup="isExistEmail()" /> <font color="red">
																	<span id="duplicateResult"></span><br> <form:errors
																		path="email" />
																</font>
															</div>
														</div>
													</div>
												</li>
												<li class="fields">
													<div class="field">
														<label for="pw" class="required"><em>*</em>Password</label>
														<div class="input-box">
															<input type="password" name="pw" id="pw" title="Password"
																class="input-text required-entry validate-password" />
															<font color="red"><form:errors path="pw" /></font>
														</div>
													</div>
													<div class="field">
														<label for="confirmation" class="required"><em>*</em>Confirm
															Password</label>
														<div class="input-box">
															<input type="password" name="confirmation"
																title="Confirm Password" id="confirmation"
																class="input-text required-entry validate-cpassword" />
														</div>
													</div>
												</li>
											</ul>
											<ul class="form-list">
												<li class="fields">
													<div class="field name-username">
														<label for="name" class="required"><em>*</em>Name</label>
														<div class="input-box">
															<input type="text" id="name" name="name" title="Name"
																maxlength="255" class="input-text required-entry" /> <font
																color="red"><form:errors path="name" /></font>
														</div>
													</div>
												</li>
												<li class="fields">
													<div class="field">
														<label for="phone" class="required"><em>*</em>Phone</label>
														<div class="input-box">
															<input type="text" name="phone" id="phone" title="Phone"
																value="${member.phone}"
																class="input-text required-entry" maxlength="13"
																onkeyup="pressKey()" /> <font color="red"><form:errors
																	path="phone" /></font>
														</div>
													</div>
												</li>
											</ul>
											<div class="buttons-set">
												<p class="back-link">
													<a href="/" class="back-link"><small>&laquo;
													</small>Back</a>
												</p>
												<button type="submit" title="Submit" class="button">
													<span><span>Submit</span></span>
												</button>
												<p class="required">* Required Fields</p>
											</div>

										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
</body>
</html>