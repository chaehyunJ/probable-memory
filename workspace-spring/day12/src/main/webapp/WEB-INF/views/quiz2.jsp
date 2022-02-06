<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<form>
	<p>ID</p>
	<p><input name="userid" placeholder="ID" required autocomplete="off"><button id="btn">중복확인</button></p>
	<p>PW</p>
	<p><input type="password" name="userpw" placeholder="PW" required></p>
	<p>Name</p>
	<p><input name="username" placeholder="NAME"></p>
	<p>E-Mail</p>
	<p><input type="email" name="email" placeholder="foo@bar.com"></p>
	<p>Gender</p>
	<p>
		<label><input type="radio" name="gender" value="남성">남성</label>
		<label><input type="radio" name="gender" value="여성">여성</label>
	</p>
	<p><input type="submit" value="회원가입"></p>
</form>


<script>
	const cpath = '${ cpath }'
	const form = document.forms[0]
	const btn = document.getElementById('btn')
	
	btn.onclick = function(){
		const userid = document.querySelector('input[name="userid"]')
		console.log(userid)
		
		if(userid.value == ''){
			alert('ID를 입력해주세요')
			userid.focus()
			return
		}
		
		const url = cpath + '/ajaxQuiz2?userid=' + userid.value
		const opt ={
			method : 'get'
		}
		fetch(url, opt)
		.then(function(resp){
			return resp.json()
		})
		.then(function(json){
			if(json == null){
				const pw = document.quertSelector('input[name="userpw"]')
				pw.focus()
			}
			else{
				alert('이미 등록된 id입니다')
				userid.select()
			}
		})
	}
</script>
</body>
</html>