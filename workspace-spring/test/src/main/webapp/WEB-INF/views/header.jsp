<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mcdelivery</title>
    <style>
    	body{
    		background-color: #e8e6df;	
    	}
        div{
            box-sizing: border-box;
        }
        h4{
        	width : 200px;
        	margin-right : 0;
        }
        a{
        	text-decoration: none;
        	color : inherit;
        }
        .root{
        	display : flex;
       		margin-top : -250px;
            margin-left : 300px;
            margin-right : auto;
            
        }
        .price {
        	color : green;
        }
        .name{
        	text-align: center;
        	font-weight: bold;
        }
        .sideMenu{
        	border : 0px solid black;
        	width : 200px;
            position: sticky;
            top: 0;
            margin-top : 10px;
            background-color: #ffc423;
            border-radius: 10px;
        }
        .sideMenu  li{
        	height : 40px;
        }
        .mainMenu{
            border: 0px solid black;
            width : 520px;
            display: flex;
            flex-flow: wrap;
        }
        .item{
            border: 0px solid black;
            width: 230px;
            height: 240px;
            margin : 10px;
            background-color: white;
            border-radius: 10px;
        }
        img{
        	width : 200px;
        	height : 150px;
        	text-align: center;
        }
        .main-top{
        	width : 1140px;
        	display: flex;
        	justify-content: space-between;
        }
        .login-top{
        	list-style: none;
        	display : flex;
        }
        .login-top > li {
        	width : 120px;
        	font-size: 14px;
        }
        .top-menu{
            display: flex;
            width: 1140px;
            height : 60px;
            border-radius: 10px;
            background-color: #3d3d3d;
            box-shadow:  5px 5px grey;
        }
        .top-menu > a > img{
        	width : 150px;
        	height : 60px;
        	border-radius: 10px 0px 0px 10px;
        }
        .top-right{
            background-color: #3d3d3d;
        }
        .top-menu-inner{
            display: flex;
            list-style: none;
            background-color: #3d3d3d;
        }
        .top-menu-inner > li {
            width: 200px;
            height: inherit;
            font-size: 20px;
            font-weight: bold;
            background-color: #3d3d3d;
            color: white;
        }
    </style>
</head>
<body>

<div class="main-top">
	<h4>응시자 : 전채현</h4> 
	<ul class="login-top">
		<li>로그인</li>
		<li>회원가입</li>
	</ul>
</div>