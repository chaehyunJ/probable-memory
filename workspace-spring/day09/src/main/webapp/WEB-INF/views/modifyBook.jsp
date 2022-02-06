<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<h2>도서 수정 : ${ dto.idx }번 도서</h2>

<form method="POST">
	<p><input name="name" value="${ dto.name }"></p>
	<p><input name="author" value="${ dto.author }"></p>
	<p><input name="publisher" value="${ dto.publisher }"></p>
	<p><input type="date" name="publishDate" value="${ dto.publishDate }"></p>
	<p><input type="number" step="100" name="price" value="${ dto.price }"></p>
	<textarea style="width : 300px; height : 400px; resize : none;">${ dto.description }</textarea>
	<p><input type="submit" value="수정하기"></p>
</form>
</body>
</html>