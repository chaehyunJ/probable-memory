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

<h2>로그인 가능한 Book</h2>
<hr>


<h3>DB 접속 확인 : ${ test }</h3>

<ul>
	<li><a href="${ cpath }/memberList">회원목록</a></li>
	<c:if test="${ empty login }">
		<li><a href="${ cpath }/login">로그인</a></li>	
	</c:if>
	<c:if test="${ not empty login }">
		<li><a href="${ cpath }/logout">로그아웃</a></li>
		<li><a href="${ cpath }/modify">${ login.userid }</a></li>
	</c:if>
</ul>
</body>
</html>