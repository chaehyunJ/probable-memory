<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="menu-container">

	<div class="menu-top"></div>
	
	<div class="menu-list">
	
		<div class="menu-total">• 21 Products</div>
		
		<div class="menu-product-list"></div>
	   
	    <div class="menu-btn"></div>
	    
	</div>

</div>
<script>
	const cpath = '${cpath}'
	const table = '${table}'
	const topList = document.querySelector('.menu-top')
	const menuList = document.querySelector('.menu-product-list')
	const menuLink = document.querySelectorAll('.top-menu-li:nth-child(1) a')
	const detail = document.querySelectorAll('.menu-product-list div')
	
	if(table == '') { table = 'BURGER_TABLE' }
	
	getJson(table)
	
</script>

<%@ include file="../footer.jsp" %>
</body>
</html>