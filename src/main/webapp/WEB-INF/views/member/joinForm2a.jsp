<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">

<!-- 공통 CSS  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/user.css">

<!-- 공통 JS  -->
<script src="${pageContext.request.contextPath}/resources/js/1602931226643913.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fbevents.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/analytics.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/masonry.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_002.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/imgliquid.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/iscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_003.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/user.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>

<script>

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

<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
	<!-- //주메뉴 영역(mWeb용) -->

	<div id="allWrap">
		<!-- (공통)contentsWrap -->
		<article id="contentsWrap">


			<!-- user wrap -->
			<div class="user_wrap row row_cont">

				<!-- user_cont_wrap -->
				<div class="user_cont_wrap">
					<form action="${pageContext.request.contextPath}/join/joinA.gh"
						method="post" accept-charset="utf-8" id="joinform">

						<input name="step" value="3" type="hidden"> <input
							name="utype" value="1" type="hidden"> <input
							name="duplidchk" value="" type="hidden"> <input
							name="duplnickchk" value="" type="hidden">

						<!-- 회원가입 입력 -->
						<div class="join_email">
							<p class="join_item item_1">
								<label>이메일</label> <input class="ipt ipt_email" size="50"
									maxlength="50" placeholder="이메일 입력" id="email" name="email"
									onkeypress="$.duplidreset()" type="email"> <a
									onclick="return false;" class="btn_overlap_chk" id="chkid">중복확인!</a>
							</p>
							<p class="join_item item_2">
								<label>비밀번호</label> <input class="ipt ipt_password"
									placeholder="영문,숫자 포함 6~20자" id="pw" name="pw" maxlength="20"
									type="password">
							</p>
							<p class="join_item item_3">
								<label>비밀번호 확인</label> <input class="ipt ipt_password"
									placeholder="비밀번호 확인" name="upwchk" maxlength="20"
									type="password">
							</p>
							<p class="join_item item_4">
								<label>닉네임</label> <input class="ipt ipt_nick"
									placeholder="한글,영문,숫자 포함 2~10자" name="name" maxlength="10"
									onkeypress="$.duplnickreset()" id="name" type="text"> <a
									class="btn_overlap_chk" id="chknick" onclick="return false;">중복확인!</a>
							</p>
							<p class="join_item item_4">
								<label>핸드폰</label> <input class="ipt ipt_phone"
									placeholder="" id="phone" name="phone" maxlength="13"
									onkeyup="pressKey()" type="text">
							</p>
							
							<!-- 휴대폰 입력폼 필요 -->
							

							<!-- Agree Area -->
							<div class="agree_area">
								<!-- 서비스 이용약관 동의 -->
								<label class="agree_chk"> <input class="ipt_chk"
									name="rolechk" id="rolechk" type="checkbox"> <strong>서비스
										이용약관</strong> 동의
								</label>
								<div class="agree_txt">
									<div class="ag_wrap"></div>
									<p class="join_info">
										<span>14세 미만 아동은 서비스 사용이 불가합니다</span>
									</p>
								</div>
								<div class="btn_area">
									<!-- <a href="" onclick="$.joinok(); return false;"
										class="btn_confirm">회원가입!</a> -->
									<input class="btn_confirm" type="submit" width="200" value="JOIN">
								</div>
								<p class="join_info">
									<span>비밀번호 분실시 이메일을 통해 확인하므로,</span> <span>정확하게 입력해주세요.</span>
								</p>
							</div>
							<!-- 회원가입 입력 -->
						</div>
					</form>
				</div>
			</div>
		</article>
	</div>
</body>
</html>