    // 1. 단일 객체를 화면에 표현할 수 있도록 함수를 구성한다
    // 함수들을 별도로 뺀다
const getElementFromData = function(data){
    const element = document.createElement('div')
    element.classList.add('item')

    const div1 = document.createElement('div')
    const img = document.createElement('img')
    img.src = 'img/' + data.img
    img.width = '150'
    img.height = '150'
    div1.appendChild(img)

    const div2 = document.createElement('div')
    const name = document.createElement('div')
    const age = document.createElement('div')
    const gender = document.createElement('div')
    
    name.innerText = '이름 : ' + data.name
    age.innerText = '나이 : ' + data.age + '살'
    gender.innerText = '성별 : ' + data.gender

    div2.appendChild(name)
    div2.appendChild(age)
    div2.appendChild(gender)

    element.appendChild(div1)
    element.appendChild(div2)
    return element
}