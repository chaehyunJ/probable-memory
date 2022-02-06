<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>회원가입</h2>
<hr>

<form method="POST" class="jcce">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="PW" required></p>
	<p><input type="text" name="username" placeholder="NAME" required></p>
	<p><input type="email" name="email" placeholder="E-Mail" required></p>
	<p>
		<label><input type="radio" name="gender" value="남성" required>남성</label>
		<label><input type="radio" name="gender" value="여성" required>여성</label>
	</p>
	<p><input type="submit" value="회원가입"></p>
</form>


</body>
</html>