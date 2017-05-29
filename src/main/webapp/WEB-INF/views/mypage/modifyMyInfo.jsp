<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>

	
</head>

<body class="pcweb" oncontextmenu="return false" ondragstart="return false"> <!--<![endif]-->
	
	<!-- 페이지별 화면 load -->
		<!-- 페이지별 호출 소스 -->
	<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>
	
	<script type="text/javascript">
	function validate() {
		if(document.infoform.pw.value==''){
			alert('정보변경을 위해서 기존 비밀번호를 입력해주세요');
		}
	}
	</script>
	<!-- //페이지별 호출 소스 -->

	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">마이페이지</h2>
		
		<!-- 페이지 navi -->
		
<script src="${pageContext.request.contextPath}/resources/js/jquery_003.js"></script>

<script>
	$(document).ready(function(){
		$('.bxslider').bxSlider({
			mode: 'vertical',
			auto: true,
			controls : false,
			pager : false

		});
	});
</script>

		<!-- 마이페이지 wrap -->
<!-- 해봄 위에 얇은줄만 없어짐 --><!-- <div class="my_allwrap"> -->
	<!-- 해봄 왼쪽메뉴바 사라짐 -->		<div class="my_wrap row row_cont">
				<!-- 마이페이지 메뉴 -->
<!-- 해봄 왼쪽메뉴바 망가짐 -->				
<div class="my_menu" style="display: none;"><!-- min-height: 1530px; -->

<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>		
</div>		
				<!-- 마이페이지 콘텐츠 -->
				<div class="my_contents">
					<!-- my_cont_wrap  얘가 오른쪽 페이지 줄짧게 만드는?애 없애면 길어짐 -->
					<div class="my_cont_wrap">
						<!-- 내정보 수정 -->
						<div class="myinfo_title">
							<strong>내정보 수정</strong>
							<span>회원정보를 수정할 수 있습니다.</span>
						</div>
						<div class="myinfo_table ">
						<form name="infoform">
								<table>
									<tr>
										<th>이메일</th>
										<td>
											${mem.email == null ? host.email : mem.email }				
											<a class="btn_logout" href="memdeleteform.gh">회원탈퇴</a>
										</td>
									</tr>
									
									<tr>
										<th>연락처</th>
										<td>
											<input type="tel" name="phone" placeholder="연락처불러오기" value="${mem.phone }" size="15" maxlength="11">
										</td>
									</tr>

									<tr>
										<th>비밀번호</th>
										<td>
											<input type="password" name="pw" placeholder="정보수정을 위해서 기존비밀번호를 입력해주세요" size="40" maxlength="15">
										</td>
									</tr>
									<tr>
										<th>새 비밀번호</th>
										<td>
											<input type="password" name="newpw1" placeholder="비밀번호를 변경하려면 입력해주세요" size="40" maxlength="15">
										</td>
									</tr>
									<tr>
									<th>새 비밀번호 확인</th>
										<td>
											<input type="password" name="newpw2" placeholder="변경할 비밀번호를 다시한번 입력헤주세요" size="40" maxlength="15">
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="myinfo_table ">
						<table>
						<tr><td>
						<a class="btn_change_pw"  onclick="validate();return false;">변경</a>
						<!-- <a id="infoChange" onclick="validate();return false;">link text</a> -->
						<br>
						</td></tr>
						</table>
						</div>
						<!-- //내정보 수정 -->
					</div>
					<!-- //my_cont_wrap -->
				</div>
				<!-- //마이페이지 콘텐츠 -->
			</div>
		<!-- //마이페이지 wrap -->
	</article>
	<!-- //(공통)contentsWrap -->
	
	
	
<!-- 레이어 : 비밀번호 변경 -->
<div class="layer_allwrap">
<div class="layer_bg"></div>
<div class="layer_wrap" id="changePw" style="margin-top: 0px; margin-left: 0px;">
	
	<div class="layer_title">
		<h3>비밀번호 변경</h3>
		<a href="" class="layer_close">X</a>
	</div>
	<div class="layer_cont">
		<h4>기존 비밀번호</h4>
		<p class="ipt_txt"><input placeholder="기존 비밀번호 입력" id="upw" class="ori_pw" type="password"></p>
		<h4>새로운 비밀번호 입력</h4>
		<p class="ipt_txt"><input placeholder="영문, 숫자 포함 6~20자" id="nupw" class="pw" type="password"></p>
		<p class="ipt_txt"><input placeholder="비밀번호 확인" class="pw_chk" type="password"></p>
		<div class="noneblock" style="padding: 0px;"></div>
	</div>
	<div class="layer_btn">
		<a id="change_pw" class="ly_btn">확인</a>
	</div>
	
</div>
</div>
<!-- //레이어 : 비밀번호 변경 -->
</body></html>