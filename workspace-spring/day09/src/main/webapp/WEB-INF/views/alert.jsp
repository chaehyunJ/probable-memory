<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div id="alert" class="jcce aice ffc" 
    style="border: 2px solid black;
           box-shadow: 5px 5px grey;
           width: 500px;
           height: 300px;
           margin: 50px auto;
           border-radius: 25px;
           opacity: 0;
           position: absolute;
           top: 50%;
           transition-duration: 1.5s">
   <div style="font-size: 16px; font-weight: bold; margin: 30px;">
      ${msg }
   </div>
   <button class="btn">확인</button>
</div>

<script>
   const cpath = '${cpath}'
   const msg = '${msg}'
   const url = '${url}'
   const alert = document.getElementById('alert')
   
   const clientWidth = document.body.clientWidth
   const alertWidth = alert.clientWidth
   const left = (clientWidth / 2) - (alertWidth / 2)
   
   window.onload = function(event) {
      alert.style.left = left + 'px'
      console.log('onload !!')
      alert.style.opacity = 1;
      alert.style.top = '30%'
   }
   document.querySelector('button').onclick = function() {
      if(url == '') {
          history.go(-1);
       }
       else {
          location.href = cpath + '/' + url
       }
   }
   
//    alert(msg)
//    if(url == '') {
//       history.go(-1);
//    }
//    else {
//       location.href = cpath + '/' + url
//    }
</script>

</body>
</html>