<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<div class="join-address-container">
        <ul class="join-address-ul">
            <li style="background-color: red">배달 주소 입력</li> 
            <li style="background-color: #ffbc0d">추가 정보 입력</li>  
            <li style="background-color: #264a36">가입 완료</li>
        </ul>
        <form class="join-address-form" action="${ cpath }/join/step1">
           <textarea style="width: 800px; height: 400px; resize: none;" readonly>${agreement }</textarea>
			<div style="display: flex; justify-content:space-between;">
				<p>
					<label>
						<input type="checkbox" name="agree">위 사항을 읽었으며, 약관에 동의합니다
					</label>	
				</p>
	            <input id="addressSubmit" type="submit" value="다음">
            </div>
        </form>
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
