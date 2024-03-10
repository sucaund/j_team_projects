function resetPw() {
   
   window.location.href = "/jmResetPwForm";
}

function addhyphen() { //정규식 만족하는 전화번호에 - 추가
   $(document).on("keyup", "#m_phone", function () {
      $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); 
   })
}

function regPhoneNumber(m_phone) { //전화번호, 자동으로 - 붙여줌
   var regExp = /^01(?:0|1|[6-9])-(?:\d{3})-\d{5}$/;
   return regExp.test(m_phone);
}

var phoneCheck = 0;

function checkPhone() { //전화번호 체크(정규식)
   var inputed = $('#m_phone').val();
   
   $.ajax({
      success: function() {
         if(regPhoneNumber(inputed) ==  false) {
            $("#m_phone").css("background-color", "#FFCECE");
          
            inputed = $('#m_phone').val();
            phoneCheck = 0;
         }
         else if(regPhoneNumber(inputed)== true) {
            $("#m_phone").css("background-color", "#B0F6AC");
        
            phoneCheck = 1;
         }
      }
   })
}


var emailCheck=1;

var mailRegCheck=0;

var mailauthnumber=0; //이메일 인증 번호

function changeMail() {
   $("#email_change").css("display","block");
   $("#email_old_value").innerText = '기존 이메일';
   emailCheck=0;
}

function regEmail(m_email) {
   var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  return regExp.test(m_email);
   
}

function checkMailReg() { //메일 정규식 체크
   var inputed = $('#m_email').val();
   
   $.ajax({
      success: function() {
        if(regEmail(inputed) == false) {
          $("#sendMailBtn").prop("disabled", true);
          $("#sendMailBtn").css("background-color", "#aaaaaa");
          $("#m_email").css("background-color", "#FFCECE");
         
          mailRegCheck = 0; //실패
        } else if(regEmail(inputed) == true) {
          $("#sendMailBtn").prop("disabled", false);
           $("#sendMailBtn").css("background-color", "#B0F6AC");
          $("#m_email").css("background-color", "#B0F6AC");
          mailRegCheck = 1; //성공
        }
      }
   })
 }


   

 function sendMailNumber(){
     $("#mail_check").css("display","block"); //전송버튼 누르는 순간 메일체크 div가 드러남
     $.ajax({
         url:"/jmMailCheck",
         type:"post",
         crossDomain: true,
         headers: {  'Access-Control-Allow-Origin': 'http://The web site allowed to access' },
         dataType:"json",
         data:{"m_email" : $("#m_email").val()},
         success: function(data){
             alert("인증번호 발송");
             mailauthnumber=data;
            } /* 받은 인증번호가 여기(보이지 않는 더미)에 들어감 */
     })
 }

 function confirmMailNumber(){
     var input_number = $("#input_mail_number").val();

     if(input_number == mailauthnumber){
         alert("인증되었습니다.");
         emailCheck=1;
     }else{
         alert("번호가 다릅니다.");
         emailCheck=0;
     }
 }

function changeAdress() {
   $("#address_change").css("display","block");
   $("#address_old_value").innerText = '기존 주소';
}


function activateUpdateBtn() { //가입버튼 활성화
   console.log('phoneCheck'+phoneCheck);
   console.log('emailCheck'+emailCheck);
      
      if( phoneCheck==1 && emailCheck==1) {
         $("#updatebtn").prop("disabled", false);   
         $("#updatebtn").css("background-color", "#B0F6AC");
      }
      else  {
         $("#updatebtn").css("background-color", "#aaaaaa");
         $("#updatebtn").prop("disabled", true);
      }
   }