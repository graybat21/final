<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>공지</title>


</head>

<body class="pcweb" oncontextmenu="return false"
   ondragstart="return false">
   
	<div class="svc_allwrap">
		<div class="svc_wrap row row_cont">	
			<div class="svc_contents_notice">
				<div class="svc_title svc_notice">
					<h4>공지사항</h4>
				</div>
                  <!-- svc_cont_wrap -->
                  <div class="svc_cont_wrap">  <!-- 제목 내용 칸 너비 -->

                        <form action="noticeWrite.gh" method="post" accept-charset="utf-8">
                           <div class="svc_inquiry_reg">  <!-- <<<<<<<<<<<<<<<<얘가 글 칸 넓게 해줌 -->    
                              <div class="inq_tel">
                                 <p>

                                    <label><input class="ipt_inq_tel numOnly" name="subject" placeholder="제목을 입력해주세요" maxlength="20"></label>
                              </div>
                              <div class="inq_input">
                                 <textarea name="content" placeholder="문의하실 내용을 입력해주세요."></textarea>
                              </div>



                              <div class="inq_btn">
                                 <input type="submit" class="btn_inq_reg" value="완료">
                                 <span  onclick="history.go(-1);"><input type="button" class="btn_inq_reg" value="취소"></span>
                              </div>

                           </div>

                        </form>

                     </div>
                     <!-- //svc_cont_wrap -->


                  <!-- //서비스 콘텐츠 -->
          

     
            <!-- //서비스 wrap -->
  
      
      
      
			</div>

		</div>
	</div>
</body>
</html>