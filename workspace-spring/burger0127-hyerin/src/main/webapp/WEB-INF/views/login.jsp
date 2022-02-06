<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<div class="login-form">
        <button class="client-login">회원로그인</button>
        <button class="non-client-login">비회원로그인</button>
        <form>
            <p><input type="text" name="userid" placeholder="ID" style="width : 240px;"></p>
            <p><input type="text" name="userpw" placeholder="PW" style="width : 240px;"></p>
            <p><input type="checkbox">자동로그인</p>
            <input class="login-submit" type="submit" value="로그인">
            <p><button class="join-button">회원가입</button></p>
        </form>
    </div>

<%@ include file="footer.jsp" %>
