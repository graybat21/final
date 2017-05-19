<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	


	<c:if test="${mem != null }">
	<h3>마이페이지</h3>
	<ul>
		<li><a href="wishList.gh">찜 </a></li>
		<li><a href="#">예약내역</a></li>
		<li><a href="modifyMyInfo.gh">내정보수정</a></li>
	</ul>
	<h3>QNA</h3>
	<ul>
		<li><a href="qnaList.gh" class="active">QNA리스트</a></li>
		<li><a href="qnaList.gh">QNA내가쓴글</a></li>
	</ul>
	</c:if>
	<c:if test="${host != null }">
	<h3>방관리</h3>
	<ul>
		<li><a href="roomInsertForm.gh">방 추가하기</a></li>
		<li><a href="roomList.gh">방 목록확인</a></li>
	</ul>
	<h3>QNA</h3>
	<ul>
		<li><a href="qnaList.gh" class="active">QNA리스트</a></li>
		<li><a href="qnaList.gh">QNA내가쓴글</a></li>
	</ul>
	
	</c:if>
