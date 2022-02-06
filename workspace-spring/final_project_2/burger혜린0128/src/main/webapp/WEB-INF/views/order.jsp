<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${cpath}/resources/css/order.css" rel="stylesheet" type="text/css">
</head>
<body>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="${cpath }/resources/js/order.js"></script>
<script src="${cpath }/resources/js/orderCount.js"></script>
<script src="${cpath }/resources/js/totalprice.js"></script>
<script src="${cpath }/resources/js/payment.js"></script>
<script src="${cpath }/resources/js/modalfunction.js"></script>
    <div class="modalback">
    	<div class="modalcontent" style="width: 850px;">
    	  <div style="display: flex;">
	    	    <div>
	    		 	<div class="burgerimg" style="width: 360px; height: 300px; align-items: center;"></div>
	    		</div>
    		    <div class="npcinputparent" style="width: 300px; height:300px;" >
    		    	<div class="modalname"></div>
	    		 	<div class="modalprice" style="text-align: right;"></div>
	    		 	<div class="modalcount" style="display: flex; justify-content: space-between;"></div>
    		    	<div class="inputorderdiv">
    		    		<div class="sizeselect"><label id="input_check"><input class="sizeinput" id="input_check1" type="checkbox">사이즈업그레이드[+700]</label><p>700원을 추가하시면 감자튀김과 콜라를 SizeUp</p></div>
    		 		    <div class='inputorder'></div>  
    		 		    <div class='inputordernot'></div>
    		 		</div> <!-- 담기버튼 -->
    		    </div>
    		    <div class="deletemodal" style="height: 300px;">
    		    	<button class="deletemodalbtn">x</button>
    		    </div>
    	  </div>
    	</div>
    </div>
		<ul class="menuparent">
			<li><a href="${ cpath }"><img class="main-logo" src="data:image/png;base64,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" style="width: 65px; height: 50px;"></a></li>
	        <li class="selectMenu showColor" data-cate="mac">맥모닝</li>
	        <li class="selectMenu" data-cate="macSet">맥모닝 세트</li>
	        <li class="selectMenu" data-cate="burger">버거</li>
	        <li class="selectMenu" data-cate="burgerSet">버거 세트</li>
	        <li class="selectMenu" data-cate="side">스낵＆사이드</li>
	        <li class="selectMenu" data-cate="drink">음료</li>
	        <li class="selectMenu" data-cate="dessert">디저트</li>
	        <li class="selectMenu" data-cate="mcafe">맥카페</li>
	    </ul>
    <div class="show">
    	<div class="show-frame"></div>
    	<button class="slide-before"><</button>
        <button class="slide-next">></button>
    </div>
    
    <!-- 주문목록 -->
    <div class="grand_order">
	    <div class="parent_order"></div>
	    <div class="totalprice">
	    	<div class="deleteall">전체  삭제</div>
	    	<div class="productcount">선택한 상품   <span class="productcount1" style="color: #f7533e;">0</span>개</div>
	    	<div>
		    	<div class="payment">결제하기</div>
	    	</div>
	    </div>
    </div>
    <div class="clientrequest">
	    <form>
	    <p style="margin-left: 35px;">
	    	<label id="radio"><input type="radio" class="notreq" name="clientradio" onclick="notreq()"checked>요청사항 없음</label>
	    	<label id="radio"><input type="radio" class="isreq" name="clientradio" onclick="isreq()">요청사항 있음</label>
		</p>
	    	<textarea class="clientrqform hidden" placeholder="요청사항을 입력해주세요" cols="50" rows="3"></textarea>
	    </form>
	</div>
   <script>
   	   const login = '${login}'
   	   const userid = '${login.userid}'
   	   const address = '${login.address}'
   	   const phone = '${login.phone}'
   	   
   	   const cpath = '${cpath}'
   	   
	   const modalback = document.querySelector('.modalback')
	   const modalcontent = document.querySelector('.modalcontent')
	   const modalcount = document.querySelector('.modalcount')
	   const modalprice = document.querySelector('.modalprice')
	   const modalname = document.querySelector('.modalname')
	   const modalcountchild = document.querySelector('.modalcountchild')
	   const inputorderdiv = document.querySelector('.inputorderdiv')
	   const inputorder = document.querySelector('.inputorder')
	   const inputordernot = document.querySelector('.inputordernot')
	   const deletemodalbtn =document.querySelector('.deletemodalbtn')
	   const burgerimg = document.querySelector('.burgerimg')
	   const before = document.querySelector('.slide-before')
	   const next = document.querySelector('.slide-next')
	   const showFrame = document.querySelector('.show-frame')
	   const menuSelectList = document.querySelectorAll('.selectMenu')
	   const parent_order = document.querySelector('.parent_order')
	   const totalprice = document.querySelector('.totalprice')
	   const payment = document.querySelector('.payment')
	   const deleteall = document.querySelector('.deleteall')
	   const productcount1 = document.querySelector('.productcount1')
	   const clientradio1 = document.querySelector('.notreq')
	   const clientradio2 = document.querySelector('.isreq')
	   const clientrqform = document.querySelector('.clientrqform')
	   const sizeselect = document.querySelector('.sizeselect')
	   const sizeinput = document.querySelector('.sizeinput')
	   const surangspan = document.querySelector('.surangspan')
	   const inputcheck = document.getElementById('input_check1')
	   
	 
	   window.onload = macImageHandler
	   menuSelectList.forEach(menu=>{
		   menu.onclick = function(event) {
			  menuSelectList.forEach(menu=>{
				  menu.classList.remove("showColor")
			  })
			  event.target.classList.add("showColor")
			  if(menu.dataset.cate == 'mac')
				  macImageHandler()
			  else if(menu.dataset.cate =='macSet')
				  macSetImageHandler()
			  else if(menu.dataset.cate =='burger')
				  burgerImageHandler()
			  else if(menu.dataset.cate == 'burgerSet')
				  burgerSetImageHandler()
			  else if(menu.dataset.cate == 'side')
				  sideImageHandler()
			  else if(menu.dataset.cate == 'drink')
				  drinkImageHandler()
			  else if(menu.dataset.cate == 'mcafe')
				  mcafeImageHandler()
			  else
				  dessertImageHandler()
		   }
	   })
	   next.onclick = nextSildeHandler
	   before.onclick = beforeSildeHandler
	   parent_order.onclick = function(event) {
           if(event.target.classList == 'deleteBtn') {
               deleteHandler(event)
           }
           else if(event.target.classList == 'addminusBtn') {
               console.log(event.target)
               countHandler(event)    
           }
           else {
               return;
           }
       }
	   deleteall.onclick = deleteallHandler
	   deletemodalbtn.onclick = deletemodalHandler
	   payment.onclick = paymentHandler
	   function notreq() {
		   clientrqform.classList.add('hidden')
	   }
	   function isreq() {
		   if(clientrqform.classList.contains('hidden')) clientrqform.classList.remove('hidden')
	   }
	   
	   sizeinput.onclick = function(event) {
		   let count = parseInt(modalcount.childNodes[0].childNodes[1].innerHTML)
		   let sizeup = inputcheck.checked
		   let price = parseInt(modalprice.childNodes[0].innerHTML.split(' ')[0].replace(/,/g,""))
		   console.log('참이니: ' + event.target.classList)
		   if(event.target.classList=='sizeinput' && sizeup == false) { //체크를 해제 했을 때 기존값이 사라지고 700원이 감소한값
			  console.log('해제')
			   //1. 수량이 3일 떼 체크를 해제하면 price / count  
			   modalprice.childNodes[0].innerHTML = ((price / count)-700).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원' 
			   modalcount.childNodes[0].childNodes[1].innerHTML = 1
		   }
		   if(event.target.classList=='sizeinput' && sizeup == true) { //체크를 했을 때 기존값이 사라지고 700원이 감소한값
			   console.log('체크')
			   modalprice.childNodes[0].innerHTML = ((price / count) + 700).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원' 
			   //modalprice.childNodes[0].innerHTML = (((count * price) - ((count - 1) * price) + 700)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원' 
			   modalcount.childNodes[0].childNodes[1].innerHTML = 1
		   }
	   }
	   
	   //모달안의 +, - 클릭 시
	   modalcount.onclick = function(event) {
		   const sizeup = document.getElementById("input_check").checked
		   if(event.target.classList == 'modaladdminusBtn1')
              modalcountHandler(event,sizeup)
       }
	   inputorder.onclick = inputorderHandler
	   inputordernot.onclick = deletemodalHandler
	</script>
</body>
</html>