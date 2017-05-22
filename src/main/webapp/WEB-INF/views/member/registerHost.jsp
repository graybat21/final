<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html class='no-js'>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script>
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
<!-- <script type="text/javascript">

/*----------------------------------------
Upload btn
------------------------------------------*/
var SITE = SITE || {};
 
SITE.fileInputs = function() {
  var $this = $(this),
      $val = $this.val(),
      valArray = $val.split('\\'),
      newVal = valArray[valArray.length-1],
      $button = $this.siblings('.btn'),
      $fakeFile = $this.siblings('.file-holder');
  if(newVal !== '') {
    $button.text('Photo Chosen');
    if($fakeFile.length === 0) {
      $button.after('<span class="file-holder">' + newVal + '</span>');
    } else {
      $fakeFile.text(newVal);
    }
  }
};
 

$('.file-wrapper input[type=file]').bind('change focus click', SITE.fileInputs);

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    var tmppath = URL.createObjectURL(event.target.files[0]);

    reader.onload = function (e) {
      $('#img-uploaded').attr('src', e.target.result);
      $('input.img-path').val(tmppath);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

$(".uploader").change(function(){
  readURL(this);
});

</script> -->
<style>
@import "bourbon";
.img-holder{
  display: block;
  vertical-align: middle;
  width: 2em;
  height: 2em;
  
  img{
    width: 100%;
    max-width: 100%;
  }
}

.file-wrapper {
  cursor: pointer;
  display: inline-block;
  overflow: hidden;
  position: relative; 
 
 &:hover .btn{
 	background-color:	lighten($color-alpha, 10%) !important;
 } 
}

.file-wrapper input {
  cursor: pointer;
  font-size: 100px;
  height: 100%;
  filter: alpha(opacity=1);
  -moz-opacity: 0.01;
  opacity: 0.01;
  position: absolute;
  right: 0;
  top: 0; 
  z-index:	9;
}

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>Host Register</h2>
				<form class="form-horizontal" action="${pageContext.request.contextPath}/join/joinB.gh" 
				method="post" enctype="multipart/form-data" name="hostVO" id="hostVO">
				
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">Email</label>
						<div class="col-sm-6"><div class="controls">
							<input type="email" class="form-control" id="email" name="email" 
  							data-validation-email-message="형식에 맞는 이메일을 입력해 주세요."/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
						<div class="col-sm-3">
							<a class="btn" id="chkzip" onclick="execDaumPostcode()">중복확인</a>
						</div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">비밀번호</label>
						<div class="col-sm-6"><div class="controls">
							<input type="password" class="form-control" name="pw" id="pw"/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">비밀번호 확인</label>
						<div class="col-sm-6"><div class="controls">
							<input type="password" class="form-control" id="pwcheck" name="pwcheck"
							data-validation-match-match="pw"
							data-validation-match-message="비밀번호가 다릅니다." />
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">업체명</label>
						<div class="col-sm-6"><div class="controls">
							<input type="text" class="form-control" id="name" name="name" required="required"
							data-validation-required-message="꼭 적어주세요" />
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">업체번호</label>
						<div class="col-sm-6"><div class="controls">
							<input type="text" class="form-control" id="tel" name="tel" required="required"
							data-validation-required-message="꼭 적어주세요" />
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">사업자번호</label>
						<div class="col-sm-6"><div class="controls">
							<input type="text" class="form-control" id="biz_no" name="biz_no" required="required"
							data-validation-required-message="꼭 적어주세요" />
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">우편번호</label>
						<div class="col-sm-6"><div class="controls">
							<input type="text" class="form-control" id="zip" name="zip" readonly="readonly" required="required"/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
						<div class="col-sm-3">
							<a class="btn" id="chkzip" onclick="execDaumPostcode()">우편번호찾기</a>
						</div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">주소1</label>
						<div class="col-sm-9"><div class="controls">
							<input type="text" class="form-control" id="addr1" name="addr1" readonly="readonly" required="required"/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">주소2</label>
						<div class="col-sm-9"><div class="controls">
							<input type="text" class="form-control" id="addr2" name="addr2" required="required"/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">이미지</label>
						<div class="col-sm-3">
						<span class="file-wrapper">
	  						<input type="file" name="imageFile" id="imageFile" required="required"/>
	  						<input type="hidden" name="imagename" value="">
	  						<span class="btn btn-large btn-alpha">Upload Image</span>
						</span>
  						</div>
						<!-- <div class="col-sm-3">
						<img id="img-uploaded" src="http://placehold.it/350x350" alt="your image" />
  						</div> -->
					</div></div>
					
					<div class="form-group"><div class="control-group">
						<label class="col-sm-3 control-label">약관</label>
						<div class="col-sm-9"><div class="controls">
							<input type="checkbox" class="form-control" id="chk" name="chk" required 
  							data-validation-required-message="You must agree to the terms and conditions"/>
							<p class="help-block" style="color:red;"></p>
						</div></div>
					</div></div>
					
					<div class="col-sm-5"></div>
					<div class="col-sm-2">
						<input type="submit" class="form-control" value="입력"/>
					</div>
					<div class="col-sm-5"></div>
					
					
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

</body>
</html>
