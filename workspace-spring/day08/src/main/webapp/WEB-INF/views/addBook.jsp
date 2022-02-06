<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>책 추가하기</h2>
<hr>

<form method="POST">
	<p><input name="name" placeholder="NAME" required autofocus></p>
	<p><input name="author" placeholder="Author" required></p>
	<p><input name="publisher" placeholder="publisher" required></p>
	<p><input type="date" name="publishDate" required></p>
	<p><input type="number" step="100" name="price" placeholder="Price" required></p>
	<textarea name="description" style="width : 300px; height : 400px; resize : none;" placeholder="설명"></textarea>
	<p><input type="submit" value="추가"></p>
</form>

<script>
 
	const today = new Date().toISOString().split('T')[0]
	console.log(today)
	
	document.querySelector('input[type="date"]').value= today
</script>
</body>
</html>