<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<!-- (공통)contentsWrap -->
	<!-- 서비스 wrap -->
	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			<!-- 서비스 메뉴 -->
			<div class="svc_menu" style="display: none;">
				<!-- min-height: 1530px; -->

				<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
			</div>
			<!-- //서비스 메뉴 -->

			<!-- 서비스 콘텐츠 -->
			<div class="svc_contents">
				<div class="svc_title svc_inquiry">
					<h4>리뷰 메시지함</h4>
				</div>
				<!-- svc_cont_wrap -->
				<div class="svc_cont_wrap" style="min-height: 1127px;">
					<div class="svc_inquiry_list">
					
				 	<c:forEach items="${list}" var="clist">
						<ul>
						
							<li>
								<div class="inq_cont">
									<p class="inq_state inq_end">
										<span class="inq_cate" data-uiqno="54796" data-state="A">
											리뷰</span> <span> 답변 </span>
									</p>
									<p class="inq_txt">
										${clist.CONTENT}
									</p>
									<p class="inq_date">${clist.REG }</p>
								</div>
								<div class="reply_cont">
									<p class="reply_txt">
										${clist.C_CONTENT }
									</p>
									<p class="reply_date">${clist.C_REG }</p>
								</div>
							</li>
						</ul>
					</c:forEach>
					
						
					</div>
					</div>
					<c:if test="${empty list }">
			<li class="list_none">
				<p class="msg_title" style="cursor: pointer;">
					<span class="msg_no">&nbsp; </span><span class="msg_subject">메시지가
						없습니다.</span><span class="msg_date"></span>
				</p>
			</li>
		</c:if>
</div>
			
			<!-- //서비스 콘텐츠 -->
		</div>
		
		

	</div>

	<!-- //서비스 wrap --> </article>
	
	<!-- //(공통)contentsWrap -->
	<%-- <!-- 네비게이션 -->
					
홈&gt;마이페이지 &gt; <strong>메시지함</strong>	</p>
			<!-- 마이페이지 콘텐츠 -->
			<div class="my_contents">
				<!-- my_cont_wrap  얘가 오른쪽 페이지 줄짧게 만드는?애 없애면 길어짐 -->
				<div class="my_cont_wrap">
			
				<!-- 서비스 콘텐츠 -->
				<div class="svc_contents">
					<div class="svc_title svc_inquiry">
						<h4>메시지함</h4>
					</div>
				<c:forEach var="list" items="${cList}">
				<div class="svc_inquiry_list">
				<ul>
						<li>
							<div class="inq_cont">
								<p class="inq_state inq_end">
									<span class="inq_cate" data-uiqno="54796" data-state="A">리뷰답변</span>
								</p>
								<p class="inq_txt">${list.CONTENT }<br>
								</p>
								<p class="inq_date">${list.REG }</p>
							</div>
							<div class="reply_cont">
								<p class="reply_txt">${list.C_CONTENT }<br>
								</p>
								<p class="reply_date">${list.C_REG }</p>
							</div>
							
				</li>
				</ul>
						</div>		
											
					</c:forEach> 

		<c:if test="${empty list }">
			<li class="list_none">
				<p class="msg_title" style="cursor: pointer;">
					<span class="msg_no">&nbsp; </span><span class="msg_subject">메시지가
						없습니다.</span><span class="msg_date"></span>
				</p>
			</li>
		</c:if>


 --%>
 
</body>
</html>