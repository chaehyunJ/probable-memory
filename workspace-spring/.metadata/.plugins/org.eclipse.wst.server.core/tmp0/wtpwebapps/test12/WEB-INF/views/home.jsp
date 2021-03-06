<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  구글 차트 라이브러리  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<h1>비NCS 데이터 시각화 평가 A형</h1>
<p>응시자 : 전채현</p>
<hr>

<div class="root1"></div>
<div class="root2"></div>


<script>
	const cpath = '${ cpath }'
	const root1 = document.querySelector('.root1')
	const root2 = document.querySelector('.root2')
	
	console.log(root1)
	console.log(root2)
	
	const url = cpath + '/covid'
	const opt = {
		method : 'get'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		console.log(json.response.body.items.item)

		const arr = json.response.body.items.item
		
		const result = arr.filter(arr => arr.gubun == '부산')
		
		const result1 = result.map(v => {
			return {
				localOccCnt : v.localOccCnt,
				stdDay : v.stdDay.substring(6,13).replace('월', '').replace('일', '')
			}
		})
		
		
		console.log("check : ", result1)
		
		
		
		google.charts.load('current', {packages : ['corechart']})
		google.charts.setOnLoadCallback(drawChart)
		
		function drawChart(){
			const ar1 = [] 
			
			for(key in result1){
				let value = result1[key]
// 				console.log("incDec : ", value.incDec)
// 				console.log("stdDay : ", value.stdDay)
				const ar2 = []
				
				ar2.push(value.stdDay)
				ar2.push(value.localOccCnt)
				
				
				ar1.push(ar2)
			}
			ar1.reverse()
			
// 			for(let i = 0; i < result.length; i++){
// 				ar1.push(result[i])
// 			}
// 			ar1.sort(function(a,b){
// 				return a.stdDay < b.stdDay ? 1 : 0
// 			})
		// 테이블 생성
		const table = new google.visualization.DataTable()
			
		// column 추가
		table.addColumn('string', 'stdDay')
		table.addColumn('number','지역별 확진자 수')
		
		table.addRows(ar1)
		
		const opt1 = {
				title : '일자별 코로나 확진자',
				width : 1900,
				height : 450
			}
			
		const chart = new google.visualization.ColumnChart(root2)
		chart.draw(table,opt1)
		}
		
		
	})
	
	
	const url2 = cpath + '/vaccine'
	const opt2 = {
		method : 'get'
	}
	fetch(url2, opt2)
	.then(resp => resp.json())
	.then(json => {
		console.log(json.data)
		
		const arr1 = json.data
		
		const result2 = arr1.map(v => {
			return {
				baseDate : v.baseDate.substring(5,11),
				totalFirstCnt : v.totalFirstCnt,
				totalSecondCnt : v.totalSecondCnt,
				totalThirdCnt : v.totalThirdCnt
			}
		})
		
		console.log("vaccine : ", result2)


		
		google.charts.load('current', {packages : ['corechart']})
		google.charts.setOnLoadCallback(drawChart)
		
		function drawChart(){
			const ar = []
			
			
			for(key in result2){
				let value = result2[key]
				const ar1 = []
				ar1.push(value.baseDate)
				ar1.push(value.totalFirstCnt)
				ar1.push(value.totalSecondCnt)
				ar1.push(value.totalThirdCnt)
				
				ar.push(ar1)
			}
			// 테이블 생성
			const table = new google.visualization.DataTable()
			
			// 컬럼 추가
			
			table.addColumn('string', 'baseDate')
			table.addColumn('number', '1차 접종 완료')
			table.addColumn('number', '2차 접종 완료')
			table.addColumn('number', '3차 접종 완료')
		
			
			table.addRows(ar)
			
			const opt2 = {
					title : '일자별 코로나 백신 접종',
					width : 1900,
					height : 450
			}
			const chart = new google.visualization.ColumnChart(root1)
			chart.draw(table,opt2)
			
		}
		

		
		

	})
	
</script>

</body>
</html>