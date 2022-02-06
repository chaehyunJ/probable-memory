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
<h1>정적파일 서버 연동하기(Linux, SFTP)</h1>


<form method="post" action="${ cpath }/upload" enctype="multipart/form-data">
	<input type="file" name="uploadFile">
	<input type="submit">
</form>

<!--  정적파일 리눅스에 저장해서 불러오기 / 암호화 -->
<c:if test="${ not empty uploadFilePath }">
	<img src="${ uploadFilePath }">
</c:if>
</body>
</html>