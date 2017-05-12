<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	

<style type="text/css">
#boardWriteForm{margin: 30px 0;}
.menu-wrap{text-align: right; margin-right:50px;}
.contents-wrap{margin:30px 0 0 0;min-height: 500px;}
   .contents{ margin: 60px 0 0 0;}
   .recode-wrap{text-align: right; color: #888;}
   .hit-wrap{color:#888; margin: 10px 0;}
   .viewForm{margin: 20px 0 0 0;}
</style>
<title>NOTICE</title> 
</head>
<body>
<div class="category_top">

</div>		
	<div id="wrapper">
		<form action="noticeModify.gh" method="post"> 
			<div id="page-wrapper">
        		 <div class="row">
           			 <div class="col-lg-12">
						<h3 class="page-header"><br/>notice 수정</h3>
						<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
						
				<thead>
					<tr class="danger">
							<th width="15%" align="center">글제목</th>
							<td colspan=5><input type="text" name="subject" value="${noticeVO.subject }" />
							</td>
							</tr>
							</thead>
								
				<tbody>
				
					<input type="hidden" name="no" value="${noticeVO.no }" />
					<tr>
						 
						 <th >사용자 ID</th>
						 	<td>
							<input type="text" name="name"
								value="${noticeVO.name }" readonly />
							</td>
							</tr>
							<tr>
								<th colspan=6>글내용</th>
							</tr>
							<tr>
								<td colspan=6 height=300 style="padding: 0px !important;">
									<textarea cols="40" name="content">${noticeVO.content } </textarea>
								</td>
							</tr>
					</tbody>
				</table>
			</div>
			</div>
			</div>
			<div class="row">
            	<div class="col-lg-12">
            			<div class="menu-wrap">	
								<span >	<input type="submit" value="작성완료" class="btn btn-primary"/>	</span>
								<span  onclick="history.go(-1);"> <input type="button" value="취소" class="btn btn-primary"/> </span>
						</div>
				</div>
			</div>
				<br/>
				<br/>
				<br/>
				<br/>
		</form>
	</div>
</body>
</html>