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
				<li><a href="${cpath }/memberInfo">회원 정보</a></li>
			</ul>
	   </div>
	<div class="memberInfo-wrap">
	<div class="memberInfo-table">
		<div class="memberInfo-tableName"><h4>회원 정보</h4></div>
		<table class="myPage-tableType01" border="0" cellpadding="15" cellspacing="10">
			<tbody>
				<tr>
					<th scope="row">아이디 :</th>
					<td>
						<input type="text" name="userid" placeholder="ID" required readonly="readonly"></p>
					</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 :</th>
					<td>
						<input type="password" name="userpw" placeholder="Password" required>
					</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 확인 :</th>
					<td>
						<input type="password" name="userpw" placeholder="Password" required>
					</td>
				</tr>
				<tr>
					<th scope="row">닉네임 :</th>
					<td>
						<input type="text" name="username" placeholder="ninkname" required>
					</td>
				</tr>
				<tr>
					<th scope="row">성별 :</th>
					<td>
						<label><input type="radio" name="gender" value="남성" required>남성</label>
						<label><input type="radio" name="gender" value="여성" required>여성</label>
					</td>
				</tr>
				<tr>
					<th scope="row">전화번호 :</th>
					<td>
						<input type="tel" name="phoneNumber" placeholder="010-0000-0000" required>
					</td>
				</tr>
				<tr>
					<th scope="row">이메일 :</th>
					<td>
						<input type="email" name="email" placeholder="coded@burger.com" required>
					</td>
				</tr>
				<tr>
					<th scope="row">주소 :</th>
					<td>
						<div class="join-address-container">
							<form class="join-address-form" action="${ cpath }/join/step2">
								<p>지역명</p>
								<input id="addressInput" type="text" name="addressName"
									placeholder="지번, 도로명, 건물명으로 입력해주세요" readonly>
								<hr>
								<p>상세주소</p>
								<input id="detailAddressInput" type="text" name="adressDetail"
									placeholder="나머지 주소를 입력해주세요" required>
								<hr>
								<p>최종 배달주소</p>
								<div id="address-result" style="background-color: beige;">
									<span id="resultAddress"></span>
								</div>
								<hr>
								<input id="addressSubmit" type="submit" value="저장">
							</form>
						</div>
					</td>
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
		const resultAddress = document.getElementById('resultAddress')
	
    	document.getElementById("addressInput").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("addressInput").value = data.address; // 주소 넣기
                
                resultAddress.innerText = document.getElementById("addressInput").value
                
                document.getElementById("detailAddressInput").focus(); //상세입력 포커싱
            }
        }).open();
    });
    
    	
    	console.log(resultAddress)
    	let address2 = $('#detailAddressInput').val()
    	
    	
    	resultAddress.innerText += address2
    	
	</script>
</body>
</html>

	