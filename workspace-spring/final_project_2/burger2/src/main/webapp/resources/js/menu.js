function getJson(table){
	const url = cpath + '/ajaxMenu/' + table
	const opt = {
		method : 'GET',
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		getMenuList(table,json)
	})
}
function getMenuList(table,json){
	if(table.includes('MCMORNING'))
		getMcmorning(json)
	else if(table.includes('BURGER'))
		getBurger(json)
	else if(table.includes('SIDE'))
		getSide(json)
	else if(table.includes('MCCAFE'))
		getMccafe(json)
	else if(table.includes('DRINK'))
		getDrink(json)
	else
		getDessert(json)
}
function getMcmorning(json){
	let menu = ``
	let top = ``
	json.tlist.forEach(dto =>{
		top += `<img class="menu-img" src="`+dto.MCMORNING_TABLE_BACKGROUND+`">`
		top += `<h1 class="menu-title">맥모닝</h1>`
		top += `<p class="menu-text">`+dto.MCMORNING_TABLE_DESCRIPTION+`</p>`
		top += `<ul class="menu-ul">`
		top += 		`<li><a href="${cpath}">Home</a></li>`
        top +=		`<li>•</li>`
        top += 		`<li>Menu</li>`
        top += 		`<li>•</li>`
        top +=		`<li>맥모닝</li>`
        top += `</ul>`
		})
	topList.innerHTML = top
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item">`
		menu += `<div class="menu-product-img"><img src="`+dto.MCMORNING_IMAGE+`"></div>`
		menu += `<div class="menu-product-name">`+dto.MCMORNING_NAME+`</div>`
		menu += `</div>`
		})
	menuList.innerHTML = menu
}
function getBurger(json){
	let menu = ``
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item">`
		menu += `<div class="menu-product-img"><img src="`+dto.BURGER_IMAGE+`"></div>`
		menu += `<div class="menu-product-name">`+dto.BURGER_NAME+`</div>`
		menu += `</div>`
		})
	menuList.innerHTML = menu
}
function getSide(json){
	let menu = ``
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item">`
		let iArr = dto.SIDE_IMG.split(' // ')
		if(iArr.length == 1){
			menu += `<div class="menu-product-img"><img src="`+iArr[0]+`"></div>`			
		}
		else{			
			menu += `<div class="menu-product-img"><img src="`+iArr[1]+`"></div>`			
		}
		let nArr = dto.SIDE_NAME.split(' // ')
		if(nArr.length == 1){
			menu += `<div class="menu-product-name">`+nArr[0]+`</div>`								
		}
		else{
			let nsArr = nArr[1].split(' ')
			nsArr.pop()
			menu += `<div class="menu-product-name">`+nsArr.join(' ')+`</div>`						
		}
		menu += `</div>`
	})
	menuList.innerHTML = menu
}
function getMccafe(json){
	let menu = ``
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item">`
		let iArr = dto.MCCAFE_IMG.split(' // ')
		if(iArr.length == 1){
			menu += `<div class="menu-product-img"><img src="`+iArr[0]+`"></div>`			
		}
		else{			
			menu += `<div class="menu-product-img"><img src="`+iArr[1]+`"></div>`			
		}
		let nArr = dto.MCCAFE_NAME.split(' // ')
		if(nArr.length == 1){
			menu += `<div class="menu-product-name">`+nArr[0]+`</div>`								
		}
		else{
			let nsArr = nArr[1].split(' ')
			nsArr.pop()
			menu += `<div class="menu-product-name">`+nsArr.join(' ')+`</div>`				
		}
		menu += `</div>`
	})
	menuList.innerHTML = menu
}
function getDrink(json){
	let menu = ``
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item">`
		let iArr = dto.DRINK_IMG.split(' // ')
		if(iArr.length == 1){
			menu += `<div class="menu-product-img"><img src="`+iArr[0]+`"></div>`			
		}
		else{			
			menu += `<div class="menu-product-img"><img src="`+iArr[1]+`"></div>`			
		}
		let nArr = dto.DRINK_NAME.split(' // ')
		if(nArr.length == 1){
			let nsArr = nArr[0].split('M')
			menu += `<div class="menu-product-name">`+nsArr[0]+`</div>`						
		}
		else{
			nsArr = nArr[1].split(' ')
			nsArr.pop()
			menu += `<div class="menu-product-name">`+nsArr.join(' ')+`</div>`				
		}
		menu += `</div>`
	})
	menuList.innerHTML = menu
}
function getDessert(json){
	let menu = ``
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item">`
		menu += `<div class="menu-product-img"><img src="`+dto.DESSERT_IMG+`"></div>`
		menu += `<div class="menu-product-name">`+dto.DESSERT_NAME+`</div>`
		menu += `</div>`
		})
	menuList.innerHTML = menu
}

	

	