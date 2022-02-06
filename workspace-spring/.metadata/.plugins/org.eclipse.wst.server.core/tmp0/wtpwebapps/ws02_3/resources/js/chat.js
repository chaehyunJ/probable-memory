function onMessage(event){		// 메시지를 받으면 수행하는 함수
	
	let className = ''
	
	if(JSON.parse(event.data).username == 'alarm'){
		className = 'alarm'
	}
	else if(JSON.parse(event.data).username == username){
		className = 'self'
	}
	else{
		className = 'other'
	}
	
	const div = document.createElement('div')
	const name = document.createElement('div')
	const message = document.createElement('span')
	div.className = className
	name.className = 'name'
	name.innerText = JSON.parse(event.data).username
	message.className = 'message'
	message.innerText = JSON.parse(event.data).message
	
	div.appendChild(name)
	div.appendChild(message)
	textarea.appendChild(div)
	
		// 메시지가 길어지면 자동으로 아래로 스크롤
	textarea.scroll({
		top : textarea.scrollHeight,
		behavior : 'smooth'
	})
}


function onOpen(){
	const payload = {
			username : 'alarm',
			message : username + '님이 입장하셨습니다'
	}
//	const div = document.createElement('div')
//	div.innerText = username + '님이 입장하셨습니다'
//	textarea.appendChild(div)
	
	// payload를 stringify해서 JSON형식의 문자열로 send한다
	ws.send(JSON.stringify(payload))
}

function onClose(event){
//	const payload = {
//			username : 'alarm',
//			message : username + '님이 나가셨습니다'
//	}
//	ws.send(JSON.stringify(payload))

	// 미리 메시지를 보내고 로그아웃을 하게 만든다
	// 나가기 전에 미리 메시지를 보내는 것이다
}

function quitHandler(event){
	const payload = {
			username : 'alarm',
			message : username + '님이 나가셨습니다'
	}
	ws.send(JSON.stringify(payload))
	
	ws.close()		// 나가기 버튼 클릭하면 웹소켓을 닫도록 함수를 호출한다
	
	location.href = cpath + '/logout'
}

function keyHandler(event){
	if(event.key == 'Enter'){
		// 입력한 키가 엔터키면 보내는 함수
		sendHandler(event)
	}
}

function sendHandler(event){
	const message = send.value
	send.value = ''
		
	// 입력받을 값
	const payload = {
			username : username,
			message : message
	}
	ws.send(JSON.stringify(payload))
	send.focus()
}


// 함수를 이용해서 접속자의 id가 뜬다
// 함수를 만들어서 username으로 반환
function generateSessionId(){
	return username
}



function ajaxHandler(event){
		const flag = right.classList.contains('hidden')
		
		if(flag == false){
			right.classList.add('hidden')					
			overlay.classList.add('hidden')
			right.style.marginLeft = 0 + 'px'
			return
		}
		overlay.classList.remove('hidden')
		right.style.zIndex = 1
		right.classList.remove('hidden')	
		
		// 문자열 속성이라서 '-120px' 도 먹음
		right.style.marginLeft = -120 + 'px'
	
		const url = cpath + '/getList'
		const opt = {
				method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			const userList = document.getElementById('userList')
			userList.innerHTML = ''
			json.forEach(user => {
				userList.innerHTML += '<div class="username">' +  user + '</div>'
			})
			
			// 이름 클릭하면 새로운 모달창이 뜨게 만들어 준다
			userList.querySelectorAll('.username').forEach(user => user.onclick = createModal)
		})
	
	}


let diffX
let diffY

function createModal(event){
	let dom = '<div class="chatToTarget">'
	dom += '<div class="title">' +  event.target.innerText + '님과 1:1채팅' + '</div>'
	dom += '<div class="textarea"></div>'
	dom += '<div class="bottom">'
	dom += '<input type="text" name="send2">'
	dom += '<input type="submit" value="전송">'
	dom += '<input type="button" value="나가기">'
	dom += '</div>'
	dom += '</div>'
		
	const wrap = document.getElementById('wrap')
	
	wrap.innerHTML += dom
	
	const chat = document.querySelector('.chatToTarget')
	const title = chat.querySelector('.title')
	
	console.log(title)
	
	title.draggable = 'true'
	title.addEventListener('dragstart', function(event){
		const absTop = event.target.parentNode.getBoundingClientRect().top
		const absLeft = event.target.parentNode.getBoundingClientRect().left
		event.target.opacity = '0.5'
		diffX = event.clientX - absLeft
		diffY = event.clientY - absTop
		
		console.log(diffX, diffY)
	})	
	
//	chat.addEventListener('drag', function(event){
//		console.log('drag')
//		const absTop = event.target.parentNode.getBoundingClientRect().top
//		const absLeft = event.target.parentNode.getBoundingClientRect().left
//		console.log(diffX, diffY)
//	}, false)	
//	
//	chat.addEventListener('dragover', function(event){
//		console.log('dragover')
//		const absTop = event.target.parentNode.getBoundingClientRect().top
//		const absLeft = event.target.parentNode.getBoundingClientRect().left
//	}, false)	
	
	chat.addEventListener('dragend', function(event){
		console.log('dragend')
		const absTop = event.target.parentNode.getBoundingClientRect().top
		const absLeft = event.target.parentNode.getBoundingClientRect().left
		
		event.target.parentNode.style.left = (event.clientX - diffX) + 'px'
		event.target.parentNode.style.top = (event.clientY - diffY) + 'px'
		
		console.log(event.target.style.left)
		console.log(event.target.style.top)
		console.log(diffX, diffY)
		
	}, false)	
	
}
