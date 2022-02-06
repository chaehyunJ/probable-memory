function filterHandler(event){
    // console.log('ex02 filterHandler')

    // const checkFilter = document.querySelectorAll('.left input:checked')
    // Array.from하면 진짜 배열로 바꿔준다
    // NodeList => Array로 변경
    const checkFilter = Array.from(document.querySelectorAll('.left input:checked'))
    console.log(checkFilter)

    // NodeList 가 아닌 Array의 함수 중에서 map을 사용한다
    // 객체의 배열이 있을 때, 객체의 특정 속성만 추출하여 새로운 간단한 배열로 반환한다

    // Set<> set = get(i).keyset()
    // set.value
    const filter = checkFilter.map(v => +v.value)
    console.log(filter)

    // 내용 지우는 건 한번만
    tbody.innerHTML = ''

    if(filter == 0){
        arr.forEach(dto => {
            const tr = convert(dto)
            tbody.appendChild(tr)
        })
        return 
    }
    
    // 내용 지우는 건 한번만
    // tbody.innerHTML = ''


    // const filterArr = arr.filter(dto => {
    //     let flag = true
    //     filter.forEach(age => {
    //         flag = flag && (+age <= dto.age && dto.age < +age + 10)
    //     })
    //     return flag
    // })

    //  체크된 조건 개수만큼 반복
    filter.forEach(e => {
        console.log(e)
        const filterArr = arr.filter(dto => e <= dto.age && dto.age < e + 10)

        // appendChild는 조건별로 여러번 수행하기
        filterArr.forEach(dto => {
            const tr = convert(dto)
            tbody.appendChild(tr)
        })
    })

    // console.log(filterArr)

}

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