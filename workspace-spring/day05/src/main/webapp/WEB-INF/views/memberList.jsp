<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpth">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>회원목록</h1>
<hr>
<h3>DB test : ${ test }</h3>
<h3>now : ${ now }</h3>

<table border="1" cellpadding="7" cellspacing="0">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>E-Mail</th>
		<th>Gender</th>
	</tr>
	<c:forEach var="ls" items="${ list }">
	<tr>
		<th>${ ls.userid }</th>
		<th>${ ls.username }</th>
		<th>${ ls.email }</th>
		<th>${ ls.gender }</th>
	</tr>
	</c:forEach>
</table>

</body>
</html>