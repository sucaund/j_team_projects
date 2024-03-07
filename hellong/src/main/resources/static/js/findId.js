//이메일
/*var emailCheck=0;*/

function sendMailNumber(){
    $("#mail_check").css("display","block"); //버튼 보내는 순간 메일체크 div가 드러남
    $.ajax({
        url:"/jmMailCheck",
        type:"post",
        crossDomain: true,
        headers: {  'Access-Control-Allow-Origin': 'http://The web site allowed to access' },
        dataType:"json",
        data:{"m_email" : $("#m_email").val()},
        success: function(data){
            alert("인증번호 발송");
            $("#correct_mail_number").attr("value",data);
            } /* 받은 인증번호가 여기(보이지 않는 더미)에 들어감 */
    })
}

function confirmMailNumber(){
    var number1 = $("#input_mail_number").val();
    var number2 = $("#correct_mail_number").val();

    if(number1 == number2){
        /*alert("인증되었습니다.");
        emailCheck=1;*/
    }else{
        /*alert("번호가 다릅니다.");
        emailCheck=0;*/
    }
}