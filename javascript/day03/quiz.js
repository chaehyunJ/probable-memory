function getDataArray(){
    const arr = [
        {
            img : "돈까스.png",
            name : '돈까스',
            price : '16900',
            cate : '일식'
        },
        {
            img : "떡볶이.jpg",
            name : '떡볶이',
            price : '32000',
            cate : '한식'
        },
        {
            img : "로제떡볶이.jpg",
            name : '로제떡볶이',
            price : '25000',
            cate : '한식'
        },
        {
            img : "어묵탕.jpg",
            name : '어묵탕',
            price : '16000',
            cate : '일식'
        },
        {
            img : "쫄면.jpg",
            name : '쫄면',
            price : '15000',
            cate : '중식'
        }
    ]
    return arr
}

function getDom(arr){
    // console.log(arr)
    // arr.sort((a,b) => a.name > b.name ? 1 : -1)
    
    // const item = document.createElement('div')
    // item.classList.add('item')

    // for(key in arr){
    //     const value = arr[key]
    //     const div = document.createElement('div')
    //     div.classList.add(key)
    //     if(key == 'img'){
    //         const img = document.createElement('img')
    //         img.src = 'img/' + arr.img
    //         img.height = 200
    //         img.width = 280
    //         div.appendChild(img)
    //     }
    //     else{
    //         div.innerText = key + ':' + value
    //     }
    //     item.appendChild(div)
    // }
    // return item

    // let dom = ''

    // arr.forEach(dto => {
    //     dom += `<div class="item">`
    //     doo
    // })
    let dom = ''
    arr.forEach(dto => {
        dom += `<div class="item">`
        dom += `<div><img src="img/${dto.img}" style="width : 100px;"></div>`
        dom += `<div><strong>${dto.name}</strong></div>`
        dom += `<div>가격 : ${dto.price}</div>`
        dom += `<div>분류 : ${dto.cate}</div>`
        dom += `</div>`
    })
    return dom
}



function render(target, dom){
    target.innerHTML = ''

    console.log(typeof dom)

    if(typeof dom == 'string'){
        target.innerHTML += dom
    }
    else{
    // console.log(arr)
    // console.log(dom)
        // arr.forEach(fd =>{
        //     const fd1 = getDom(fd)
        //     target.appendChild(fd1)
        // })
        target.appendChild(dom)
    }
}

function filterHandler(event){
    console.log(event.target)
    const cateFilterArray = Array.from(document.querySelectorAll('.root > .left input[name="cateFilter"]:checked')).map(v => v.value)
    const priceFilterArray = Array.from(document.querySelectorAll('.root > .left input[name="priceFilter"]:checked')).map(v => +v.value)
    const sort = document.querySelector('input[name="sort"]:checked')
    
    console.log(cateFilterArray)
    console.log(priceFilterArray)
    console.log(sort)

    // const ob = {
    //     priceFilter : null,
    //     cateFilter : null
    // }

    // checkedFilter.forEach(e => ob[e.name] = e.value)
    // console.log(ob)

    // const filter1 = checkedFilter.map(v => +v.value)
    // console.log(filter1)

    // const filter2 = checkedFilter.map(v => v.value)
    // console.log(filter2)
    // right.innerHTML = ''

    // if(ob.priceFilter == '0'){
    //     arr.forEach(dto =>{
    //         const div = getDom(dto)
    //         right.appendChild(div)
    //     })
    // }
    const result = arr.filter(dto =>{

        // const flag1 = +ob.priceFilter <= dto.price && dto.price < +ob.priceFilter + 10000
        // const flag2 = ob.cateFilter == dto.cate

        const flag1 = cateFilterArray.includes(dto.cate)
        const flag2 = priceFilterArray.includes(Math.floor(dto.price/10000) * 10000)
     
        let flag = true

        if(cateFilterArray != 0)  flag = flag && flag1
        if(priceFilterArray != 0)   flag = flag && flag2
        
        return flag
    })
          
    if(sort != null){
        switch(sort.value){
        case 'price':
            result.sort((a,b) => +a[sort.value] > +b[sort.value] ? 1 : -1)
            break
        case 'name':
            result.sort((a,b) => a[sort.value] > b[sort.value] ? 1: -1)
            break
        }
        

    }

    render(right, getDom(result))

    
}