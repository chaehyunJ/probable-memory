<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%-- <script src="${ cpath }/resources/js/ex05.js"></script> --%>

<form>
	<input name="username" placeholder="검색어를 입력하세요">
	<input type="submit" value="검색하기">
</form>

<div id="result"></div>

<script>
	const cpath = '${ cpath }'
	const form = document.forms[0]
	const result = document.getElementById('result')
	
	
	form.onsubmit = function(event){
		event.preventDefault()
		const search = document.querySelector('input[name="username"]')
		console.log(search)
		const url = cpath + '/ajax5?username=' + search.value
		const opt = {
			method : 'get'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			// 배열 형태로 받아오긴
			let tag = '<table border="1" cellpadding="7" cellspacing="0">'
			tag += '<tr>'
			for(key in json[0]){
				tag += '<th>' + key + '</th>'
			}
			tag += '</tr>'
			
			json.forEach(dto =>{
				tag += '<tr>'
				for(key in dto){
					const value = dto[key]
					tag += '<td>' + value + '</td>'
				}
				tag += '</tr>'
			})
			tag += '</table>'
			result.innerHTML = tag
		})
	}
	
</script>
</body>
</html>