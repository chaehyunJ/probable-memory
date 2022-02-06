function getMidLandFcst(){
	const url = cpath + '/getMidLandFcst'
	const opt = {
			method : 'get'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		const arr = json.response.body.items.item
		console.log(arr)
		
	
		const ob = {
			'3일후 날씨' :arr.wf3Am, 
			'4일후 날씨' :arr.wf4Am, 
			'5일후 날씨' :arr.wf5Am, 
			'6일후 날씨' :arr.wf6Am, 
			'7일후 날씨' :arr.wf7Am, 
			'8일후 날씨' :arr.wf8, 
			'9일후 날씨' :arr.wf9, 
			'10일후 날씨' :arr.wf10 
		}
		
		let dom = ''
		
		for(key in ob){
			const value = ob[key]
			dom += '<div class="mid-fcst-inner '+ value + '"> <p>' + key + '</p>' + value + '</div>' 			
		}

//		const all = document.querySelectorAll('.mid-fcst-inner')
//		console.log(all)
		
		midFc.innerHTML += dom
  	})
}

function getMidTa(){
	const url = cpath + '/getMidTa' 
	const opt = {
			method : 'get'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		
		const arr = json.response.body.items.item
		console.log(arr)
		
		const ob = {
			'3일후 기온' : arr.taMin3 + '°C~' + arr.taMax3 + '°C', 
			'4일후 기온' : arr.taMin4 + '°C~' + arr.taMax4 + '°C',
			'5일후 기온' : arr.taMin5 + '°C~' + arr.taMax5 + '°C',
			'6일후 기온' : arr.taMin6 + '°C~' + arr.taMax6 + '°C',
			'7일후 기온' : arr.taMin7 + '°C~' + arr.taMax7 + '°C',
			'8일후 기온' : arr.taMin8 + '°C~' + arr.taMax8 + '°C',
			'9일후 기온' : arr.taMin9 + '°C~' + arr.taMax9 + '°C',
			'10일후 기온' : arr.taMin10 + '°C~' + arr.taMax10 + '°C',
		}
		
		let dom = ''
		for(key in ob){
			const value = ob[key]
			console.log(key)
			const str = value.substr(0,1)
			dom += '<div class="mid-ta-inner'+str+'"> <p>'+ key+ '</p>' + value + '</div>' 
//			const inner = document.querySelectorAll('.mid-ta-inner')
	
//			console.log(inner)
			console.log(value)
			console.log(value.substr(0,1))
			
//			if(value.substr(0,1) == '-'){
//				inner.style.backgroundColor = '#6a9eff'
//			}
//			else if(value.substr(0,1) == '0'){
//				inner.style.backgroundColor = '#b9d1ff'
//			}
//			else{
//				inner.style.backgroundColor = 'white'
//			}
		}
	
		midTa.innerHTML += dom
	})
}


function dayFormat(){
	let date = new Date()
	let year = date.getFullYear()
	let month = date.getMonth() + 1
	let day = date.getDate() + 2
	
	let times = ''
	
	let dom = ''
	for(let i = 0; i <= 7; i++){
		day = day+1
		dom += '<div>'
		dom += (year + '. ' + month + '. ' + day + '.')
		dom += '</div>'
	}
	
//		let times = year + '. ' + month + '. ' + day + '.'
	
	resultTime.innerHTML += dom
}

function dateFormat(){
	let date = new Date()
	let year = date.getFullYear()
	let month = date.getMonth() + 1
	let day = date.getDate()
	let hour = date.getHours()
	let min = date.getMinutes()
	let sec = date.getSeconds()
	
	let ampm;
	
	month = month >= 10 ? month : '0' + month
	day = day >= 10 ? day : '0' + day
	hour = hour >= 10 ? hour : '0' + hour
	min = min >= 10 ? min : '0' + min
	sec = sec >= 10 ? sec : '0' + sec
	
	if(hour < 12){
		ampm = '오전'
	}
	else {
		ampm = '오후'
	}
			
	let time = year + '. ' + month + '. ' + day + '. ' + ampm + ' ' + hour + ':' + min + ':' + sec
	
	return clock.innerText = time
}
function timer(){
	setInterval(dateFormat, 1000)
}