<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	function handler(event){
		const url = cpath + '/ajax1'
		const opt = {
				method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => result.innerText = text)
	}
</script>

<button id="btn">요청</button>
<div id="result"></div>

<script>
	const cpath = '${ cpath }'
	const btn = document.getElementById('btn')
	const result = document.getElementById('result')
	
	btn.onclick = handler
</script>
</body>
</html>