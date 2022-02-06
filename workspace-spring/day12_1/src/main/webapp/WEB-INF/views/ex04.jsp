<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script src="${ cpath }/resources/js/ex04.js"></script>

<h3>목록으로 테이블 만들기</h3>

<button id="btn">멤버 목록 가져오기</button>
<div id="result">
	<img src="http://221.164.9.222/img/heos.gif">
</div>

<script>
	const cpath = '${ cpath }'
	const btn = document.getElementById('btn')
	const result = document.getElementById('result')
	
	btn.onclick = function(){
		const url = cpath + '/ajax4'
		const opt = {
				method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(result, getDom(json)))
	}
</script>
</body>
</html>