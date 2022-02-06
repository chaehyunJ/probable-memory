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

<h2>업로드2</h2>


<form method="POST" enctype="multipart/form-data">
	<p><input name="name" placeholder="Name"></p>
	<p><input type="number" name="age" placeholder="Age"></p>
	<p><input type="file" name="uploadFile"></p>
	<p><input type="submit" value="제출"></p>
</form>

<a href="/day09_file">대문페이지</a>

<div>
	<c:forEach var="dto" items="${ list }">
		<div class="name">${ dto.name }</div>
		<div class="age">${ dto.age }</div>
		<div class="img">
		<img src="${ cpath }/upload/${dto.fileName}" style="width : 100px; height : 100px;">
		</div>
	</c:forEach>
</div>
</body>
</html>