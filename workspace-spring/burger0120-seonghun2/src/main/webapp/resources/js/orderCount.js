function countHandler(event) {
            const getOperation = event.target.innerHTML
            const child_orders=event.target.parentElement
            let getCount;
            
            //가격계산을 위한 변수
            let children = child_orders.childNodes
            let vargetprice = children[5].innerText.split(' ')[1]  //2,300
            vargetprice = parseInt(vargetprice.replace(/,/g,"")) 
            
            let total

            // 2 , 2300 + 2300    2-1 
            // 3 , 4600 + 2300    3-1
            // 4 , 6900 + 2300    4-1
            // 5 , 9200 + 2300    5-1
            
            //const spanmenupriceList = document.querySelectorAll('.spanmenuprice')
            
            if(getOperation == '+') {
                getCount = event.target.nextElementSibling.innerHTML
                getCount = parseInt(getCount) + 1;
                event.target.nextElementSibling.innerHTML = getCount
                totalfunction(vargetprice)
                for(let i=getCount-1; i<getCount; i++) {
                	if(i == 1)
                		total = vargetprice + vargetprice
                	else {
                		total = vargetprice + (vargetprice / i)
                	}
                }
              
                
            }
            
            
            //1이되면 4600 - 2300  1+1
            //2가되면 6900 - 2300  2+1
            
            else {
                getCount = event.target.previousElementSibling.innerHTML
                getCount = parseInt(getCount) - 1;
               	const minusprice = -(vargetprice/(getCount+1))
               	totalfunction(minusprice)
                if(getCount <= 0) {
                    deleteHandler(event)
                }
                else {
                	for(let i=getCount-1; i<getCount; i++) {
                		total = vargetprice - (vargetprice / (getCount + 1))
                	}
                }
                event.target.previousElementSibling.innerHTML = getCount
            }
            if(getCount >= 1)
            children[5].innerHTML = '￦ ' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
          //console.log(total)
}

function imageOrderDom(event) {
	const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
    const div = document.createElement('div')
    div.classList.add('child_order')

    const menuname = document.createElement('div')
    menuname.classList.add('menuname')
    menuname.innerText= event.target.nextElementSibling.nextElementSibling.innerText

    const deleteButton = document.createElement('button')
    deleteButton.innerHTML="x"
    deleteButton.classList.add('deleteBtn')

    const plusButton = document.createElement('button')
    plusButton.classList.add('addminusBtn')
    //plusButton.classList.add('plusBtn')
    plusButton.innerHTML="+"

    const span = document.createElement('span')
    span.classList.add('orderCount')
    span.innerHTML="1"

    const minusButton = document.createElement('button')
    minusButton.classList.add('addminusBtn')
    //minusButton.classList.add('minusBtn')
    minusButton.innerHTML="-"
    
    const spanmenuprice = document.createElement('span')
    spanmenuprice.classList.add('spanmenuprice')
    spanmenuprice.innerText= event.target.nextElementSibling.innerText
    
    	
    	
    div.appendChild(deleteButton)
    div.appendChild(menuname)
    div.appendChild(plusButton)
    div.appendChild(span)
    div.appendChild(minusButton)
    div.appendChild(spanmenuprice)
    
    parent_order.appendChild(div)
    
    //console.log(parent_order.scrollHeight)
	parent_order.scroll({top: parent_order.scrollHeight, behavior: `smooth`})
}

function deleteHandler(event) {
        const parent_order = event.target.parentElement.parentElement
        const child_orders = event.target.parentElement
        let children = child_orders.childNodes
        let vargetprice = children[5].innerText.split(' ')[1]  //2,300
        vargetprice = parseInt(vargetprice.replace(/,/g,""))
        totalfunction(-vargetprice)
        parent_order.removeChild(child_orders)
}
