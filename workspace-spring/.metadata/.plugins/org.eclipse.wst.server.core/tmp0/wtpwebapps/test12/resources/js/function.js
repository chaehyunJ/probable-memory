//function covid(){
//	const url = cpath + '/covid'
//	const opt = {
//		method : 'get'
//	}
//	fetch(url, opt)
//	.then(resp => resp.json())
//	.then(json => {
//		console.log(json)
//		console.log(json.response.body.items.item)
//
// 		const arr = json.response.body.items.item
//		
// 		const result = arr.filter(arr => arr.gubun == '부산')
//		
// 		const result1 = result.map(v => {
// 			return {
// 				incDec : v.incDec,
// 				gubun : v.gubun
// 			}
// 		})
//		
// 		console.log("check : ", result1)
//}