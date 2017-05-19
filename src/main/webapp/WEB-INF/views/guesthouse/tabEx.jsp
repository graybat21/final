<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<style>
.tab ul li {
	float: left;
	margin: 0;
	padding: 5px;
	border: 1px solid #006633;
	background-color: #CCFDC4
}

.contents {
	border: 1px solid #006633;
	clear: both;
	margin: 0;
}
</style>
<script type="text/javascript">
	function showTabMenu(n) {
		var conId;

		for (i = 1; i < 4; i++) {
			conId = document.getElementById("con" + i);
			if (i == n) {
				conId.style.display = "";
			} else {
				conId.style.display = "none";
			}
		}
	}
	var newPageLoad = function() {

		$.ajax({
			url : dsfkds.gh,
			data : {id : a, name: b},
			success : function(data) {
				// newPage 에 뿌려줄 data
				$("#newPage").empty().append(data);
			}
		});

	}
	
	$(".ad_info_wrap").load("/tabReserve.gh",data);
	$(".ad_info_wrap").load("/tabReview.gh",data);
	$(".ad_info_wrap").load("/tabRoomDetail.gh",data);
	
</script>
</HEAD>

<BODY>
	<div class="tab">
		<ul>
			<li><a href="javascript:showTabMenu(1)">탭 메뉴1</a></li>
			<li><a href="javascript:showTabMenu(2)">탭 메뉴2</a></li>
			<li><a href="javascript:showTabMenu(3)">탭 메뉴3</a></li>
		</ul>
	</div>
	<div>
		<div class="contents" id="con1">탭 메뉴1 입니다.</div>
		<div class="contents" id="con2" style="display: none">탭 메뉴2 입니다.</div>
		<div class="contents" id="con3" style="display: none">탭 메뉴3 입니다.</div>
	</div>
</BODY>
</HTML>
