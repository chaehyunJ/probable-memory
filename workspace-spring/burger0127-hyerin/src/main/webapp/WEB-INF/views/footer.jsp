<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>


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
	const cpath = '${ cpath }'
	const btn = document.getElementById('btn')
	const btn1 = document.getElementById('btn1')
	const mainOne = document.querySelector('.main-inner-one1')
	const mainOne2 = document.querySelector('.main-inner-one2')
	const slide = document.querySelector('.slide')
	
	const promotionImageList = document.querySelector('.promotion-imageList')
	console.log(promotionImageList)
	
	let value = 0

	const unit = 1700

	
	console.log(mainOne2)
	console.log(mainOne)
	console.log(btn)
	
	btn.onclick = btnHandler 
	btn1.onclick = btn1Handler
	setMoveInterval()
	

</script>


</body>
</html>