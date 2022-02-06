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

<h2>회원 목록</h2>
<hr>

<table border="0" cellpadding="7" cellspacing="0">
	<tr>
		<th>ID</th>
		<th>PW</th>
		<th>Name</th>
		<th>E-mail</th>
		<th>Gender</th>
	</tr>
	<c:forEach var="ls" items="${ list }">
	<tr>
		<th>${ ls.userid }</th>
		<th>${ ls.userpw }</th>
		<th>${ ls.username }</th>
		<th>${ ls.email }</th>
		<th>${ ls.gender }</th>
	</tr>
	</c:forEach>
</table>
</body>
</html>