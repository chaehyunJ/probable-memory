<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="../header.jsp" %>

<div class="board-container">
        <div class="board-area" >
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
        <div class="board-list">
        	<div class="board-list-title">
	        	<div class="board-total">총 <span class="board-total-count" style="color: #da0000;">79건</span>의 게시글이 있습니다. </div>
	        	<div class="board-search">
	        			<input type="text" placeholder="검색어를 입력하세요.">
	        			<button class="board-search-icon"><img src="${ cpath }/resources/src/board/search.png"></button>
	        	</div>
        	</div>
        	<div class="board-list-main">
        		<div class="board-notice">
        			<div class="board-notice-list">
	        			<div class="board-notice-icon"><img src="${ cpath }/resources/src/board/notice.png"></div>
	        			<div class="board-notice-title">주방 공개 행사 잠정 중단 안내의 건</div>
	        			<div class="board-notice-date">2020.02.27</div>
        			</div>
        			<div class="board-notice-list">
	        			<div class="board-notice-icon"><img src="${ cpath }/resources/src/board/notice.png"></div>
	        			<div class="board-notice-title">주방 공개 행사 잠정 중단 안내의 건</div>
	        			<div class="board-notice-date">2020.02.27</div>
        			</div>
        			<div class="board-notice-list">
	        			<div class="board-notice-icon"><img src="${ cpath }/resources/src/board/notice.png"></div>
	        			<div class="board-notice-title">주방 공개 행사 잠정 중단 안내의 건</div>
	        			<div class="board-notice-date">2020.02.27</div>
        			</div>
        		</div>
        		<div class="board-post">
					<div class="board-post-list">
	        			<div class="board-post-number">79</div>
	        			<div class="board-post-title">[당첨자 발표] 맥카페X카카오톡 선물하기 이벤트</div>
	        			<div class="board-post-date">2021.12.16</div>
        			</div>
        		</div>
        	</div>
        </div>
</div>
<script>
	console.log('${cpath}')
</script>
</body>
</html>