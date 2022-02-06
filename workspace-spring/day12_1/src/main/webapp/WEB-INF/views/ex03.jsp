<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>id로 검색하기</h3>

<form>
	<input name="userid" placeholder="검색할 ID 입력">
	<input type="submit" value="검색">
</form>

<div id="result"></div>


<script>
	const cpath = '${ cpath }'
	const form = document.forms[0]
	const result = document.getElementById('result')
	
	form.onsubmit = function(event){
		event.preventDefault()
		const userid = document.querySelector('input[name="userid"]')
		console.log(userid)
		
		const url = cpath + '/ajax3?userid=' + userid.value
		const opt = {
			method : 'get'
		}				
		fetch(url, opt)
		.then(function(resp){
			// 응답 데이터는 JSON형식의 문자열이므로 객체로 변환하여 처리하겠다
			return resp.json()
		})
		.then(function(json){
			if(json == null){
				result.innerHTML = '<h3>검색결과는 없습니다</h3>'
				return
			}
			const ul = document.createElement('ul')
			for(key in json){
				const li = document.createElement('li')
				const value = json[key]
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