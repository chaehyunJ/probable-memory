<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<div class="login-form">
        <a href="${ cpath }/login"><button class="client-login">회원로그인</button></a>
        <a href="${ cpath }/join/nonmemberJoin"><button class="non-client-login">비회원주문하기</button></a>
        <form method="POST">
            <p class="login-p"><input class="login-input" type="text" name="userid" placeholder="ID" style="width : 240px;"></p>
            <p class="login-p"><input class="login-input" type="password" name="userpw" placeholder="PW" style="width : 240px;" ></p>
            <p class="login-p"><input class="login-checkbox" name="auto" type="checkbox">자동로그인</p>
            <input class="login-submit" type="submit" value="로그인">
        </form>
        	<p class="login-p"><a href="${ cpath }/join"><button class="join-button">회원가입</button></a></p>
        	
        	<!--  비밀번호 찾을 때 등록된 이메일을 통해서 임시비밀번호 보내주기  -->
        	<!--  비밀번호를 보내주면 DB에는 해당 계정의 비밀번호는 임시비밀번호를 해쉬로 처리한 값이 들어가야 한다   -->
        	<p class="login-p"><a href="${ cpath }/findPw"><button class="join-button">비밀번호찾기</button></a></p>
        	<p class="login-p"><a href="${ cpath }/findId"><button class="join-button">아이디찾기</button></a></p>
    </div>

<%@ include file="footer.jsp" %>
