<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
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
	
<%-- ${contextPath}/ --%>
	<form:form commandName="memberVO" action="login.gh"
		method="post" name="joinform">

		<div class="login">
			<fieldset>
				<legend>회원로그인</legend>
				<label class="email">email 
				<form:input	id="email" name="email" class="inputTypeText" type="text" path="email" />
				</label> 
				<label class="pw">pw
				<form:input id="pw" name="pw" type="password" path="pw" />
				</label>
				<!-- <p class="security"></p>
				<ul>
					<li><a href="#none" title="아이디찾기(새창으로 열기)"
						onclick="return openIdfind()" id="postBtn"> 아이디찾기</a></li>
					<li><a href="#none" title="비번찾기(새창으로 열기)"
						onclick="return openPwfind()" id="postBtn"> 비밀번호찾기</a></li>
				</ul> -->
			</fieldset>
		</div>
		<div class="login_btn">
		<form:button type="submit">LOGIN</form:button>
			<!-- <input type="submit" value="로그인"> -->
			<!-- <input TYPE="IMAGE" src="/pet/resources/images/SkinImg/btn_login.gif"
				name="Submit" value="Submit" /> -->
		</div>
		<!-- <div class="join">
			<h3>
				<img src="/pet/resources/images/SkinImg/h3_join.png" alt="회원가입" />
			</h3>
			<p>
				아직 오키독키 회원이 아니십니까?<br />회원을 위한 다양한 혜택이 준비되어 있습니다.
			</p>
		</div>
		<div class="join_btn">
			<a href="/pet/member/member.dog"><img
				src="/pet/resources/images/SkinImg/btn_join.gif" alt="회원가입" /></a>
		</div> -->

	</form:form>
</body>
</html>