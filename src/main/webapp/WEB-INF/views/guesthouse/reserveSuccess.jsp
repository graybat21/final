<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>예약 성공</h1>
<br>
<br>
<h2>예약내용</h2><br>

<%-- 멤버NO : ${payment.mem_no }<br>
호스트NO : ${payment.host_no }<br>
예약날짜 : ${payment.checkin } ~ ${payment.checkout }<br>
예약일 : ${payment.reg }<br>
총금액 : ${payment.finalPrice }<br>
입금자 이름 : ${payment.mem_name }<br>
입금자 번호 : ${payment.mem_phone }<br>
입금자 은행/이름 : ${payment.mem_bank }<br>
입금자 계좌번호 : ${payment.mem_account }<br>
<c:forEach var="item" items="${payment }" varStatus="status">
<hr>
예약한 방 : ${status.count }번방, ${item.room_no[status.index] }<br>
예약한 인원 : ${item.count[status.index] }<br>
방 가격 : ${item.price[status.index] }<br>
방 금액 : ${item.tprice[status.index] }<br>
</c:forEach>
 --%>