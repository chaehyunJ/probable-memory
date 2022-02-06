function modalHandler(event) {
	modalback.style.display = 'block'
	modalback.style.marginTop = '0px';
	modalback.classList.add('slide-down')
	inputcheck.checked = false  //모달 띄울때 sizeup이 체크되있을수도 있으니 체크해제
	
}

//모달안의 내용 채우는 dom
function getsizedom(event) {
		console.log(event.target)
		let tag = ``
		tag += `<img src="${event.target.src}" style="width: 100%; height: 90%;">`
		burgerimg.innerHTML = ''
		modalprice.innerHTML = ''
		modalcount.innerHTML = ''
		modalname.innerHTML = ''
		burgerimg.innerHTML = tag	
	 	
	 	const name = document.createElement('span')
	 	name.classList.add('modalname')
	 	name.innerHTML = event.target.nextElementSibling.nextElementSibling.innerText
	 	modalname.appendChild(name)
	 	
		 	const price = document.createElement('span')
		 	price.classList.add('modalpricespan')
		 	price.innerHTML=event.target.nextElementSibling.innerText.split(' ')[1] + ' 원'
			
		 	modalprice.appendChild(price)
		 	
		 	const surangspan = document.createElement('div')
		 	surangspan.classList.add('surangspan')
		 	
		 	const surang = document.createElement('div')
		 	surang.classList.add('surang')
		 	surang.innerHTML="수량"
		 	
		 	const span = document.createElement('div')
		    span.classList.add('modalcountchild')
		    span.innerHTML="1"
		    
		    surangspan.style.width='100%'
		    surangspan.style.display='flex'
		    surangspan.style.justifyContent='flex-start'
		 	
		    surangspan.appendChild(surang)
		 	surangspan.appendChild(span)
		 	
		 	modalcount.appendChild(surangspan)
		    
		 	const plusminusdiv = document.createElement('div')
		 	plusminusdiv.classList.add('plusminusdiv')
		 	
		 	const plusButton = document.createElement('button')
		    plusButton.classList.add('modaladdminusBtn1')
		    plusButton.innerHTML="+"
		  
		    const minusButton = document.createElement('button')
		    minusButton.classList.add('modaladdminusBtn2')
		 	minusButton.innerHTML="-"
	
		 	plusminusdiv.appendChild(plusButton)
		 	plusminusdiv.appendChild(minusButton)
		 	modalcount.appendChild(plusminusdiv)
		 	
		 	sizeselect.innerHTML = "<label id='input_check'><input class='sizeinput' id='input_check1' type='checkbox'>사이즈업그레이드[+700]</label><p>700원을 추가하시면 감자튀김과 콜라를 SizeUp</p>";
		 	const sizeinput = document.querySelector('.sizeinput')
			sizeinput.onclick = function(event) {
				 let count = parseInt(modalcount.childNodes[0].childNodes[1].innerHTML)
				 const inputcheck = document.getElementById('input_check1')  //새로 태그를 만들었기 때문에 inputcheck를 다시 선언해야한다. 
				 let sizeup = inputcheck.checked
				 console.log('사이즈업? : '+ sizeup)
				 let price = parseInt(modalprice.childNodes[0].innerHTML.split(' ')[0].replace(/,/g,""))
				 console.log('참이니123: ' + event.target.classList)
				 		if(event.target.classList=='sizeinput' && sizeup == false) { //체크를 해제 했을 때 기존값이 사라지고 700원이 감소한값
				 				console.log('해제')
				 				//1. 수량이 3일 떼 체크를 해제하면 price / count  
				 				modalprice.childNodes[0].innerHTML = ((price / count)-700).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원' 
				 				modalcount.childNodes[0].childNodes[1].innerHTML = 1
				 			}
				 		if(event.target.classList=='sizeinput' && sizeup == true) { //체크를 했을 때 기존값이 사라지고 700원이 감소한값
				 				 console.log('체크')
				 				 modalprice.childNodes[0].innerHTML = ((price / count) + 700).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원' 
				 				 //modalprice.childNodes[0].innerHTML = (((count * price) - ((count - 1) * price) + 700)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원' 
				 				 modalcount.childNodes[0].childNodes[1].innerHTML = 1
				 			   } 	
				 		   }
		 		inputorder.style.height='50px'
			 	inputordernot.style.height='0px'
			 	inputordernot.innerHTML = ''
			 	inputorder.innerHTML = '목록에 담기'
		 		}
	/*let tag = `<div style="display: flex;">`
	tag +=  `	<div><img src="${event.target.src}"></div>`
	tag +=  `	<div><span>${event.target.nextElementSibling.nextElementSibling.innerText}</span></div>`
	tag +=  `</div>`		
	modalcontent.innerHTML += tag*/

function inputorderHandler(event) {
	console.log('핸들러야')
	const price = '￦ ' +modalprice.childNodes[0].innerHTML.split(' ')[0] //'2000 원'을 공백기준으로 자르기
	const count = parseInt(modalcount.childNodes[0].childNodes[1].innerHTML) //모달에 찍힌 수량
	const inputcheck = document.getElementById('input_check1')  //새로 태그를 만들었기 때문에 inputcheck를 다시 선언해야한다. 
	let sizeup = inputcheck.checked
	let name
	if(sizeup == true) {
		name = modalname.childNodes[0].innerHTML + '(Large)'
	}
	else {
		name = modalname.childNodes[0].innerHTML
	}
	modalback.style.display = 'none'
	modalback.style.marginTop = '-1000px';
	modalback.classList.remove('slide-down')
	modalImageOrderDom(price,count,name)
	totalfunction2()
}

function deletemodalHandler(event) {
	modalback.style.display = 'none'
	modalback.style.marginTop = '-1000px';
	modalback.classList.remove('slide-down')
}

function modalcountHandler(event,checksize) {
	const getOperation = event.target.innerHTML
	let count = parseInt(modalcount.childNodes[0].childNodes[1].innerHTML)
	let price
	if(getOperation == '+') {  // '+' 를 클릭했을 때
		modalcount.childNodes[0].childNodes[1].innerHTML = count + 1
		count += 1
		if(checksize == true) {
			price = parseInt(modalprice.childNodes[0].innerHTML.split(' ')[0].replace(/,/g,"")) / (count-1)
			price = price * count
			modalprice.childNodes[0].innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원'
		}
		else {
			price = parseInt(modalprice.childNodes[0].innerHTML.split(' ')[0].replace(/,/g,"")) / (count-1)
			price = price * count
			modalprice.childNodes[0].innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원'
		}
	}
	else {  // '-' 를 클릭했을 때
		if(modalcount.childNodes[0].childNodes[1].innerHTML == '1') return
		modalcount.childNodes[0].childNodes[1].innerHTML = count - 1
		count -= 1
		if(checksize == true) {
			price = parseInt(modalprice.childNodes[0].innerHTML.split(' ')[0].replace(/,/g,"")) / (count + 1)
			price = price * count
			modalprice.childNodes[0].innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원'
		}
		else {
			price = parseInt(modalprice.childNodes[0].innerHTML.split(' ')[0].replace(/,/g,"")) / (count + 1)
			price = price * count
			modalprice.childNodes[0].innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원'
		}
	}
	
}

