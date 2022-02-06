<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/order.css">
</head>
<body>
<script src="${ cpath }/resources/js/order.js"></script>
	<ul class="menuparent">
        <li>맥모닝</li>
        <li>맥모닝 세트</li>
        <li>버거</li>
        <li>버거 세트</li>
        <li>스낵＆사이드</li>
        <li>음료</li>
        <li>디저트</li>
        <li>해피밀</li>
    </ul>
    <div class="show">
    	<div class="show-frame"></div>
    </div>
    
    <script>
   	   const cpath = '${cpath}'
	   const before = document.querySelector('.slide-before')
	   const next = document.querySelector('.slide-next')
	   const showFrame = document.querySelector('.show-frame')
	   let showContainCount = document.getElementsByClassName('show-contain').length
	  
	   console.log(showContainCount)
	   showFrame.style.width=showContainCount*1000+'px'
	   window.onload = imageHandler
	   next.onclick = nextSildeHandler
	   before.onclick = beforeSildeHandler
   </script>
</body>
</html>