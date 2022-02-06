// 1. 함수만들기
// 2. 매개변수 형식 맞춰주기

function getData(){
    const arr = [
        {name : '이지은', age : 29, gender : '여성'},
        {name : '홍지노', age : 41, gender : '남성'},
        {name : '나단비', age : 7, gender : '여성'},
        {name : '해적왕', age : 18, gender : '남성'},
        {name : '이병건', age : 18, gender : '남성'},
    ]
    return arr
}

function getDom(data){      // 데이터를 받아서 문자열 태그 형식으로 반환
    let dom = ''
    data.sort((a,b) => a.age > b.age ? 1: -1)
    data.forEach(dto => {
        dom += `<tr><td>${ dto.name}</td><td>${ dto.age }</td><td>${ dto.gender}</td></tr>`
    })
    return dom
}

function render(target, dom){   // 대상과 dom을 받아서 대상에 dom을 그리기
    // 일단 안에 다 비우고
    target.innerHTML = ''
    // 자료형에 따라서 다르게 처리하기
    
    // string 이니까 innerHTML을 사용

    console.log(typeof dom)

    if(typeof dom == 'string'){
        target.innerHTML += dom
    }
    // object 타입이니까 appendChild를 사용
    else{
        target.appendChild(dom)
    }
    
}

function filterHandler(event){
    // console.log(data)
    // console.log(tbody)
    // console.log(event.target)
    const checkedFilterList = document.querySelectorAll('.left input:checked')
    const checkedFilterArray = Array.from(checkedFilterList).map(v => +v.value)

    if(checkedFilterArray == 0){
        render(tbody, getDom(data))
        return
    }
    const filterArr = data.filter(dto => {
        // 나이를 정수형으로 10으로 나누어서 다시 10을 곱한 값(10의 자리수)
        const age = Math.floor(dto.age/10) * 10
        
        // switch case 역할을 해준다
        // 입력한 value를 그대로 넣어서 체크한다
        return checkedFilterArray.includes(age)
    }) 

 

    render(tbody, getDom(filterArr))

}