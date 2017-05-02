<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
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
	<h1>회원가입 메일 테스트</h1>

	<form method="post" action="sendmail2.gh">
		<!-- validator 추가 -->
		<input type="text" name="email" id="email" size="23" placeholder="이메일"><br>
		<input type="password" name="pw" id="pw" size="23" placeholder="비밀번호"><br>
		<input type="text" name="name" id="name" size="23" placeholder="이름"><br>
		<input type="text" name="phone" id="phone" placeholder="핸드폰"
			maxlength="13" onkeyup="pressKey()"> <br>
		<input type="submit" value="JOIN">
	</form>
</body>
</html>