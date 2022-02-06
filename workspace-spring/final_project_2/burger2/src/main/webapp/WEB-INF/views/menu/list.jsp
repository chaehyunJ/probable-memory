<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="menu-container">
        <div class="menu-area" >
            <h1 class="menu-title">버거</h1>
            <p class="menu-text">빅맥®에서 맥스파이시®상하이버거까지,<br>주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.</p>
            <ul class="menu-ul">
                <li>Home</li>
                <li>•</li>
                <li>Menu</li>
                <li>•</li>
                <li>버거</li>
            </ul>
            <img src="${ cpath }/resources/src/menu/menu-burger.jpg">
        </div>
	<div class="menu-list">
		<div class="menu-total">• ${ cnt } Products</div>
		<div class="menu-product-list">
		</div>
	    
	    <div class="menu-btn">
	    </div>
	</div>
</div>


<!-- <div class="menu-list-inner"> -->

<!-- </div> -->

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
	// 메뉴 클릭
		const cpath = '${ cpath }'
		const menu = document.querySelector('.menu-product-list')
		const menuList = document.querySelectorAll('.top-menu-inner li')
		const productList = document.querySelector('.menu-product-list')
		
		console.log(document.querySelector('.menu-product-list').clientHeight)
		console.log(menu)
		console.log(menuList)
		
		
		
		const url = cpath + '/ajaxBurgerList'
		const opt = {
			method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			let dom = ''
			
			json.forEach(dto => {
				dom += '<div class="menu-product-item">'
				dom += '<img src="'+ dto.BURGER_IMAGE +'">'
				dom += '<div>' + dto.BURGER_NAME + '</div>'
				dom += '<div class="burger-desc">' + dto.BURGER_DESCRIPTION + '</div>'
				dom += '</div>'
			})
			menu.innerHTML += dom
		})
		
		
	
		// table의 이름을 판별해서 burger나 mcmorning이면 dom을 다르게 불러오기
		// 그럼 한페이지 안에서 처리가능할듯
		
// 		menuList.forEach(list => {
// 			list.onclick = function(event){
// 				const table = event.target.dataset.table
// 				console.log(table)
				
// 				const url = cpath + '/ajaxBurger/' + table
// 				console.log(url)
// 				const opt = {
// 					method : 'get'
// 				}
// 				fetch(url, opt)
// 				.then(resp => resp.json())
// 				.then(json => {
// 					console.log(json)
// 				})
// 		}
// 	})
    </script>
</body>
</html>