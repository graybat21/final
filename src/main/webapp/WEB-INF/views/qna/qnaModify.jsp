<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기</title>

</head>
</head>
<body>
	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			<div class="svc_menu" style="display: none;"><!-- min-height: 1530px; -->
			
			<%@ include file="/WEB-INF/views/layout/mypage.jsp"%>
			</div>
			<div class="svc_contents">
				<div class="svc_title svc_notice">
					<h4>QnA</h4>
				</div>
                  <!-- svc_cont_wrap -->
                  <div class="svc_cont_wrap">  <!-- 제목 내용 칸 너비 -->

                        <form action="qnaModify.gh" method="post" accept-charset="utf-8">
                           <div class="svc_inquiry_reg">  <!-- <<<<<<<<<<<<<<<<얘가 글 칸 넓게 해줌 -->
                             <div class="inq_tel">
                                 <p>
<input type="hidden" name="no" value="${qnaVO.no }" />
                                    <label><input class="ipt_inq_tel numOnly" name="subject" value="${qnaVO.subject }" maxlength="20"></label>
                              </div>
                              <div class="inq_input">
                                 <textarea name="content" >${qnaVO.content }</textarea>
                              </div>



                              <div class="inq_btn">
                                 <input type="submit" class="btn_inq_reg" value="완료">
                                 <span  onclick="history.go(-1);"><input type="button" class="btn_inq_reg" value="취소"></span>
                              </div>

                           </div>

                        </form>

                     </div>		
			</div>
		</div>
	</div>
</body>
</html>