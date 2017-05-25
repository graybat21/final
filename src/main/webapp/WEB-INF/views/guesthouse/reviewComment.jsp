<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<li class="review_oner">
	<form action="writeReviewComment.gh">
	<div class="review_user_img">
		<img
			src="${pageContext.request.contextPath}/resources/image/owner_defaultprofile_20160414.png"
			alt="">
	</div>
	<div class="review_user_info">
		<span class="user_name">${session_host_name}</span> <span
			class="user_reg_date">now</span>
	</div>

	<div class="review_cont">
		<textarea rows="10" cols="100" name="c_content"></textarea>
		<input type="submit" value="작성">
	</div>
	</form>
</li>