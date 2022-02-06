function render(target, dom){
	console.log('render 호출 !!')
	
	target.innerHTML = dom 
}

function getDom(json){				// 넘어오는 json 객체가 배열이다
	console.log('getDom 호출 !!')
	console.log(json)
	
	let tag = `<table border="1" cellpadding="7" cellspacing="0">`

	tag += `<tr>`
	for(key in json[0]){			// 컬럼 이르 첫줄만 작성하기
		tag += `<th>${key}</th>`
	}
	tag += `</tr>`
		
	json.forEach(dto =>{			// value 호출하기
		tag += `<tr>`
		for(key in dto){
			const value = dto[key]
			tag += `<td>${ value }</td>`
		}
		tag += `</tr>`
	})
	
	tag += `</table>`
	
	console.log(tag)
	
	return tag
	
}