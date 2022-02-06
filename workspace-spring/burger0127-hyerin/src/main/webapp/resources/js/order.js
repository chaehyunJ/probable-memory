function nextSildeHandler(event) {
            if(check <=0 && check > -(showContainCount-1) ) { //check의 최대는 -(showContain갯수 -1)
                check -= 1
                nowPic = check * 1000
                showFrame.style.transform='translateX('+nowPic+'px)';
                console.log(check)
            }
            else {  //-2...
                check = 0;
                nowPic = check
                showFrame.style.transform='translateX('+nowPic+'px)';
                console.log(check)
            }
}

function beforeSildeHandler(event) {
    if(check >= 0) {  //젤 처음일때부터 before를 누르면
        if(check == 0) check = -(showContainCount-1); {
        nowPic = check * 1000
        showFrame.style.transform='translateX('+nowPic+'px)';
        }
    }
    else {
        if(check < 0) {
            check += 1;
            nowPic = check * 1000
            showFrame.style.transform='translateX('+nowPic+'px)';
        }
    }
}

function imageHandler() {
	const url = cpath + '/order'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
	})
}

//function render(target, dom) {
//	target.innerHTML = dom
//}


