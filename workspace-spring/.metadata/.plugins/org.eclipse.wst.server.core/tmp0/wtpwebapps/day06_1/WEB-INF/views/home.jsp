<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>연습</h1>
<hr>

<ul>
	<li><a href="${ cpath }/memberList">회원목록</a></li>
	
	<c:if test="${ empty login }">
	
		<li><a href="${ cpath }/login">로그인</a></li>	
	
	</c:if>
	
	<c:if test="${ not empty login }">
	
		<li><a href="${ cpath }/logout">로그아웃</a></li>
		<li>${ login.userid }</li>
	</c:if>
</ul>
</body>
</html>