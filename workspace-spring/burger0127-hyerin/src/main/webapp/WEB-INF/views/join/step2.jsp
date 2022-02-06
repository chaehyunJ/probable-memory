<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="join-main-container">
        <ul class="join-main-ul">
            <li style="background-color: red">배달 주소 입력</li>
            <li style="background-color: #ffbc0d">추가 정보 입력</li>
            <li style="background-color: #264a36">가입 완료</li>
        </ul>
        <form class="join-main-form" method="POST">
        	<input type="hidden" name="address" value="${ param.addressName } ${ param.adressDetail }">
            <p>ID</p>
            <input id="mainInput" type="text" name="userid" placeholder="ID를 입력해 주세요" required autofocus>
            <input id="idChkBtn" type="button" value="중복확인">
            <p>비밀번호</p>
            <input id="userpass" type="password" name="userpw" placeholder="비밀번호를 입력해주세요" required autocomplete="off">
            <span class="point2">※ 비밀번호는 총 8자에서 15자까지 입력가능</span>
            <p>비밀번호 확인</p>
            <input id="userpasschk" type="password" name="sm_pw_chk" placeholder="동일하게 입력해주세요." required maxlength="8" autocomplete="off"/>
            <span class="point successPwChk"></span>
            <p>성함</p>
            <input id="mainInput" type="text" name="joinname" placeholder="성함을 입력해주세요" required>
            <p>휴대전화 번호</p>
            <input id="mainInput" type="text" name="phone" placeholder="전화번호를 입력해주세요" required>
            <p>이메일</p>
            <input id="mainInput" type="email" name="email" placeholder="이메일을 입력해주세요" required>
            <input id="mainBtn" type="button" value="인증번호발송">
            <p>이메일 인증 </p>      
            <input id= "authresult" type="text" name="authresult" placeholder="인증번호 입력">
            
            <p><a href="">이용약관</a>동의</p>
            <input type="checkbox">동의
  
            <hr>
            <input id="mainSubmit" type="submit" value="가입">
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
    	const address = document.querySelector('input[name="address"]')
    	
    	console.log(address.value)
    	
        $('#userpass').blur(passchk1) 
    	
    	$("#userpasschk").blur(passchk2) 
    </script>
</body>
</html>