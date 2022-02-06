<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="top-menu">
	<a href="${ cpath }"><img
		src="https://www.mcdelivery.co.kr/kr//static/1639621479089/assets/82/img/mcdelivery_logo_ko.jpg"
		alt=""></a>
	<div class="top-right">
		<ul class="top-menu-inner">
			<li>메뉴</li>
			<li>마이페이지</li>
			<li>기타정보</li>
		</ul>
	</div>
</div>

<div class="sideMenu">
	<ul>
		<li><a href="${ cpath }">추천메뉴</a></li>
		<li>맥모닝&세트</li>
		<li>스낵&사이드</li>
		<li>음료</li>
		<li>디저트</li>
		<li>해피밀</li>
	</ul>
</div>

<div class="root">
	<div class="mainMenu"></div>
</div>

<script>
	const cpath = '${ cpath }'
	function getData(){
		const mainMenu = document.querySelector('.mainMenu')
		
		const url = cpath + '/getData'
		const opt = {
			method : 'get'
		}
		const data = fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			const dom = getDom(json)
			mainMenu.innerHTML += dom
		})
		return data
	}
	
	function getDom(json){
		let dom = ''
		
		json.forEach(dto => {
			dom += '<div class="item">'
			dom += '<img src="' + dto.img + '">'
			dom += '<div class="name">' + dto.name + '</div>'
			dom += '<div class="price">가격 \\' + dto.price + '</div>'
			dom += '<div>' + dto.kcal + 'Kcal</div>'
			dom += '</div>'
		})
		return dom
	}
</script>

<script>
	window.onload = function(){
		const mc = getData()
	}
</script>

</body>
</html>