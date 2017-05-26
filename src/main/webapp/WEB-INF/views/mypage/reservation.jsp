<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko"><head>

   
   
   <title><tiles:getAsString name="title"/></title>
      
   
   
   <!-- 공통 CSS  -->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/default.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/owl.css">
   
   <!-- 공통 JS  -->
   
   <script src="${pageContext.request.contextPath}/resources/mypage_files/jquery-1.js"></script>
<%--    <script src="${pageContext.request.contextPath}/resources/mypage_files/jquery_004.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/owl.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/masonry.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/jquery_002.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/imgliquid.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/iscroll.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/jquery_003.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/common.js"></script>    --%>
</head>

 <body class="pcweb" oncontextmenu="return false" ondragstart="return false"> <!--<![endif]-->

   <!-- 페이지별 호출 소스 -->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/mypage.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/search.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage_files/jquery-ui-1.htm">

   <script src="${pageContext.request.contextPath}/resources/mypage_files/mypage.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/search.js"></script>
   <script src="${pageContext.request.contextPath}/resources/mypage_files/jquery-ui-1.js"></script>


<!-- 페이지에서 1주일 1개월 3개월 클릭시 사용 -->
<article id="contentsWrap">
   <script>
   var date = new Date();
   var year  = date.getFullYear();
   var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
   var day   = date.getDate();

   if (("" + month).length == 1) { month = "0" + month; }
   if (("" + day).length   == 1) { day   = "0" + day;   }
  
   var nowdate = year +"-"+ month +"-"+  day;
   
   function padLeft(nr, n, str){
      return Array(n-String(nr).length+1).join(str||'0')+nr;
   }

   $(function() {
      $(".sel_day").click(function() {
         $(".sel_day").removeClass("active");
         $(this).addClass("active");

         var nowdatearr = nowdate.split('-');
         var predate = new Date(parseInt(nowdatearr[0]), parseInt(nowdatearr[1]), parseInt(nowdatearr[2]));

         switch($(this).attr("id")) {
         case 'sel_day_week':
            predate.setDate(predate.getDate() - 7);
            predate = predate.getFullYear() + '-' + padLeft(predate.getMonth(), 2) + '-' + padLeft(predate.getDate(), 2);

            $("input[name='sel_date_type']").val(1);
            break;
         case 'sel_day_month1':
            predate.setMonth(predate.getMonth() - 1);
            predate = predate.getFullYear() + '-' + padLeft(predate.getMonth(), 2) + '-' + padLeft(predate.getDate(), 2);

            $("input[name='sel_date_type']").val(2);
            break;
         case 'sel_day_month3':
            predate.setMonth(predate.getMonth() - 3);
            predate = predate.getFullYear() + '-' + padLeft(predate.getMonth(), 2) + '-' + padLeft(predate.getDate(), 2);

            $("input[name='sel_date_type']").val(3);
            break;
         }

         $("#reserve_date_01").val(predate);
         $("#reserve_date_02").val(nowdate);
      });

      $("#reserve_date_01, #reserve_date_02").change(function() {
         $("input[name='sel_date_type']").val('');
      });
   });
   </script>
   
      <!-- //페이지 navi -->
      
      <form name="my_reserve_frm" action="" method="POST">
      <input name="sel_date_type" value="1" type="hidden">
      <!-- 마이페이지 wrap -->

         <div class="my_allwrap">
<!--          <div class="bg_left"></div>
         <div class="bg_right"></div> -->
         
         <div class="my_wrap row row_cont">


<!-- 좌측의 마이페이지 메뉴바 -->
            <div class="my_menu" style="display:none">
              <%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
            </div>
<!-- 마이페이지 메뉴 -->
            
            <!-- 마이페이지 콘텐츠 -->
            <div class="my_contents">
               <!-- my_cont_wrap -->
               <div class="my_cont_wrap">
                  <div class="reserve_wrap" style="display:block">


                     <%-- <div class="cal_wrap">
                        <div class="left">
                           <span>조회 기간</span>
                           <a id="sel_day_week" class="sel_day active">1주일</a>
                           <a id="sel_day_month1" class="sel_day ">1개월</a>
                           <a id="sel_day_month3" class="sel_day ">3개월</a>
                        </div>
                        <div class="right">
                           <div class="date">
                           <input id="reserve_date_01" name="srch_from" value="${nowdate }" readonly="readonly" class="hasDatepicker" type="text"></div>
                           <span>~</span>
                           <div class="date">
                           <input id="reserve_date_02" name="srch_to" value="${nowdate }" readonly="readonly" class="hasDatepicker" type="text"></div>
                           <a onclick="javascript:document.my_reserve_frm.submit();">검색</a>
                        </div>
                        <div class="clear">&nbsp;</div>
                     </div> --%>

                     <div class="vr_table_th_reservation">
                        <span>예약일자</span>
                        <span>방사진</span>
                        <span>방정보</span>
                        <span>예약자정보</span>
                        <span>총결제금액</span>
                        <span>상태</span>
                     </div>
                     <c:forEach var="item" items="${list }">
                     <div class="vr_table_td_reservation">
                     	<li>
                     	<span><fmt:formatDate value="${item.CHECKIN }" pattern="yyyy-MM-dd"/>&nbsp;
                     	~&nbsp;<fmt:formatDate value="${item.CHECKOUT }" pattern="yyyy-MM-dd"/></span>
                        <span><img src="./resources/upload/${item.FILENAME }" width="100px" height="100px"/>
                        </span>
                        <span>${item.R_NAME }</span>
                        <span>${item.M_NAME }&nbsp;님</span>
                        <span>${item.COUNT}&nbsp;명 &nbsp;&nbsp;총&nbsp;${item.TOTALPRICE }원</span>
                        <span>${item.STATUS }</span>
                        </li>
                     </div>
					</c:forEach>
					<c:if test="${empty list }">
                     <div class="empty" colspan="4">
                        <div>
                           <b>예약된 내역이 없습니다.</b>
                        </div>
                     </div>
                     </c:if>
                  </div>
               </div>
               <!-- //my_cont_wrap -->
                  
            </div>
            <!-- //마이페이지 콘텐츠 -->
         </div>
        </div>
      </form>
      </article>
   <!-- //(공통)contentsWrap -->
   

<script type="text/javascript">
$(function(){ // DatePicker
   $('#reserve_date_01').datepicker({dateFormat: 'yy-mm-dd'});
   $('#reserve_date_02').datepicker({dateFormat: 'yy-mm-dd'});
});
</script>

</body></html>