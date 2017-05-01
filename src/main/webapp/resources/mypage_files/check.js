
/*------------- 유효성 검사 ---------------*/
var confirm_msg = {	
	'email_type' : '이메일을 다시 입력해주세요.'
	,'logout_confirm' : '로그아웃 하시겠습니까?'
	,'ajax_fail' : '다시 시도하여 주세요.'
}

confirm_msg.joinEmail = {
	'email_chk' : '중복확인할 이메일을 입력하여 주세요.'
	,'email_ok' : '사용 가능한 이메일 입니다.'
	,'email_used' : '이미 사용중인 메일 주소입니다.'
	,'nick_ok' : '사용하실 수 있는 닉네임입니다.'
	,'nick_used' : '이미 사용중인 닉네임입니다.'

	,'duplidchk' : '이메일 중복확인을 해주세요.'
	,'pw_null' : '비밀번호를 입력해주세요.'
	,'pwchk_null' : '비밀번호 확인을 입력해주세요.'
	,'pwmissmatch' : '입력한 비밀번호가 일치하지 않습니다'
	,'duplnickchk' : '닉네임 중복확인을 해주세요.'
	,'rolechk' : '[서비스 이용약관]에 동의하여 주시기 바랍니다.'
	,'rolechk2' : '[개인정보 취급방침]에 동의하여 주시기 바랍니다.'
}

confirm_msg.login = {
	'email' : '이메일을 입력하여 주세요.'	
	,'upw' : '비밀번호를 입력하여 주세요.'
}

confirm_msg.pwFind = {
	'join_email' : '회원 가입한 이메일을 입력하세요.'
	,'mismatch' : '일치하는 회원정보가 없습니다.'
	,'send_email' : '비밀번호 재설정 메일이 발송되었습니다.\n\n입력하신 이메일을 확인해주세요.'
}

confirm_msg.password = {
	'ok' : '비밀번호가 변경되었습니다.'
	,'missmatch' : '입력한 비밀번호가 일치하지 않습니다'
	,'chk' : {
		'.ori_pw' : '기존 비밀번호를 입력해주세요.'
		,'.pw' : '새로운 비밀번호를 입력해주세요.'
		,'.pw_chk' : '비밀번호 확인을 입력해주세요.'
	},
	'chk_function' : {
		'case' : '비밀번호는 6~20자 이내의 영문, 숫자만 사용 가능합니다.'
		,'mix' : '비밀번호는 영문과 숫자를 포함하여 입력해주세요.'
	}
};

confirm_msg.nickname = {
	'null' : '닉네임을 입력해주세요.'
	,'case' : '닉네임은 2~10자 이내의 한글, 영문, 숫자만 사용 가능합니다.'
	,'ok' : '닉네임이 변경되었습니다.'
};

//이메일 형식 검사
function email_chk(email){
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if ( ! regEmail.test(email))
	{
		alert(confirm_msg['email_type']);
		return false;
	}
	return true;
}


//비밀번호 검사
function password_chk(password){
	var regexp = /[0-9a-zA-Z]{6,20}/;
	if ( ! regexp.test(password) ){
		alert(confirm_msg['password']['chk_function']['case']);
		return false;
	}
	if ( ! password.match(/([a-zA-Z].*[0-9])|([0-9].*[a-zA-Z])/) ){
		alert(confirm_msg['password']['chk_function']['mix']);
		return false;
	}
	return true;
}



//닉네임 검사
function wordch(thisword){
	var flag = true;
	var specialChars="~`!@#$%^&*-=+\|[](){};:'<.,>/?_";
	wordadded = thisword;
	for (i = 0; i < wordadded.length; i++) {
		for (j = 0; j < specialChars.length; j++) {
			if (wordadded.charAt(i) == specialChars.charAt(j)){
				flag=false;
				break;
			}
		}
	}
	return flag;
}

function nick_chk(nick){
	var regnick = /[가-힣0-9a-zA-Z]{2,10}/;

	if ( ! regnick.test(nick) || !wordch(nick) )
	{
		alert(confirm_msg['nickname']['case']);
		return false;
	}
	return true;
}