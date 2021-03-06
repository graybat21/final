<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:if test="${mem != null && session_mem_no!='1'}">
	<h3>마이페이지</h3>
	<ul>
		<li><a href="wishList.gh">찜 </a></li>
		<li><a href="myReservation.gh">예약내역</a></li>
		<li><a href="modifyMyInfo.gh">내정보수정</a></li>
		
		<li><a href="myMessage.gh">메시지함<c:if test="${REF}">
		<img class="ic_new" src="${pageContext.request.contextPath}/image/ic_new.png"/></c:if></a>
		</li>
	</ul>
	<h3>QNA</h3>
	<ul>
		<!-- QNA리스트는 관리자만  -->
		<!-- <li><a href="qnaList.gh">QNA리스트</a></li> --> 
		<li><a href="myqnaList.gh">나의 QNA</a></li>
	</ul>
	</c:if>
	<c:if test="${host != null }">
	<h3>마이페이지</h3>
	<ul>
		<li><a href="myReserveList.gh">예약내역</a></li>
		<li><a href="modifyMyInfoHost.gh">내정보수정</a></li>
	</ul>
	<h3>방관리</h3>
	<ul>
		<li><a href="roomInsertForm.gh">방 추가하기</a></li>
		<li><a href="roomList.gh">방 목록확인</a></li>
	</ul>
	<h3>QNA</h3>
	<ul>
		<!-- QNA리스트는 관리자만  -->
		<!-- <li><a href="qnaList.gh">QNA리스트</a></li> -->
		<li><a href="myqnaList.gh">나의 QNA</a></li>
	</ul>
	
	</c:if>
	
	<c:if test="${session_mem_email =='admin'||session_mem_no=='1' }">
	<h3>QNA</h3>
	<ul>
		<li><a href="qnaList.gh">QNA리스트</a></li>
	</ul>
	</c:if>
