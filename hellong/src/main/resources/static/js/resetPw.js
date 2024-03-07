function regPassword(m_pw) { //8~16자 영문, 숫자 조합
    var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
    return regExp.test(m_pw);
 }

 function checkPwReg() { //비번 체크
    var inputed = $('#m_pw').val();
    
    $.ajax({
       success: function() {
          if(regPassword(inputed) == false || inputed.length > 16) {
             $("#signupbtn").prop("disabled", true);
             $("#signupbtn").css("background-color", "#aaaaaa");
             $("#m_pw").css("background-color", "#FFCECE");
            
             pwRegCheck = 0; //실패
          } else if(regPassword(inputed) == true) {
             $("#m_pw").css("background-color", "#B0F6AC");
         
             pwRegCheck = 1; //성공
          }
       }
    })
 }

 function checkPwSame() { /* 비밀번호 일치 확인 */
 var inputed = $('#m_pw_check').val();
 var inputed1 = $('#m_pw').val();
 
 $.ajax({
    success: function() {
       if(inputed != inputed1) {
          $("#signupbtn").prop("disabled", true);
          $("#signupbtn").css("background-color", "#aaaaaa");
          $("#m_pw_check").css("background-color", "#FFCECE");
        
          pwSameCheck = 0;
       } else if(inputed == inputed1) {
          $("#m_pw_check").css("background-color", "#B0F6AC");
        
          pwSameCheck = 1;
       }
    }
 })
}

function activateSignUpBtn() { //가입버튼 활성화
    console.log('idCheck'+idCheck);
    console.log('pwRegCheck'+pwRegCheck);
    console.log('pwSameCheck'+pwSameCheck);
    console.log('phoneCheck'+phoneCheck);
    console.log('emailCheck'+emailCheck);
       
       if( idCheck == 1 && pwRegCheck == 1  && pwSameCheck == 1 && phoneCheck==1 && emailCheck==1) {
          $("#signupbtn").prop("disabled", false);   
          $("#signupbtn").css("background-color", "#B0F6AC");
       }
       else  {
          $("#signupbtn").css("background-color", "#aaaaaa");
          $("#signupbtn").prop("disabled", true);
       }
    }