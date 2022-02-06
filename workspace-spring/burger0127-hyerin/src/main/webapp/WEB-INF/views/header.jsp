<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coded Burger</title>
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/login.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/join.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/promotion.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/menuList.css">

<!-- 추가  -->
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/myPage.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/store.css">
</head>
<body>
<script src="${ cpath }/resources/js/main.js"></script>
<script src="${ cpath }/resources/js/step2.js"></script>
<script src="${ cpath }/resources/js/promotion.js"></script>
<script src="${ cpath }/resources/js/menu.js"></script>
<script src="${ cpath }/resources/js/detail.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <header>
        <div class="header">
            <div class="top-left">
                <div>
                    <a href="${ cpath }"><img class="main-logo" src="${ cpath }/resources/src/픽셀 버거2.png"></a>
                </div>
                <nav class="top-menu">
                    <ul>
                        <li class="top-menu-li">
                        	<!--  -->
                            <a href="${ cpath }/menu/list/burger">Menu</a>
                            <div class="top-menu-submenu">
                                <ul class="top-menu-inner">
                                	<!-- 혜린 추가 -->
                                    <li><a href="${ cpath }/menu/list/mcmorning">맥모닝</a></li>
                                    <li><a href="${ cpath }/menu/list/burger">버거</a></li>
                                    <li><a href="${ cpath }/menu/list/side">사이드</a></li>
                                    <li><a href="${ cpath }/menu/list/mccafe">맥카페</a></li>
                                    <li><a href="${ cpath }/menu/list/drink">음료</a></li>
                                    <li><a href="${ cpath }/menu/list/dessert">디저트</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="top-menu-li">
                            <a href="${ cpath }/store">Store</a>
                            <div class="top-menu-submenu">
                                <ul class="top-menu-inner">
                                    <li><a href="">매장찾기</a></li>
                                    <li><a href="">맥딜리버리</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="top-menu-li">
                            <a href="${ cpath }/promotion">promotion</a>
                            <div class="top-menu-submenu">
                                <ul class="top-menu-inner">
                                    <li><a href="${ cpath }/promotion">프로모션</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="top-menu-li">
                            <a href="${ cpath }/board/news">Board</a>
                            <div class="top-menu-submenu">
                                <ul class="top-menu-inner"> 
                                   	<!--혜린 추가 내용  -->
                                    <li><a href="${ cpath }/board/news">새로운소식</a></li>
                                    <li><a href="${ cpath }/board/question">문의사항</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="top-right">
                <ul>
                    <li>
                    	<c:if test="${ empty login }">
 							<a href="${ cpath }/join">회원가입</a>                   	
                    	</c:if>
                    	<c:if test="${ not empty login }">
                    		<a href="${ cpath }/logout">로그아웃</a>
                    	</c:if>
                    </li>
                    <li><a href="${ cpath }/order">주문하기</a></li>
                    
                    <li>
                    <c:if test="${ empty login }">
                        <a href="${ cpath }/login">로그인</a>
                    </c:if>
                    <c:if test="${ not empty login }">
                    	<a href="${ cpath }/myPage">${ login.username }</a>
                    </c:if>
                    </li>
                    <li><img class="search-icon" src="${ cpath }/resources/src/검색아이콘.png" alt=""></li>
                </ul>
            </div>
        </div>
    </header>