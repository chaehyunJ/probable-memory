<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>

    <section class="main-slide">
        <div class="slide">
            <img class="slide-img" src="${ cpath }/resources/src/slide/1617176534703.png" alt="">
            <img class="slide-img" src="${ cpath }/resources/src/slide/1617838609437.png" alt="">
            <img class="slide-img" src="${ cpath }/resources/src/slide/1621833457701.png" alt="">
            <img class="slide-img" src="${ cpath }/resources/src/slide/1631842026946.png" alt="">
            <img class="slide-img" src="${ cpath }/resources/src/slide/1633532684256.png" alt="">
            <img class="slide-img" src="${ cpath }/resources/src/slide/1635904486344.png" alt="">
            <img class="slide-img" src="${ cpath }/resources/src/slide/1635905159418.png" alt="">
        </div>
    </section>

    <div class="title-main"><h2>Coded Burger Live</h2></div>

    <div class="main-inner">
        <div class="main-inner-one">
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
        </div>
        <div class="main-inner-one1 hidden1">
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
        </div>
        <div class="main-inner-one2 hidden1">
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
            <div class="main-inner-event"></div>
        </div>
    </div>

    <div class="btn-list">
        <button id="btn">+</button>
        <button id="btn1" class="hidden1">+</button>
    </div>

<script>
	const cpath = '${cpath}'
	const menuList = document.querySelector('.menu-product-list')
	const menuLink = document.querySelectorAll('.top-menu-li:nth-child(1) a')
	menuLink.forEach(a => {
		a.onclick = (event) => {
				
		}
	}) 
</script>

<%@ include file="footer.jsp" %>
</body>
</html>