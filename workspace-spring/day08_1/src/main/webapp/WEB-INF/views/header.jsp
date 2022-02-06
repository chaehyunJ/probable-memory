<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		body{
			width : 100%;
			overflow-x: hidden; 
		}
		div, span, header, nav, main, section, article, footer, aside{
			box-sizing: border-box;
		}
		a{
			text-decoration: none;
			color : inherit;
		}
		a:hover{
			text-decoration: underline;
		}
		.btn{
			display : block;
			width : 180px;
			height: 40px;
			line-height : 40px;
			text-align : center;
			background-color: darkgrey;
			font-size: 18px;
			font-weight: bolder;
			transition-duration : 0.5s;
			border-radius: 10px;
			margin-right: 6px;
			border : 0;
			margin : auto;
		}
		.btn:hover{
			text-decoration : none;
			background-color: black;
			color: white;
			transition-duration : 0.5s;
		}
		.flex{
			display : flex;
		}
		.ffc{
			display : flex;
			flex-flow:  column;
		}
		.ffw{			
			display : flex;
			flex-flow: wrap;
		}
		.ffr{
			display : flex;
			flex-flow: row;
		}
		.jcfs {
			display : flex;
			justify-content: flex-start;
		}
		.jcfe {
			display : flex;
			justify-content: flex-end;
		}
		.jcsb{
			display : flex;
			justify-content: space-between;
		}
		.aifs{
			display : flex;
			align-items:  flex-start;
		}
		.aice{
			display : flex;
			align-items: center;
		}
		.aife{
			display : flex;
			align-items: flex-end;
		}
		nav > ul {
			padding : 0;
			width : 800px;
			margin : auto;
			list-style: none;
		}
	
		h1{
			text-align: center;
		}
	</style>
</head>
<body>

<header>
	<h1><a href="${ cpath }">day07</a></h1>
	<hr>
	
	<div class="jcfe" style="padding-right : 20px; line-height: 20px;">
		<c:if test="${ not empty login }">
			<a href="${ cpath }">${ login.userid } (${ login.username })</a>
		</c:if>
	</div>
	
	<nav>
		<ul class="jcfe ffr">
			<c:if test="${ empty login }">
				<li><a class="btn" href="${ cpath }/login">로그인</a></li>				
			</c:if>
			<c:if test="${ not empty login }">
				<li><a class="btn" href="${ cpath }/logout">로그아웃</a></li>			
			</c:if>
			<li><a class="btn" href="${ cpath }/book">도서 관리</a></li>
		</ul>
	</nav>
</header>