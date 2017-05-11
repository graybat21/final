<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title><tiles:getAsString name="title" /></title>
<script src="${pageContext.request.contextPath}/resources/js/1602931226643913.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fbevents.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/analytics.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_002.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_003.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_004.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_005.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl_003.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/masonry.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/imgliquid.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/iscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/conversion.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/user.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/wcslog.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/service.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/search.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/roosevelt.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/log.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/iscroll.js"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default_002.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl_003.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/service.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/search.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lightgallery.css">
<style>
* {
	vertical-align: top;
}
#wrap {
	margin: 0 auto;
	width: 1200px;
}
#content {
	text-align: center;
	min-height: 700px;
	padding-top: 90px;
}
</style>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</body>
</html>

<!-- .box {
	border: 1px solid #000;
}

#side {
	width: 200px;
	display: inline-block;
	height: 600px;
} */

/* .contents {
	display: inline-block;
	width: 988.9px;
	height: 600px;
} -->
