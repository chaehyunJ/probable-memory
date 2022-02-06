<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="adminPage-container">

	<div class="myPage-list">
	       <h4 class="myPage-title">Admin 페이지</h4>
	       <hr>
			<ul class="myPage-navPath">
				<li><a href="${cpath }/admin/adminInfo">관리자 정보</a></li>
				<li><a href="${cpath }/admin/qnaCheck">Q&A 확인</a></li>
				<li><a href="${cpath }/board/news?page=1">새로운 소식 수정</a></li>
			</ul>
	</div>

	<div class="QnA-content-main">
		<div class="QnA-content-left">
        	<div class="QnA-content-result">답변상태</div>
        	<div class="QnA-content-title">제목</div>
       		<div class="QnA-content-writer">작성자</div>
       		<div class="QnA-content-regDate">작성일</div>
       	</div>
	
		<c:forEach var="ls" items="${ list }">
			<div class="QnA-inner">
				<div class="QnA-inner-result">${ ls.result == 'n' ? '미답변' : '답변완료' }</div>
				<div class="QnA-inner-title">${ ls.title }
					<div class="reply-form hidden">
						<form method="post">
							<input class="hidden" type="number" name="board_idx" value="${ ls.qna_seq }">
							<input type="hidden" name="writer" value="${ adminlogin.adminid }">
							<input name="content">
							<input type="submit" value="작성하기">
						</form>
					</div>
				</div>
				<div class="QnA-inner-writer">${ ls.writer }</div>
				<div class="QnA-inner-regDate">${ ls.regDate }</div>
			</div>
		</c:forEach>
	</div>
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
                <a href=""><img src="${ cpath }/resources/src/footer/fb.png" alt=""></a>
                <a href=""><img src="${ cpath }/resources/src/footer/insta.png" alt=""></a>
                <a href=""><img src="${ cpath }/resources/src/footer/youtube.png" alt=""></a>
            </div>
        </div>
    </footer>
   
    <script>
	 	const innerTitle = document.querySelectorAll('.QnA-inner-title')
	 	const replyForm = document.querySelector('.reply-form')
	 	console.log(innerTitle)
	 	console.log(replyForm)
	 	
	 	innerTitle.forEach(e => {
	 		e.onclick = function(){
	 			replyForm.classList.remove('hidden')
	 		}
	 	})
	</script>
</body>
</html>