<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br>
${search.area}<br>
from : ${search.from}<br>
to : ${search.to}<br>
${search.max_price}<br>
${search.participant}<br>
<hr>
<c:forEach var="item" items="${reserve }">
방주소 : ${item.ADDR1}<br>
호스트이름 : ${item.NAME}<br>
인당가격 : ${item.PRICE}<br>
방의최대인원수 : ${item.MAX}<br>
checkin : ${item.CHECKIN}<br>
checkout : ${item.CHECKOUT}<br>
예약인원 : ${item.COUNT}<br>
</c:forEach>
<hr>
