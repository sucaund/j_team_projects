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
    	           
                    
    	         } else if(regEmail(inputed) == true) {
					$("#sendMailBtn").prop("disabled", false);
					 $("#sendMailBtn").css("background-color", "#B0F6AC");
    	            $("#m_email").css("background-color", "#B0F6AC");
    	            
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
            alert("아이디 확인용 인증번호 발송");
/*            console.log("data"+data);*/
            mailauthnumber=data;
/*            console.log("mailauthnumber"+mailauthnumber);*/
            } /* 받은 인증번호 여기에 넣음 */
    })
}

function confirmMailNumber(){ 
	//사용자와 입력한 번호와 이메일로 간 번호를 체크, 인증 버튼 누를 시
	//html에선 값을 서버로 직접 보낼 수 없으므로 js와 ajax 사용
    var input_number = $("#input_mail_number").val(); //사용자가 입력한 인증번호
	var check_mail= $("#m_email").val(); //사용자의 이메일
/*	console.log("number"+number);
	console.log("mailauthnumber"+mailauthnumber);
	console.log(check_mail);*/
    // 값 비교
    if (input_number == mailauthnumber) {
        $.ajax({
                 type: "POST",
                 url: "jmFindIdWithMail",
                 data: { mail: check_mail },
                 success: function(response) {
/*				console.log(response);*/
                 console.log("아이디찾기에서 confirmMailNumber의 ajax 작업이 성공");
                 $("#form-check-id-with-mail").css("display","none");
                 $("#view-id").text(response);
                 $("#form-view-id-with-mail").css("display","block");
                 },
                 error: function(xhr, status, error) {
                  console.error("아이디찾기에서 confirmMailNumber의 ajax 작업에서 에러 발생", error);
                  }
               });
        
    } else {
        alert("인증번호가 일치하지 않습니다");
    }
}

