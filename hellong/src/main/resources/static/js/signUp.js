    function regMemberid(m_id) { //영문자 또는 숫자 6~16자
    	   var regExp = /^[A-za-z0-9]{5,15}/g;
    	   return regExp.test(m_id);   
    	}
    	function regPassword(m_pw) { //8~16자 영문, 숫자 조합
    	   var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
    	   return regExp.test(m_pw);
    	}
    	function regPhoneNumber(m_phone) { //전화번호, 자동으로 - 붙여줌
    	   var regExp = /^01(?:0|1|[6-9])-(?:\d{3})-\d{5}$/;
    	   return regExp.test(m_phone);
    	}
    	/*function regMemberName(m_name) { //이름
    	   var regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    	   return regExp.test(m_name);
    	}*/
    	function regEmail(m_email) {
			var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return regExp.test(m_email);
			
		}
    	
    	
    	var idCheck = 0;
    	var pwRegCheck = 0;
    	var pwSameCheck = 0;
    	var phoneCheck = 0;
    	var nameCheck = 0;
    	var authCheck = 0;
    	var emailCheck=0;
    	var mailRegCheck=0;

    	/*function checkName() {
    	   var inputed = $('#m_name').val(); //이름에 입력한 값
    	   $.ajax({
    	      success: function() {
    	         if(regMemberName(inputed) == false || inputed.length > 18) { //입력한 값이 정규표현식에 해당되지 않을 때와 18자 이상이 넘을 때 
    	            $(".signupbtn").prop("disabled", true); //회원가입 버튼 누르지 못하게 하기
    	            $(".signupbtn").css("background-color", "#aaaaaa"); //버튼 회색으로 바꾸기 
    	            $("#m_name").css("background-color", "#FFCECE");  // input 배경 붉은색으로 바꾸기
    	   
    	            nameCheck = 0; // 회원 가입 전 값들 체크하기 위해 (0은 불가, 1은 가능)
    	         } else if(regMemberName(inputed) == true) { //정규표현식에 해당할 때
    	            $("#m_name").css("background-color", "#B0F6AC"); // input 배경 초록색으로 바꾸기
    	        
    	            nameCheck = 1;
    	         }
    	      }
    	   })
    	}*/
    	
    	 	function checkId() { /* 아이디 : 정규식뿐이 아닌 중복처리 위해 컨트롤러에 */
    		   var inputed = $('#m_id').val();
    		   $.ajax({
    		      data : {
    		         m_id : inputed //입력한 값을 m_id라는 변수에 담음
    		      },
    		      url : "jmConfirmMemberIdAjax2", // data를 checkid url에 보냄 (Controller에서 받아처리한다. 중복이 되면 1, 아니면 0을 반환하는 함수를 구현했다.)
    		      success : function(data) {
    		         if(data == '1') { //아이디가 중복되었을 때
    		            $("#fail").css("display", "block"); //에러메세지를 띄운다
    		            $("#failid").css("display","none"); //중복에러메세지 말고 다른 에러 메세지를 지운다.
    		            $("#signupbtn").prop("disabled", true);
    		            $("#signupbtn").css("background-color", "#aaaaaa");
    		            $("#m_id").css("background-color", "#FFCECE");
    		           
    		            idCheck = 0;
    		         } else if (regMemberid(inputed) == false || inputed.length > 14) {
    		            $("#failid").css("display","block");
    		            $("#fail").css("display","none");
    		            $("#signupbtn").prop("disabled", true);
    		            $("#signupbtn").css("background-color", "#aaaaaa");
    		            $("#m_id").css("background-color", "#FFCECE");

    		            idCheck = 0;
    		         } else if( data == '0' && regMemberid(inputed)) { //중복되지않고, 정규식을 통과할 때
    		            $("#m_id").css("background-color", "#B0F6AC");
    		            $("#failid").css("display","none");
    		            $("#fail").css("display","none");
    		            idCheck = 1;  
    		         }
    		      }
    		   });
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
	  
   
    	
    	function addhyphen() { //정규식 만족하는 전화번호에 - 추가
    		   $(document).on("keyup", "#m_phone", function () {
    		      $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); //- 자동으로 입력
    		   })
    		}

			var mailauthnumber=0;

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

	 var mailauthnumber=0; //이메일 인증 번호
   
   //이메일
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