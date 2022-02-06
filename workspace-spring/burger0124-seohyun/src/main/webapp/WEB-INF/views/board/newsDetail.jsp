<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div class="board-area">
	<h1 class="board-title">새로운 소식</h1>
	<ul class="board-ul">
		<li>Home</li>
		<li>•</li>
		<li>Board</li>
		<li>•</li>
		<li>새로운 소식</li>
	</ul>
	<img src="${ cpath }/resources/src/board/board.jpg">
</div>

<%-- <p>${ dto }</p> --%>
<div class="detail-news">
	<div class="detail-header">
		<div class="detail-title">${dto.title }</div>
		<div class="detail-num">
<%-- 			<fmt:formatDate var="formatRegDate" value="${ dto.regDate }" pattern="yyyy-MM-dd"/> --%>
			<div class="detail-regDate">${ dto.regDate }</div>
			<div class="detail-cnt">&nbsp;<span>|</span> &nbsp;${dto.cnt }</div>
		</div>
	</div>
</div>
	<hr class="detail-hr">
	<div class="detail-content">${ dto.content }</div>
	<hr class="detail-hr1">
	<div class="btn-list1">
		<button class="prev-btn">&lt;</button>
		<button class="news-list-btn">목록보기</button>
		<button class="next-btn">></button>
	</div>
<footer class="footer">
	<div class="footer-inner">
		<div class="footer-left">
			<ul>
				<li><a>개인정보 처리방침</a></li>
				<li><a>위치정보 이용약관</a></li>
				<li><a>QnABoard</a></li>
			</ul>
		</div>
		<div class="footer-right">
			<ul>
				<li>Coded Burger</li>
				<li>공동대표 : 5조 전원</li>
				<li>사업자등록번호 : 1234-56-789</li>
				<li>회사전화 : 010-7374-5328</li>
				<li>COPYRIGHT © 2019 ALL RIGHTS RESERVED BY McDonald's.</li>
			</ul>
		</div>
		<div class="footer-icon">
			<a href=""><img src="${ cpath }/resources/src/footer/fb.png"
				alt=""></a> <a href=""><img
				src="${ cpath }/resources/src/footer/insta.png" alt=""></a> <a
				href=""><img src="${ cpath }/resources/src/footer/youtube.png"
				alt=""></a>
		</div>
	</div>
</footer>

<script>
	const cpath = '${ cpath }'
	let seq = ${ dto.notice_seq }
	
	const detailTitle = document.querySelector('.detail-title')
	const detailRegDate = document.querySelector('.detail-regDate')
	const detailCnt = document.querySelector('.detail-cnt')
	const detailContent = document.querySelector('.detail-content')
	const prevBtn = document.querySelector('.prev-btn')
	const nextBtn = document.querySelector('.next-btn')
	const listBtn = document.querySelector('.news-list-btn')
	
	console.log(detailTitle)
	console.log(detailRegDate)
	console.log(detailCnt)
	console.log(detailContent)
	console.log(prevBtn)
	console.log(nextBtn)
	
	nextBtn.onclick = function(event){
		event.preventDefault()
		const url = cpath + '/btnNewsDetail/' + (seq + 1)
		const opt = {
			method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
// 			const date = new Date(json.regDate).getTime()
// 			console.log(date)
			detailTitle.innerText = ''
			detailTitle.innerText += json.title
			detailRegDate.innerText = ''
			detailRegDate.innerText += (json.regDate + ' | ')
// 			new Date(detailRegDate).getTime()
			detailCnt.innerText = ''
			detailCnt.innerText += json.cnt
			detailContent.innerText = ''
			detailContent.innerText += json.content
		})
		seq++
	}
	
	prevBtn.onclick = function(event){
		event.preventDefault()
		const url = cpath + '/btnNewsDetail/' + (seq-1)
		const opt = {
			method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
// 			let date = new Date(json.regDate).getTime()
			detailTitle.innerText = ''
			detailTitle.innerText += json.title
			detailRegDate.innerText = ''
			detailRegDate.innerText += (json.regDate + ' | ') 
			detailCnt.innerText = ''
			detailCnt.innerText += json.cnt
			detailContent.innerText = ''
			detailContent.innerText += json.content
		})
		seq--
	}
	listBtn.onclick = function(){
		location.href = cpath + '/board/news'
	}
</script>

</body>
</html>