<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>도서 목록</h3>
<hr>

<table border="1" cellpadding="7" cellspacing="0" style="margin : auto;">
	<tr>
		<th><a class="btn"  href="${ cpath }/book/idx">책 번호</a></th>
		<th><a class="btn"  href="${ cpath }/book/name">책 이름</a></th>
		<th><a class="btn" href="${ cpath }/book/author">저자</a></th>
		<th><a class="btn" href="${ cpath }/book/publisher">출판사</a></th>
		<th><a class="btn" href="${ cpath }/book/publishDate">출판일자</a></th>
		<th><a class="btn" href="${ cpath }/book/price">가격</a></th>
		<th><a class="btn"  href="${ cpath }/book/description">설명</a></th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<c:forEach var="ls" items="${ list }">
	<tr>
		<th>${ ls.idx }</th>
		<th>${ ls.name }</th>
		<th>${ ls.author }</th>
		<th>${ ls.publisher }</th>
		<th>${ ls.publishDate }</th>
		<th>${ ls.price }</th>
		<th>${ ls.description }</th>
		<th><a href="${ cpath }/modifyBook/${ ls.idx }">수정</a></th>
		<th><button class="deleteBtn" data-idx="${ ls.idx }">삭제</button></th>
	</tr>
	</c:forEach>
</table>

<div style="width : 400px; margin : auto;">
	<form>
		<select name="type">
			<option>==선택하기==</option>
			<option ${ param.type == 'idx' ? 'selected' : '' } value="idx">책번호</option>
			<option ${ param.type == 'name' ? 'selected' : '' } value="name">이름</option>
			<option ${ param.type == 'author' ? 'selected' : '' } value="author">저자</option>
		</select>
		<input name="search" value="${ param.search }">
		<input type="submit" value="검색하기">
	</form>
</div>

<script>
	const cpath = '${ cpath }'
	const deleteBtnList = document.querySelectorAll('.deleteBtn')
	
	deleteBtnList.forEach(function(btn){
		btn.onclick = function(event){
			const idx = event.target.dataset.idx
			if(confirm(idx + '번 도서를 삭제하시겠습니까?')){
				location.href= cpath + '/deleteBook/' + idx 
			}
		}
	})
	
</script>
</body>
</html>