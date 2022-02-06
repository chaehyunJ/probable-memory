<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${ cpath }/resources/css/style.css">
</head>
<body>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="${ cpath }/resources/js/chat.js"></script>

<c:if test="${ empty username }">
	<c:redirect url="/"/>
</c:if>

<h2>채팅</h2>
<hr>

<h3> username : ${ username }</h3>

<div id="wrap">
	<div class="left">
		<div class="left-inner">
			<div class="overlay hidden"></div>
			<div id="textarea"></div>
		</div>
		<div class="bottom">
			<input id="send" name="send" autofocus>
			<input id="btn" type="button" value="전송">
			<input id="quit" type="button" value="나가기">
		</div>
	</div>
	
	<div class="right hidden">
		<div id="hamburger">😊</div>
		<div id="userList"></div>
	</div>
</div>



<script>
	const cpath = '${ cpath }'
	const username = '${ username }'
	const wrap = document.getElementById('wrap')
	const hamburger = document.getElementById('hamburger')
	const userList = document.getElementById('userList')
	const quit = document.getElementById('quit')
	const btn = document.getElementById('btn')
	const send = document.querySelector('input[name="send"]')
	const textarea = document.getElementById('textarea')
	const right = document.querySelector('.right')
	const overlay = document.querySelector('.overlay')
	
	// 메시지 하나하나가 json객체 입니다
	
	console.log(wrap)
	console.log(overlay)
	console.log(right)
	console.log(userList)
	console.log(hamburger)
	console.log(quit)
	console.log(btn)
	console.log(send)
	console.log(textarea)
	
	const ws = new SockJS(cpath + '/chat', null, {sessionId : generateSessionId})
	

	
	ws.onmessage = onMessage
	ws.onopen = onOpen					// 웹 소켓이 열리면 입장 메시지를 출력하기
	ws.onclose = onClose				// 웹 소켓이 닫히면 실행되는데 닫히는게 없어서 실행되지 않는다
	ws.onerror = function(msg){}		
	
	btn.onclick = sendHandler			// 버튼 클릭이하면 보내는 함수
	send.onkeydown = keyHandler			// 키 입력하면 조건에 따라 보내는 함수로 연결
	
	quit.onclick = quitHandler			// 나가기 버튼 누르면 웹 소켓 닫고 로그아웃하는 함수

	hamburger.onclick = ajaxHandler
		

</script>
</body>
</html>