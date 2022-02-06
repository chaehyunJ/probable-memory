<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<h2>GET 파라미터 전달 요청</h2>

<input name="ch" placeholder="알파벳 한글자를 입력하세요">
<button id="btn">요청</button>

<div id="result"></div>

<script>
	const cpath = '${ cpath }'
	const btn = document.getElementById('btn')
	btn.onclick = function(){
		const ch = document.querySelector('input[name="ch"]')
		
		if(ch.value == ''){
			alert('값을 입력해야 합니다')
			ch.focus()		// 커서만 지정된 element로 옮겨주는 함수
			return
		}
		if(ch.value.length > 1){
			alert('한글자만 입력해야 합니다')
			ch.select()		// 커서를 옮기면서 값을 모두 선택한 상태로 만들어주는 함수
			return 
		}
		const url = cpath + '/ajax2?ch=' + ch.value
		const opt ={
			method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			const result = document.getElementById('result')
			result.innerText = ch.value + '의 ASCII Code : ' + text
		})
	}
</script>
</body>
</html>