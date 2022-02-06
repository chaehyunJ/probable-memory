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

<h1>myBatis 연습(2)</h1>
<hr>
<h3>DB접속확인 :  ${ test }</h3>


<ul>
	<li><a href="${ cpath }/memberList">회원목록</a></li>
	<li><a href="${ cpath }/memberList/username">회원목록-이름순 정렬</a></li>
	<li><a href="${ cpath }/memberList/userid">회원목록-ID순으로 정렬</a></li>
	<li><a href="${ cpath }/memberAdd">회원추가</a></li>
	<li><a href="${ cpath }/loginTest">로그인 테스트</a></li>
</ul>
</body>
</html>