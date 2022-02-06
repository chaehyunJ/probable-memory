<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<h2>member 검색 (id로 검색)</h2>

<form>
	<input type="text" name="userid" placeholder="검색할 ID 입력">
	<input type="submit" value="검색">
</form>

<div id="result"></div>

<script>
	const cpath = '${ cpath }'
	const form = document.forms[0]	// form을 불러오는 방법
	const result = document.getElementById('result')
	
	form.onsubmit = function(event){
		event.preventDefault()
		const userid = event.target.querySelector('input[name="userid"]')
		console.log(userid)
		const url = cpath + '/ajax3?userid=' + userid.value
		const opt = {
			method : 'get'
		}
		fetch(url, opt)						//  주소와 옵션으로 요청을 서버에게 보내면
		.then(function(resp) {				//  응답이 돌아온다
// 			console.log(resp)				//  그리고 콘솔로 출력해본단
// 			return resp.text()				//  응답 데이터를 단순 텍스트로 처리하겠다
			return resp.json()				//  응답 데이터는 JSON형식의 문자열이므로 객체로 변환하여 처리하겠다
		})
		.then(function(json){
			console.log(json)
			if(json == null){
				result.innerHTML = '<h3>검색결과가 없습니다</h3>'
				return
			}
			const ul = document.createElement('ul')
			for(key in json){
				const value = json[key]
				const li = document.createElement('li')
				li.innerText = key + ' : ' + value
				ul.appendChild(li)
			}
			result.innerHTML = ''
			result.appendChild(ul)
		})
	}
</script>
</body>
</html>