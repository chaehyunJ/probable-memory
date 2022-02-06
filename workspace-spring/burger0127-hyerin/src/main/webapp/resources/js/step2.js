function passchk1() {
	if ($('#userpass').val().length < 8 || $('#userpass').val().length >= 15) {
		$('.point2').text('')
		$('.point2').text('8자리보다 크거나 15자리보다 작습니다')
	}
}

function passchk2(){ 
    if($("#userpasschk").val() == $("#userpass").val()){ 
        $(".successPwChk").text("비밀번호가 일치합니다."); 
        $(".successPwChk").css("color", "green"); 
       //  $(".successPwChk").css("font-size", "35px");
       //  $("#pwDoubleChk").val("true"); 
   }else{ 
       $(".successPwChk").text("비밀번호가 일치하지 않습니다."); 
       $(".successPwChk").css("color", "red"); 
       // $("#pwDoubleChk").val("false"); 
   } 
}