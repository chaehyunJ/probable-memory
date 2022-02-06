function btnHandler(){
	mainOne.classList.remove('hidden1')
	btn.classList.add('hidden1')
	btn1.classList.remove('hidden1')
}

function btn1Handler(){
	mainOne2.classList.remove('hidden1')
	btn1.classList.add('hidden1')
}

function move() {
	const slide = document.querySelector('.slide')
	value -= unit

	if (value <= -11900) {
		value = 0
	}
	slide.style.marginLeft = value + 'px'
}

function setMoveInterval(){
	setInterval(move, 2000)
}