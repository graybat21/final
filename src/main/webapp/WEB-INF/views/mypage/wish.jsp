<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
body{
@font-face {
  font-family: 'Jeju Gothic';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.eot);
  src: url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.eot?#iefix) format('embedded-opentype'),
       url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.woff2) format('woff2'),
       url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.woff) format('woff'),
       url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.ttf) format('truetype');
}
body a{
 text-decoration: none;
}
}
</style>



<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/mypage_files/mypage.css">
</head>
<body class="pcweb" oncontextmenu="return false"
	ondragstart="return false">
	<!-- 헤더 시작부분 -->
	<div id="allWrap">
		<!-- 페이지별 호출 소스 -->
		<!-- //페이지별 호출 소스 -->
		<!-- (공통)contentsWrap -->
		<article id="contentsWrap">
			<h2 class="hide">마이페이지</h2>
			
			<!-- 진정한 마이페이지의 시작 -->
			<!-- 마이페이지 wrap -->
			<div class="my_allwrap">
				<!-- <div class="bg_left"></div> -->
				<!-- <div class="bg_right"></div> -->
				<div class="my_wrap row row_cont">
					<!-- 마이페이지 메뉴 -->
					<div class="my_menu" style="display: none">
						<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
					</div>
					<!-- //마이페이지 메뉴 -->
					<!-- 마이페이지 콘텐츠 -->
					<div class="my_contents">
						<!-- my_cont_wrap -->
						<div class="my_cont_wrap">
							<!-- 찜 리스트 -->
							<div class="my_count">
								<p>
									<strong class="cnt_title">찜목록</strong> 
									<span class="cnt_num"><em></em></span>
								</p>
							</div>
							<div class="my_zzim_list">

								<div class="srch_list_wrap">

									<div class="srch_list ">
										<c:forEach var="wlist" items="${list}">
											<c:url var="viewURL" value="ghDetail.gh">
												<c:param name="host_no" value="${wlist.HOST_NO }" />
											</c:url>
											
											<c:url var="deleteWishURL" value="wishDelete.gh">
												<c:param name="session_mem_no" value="${sessionScope.session_mem_no}"/>
												<c:param name="host_no" value="${wlist.HOST_NO }" />
											</c:url>
											<table id="table" class="table">
											<tr style="background-color: white;">
											<td style="background-color: #ccc; width:330px; height: 180px; ">
											<img src="${pageContext.request.contextPath}/resources/upload/${wlist.IMAGENAME}" style="width: 330px; height: 180px;">
											</td>
											<td width="25px"></td>
											<td style="text-align: left; width: 520px;">
											<br>
											<a href="${viewURL }"><h1><font style=" color:#f32e4f; text-decoration: none; font-size: x-large "><b>${wlist.NAME }</b></font></h1></a>
											
											<font style="font-size: 11px; color: #ccc; ">
											<br>
											${wlist.ZIP }
											<br>
											${wlist.ADDR1 } ${wlist.ADDR2 }
											<br>
											☎ ${wlist.TEL }
											</font>
											</td>
											<td width="30">
											<br><a href= "${deleteWishURL}"><img src="${pageContext.request.contextPath}/resources/image/delete.png" width="20px"></a>
											</td>
											</tr>											
											</table>
										</c:forEach>
										<div class="wrapper">
									</div>
								</div>
								<!-- //리스트 TYPE1 -->
						
							</div>
							<!-- //마이페이지 wrap -->
							
			<c:if test="${empty list }">
				<div class="my_zzim_list">
				<div class="list_none">
					<h5>찜한 게스트하우스가 없습니다</h5>
					<p>관심 있는 게스트하우스를 찜해놓으세요 더욱 빠르게 찾으실 수 있습니다</p>
				</div>
				</div>
			</c:if>
							<!-- //찜 리스트 -->
							<!-- 페이징 -->
							<!-- //페이징 -->
						</div>
						<!-- //my_cont_wrap -->
					</div>
					<!-- //마이페이지 콘텐츠 -->
				</div>
			</div>
			
		</article>
		<!-- //(공통)contentsWrap -->
		<!-- //페이지별 화면 load -->
	</div>
</body>
</html>