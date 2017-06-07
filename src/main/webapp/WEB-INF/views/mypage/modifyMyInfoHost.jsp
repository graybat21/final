<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
 
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;
 
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
    
 
</script>
	
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
function validate(session_host_no){
	
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
		url: 'chkPW2.gh',
		type: 'POST',
		dataType: 'text',
		data: { password: pass, session_host_no: session_host_no },
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
				location.href='hostmodify.gh?&no='+ session_host_no +'&password='+pw+'&tel='+document.infoform.tel.value+'&zip='+document.infoform.zip.value+'&addr1='+document.infoform.addr1.value+'&addr2='+document.infoform.addr2.value;
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
					<form name="infoform" id="infoform">
							<table>
								<tr>
									<th>이메일</th>
									<td>
										${host.email}				
										<a class="btn_logout" href="hostdeleteform.gh">회원탈퇴</a>
									</td>
								</tr>
								
								<tr>
									<th>연락처</th>
									<td>
										<input type="tel" name="tel" placeholder="연락처불러오기" value="${host.tel }" size="15" maxlength="15">
									</td>
								</tr>

								<tr>
									<th>우편번호</th>
									<td>
										<input type="text" id="zip" name="zip" placeholder="우편번호" value="${host.zip}" size="15" maxlength="15" readonly> <a class="btn" id="chkzip" onclick="javascript:execDaumPostcode()">우편번호찾기</a>
									</td>
								</tr>
									
								<tr>
									<th>주소</th>
									<td>
										<input type="text" id="addr1" name="addr1" placeholder="주소" value="${host.addr1 }" size="40" maxlength="15" readonly>
									</td>
								</tr>
									
								<tr>
									<th>상세주소</th>
									<td>
										<input type="text" id="addr2" name="addr2" placeholder="상세주소" value="${host.addr2 }" size="40" maxlength="15">
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
					<a class="btn_change_pw" id="passChk2" href="javascript:;" onclick='return validate("${sessionScope.session_host_no}")'>수정</a>
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