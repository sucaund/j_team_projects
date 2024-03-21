function resetPw() {
   
   window.location.href = "/jmResetPwForm";
}

function addhyphen() { //정규식 만족하는 전화번호에 - 추가
   $(document).on("keyup", "#m_phone", function () {
      $(this).val( $(this).val().replace(/[^0-9]/g, '')
      .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, ""));
   })
}

function regPhoneNumber(m_phone) { 
   var regExp = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
   return regExp.test(m_phone);
}

var phoneCheck = 1;

function checkPhone() { //전화번호를 바꿨을 때
   var inputed = $('#m_phone').val();
   
   $.ajax({
      success: function() {
         if(regPhoneNumber(inputed) ==  false) {
            phoneCheck = 0;
            $("#updatebtn").prop("disabled", true);
            $("#m_phone").css("background-color", "#FFCECE"); //빨강
          
            
            
         }
         else if(regPhoneNumber(inputed)== true) {
            phoneCheck = 1;
            $("#m_phone").css("background-color", "#B0F6AC"); //초록
            $("#updatebtn").prop("disabled", false);
            
         }
      }
   })
}


var emailCheck=1;

var mailRegCheck=0;

var mailauthnumber=0; //이메일 인증 번호

function changeMail() { //이메일 변경 버튼을 눌렀을 때
   $("#email_change").css("display","block");
   emailCheck=0;
   $("#updatebtn").prop("disabled", true);
}

function regEmail(m_email) {
   var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  return regExp.test(m_email);
   
}

function checkMailReg() { //메일 정규식+중복 체크
   var inputed = $('#m_email').val();
   
   $.ajax({
      data : {
         m_email : inputed 
       },
       url : "jmConfirmMemberMailSame", 
       success: function(data) {
         if(data=='1') { //이메일 중복 시
          $("#failmailunique").css("display", "block"); //중복에러메세지를 띄운다
          $("#failmailreg").css("display","none"); //중복에러메세지 말고 다른 에러 메세지를 지운다.
          $("#sendMailBtn").prop("disabled", true);
          $("#m_email").css("background-color", "#FFCECE");
          console.log('이메일 중복');
          mailRegCheck = 0; //실패
         } else if (regEmail(inputed) == false) { //이메일 양식에 실패했을 때
          $("#failmailreg").css("display","block");
          $("#failmailunique").css("display","none");
          $("#signupbtn").prop("disabled", true);
          $("#sendMailBtn").prop("disabled", true);
          $("#m_email").css("background-color", "#FFCECE");
          console.log('이메일 양식 실패');
          mailRegCheck = 0;
        } else if( data == '0' && regEmail(inputed)) { //중복되지않고, 정규식을 통과할 때
          $("#m_email").css("background-color", "#B0F6AC");
          $("#failmailreg").css("display","none");
          $("#failmailunique").css("display","none");
          mailRegCheck = 1;  
          $("#sendMailBtn").prop("disabled", false); //인증번호 보내기 버튼 누르기 가능
          console.log('중복체크까지 성공');
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

function changeAdress() { //주소 변경 버튼 누르는 순간
   $("#address_change").css("display","block");
   $("#address_old_value").innerText = '기존 주소';
}


function activateUpdateBtn() { //가입버튼 활성화
   console.log('phoneCheck'+phoneCheck);
   console.log('emailCheck'+emailCheck);
      
      if( phoneCheck==1 && emailCheck==1) {
         $("#updatebtn").prop("disabled", false);   
      }
      else  {
         $("#updatebtn").prop("disabled", true);
      }
   }



/*주소*/
function sample6_execDaumPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
               console.log('1'+addr);
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
               console.log('2'+addr);
           }


           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('sample6_postcode').value = data.zonecode;
           document.getElementById("m_address").value = addr;
           console.log('3'+addr);
       }
   }).open();
}