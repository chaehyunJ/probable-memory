<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form>
	<input name="username" placeholder="검색어를 입력하세요">
	<input type="submit" value="검색">
</form>
<div id="result"></div>

<script>
	const cpath = '${ cpath }'
	const form = document.forms[0]
	
	form.onsubmit = function(event){
		event.preventDefault()
		const search = document.querySelector('input[name="username"]')
		const url = cpath + '/ajax5?username=' + search
		const opt = {
			method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			let tag = '<table border="1" cellpadding="7" cellspacing="0">'
			tag += '<tr>'
			for(key in json[0]){
				tag += '<th>' + key + '</th>'
			}
			tag += '</tr>'
			
			json.forEach(dto => {
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