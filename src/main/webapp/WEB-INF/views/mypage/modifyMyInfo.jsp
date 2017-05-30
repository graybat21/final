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
	
	<!-- //페이지별 호출 소스 -->

	<!-- (공통)contentsWrap -->
	<article id="contentsWrap">
		<h2 class="hide">마이페이지</h2>
		
		<!-- 페이지 navi -->
		
<script src="${pageContext.request.contextPath}/resources/js/jquery_003.js"></script>

<script type="text/javascript">
function validate(session_mem_no){
	
	if(document.infoform.pass.value==''){
		alert('정보변경을 위해서 기존 비밀번호를 입력해주세요.');
		return false;
	}
	if(document.infoform.newpw1.value!=document.infoform.newpw2.value){
		alert('변경하실 비밀번호를 다시 확인해주세요.');
		return false;
	}
	
	var pass = $("#pass").val();
	$.ajax({
		url: 'chkPW.gh',
		type: 'POST',
		dataType: 'text',
		data: { password: pass, session_mem_no: session_mem_no },
		success: function(data) {
			if(data=='1'){
				/* alert($(#infoform.pw.value)); */
				//새로운 비번이 지정x
				if(document.infoform.newpw1.value==""||document.infoform.newpw1.value==null){
					var pw = document.infoform.pw.value;
				}else{
					//새로운 비번이 지정
					var pw = document.infoform.newpw1.value;
				}
				location.href='modify.gh?&no='+ session_mem_no +'&password='+pw+'&tel='+document.infoform.phone.value;
				alert("수정이 완료되었습니다.");
			}else if(data=='0'){
				alert("기존 비밀번호가 일치하지 않습니다.");
				return false;
			}
			
		},
		error: function(e) {
			/* alert(e.status);//404경로 500오타나  400 값 (일반적으로 파라미터나 요청값) 200//성공 문제없다 
			alert(e.readyState);//1 = 요청 실패? 2=요청 보넀는데 응답 없다 3= 지금 응답 일부분 받고 끝  4= 응답전부다받았다
			alert(confirm_msg['ajax_fail']);
					*/
			//location.reload(true);
			alert("ERROR!");
		}
	});
	}
</script>
		<!-- 마이페이지 wrap -->
	<!-- <div class="my_allwrap"> -->
<div class="my_wrap row row_cont">
		<!-- 마이페이지 메뉴 -->	
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
					<!-- @RequestParam("session_mem_no") int session_mem_no, @RequestParam("password") String password,@RequestParam("tel") String tel,HttpSession session -->
					<form name="infoform" id="infoform">
							<table>
								<tr>
									<th>이메일</th>
									<td>
										${mem.email == null ? host.email : mem.email }				
										<a class="btn_logout" href="deleteform.gh">회원탈퇴</a>
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
									<input id="pass" name="pw" placeholder="정보수정을 위해서 기존비밀번호를 입력해주세요" size="40" maxlength="15" type="password">
										<!-- <input type="password" name="pw" placeholder="정보수정을 위해서 기존비밀번호를 입력해주세요" size="40" maxlength="15"> -->
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
					<%-- <a id="passChk2" href="javascript:;" onclick='return checkdeletechk("${sessionScope.session_mem_no}")'>확인</a> --%>
					<a class="btn_change_pw" id="passChk2" href="javascript:;" onclick='return validate("${sessionScope.session_mem_no}")'>수정</a>
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

</body>
</html>