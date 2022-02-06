<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="post">

	<input id="delete2" type="password" name="userpw"placeholder="PW입력">
	<input type="submit" value="삭제하기">
</form>

<script>
// 	const chk1 = document.querySelector('input[type="hidden"]')
// 	const chk2 = document.querySelector('input[type="password"]')
	const chk2 = document.getElementById('delete2')
	const chkl_pw = '${ info2.userpw }'
	const chk2_pw = '${ param.userpw }'
	console.log(chkl_pw)
	console.log(chk2_pw)
	
	if(chk1_pw == chk2_pw){
		location.href= cpath + '/deleteMember'
	}
	else{
		history.go(-1)
	}
	
</script>
</body>
</html>