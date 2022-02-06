<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원추가</h2>
<hr>
<form method="POST">
	<p><input type="text" name="userid" placeholder="ID (Primary Key)" required autofocus></p>
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