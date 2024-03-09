
function regPassword(m_pw) { //8~16자 영문, 숫자 조합
    var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
    return regExp.test(m_pw);
 }

//  function checkPwSame() { /* 비밀번호 일치 확인 */
//        if(inputed == inputed2) {
//          pwSameCheck=true;
//        } else if(inputed != inputed2) {
//          pwSameCheck=false;
//        }
//     }

function pwSameCheck(m_pw,m_pw_check) {
   if (m_pw == m_pw_check) {
      return true;
  } else {
      return false;
  }
}


function checkPw() { 
    var inputed = $('#m_pw').val();
    var inputed2 = $('#m_pw_check').val();

$.ajax({ //1.중복찾기
   data : {
      m_pw : inputed //입력한 값을 m_pw라는 변수에 담음
   },
   url : 'jmConfirmMemberPw', 
   success : function(data) {
      console.log('ajax성공');
      console.log(data);
      if(data=='duple') { //비밀번호가 중복되었을 때
         console.log('중복');
         console.log(data);
         $("#failPwDuple").css("display", "block"); //에러메세지를 띄운다
         $("#failPwReg").css("display","none"); //중복에러메세지 말고 다른 에러 메세지를 지운다.
         $("#failPwSame").css("display","none");
         $("#checkpwbtn").prop("disabled", true);
         $("#checkpwbtn").css("background-color", "#aaaaaa");
         $("#m_pw").css("background-color", "#FFCECE"); 

      } else if(data == 'ok') { //비밀번호가 중복이 아닐떄
         console.log('중복 아님');
         console.log(data);
         if(regPassword(inputed) == false) { //정규식 미만족

         $("#failPwReg").css("display","block");
         $("#failPwDuple").css("display","none");
         $("#failPwSame").css("display","none");
         $("#checkpwbtn").prop("disabled", true);
         $("#checkpwbtn").css("background-color", "#aaaaaa");
         $("#m_pw").css("background-color", "#FFCECE");

      } else if (regPassword(inputed) == true) { //중복이 아니면서 정규식을 만족할 때
         console.log('중복 아니면서 정규식 만족');
         console.log(data);
         // console.log(pwSameCheck); 
         console.log(typeof pwSameCheck);
         if (pwSameCheck(inputed,inputed2)==false) { //비밀번호가 서로 다를떄
            console.log('비밀번호가 서로 다름');
            // console.log(pwSameCheck);
            // console.log(typeof pwSameCheck);
            $("#failPwSame").css("display","block");
            $("#failPwDuple").css("display","none");
            $("#failPwReg").css("display","none");
            $("#checkpwbtn").prop("disabled", true);
            $("#checkpwbtn").css("background-color", "#aaaaaa");
            $("#m_pw").css("background-color", "#FFCECE");
         } else if(pwSameCheck(inputed, inputed2)==true) { //모든 조건을 만족할 때
            console.log('비밀번호가 동일함');
            // console.log(pwSameCheck);
            // console.log(typeof pwSameCheck);
            $("#m_pw").css("background-color", "#B0F6AC");
            $("#failPwSame").css("display","none");
            $("#failPwDuple").css("display","none");
            $("#failPwReg").css("display","none");
            $("#checkpwbtn").prop("disabled", false);
            $("#checkpwbtn").css("background-color", "#B0F6AC");
         } 
         
      }
   } else if (data='error') { //중복 찾는 과정에서 오류났을떄 
      console.log('중복 찾는 과정에서 오류');
      alert('오류')
   }
   else {console.log('알 수 없는 오류')}
   }
})
}
// function activateBtn() { //가입버튼 활성화
//     console.log('pwRegCheck'+pwRegCheck);
//     console.log('pwSameCheck'+pwSameCheck);
//     console.log('pwDupleCheck'+pwDupleCheck);
    
       
//        if( pwRegCheck == 1 && pwRepwSameCheckgCheck == 1  && pwDupleCheck == 1) {
//           $("#checkpwbtn").prop("disabled", false);   
//           $("#checkpwbtn").css("background-color", "#B0F6AC");
//        }
//        else  {
//           $("#checkpwbtn").css("background-color", "#aaaaaa");
//           $("#checkpwbtn").prop("disabled", true);
//        }
//     }