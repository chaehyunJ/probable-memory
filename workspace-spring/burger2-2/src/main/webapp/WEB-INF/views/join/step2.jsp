<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="join-main-container">
        <ul class="join-address-ul">
            <li style="background-color: red">배달 주소 입력</li>
            <li style="background-color: #ffbc0d">추가 정보 입력</li>
            <li style="background-color: #264a36">가입 완료</li>
        </ul>
        <div class="required-inputs"><span class="required-input">*</span>&nbsp;: 필수입력 </div>
        <form class="join-main-form" method="POST">
        	
        	<input type="hidden" name="address" value="${ param.addressName } ${ param.adressDetail }">
            <input type="hidden" name="usergrade" value="회원">
            <p>ID <span class="required-input">*</span></p>
            <input type="text" name="userid" placeholder="ID를 입력해 주세요" required autofocus autocomplete="off">
            <input id="idChkBtn" type="button" value="중복확인">
            <p id="idChkResult"></p>
            <p>비밀번호 <span class="required-input">*</span></p>
            <input id="userpass" type="password" name="userpw" placeholder="비밀번호를 입력해주세요" required autocomplete="off">
            <p class="point2">※ 비밀번호는 총 8자에서 15자까지 입력가능</p>
            <p>비밀번호 확인</p>
            <input id="userpasschk" type="password" name="sm_pw_chk" placeholder="동일하게 입력해주세요." required maxlength="8" autocomplete="off"/>
            <p class="point successPwChk"></p>
            <p>성함 <span class="required-input">*</span></p>
            <input type="text" name="username" placeholder="성함을 입력해주세요" required autocomplete="off">
            <p>성별 <span class="required-input">*</span></p>
            <label>
            	<input type="radio" name="gender" value="남성">남성
            	<input type="radio" name="gender" value="여성">여성
            </label>
            <p>휴대전화 번호 <span class="required-input">*</span></p>
            <input type="text" name="phone" placeholder="전화번호를 입력해주세요" required>
            <p>이메일 <span class="required-input">*</span></p>
            <input type="email" name="email" placeholder="이메일을 입력해주세요" required>
            <input id="mainBtn" type="button" value="인증번호발송">
            <p id="emailAuth"></p>
            <p>이메일 인증 <span class="required-input">*</span></p>      
            <input id= "authResult" type="text" name="authresult" placeholder="인증번호 입력">
  			<input id="authChkBtn" type="button" value="인증확인">
  			<p id="emailResult"></p>
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
		const cpath = '${ cpath }'
    	const address = document.querySelector('input[name="address"]')
    	const idchk = document.getElementById('idChkBtn')
    	const userid = document.querySelector('input[name="userid"]')
    	const msg = document.getElementById('idChkResult')
    	const mainBtn = document.getElementById('mainBtn')
    	const email = document.querySelector('input[name="email"]')
		const emailAuth = document.getElementById('emailAuth')
		const authChkBtn = document.getElementById('authChkBtn') 
    	const emailResult = document.getElementById('emailResult')
		const authInput = document.querySelector('input[name="authresult"]')
    	
		// 헤더에 form으로 검색을 해서 이렇게 선택자로 들어와야 함
		const form = document.querySelector('.join-main-form')
    	console.log(form)
		
    	idchk.onclick = function(){
    		if(userid.value == ''){
    			alert('ID를 입력해주세요')
    			userid.focus()
    			return
    		}
    		const url = cpath + '/ajaxIdChk/' + userid.value
    		const opt = {
    				method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			msg.innerText = json.msg
    			msg.style.color = json.color
    			msg.style.fontWeight = 'bold'
    			document.querySelctor('input[name="'+ json.focus +'"]').select()
    		})
    	}
    	
    	mainBtn.onclick = function(){
    		console.log(email.value)
    		
    		const url = cpath +'/mailto/' + email.value + '/'
    		const opt = {
    			method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			emailAuth.innerText = json.message
    			emailAuth.style.color = json.status == 'OK' ? 'blue' : 'red'
    		})
    	}
    	
    	authChkBtn.onclick = function(){
    		const authResult = document.querySelector('input[name="authresult"]').value
    		console.log(authResult)
    		const url = cpath + '/ajaxAuth/' + authResult 
    		const opt = {
    			method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			
    			if(json.status == 'OK'){
    				emailResult.innerText = json.message
    				emailResult.style.color = 'blue'
//     				email.disabled = 'disabled'
    				authInput.disabled = 'disabled'
    				const emailAuth = document.createElement('input')
    				emailAuth.name = 'emailAuth'
    				emailAuth.type = 'hidden'
    				emailAuth.value = 'y'
    				form.appendChild(emailAuth)
    			}
    			else{
    				emailResult.innerText = json.message
    				emailResult.style.color = 'red'
    				email.select()
    			}
    		})
    	}
    	
    	console.log(userid)
    	console.log(idchk)
    	console.log(address.value)
    	
        $('#userpass').blur(passchk1) 
    	
    	$("#userpasschk").blur(passchk2) 
    </script>
</body>
</html>