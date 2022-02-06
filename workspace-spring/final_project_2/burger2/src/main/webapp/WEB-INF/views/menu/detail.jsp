<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
${table}
${sequence}
<div class="menu-container">

	<div class="menu-top">
		<c:choose>
			<c:when test="${table eq 'mcmorning'}">
				<c:forEach var="top" items="${tList}">
					<img class="menu-img" src="${top.MCMORNING_TABLE_BACKGROUND}">
					<h1 class="menu-title">맥모닝</h1>
					<p class="menu-text">${top.MCMORNING_TABLE_DESCRIPTION}</p>
					<ul class="menu-ul">
						<li><a href="${cpath}">Home</a></li>
						<li>•</li>
						<li>Menu</li>
						<li>•</li>
						<li>맥모닝</li>
					</ul>
				</c:forEach>
			</c:when>
		
		</c:choose>	
	</div>
	
	<div class="menu-detail">
		<div class="menu-detail-name">베이컨 토마토 에그 머핀</div>
		<div class="menu-detail-img"><img src="https://www.mcdonalds.co.kr/upload/product/pcfile/1614164824154.png"></div>
		<div class="menu-detail-desc">갓 구워내 따뜻하고 신선한<br>베이컨토마토 에그 머핀</div>
		<div class="menu-detail-time">*판매시간:4AM~10:30AM</div>
		<div class="menu-detail-"></div>
	</div>
	
</div>


<script>
	const cpath = '${cpath}'
</script>

</body>
</html>