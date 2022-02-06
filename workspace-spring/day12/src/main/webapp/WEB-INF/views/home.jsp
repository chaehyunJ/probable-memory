<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



<ul>
	<li><a href="${ cpath }/ex01">ex01 - 기본적인 get 요청</a></li>
	<li><a href="${ cpath }/ex02">ex02 - get, 파라미터 전달</a></li>
	<li><a href="${ cpath }/ex03">ex03 - get, userid를 이용한 객체 불러오기</a></li>
	<li><a href="${ cpath }/ex04">ex04 - get, 전체 목록을 AJAX로 불러오기</a></li>
	<li><a href="${ cpath }/ex05">ex05 - get, 사용자 이름으로 검색하여 목록을 불러오기</a></li>
	<li><a href="${ cpath }/quiz2">quiz2 - 회원가입 페이지</a></li>
	
	<!--  
		일반적인 jsp를 만들어서 화면을 띄웁니다
		회원 가입 시 id 입력란 옆에 중복확인 버튼을 만들고
		중복확인을 누르면 DB에 일치하는 계정이 있는지 없는지 확인하여
		alert으로 메시지를 띄웁니다
		사용할 수 없는 id라면 다시 id입력란에 글자를 선택하고
		사용가능하다면, 다음 input으로 포커스 이동
	 -->
</ul>
</body>
</html>