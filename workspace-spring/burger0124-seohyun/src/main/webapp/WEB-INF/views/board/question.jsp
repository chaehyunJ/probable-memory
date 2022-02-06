<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="board-container">
        <div class="board-area" >
            <h1 class="board-title">문의사항</h1>
            <ul class="board-ul">
                <li>Home</li>
                <li>•</li>
                <li>Board</li>
                <li>•</li>
                <li>문의사항</li>
            </ul>
            <img src="${ cpath }/resources/src/board/board.jpg">
        </div>
        
        <div class="QnA-top">
        	<div class="QnA-top-left">
	        	<div><a href="${ cpath }/board/qnaWrite"><button class="QnA-write">Q&A 작성하기</button></a></div>
	        	<div><button class="QnA-search">나의 Q&A 조회</button></div>
        	</div>
        	<div class="QnA-top-right">
        		<div class="QnA-onOff-check">
        			<span>내Q&A보기</span>
        		</div>
	        	<div class="QnA-onOff">
		        	<input type="checkbox" id="onOffBox" name="onOff">
					<label for="onOffBox" id="boxLabel"><span></span></label>
	        	</div>
	        	<div class="QnA-result">
	        		<select>
	        			<option>답변상태</option>
	        			<option>미답변</option>
	        			<option>답변완료</option>
	        		</select>
	        	</div>
	        	
        	</div>
        </div>
        
        <div class="QnA-content">
        	<div class="QnA-content-left">
        		<div class="QnA-content-result">답변상태</div>
        		<div class="QnA-content-title">제목</div>
        		<div class="QnA-content-writer">작성자</div>
        		<div class="QnA-content-regDate">작성일</div>
        	</div>
<%-- 	        <c:forEach> --%>
	        	<div class="QnA-content-inner">
	        		<div class="QnA-inner-result"></div>
	        		<div class="QnA-inner-title"></div>
	        		<div class="QnA-inner-writer"></div>
	        		<div class="QnA-inner-regDate"></div>
	        	</div>
<%-- 	        </c:forEach> --%>
        </div>
        
</div>
</body>
</html>