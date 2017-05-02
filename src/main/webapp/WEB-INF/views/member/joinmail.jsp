<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>회원가입 메일 테스트</h1>

<form method="post" action="joinmail.gh">
	<input type="text" name="email" id="email" size="23" placeholder="이메일">
	<input type="password" name="pw" id="pw" size="23" placeholder="비밀번호">
	<input type="submit" class="btn_login" onclick="loginCheck()" value="JOIN">
</form>