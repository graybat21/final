<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

​<style>
table.table_point {width:95%;padding:0;margin:0;}
table.table_point caption {overflow:hidden; width:0; height:0; visibility:hidden; font-size:0;}
table.table_point thead {background:url(/blueb/img/common/title_bg2.gif);}
table.table_point thead th {color:#125c8a;font-size:15px;letter-spacing:-1px; font-weight:bold;padding:5px;border:1px #91d1e1 solid;text-align:center;}

table.table_point tbody th {color:#125c8a; height:30px;font-size:18px;letter-spacing:-1px;border-bottom:1px solid #eaeaea;text-align:right;padding-right:20px;}
table.table_point tbody td {border-bottom:1px solid #eaeaea; font-size:16px; color:#e60005; font-family:tahoma; height:30px;}
table.table_point tbody td.center { text-align:center;} 
table.table_point tbody td.right { text-align:right;padding-right:25px;} 
table.table_point tbody td.left { text-align:left;padding-left:10px;} 
table.table_point tbody td.old { background-color:#fafafa;} 
table.table_point tbody td.new { background-color:#f3f5ff;color:#562eb2;font-weight:bold;} 
table.table_point tbody td.small { font-size:11px;font-family:돋움;letter-spacing:-1px;} 
table.table_point tbody td.red1 { color:red1;} 
</style>

<table class="table_point mgt10">
   <caption>예약 성공</caption>
   <%-- <colgroup>
   <col width="31%" />
   <col width="13%" />
   <col width="17%" />
   <col width="42%" />
   </colgroup> --%>
      <tr>
         <th style="border:1px #999 solid;border-right:none;color:#444;">멤버NO</th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">호스트NO</th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">예약날짜</th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">총금액</th>
      </tr>
      
   <tr>
      <td class="center old">${payment.mem_no }</td>
      <td class="center old">${payment.host_no }</td>
      <td class="center old">
      <fmt:formatDate value="${payment.transCheckin }" pattern="yy-MM-dd"/>~
      <fmt:formatDate value="${payment.transCheckout }" pattern="yy-MM-dd"/>
      </td>
      <td class="center old">${payment.finalPrice }</td>
   </tr>
		<tr>
         <th style="border:1px #999 solid;border-right:none;color:#444;">입금자</th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">입금자 번호</th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">입금자 은행/이름</th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">입금자 계좌번호</th>
      </tr>
   <tr>
      <td class="center old">${payment.memname }</td>
      <td class="center old">${payment.memphone }</td>
      <td class="center old">${payment.membank }</td>
      <td class="center old">${payment.memaccount }</td>
   </tr>
   </tbody>
</table>
<hr>

<table class="table_point mgt10">
<thead>
      <tr>
         <th style="border:1px #999 solid;border-right:none;color:#444;">예약한 방 </th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">예약한 인원 </th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">방 가격</th>
         <th style="border:1px #999 solid;border-right:none;color:#444;">방 금액</th>
      </tr>
      </thead>
      <tbody>
<c:forEach begin="1" end="${sizeOfRoom }" varStatus="status">
<c:if test="${payment.count[status.count-1] != 0 }">
<tr>
<td class="center old">${status.count }번방,${payment.room_no[status.count-1] }</td>
<td class="center old">${payment.count[status.count-1] }</td>
<td class="center old">${payment.price[status.count-1] }</td>
<td class="center old">${payment.tprice[status.count-1] }</td>
</tr>
</c:if>
</c:forEach>
</tbody>
</table>

