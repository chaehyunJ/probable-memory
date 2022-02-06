<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="myPage-container">
	<div class="myPage-list">
	       <h4 class="myPage-title">마이 페이지</h4>
	       <hr>
			<ul class="myPage-navPath">
				<li><a href="${cpath }/myPage">주문 조회</a></li>
				<li><a href="${cpath }/history">주문 내역</a></li>
				<li><a href="${cpath }/chkPw">회원 정보</a></li>
			</ul>
	   </div>
	<div class="myPage-contents">

	<div class="myPage-History">
		<div class="myPage-HistoryName"><h4>주문 내역</h4></div>
		<div class="myPage-HistoryDate"><h4>주문 일자 : </h4></div>
		<table class="myPage-tableType01" border="0" cellpadding="15" cellspacing="10">
			<thead>
				<tr>
					<th scope="col">주문 번호 :</th>
					<th scope="col">배달 시간/날짜</th>
					<th scope="col">주소</th>
					<th scope="col">메뉴</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2022/01/12-245722</td>
					<td>2020/01/12 11:39</td>
					<td>부산시 해운대구 </td>
				<td class="tdName">
						<dl class="myPage-menus">
							<dt><strong class="myPage-menuName">라지세트 - 행운 버거 골드</strong></dt>
							<dd>버거 : 행운 버거 골드</dd>
							<dd>음료 : 코카 콜라 라지 </dd>
							<dd>사이드 : 컬리 후라이 라지</dd>
						</dl>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
</div>

<%@ include file="footer.jsp" %>