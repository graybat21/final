<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap"%>

<html>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
#favorite {
	float: left; /* 왼쪽으로 정렬*/
}

#menu {
	float: right; /* 오른쪽으로 정렬 */
}

#navi ul li {
	list-style-type: none; /* 블릿 없애기 */
	display: inline; /* 목록을 가로로 연결해 표시 */
	margin: 0 10px; /* 상하공백 좌우공백 */
	font-family: "나눔고딕" [, "맑은고딕" ];
	font-size: 13px;
	font-weight: 800;
	color: #000000;
}

#navi ul li a {
	font-family: "나눔고딕" [, "맑은고딕" ];
	font-size: 13px;
	font-weight: 800;
	color: #000000;
	text-decoration: none;
}

#logo {
	float: left;
	margin: 50px 0 0 300px;
	width: 100%;
	height: 50px;
}

#search {
	float: left;
	margin: 10px 0 0 200px;
	width: 100%;
	height: 65px;
}

#searchBtn {
	height: 40px;
	width: 40px;
}
#popLayer{
  display: none;
  width: 100px;
  height: 50px;
  border: 1px solid red;
}

</style>
</head>
<body>
	<!-- 상단이미지 -->
		<!-- 상단메뉴 -->
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
	
							<li>    	<a href="#layer" class="layer_trigger">로그인</a></li>
					
			
			
			
		<!-- 로고 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
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




<script>
jQuery(function($){
	 var layerWindow = $('.mw_layer');
	 var layer = $('#layer');
	 
	 // Show Hide
	 $('.layer_trigger').click(function(){
	  layerWindow.addClass('open');
	 });
	 $('#layer .close').click(function(){
	  layerWindow.removeClass('open');
	 });


	 // ESC Event
	 $(document).keydown(function(event){
	  if(event.keyCode != 27) return true;
	  if (layerWindow.hasClass('open')) {
	   layerWindow.removeClass('open');
	  }
	  return false;
	 });
	 // Hide Window
	 layerWindow.find('>.bg').mousedown(function(event){
	  layerWindow.removeClass('open');
	  return false;
	 });
	});
	
function loginCheck() {
	if($("#member_id").val() == "") {
		alert("아이디를 입력해주세요.");
		return;
	} else if($("#member_pwd").val() == "") {
		alert("비밀번호를 입력해주세요.");
		return;
	}
	
	document.loginForm.submit();
}
</script>

<form method="post" action="login.action" name="loginForm">
	<div class="mw_layer">
	 <div class="bg"></div>
	 <div id="layer">
	 	<h2 style="border-bottom:1px solid black;">LOGIN</h2>
		 <div class="login_line">
		 	<div class="box_in">
		 		<input type="text" name="id" id="member_id"  size="23" placeholder="아이디">
				<input type="password" name="password" id="member_pwd" size="23" placeholder="비밀번호">
			</div>
		
			<input type="submit" class="btn_login" onclick="loginCheck()" value="LOGIN">
		 </div>
	    
	    <div class="close" >
		    <table width="100%" id="loginTbl" >
		    	<tr>
		    		<td width="30%" align="left" onclick="loginForm.action">회원가입</td>
		    		<td width="50%;" align="left">아이디/비밀번호 찾기</td>
		    		<td width="20%" align="right">
		    		 	<a href="#layer_anchor" title="레이어 닫기" class="close">닫기</a>
		    		</td>
		    	</tr>
		    </table>
	    </div>
	 </div>
	</div>
</form>
</body>
</html>
