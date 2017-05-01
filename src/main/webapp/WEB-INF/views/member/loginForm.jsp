<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap"%>

<html>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<head>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
.mw_layer{display:none;position:fixed;_position:absolute;top:0;left:0;z-index:10000;width:100%;height:100%}
.mw_layer.open{display:block}
.mw_layer .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
#layer{
	position:absolute;width:250px;top:25%;left:40%;margin:0px auto;padding:0px 28px 0 28px;
	border:2px solid #1e90ff;background:#fff;font-size:12px;font-family:Tahoma, Geneva, sans-serif;
	color:#767676;line-height:normal;white-space:normal; 
}
.login_line{margin:10px 0 0;height:80px;}
.box_in{float:left;margin:0 10px 0; }
.box_in input{width:120px;height:24px;display:block;margin:3px 0 0;}
.btn_login{
			width:72px;height:60px;background:#363636;color:#a6a6a6;float:left;
			line-height:60px;text-align:center;margin-top:5px;
			cursor: pointer;
			}
#layer h2{color:#636363;font-size:24px;line-height:40px;}
.close { margin-bottom:10px; text-decoration: none; width:100%; text-align:right; cursor: pointer}
.close a { color: #ff3300; }
#loginTbl tr td{
	font-size:11px;
	font-family : 'NanumGothic';
}
</style>

</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<a href="#layer" class="layer_trigger">로그인</a>

	<!-- 로고 -->

	<!-- <form method="post" action="login.gh" name="loginForm">
		<div class="mw_layer">
			<div class="bg"></div>
			<div id="layer">
				<h2 style="border-bottom: 1px solid black;">LOGIN</h2>
				<div class="login_line">
					<div class="box_in">
						<input type="text" name="email" id="email" size="23"
							placeholder="이메일"> <input type="password" name="pw"
							id="pw" size="23" placeholder="비밀번호">
					</div>

					<input type="submit" class="btn_login" onclick="loginCheck()"
						value="LOGIN">
				</div>

				<div class="close">
					<table width="100%" id="loginTbl">
						<tr>
							<td width="30%" align="left" onclick="loginForm.action">회원가입</td>
							<td width="50%;" align="left">아이디/비밀번호 찾기</td>
							<td width="20%" align="right"><a href="#layer_anchor"
								title="레이어 닫기" class="close">닫기</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form> -->
</body>
</html>
