<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	function ajaxHandler(event){
		const url = cpath  + '/ajax1'
		const opt = {
				method : 'get'
		}
		fetch(url, opt)							 // 요청을 전달하고, 응답을 받는다
		.then(resp => resp.text())				 // 응답 변환
		.then(text => result.innerText = text)	 // 변환된 데이터를 원하는 대로 문서에 반영하기
	}
</script>

<h2>기본 GET 요청</h2>

<button id="btn">요청</button>
<div id="result"></div>

<script>	
	const cpath = '${ cpath }'
	const btn = document.getElementById('btn')
	const result = document.getElementById('result')
	console.log(btn)
	console.log(result)
	
	btn.onclick = ajaxHandler
</script>
</body>
</html>