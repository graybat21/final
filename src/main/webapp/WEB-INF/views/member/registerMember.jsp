<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html class='no-js'>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script>
<script type="text/javascript">
	$(function() {
		$("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>
<!-- 핸드폰번호 입력 관련 -->
<script>
	function pressKey() {
		var _val = document.getElementById('phone').value.trim();
		document.getElementById('phone').value = autoHypenPhone(_val);
	}
	function autoHypenPhone(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}
	
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>Member Register</h2>
				<form class="form-horizontal" action="${pageContext.request.contextPath}/join/joinA.gh" method="post">
				
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">Email</label>
						<div class="col-sm-6"><div class="controls">
							<input type="email" class="form-control" id="email" name="email" 
  							data-validation-email-message="형식에 맞는 이메일을 입력해 주세요."/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
						<div class="col-sm-3">
							<a class="btn" id="chkemail" onclick="">중복확인</a>
						</div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">비밀번호</label>
						<div class="col-sm-6"><div class="controls">
							<input type="password" class="form-control" name="pw" id="pw"/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">비밀번호 확인</label>
						<div class="col-sm-6"><div class="controls">
							<input type="password" class="form-control" id="pwcheck"
							data-validation-match-match="pw"
							data-validation-match-message="비밀번호가 다릅니다." />
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">이름</label>
						<div class="col-sm-6"><div class="controls">
							<input type="text" class="form-control" id="name" name="name" required="required"
							data-validation-required-message="꼭 적어주세요" />
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">폰번호</label>
						<div class="col-sm-6"><div class="controls">
							<input type="text" class="form-control" id="phone" name="phone" required="required"
							data-validation-required-message="꼭 적어주세요" />
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">약관</label>
						<div class="col-sm-9"><div class="controls">
							<input type="checkbox" class="form-control" id="chk" required 
  							data-validation-required-message="You must agree to the terms and conditions"/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					
					<div class="col-sm-5"></div>
					<div class="col-sm-2">
						<input type="submit" class="form-control" />
					</div>
					<div class="col-sm-5"></div>
					
					
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

</body>
</html>
