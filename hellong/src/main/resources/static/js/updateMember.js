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

var phoneCheck = 0;

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
   $(".email_change").css("display","block");
   $(".email_old").innerText = '기존 이메일';
   emailCheck=0;
   $("#updatebtn").prop("disabled", true);
}

function regEmail(m_email) {
   var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  return regExp.test(m_email);
   
}

function checkMailReg() { //변경 이메일에 입력을 할 때
   var inputed = $('#m_email').val();
   
   $.ajax({
      success: function() {
        if(regEmail(inputed) == false) {
          $("#sendMailBtn").prop("disabled", true);
          $("#m_email").css("background-color", "#FFCECE");
         
        } else if(regEmail(inputed) == true) {
          $("#sendMailBtn").prop("disabled", false);
          $("#m_email").css("background-color", "#B0F6AC");
        }
      }
   })
 }


   

 function sendMailNumber(){
     $(".mail_check").css("display","block"); //전송버튼 누르는 순간 메일체크 div가 드러남
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
   $(".address_change").css("display","block");
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
           var extraAddr = ''; // 참고항목 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }

           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
           if(data.userSelectedType === 'R'){
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraAddr !== ''){
                   extraAddr = ' (' + extraAddr + ')';
               }
               // 조합된 참고항목을 해당 필드에 넣는다.
               document.getElementById("sample6_extraAddress").value = extraAddr;
           
           } else {
               document.getElementById("sample6_extraAddress").value = '';
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('sample6_postcode').value = data.zonecode;
           document.getElementById("m_address").value = addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById("sample6_detailAddress").focus();
       }
   }).open();
}