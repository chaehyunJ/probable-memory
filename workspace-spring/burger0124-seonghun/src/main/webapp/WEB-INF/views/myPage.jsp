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
				<li><a href="${ cpath }/chkPw">회원 정보</a></li>
				<li class="deleteBtn"><a href="${ cpath }/chkDelete">회원탈퇴</a></li>
			</ul>
	   </div>
	<div class="myPage-contents">
	<div class="myPage-table">
		<div class="myPage-tableName"><h4>주문 조회</h4></div>
		<table class="myPage-tableType01" border="0" cellpadding="15" cellspacing="10">
			<thead>
				<tr>
					<th scope="col">주문 번호 </th>
					<th scope="col">예상 배달 시간/날짜</th>
					<th scope="col">주문 접수</th>
					<th scope="col">준비 중</th>
					<th scope="col">배달 중</th>
					<th scope="col">배달 완료</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${ orderList.orderDate }-${ orderList.orderSeq }</td>
					<td><div id="timer"></div></td>
					<td>🗒 ${orderList.orderstatus=='y'? '✔️'   :  ''}  </td>
					<td>🍳${orderList.paystatus=='y'? '✔️'   : ''}    </td>
					<td id="mypageOrder">🏍 </td>
					<td id="mypageComplete">🍔</td>
				</tr>
			</tbody>
		</table>
	</div>

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

	const orderProcess = document.getElementById('mypageOrder')
	const orderComplete = document.getElementById('mypageComplete')

	let time = 5;
	let min = "";
	let sec = "";
	console.log(min)
	
	var x = setInterval(function() {
	   min = parseInt(time/60);
	   sec = time%60;
	   document.getElementById("timer").innerHTML = min + "분" + sec + "초";
	   time--;
	   if(time >= 4) {
		   orderProcess.innerText +='✔️ '
	   }
	   if(time < 0 ) {
	      clearInterval(x);
	      document.getElementById("timer").innerHTML = "배달 완료";
			orderComplete.innerText +='✔️ '
	   }
	}, 1000);
	
	
 
</script>
</body>
</html>
