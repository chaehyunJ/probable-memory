<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>회원목록</h3>
<hr>

<table border="1" cellpadding="7" cellspacing="0">
	<tr>
		<th>ID</th>
		<th>PW</th>
		<th>Name</th>
		<th>E-mail</th>
		<th>Gender</th>
	</tr>
	<c:forEach var="ls" items="${ list }">
	<tr>
		<td>${ ls.userid }</td>
		<td>${ ls.userpw }</td>
		<td>${ ls.username }</td>
		<td>${ ls.email }</td>
		<td>${ ls.gender }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>