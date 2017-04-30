<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title><tiles:getAsString name="title"/> </title>
    
    <style>

    *{ vertical-align:top; }
    
    #wrap{ margin:0 auto; width:1200px; }
    
    .box{ border:1px solid #000; }
    
    .bgcolor-orange{ background-color:orange; }
    .bgcolor-purple{ background-color:purple; }
    .bgcolor-gray{ background-color:gray; }
    
    #side{ width:200px; display:inline-block; height:600px; }
    .contents{ display:inline-block; width:988.9px; height:600px;}
    
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