<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>비밀번호 재발급</h2>

<div style="width : 700px; margin :auto;">
	<h3>비밀번호를 재발급할 계정의 ID와 Email를 입력하여 인증을 진행해주세여</h3>
</div>


<div style="width : 200px; margin : auto;">
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="email" name="email" placeholder="E@naver.com" required ></p>
		<p><input class="btn" type="submit" value="비밀번호 찾기"></p>
	</form>
</div>
</body>
</html>