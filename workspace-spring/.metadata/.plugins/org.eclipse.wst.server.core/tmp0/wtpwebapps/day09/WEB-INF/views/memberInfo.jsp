<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<div>
	<p>ID     : ${ info.userid }</p>
	<p>PW     : *******</p>
	<p>Name   : ${ info.username } </p>
	<p>E-mail : ${ info.email } </p>
	<p>Gender : ${ info.gender } </p>
	<p>
		<a href="${ cpath }/memberModify"><button>정보수정</button></a>
		<button id="deleteBtn">회원탈퇴</button>
	</p>
</div>

<script>
	const cpath = '${ cpath }'
	const deleteBtn = document.getElementById('deleteBtn')
	console.log(deleteBtn)
	
	deleteBtn.onclick = function(){
		if(confirm('정말 삭제하시겠습니까?')){
			location.href= cpath + '/deleteMember'
		}
	}
</script>
</body>
</html>