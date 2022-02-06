function totalfunction(counter) {
	let priceArr = []
	let total = 0
	//
	parent_order.childNodes.forEach(dto=> {
		let price = dto.childNodes[5].innerText.split(' ')[1]  // [\, 2,300] 2,300만 자르기
		price = parseInt(price.replace(/,/g,"")) //2300
		priceArr.push(price)
	})
	if(counter != null) {
		priceArr.push(counter)
	}
//console.log(priceArr)
	for(let i = 0; i<priceArr.length; i++) {
		total += priceArr[i]
	}
	console.log(priceArr)
	getTotalPriceDom(total)
	
}

function getTotalPriceDom(total) {
	console.log(total)
	if(total == 0) {
		totalnotnull.innerHTML = ''
		 total0.innerHTML = "결제하기"
	}
	else {
		total0.innerHTML = ''
		totalnotnull.innerHTML = total + '원 결제하기'
	}
}

function payment(event) {
	
}

