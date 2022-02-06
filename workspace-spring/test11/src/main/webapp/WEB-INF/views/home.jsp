<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨정보</title>
<style>
	div{
		box-sizing: border-box;
	}
	p{
		margin : 0;
	}
	.result-time{
		display: flex;
	}
	.result-time > div{
		width : 300px;
		border: 1px solid black;
	}
	.mid-ta{
		display: flex;
	}
	.mid-ta > div{
		width : 300px;
		border: 1px solid black;
	}
	.mid-fcst{
		display: flex;
	}
	.mid-fcst > div{
		width : 300px;
		border: 1px solid black;
	}
	.clock{
		width : 400px;
		font-size : 25px;
		border : 1px solid black;
		margin : 10px auto;
		background-color: black;
		color : green;
		text-align: center;

	}
	.맑음{
		background-color: skyblue;
	}
	.구름많음{
		background-color: #dadada;
	}
	.흐림{
		background-color: grey;
	}
	.흐리고{
		background-color: darkgrey;
	}
	.mid-ta-inner-{
		background-color: #6a9eff;
	}
	.mid-ta-inner0{
		background-color: #b9d1ff;
	}
	.tmax{
		background-color: white;
	}
</style>
</head>
<body>
<script src="${ cpath }/resources/js/function.js"></script>
<h1>통합구현A형</h1>
<p>응시자 : 전채현</p>
<hr>
<div class="clock"></div>
<div class="result">
	<div class="result-time"></div>
	<div class="mid-fcst"></div>
	<div class="mid-ta"></div>
</div>


<script>
	const cpath = '${ cpath }'
	const clock = document.querySelector('.clock')
	const result = document.querySelector('.result')
	const resultTime = document.querySelector('.result-time')
	const midFc = document.querySelector('.mid-fcst')
	const midTa = document.querySelector('.mid-ta')
	
	const midFcAll = document.querySelectorAll('.mid-fcst-inner')

	
	console.log(midFc)
	console.log(midTa)
	
	console.log(resultTime)
	console.log(result)
	
	let today = new Date()
	console.log(today)
	
	window.addEventListener('load', function(){
		getMidLandFcst()
		
	})
		
	window.addEventListener('load', function(){
		getMidTa()
	})
	
	window.addEventListener('load', function(){
		timer()
	})
		
	window.addEventListener('load', function(){
		dayFormat()
	})
	
</script>

</body>
</html>