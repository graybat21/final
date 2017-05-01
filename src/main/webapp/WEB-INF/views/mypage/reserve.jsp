<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
   var nowdate = "2017-04-27";

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
               <h3>마이페이지</h3>
               <ul>
                  <li><a href="https://www.goodchoice.kr/mypage/myZzim">찜</a></li>


                  <li><a href="https://www.goodchoice.kr/mypage/myReserve" class="active">예약내역</a></li>

                  <li><a href="https://www.goodchoice.kr/mypage/myInfo">내정보수정</a></li>
               </ul>
            </div>
<!-- 마이페이지 메뉴 -->
            
            <!-- 마이페이지 콘텐츠 -->
            <div class="my_contents">
               <!-- my_cont_wrap -->
               <div class="my_cont_wrap">
                  <div class="reserve_wrap" style="display:block">


                     <div class="cal_wrap">
                        <div class="left">
                           <span>조회 기간</span>
                           <a id="sel_day_week" class="sel_day active">1주일</a>
                           <a id="sel_day_month1" class="sel_day ">1개월</a>
                           <a id="sel_day_month3" class="sel_day ">3개월</a>
                        </div>
                        <div class="right">
                           <div class="date"><input id="reserve_date_01" name="srch_from" value="2017-04-20" readonly="readonly" class="hasDatepicker" type="text"></div>
                           <span>~</span>
                           <div class="date"><input id="reserve_date_02" name="srch_to" value="2017-04-27" readonly="readonly" class="hasDatepicker" type="text"></div>
                           <a onclick="javascript:document.my_reserve_frm.submit();">검색</a>
                        </div>
                        <div class="clear">&nbsp;</div>
                     </div>

                     <div class="vr_table_th">
                        <span>예약일자</span>
                        <span>상품정보</span>
                        <span>총결제금액</span>
                        <span>상태</span>
                     </div>

                     <div class="empty" colspan="4">
                        <div>
                           <b>예약된 내역이 없습니다.</b>
                           예약하시고 다양한 회원혜택을 받아보세요.<br>
                        </div>
                     </div>
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