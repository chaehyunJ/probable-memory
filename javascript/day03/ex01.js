function filterHandler(event){
    console.log(event.target)
    
    // 클릭할 때마다 선택되어 있는 필터 항목만 가져온다
    const checkedFilter = document.querySelectorAll('.left input:checked')
    // console.log(checkedFilter)

    // checkedFilter.forEach(element => console.log(element.dataset))

    // 조건식을 조금 더 상세하게 만들자
    



    //  서로 다른 두 조건을 묶어서 filter함수에 전달하기 위한 객체
    const ob = {  
        // null일때 필터를 하려고 
        ageFilter : null,   
        genderFilter : null
    }

    // for(let i = 0; i < a.length; i++)
    // a[i].name  = a[i].value
    checkedFilter.forEach(e => ob[e.name] = e.value)
    console.log(ob)
    // arr가 참조가 된다
    // 10 <= age < 20
    // 20 <= age < 30
    // 30 <= age < 40

    // ArrayList<BookDTO> dto = dao.select();
    const filterArr = arr.filter(dto => {
        // let flag = true
        // let age = null
        // let gender = null
    
        // switch(event.target.name){
        //     case 'ageFilter':
        //         const age = +event.target.dataset.age
        //         flag = flag && (age <= dto.age && dto.age < age + 10)
        //         break
        //     case 'genderFilter':
        //         gender = event.target.dataset.gender
        //         flag = flag && dto.gender == gender
        //         break
        // }
        // return flag
        let flag = true
        
        // 10 <= dto.age < 20
        // 20 <= dto.age < 30
        // 30 <= dto.age < 40
        const flag1 = +ob.ageFilter <= dto.age && dto.age < +ob.ageFilter + 10
        const flag2 = ob.genderFilter == dto.gender

        // null대신undefined를 사용해도 된다
        if(ob.ageFilter != null)          flag = flag && flag1
        if(ob.genderFilter != null)       flag = flag && flag2

        return flag
    })

    checkedFilter.forEach(filter => {
        console.log(filter.dataset)
    })

    tbody.innerHTML = ''
    filterArr.forEach(dto => {
        const tr = convert(dto)
        tbody.appendChild(tr)
    })
}