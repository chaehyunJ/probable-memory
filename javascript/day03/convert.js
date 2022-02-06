function convert(dto){
    const tr = document.createElement('tr')
    // const name = document.createElement('td')
    // const age = document.createElement('td')
    // const gender = document.createElement('td')


    // name.innerText = dto.name
    // age.innerText = dto.age
    // gender.innerText = dto.gender

    // tr.appendChild(name)
    // tr.appendChild(age)
    // tr.appendChild(gender)

    for(key in dto){
        const td = document.createElement('td')
        tr.appendChild(td)
      
        td.innerText = dto[key]
    }
    return tr;
}