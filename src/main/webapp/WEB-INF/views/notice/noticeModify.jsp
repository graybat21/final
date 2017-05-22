<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
<title>NOTICE</title> 
</head>
<body>

	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">
			
			<div class="svc_contents_notice">
				<div class="svc_title svc_notice">
					<h4>공지사항</h4>
				</div>

                  <!-- svc_cont_wrap -->
                  <div class="svc_cont_wrap">  <!-- 제목 내용 칸 너비 -->

                        <form action="noticeModify.gh" method="post" accept-charset="utf-8">
                           <div class="svc_inquiry_reg">  <!-- <<<<<<<<<<<<<<<<얘가 글 칸 넓게 해줌 -->
                              <div class="inq_tel">
                                 <p>
<input type="hidden" name="no" value="${noticeVO.no }" />
                                    <label><input class="ipt_inq_tel numOnly" name="subject" value="${noticeVO.subject }" maxlength="20"></label>
                              </div>
                              <div class="inq_input">
                                 <textarea name="content" >${noticeVO.content }</textarea>
                              </div>



                              <div class="inq_btn">
                                 <input type="submit" class="btn_inq_reg" value="완료">
                                 <span  onclick="history.go(-1);"><input type="button" class="btn_inq_reg" value="취소"></span>
                              </div>

                           </div>

                        </form>

                     </div>
                     <!-- //svc_cont_wrap -->
				</div>
		</div>
	</div>
	
</body>
</html>