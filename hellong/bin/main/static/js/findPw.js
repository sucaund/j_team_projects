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
            $("#m_email").css("background-color", "#FFCECE");
            $("#failmailreg").css("display", "block");
            
            
         } else if(regEmail(inputed) == true) {
            $("#sendMailBtn").prop("disabled", false);
            $("#m_email").css("background-color", "#B0F6AC");
            $("#failmailreg").css("display", "none");
         }
      }
   })
}

var mailauthnumber=0; //이메일 인증번호

function sendMailNumber(){ //인증번호받기 버튼 눌렀을 때
$("#mail_check").css("display","block"); //버튼 보내는 순간 메일체크 div가 드러남
$.ajax({
url:"/jmMailCheck",
type:"post",
crossDomain: true,
headers: {  'Access-Control-Allow-Origin': 'http://The web site allowed to access' },
dataType:"json",
data:{"m_email" : $("#m_email").val()},
success: function(data){
    alert("비밀번호 확인용 인증번호 발송");
/*            console.log("data"+data);*/
    mailauthnumber=data;
/*            console.log("mailauthnumber"+mailauthnumber);*/
    } /* 받은 인증번호 여기에 넣음 */
})
}

function confirmMailNumber(){  //번호 두개 체크 후, 일치할 시 비밀번호찾기버튼 활성화

 var input_number = $("#input_mail_number").val(); //사용자가 입력한 인증번호

$("#checkpwbtn").css("display", "block");


/*	console.log("number"+number);
console.log("mailauthnumber"+mailauthnumber);
console.log(check_mail);*/

if (input_number == mailauthnumber) {
    alert("인증되었습니다.");
    $("#checkpwbtn").prop("disabled", false);   

} else {
        alert("인증번호가 일치하지 않습니다");
        $("#checkpwbtn").prop("disabled", true);   
    }
}

