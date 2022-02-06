<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>정보수정</h2>

<form method="POST" class="jcce">
	<p><input type="text" name="userid" value="${ info.userid }" readonly></p>
	<p><input type="password" name="userpw" value="${ info.userpw }" required></p>
	<p><input type="text" name="username" value="${ info.username }" required></p>
	<p><input type="email" name="email" value="${ info.email }" required></p>
	<p>
		<label><input type="radio" name="gender" value="남성" ${ info.gender == '남성' ? 'checked' : ''  } required>남성</label>
		<label><input type="radio" name="gender" value="여성" ${ info.gender == '여성' ? 'checked' : ''  } required>여성</label>
	</p>
	<p><input type="submit" value="정보 수정"></p>
</form>
</body>
</html>