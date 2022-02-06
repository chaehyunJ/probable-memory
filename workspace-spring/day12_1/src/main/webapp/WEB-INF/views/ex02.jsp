<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<input name="ch1" placeholder="알파벳 한자리 입력">
<button id="btn">요청</button>

<div id="result"></div>

<script>
	const cpath = '${ cpath }'
	const btn = document.getElementById('btn')
	btn.onclick = function(){
		const ch1 = document.querySelector('input[name="ch1"]')
		
		if(ch1.value == 0){
			alert('값을 입력해주세요')
			ch1.focus()
			return 
		}
		if(ch1.value.length > 1){
			alert('한글자만 입력')
			return
		}
		
		const url = cpath + '/ajax?ch=' + ch1
		const opt = {
				method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			const result = document.getElementById('result')
			result.innerText = ch1.value + '의  ASCII Code는 ' + text
		})
	}
</script>
</body>
</html>