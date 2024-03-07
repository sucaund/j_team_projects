<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script type="text/javascript" src="js/signUp.js"></script>
<script type="text/javascript">

	function chk() { /* 아이디 체크 */
		if (!frm.m_id.value) {
			/* 아무것도 입력 안했을 때 */
			alert("아이디를 입력해주세요");
			frm.m_id.focus();
			return false;
		} else /* 중복확인 */
			location.href = "jmConfirmMemberIdAjax?m_id=" + frm.m_id.value;
								/* 컨트롤러로 이동.. */
	} 
	
	/*  $(document).ready(function() {
         $('#m_pw').click(function() {
             var fieldType = $(this).attr('type');
             if (fieldType === 'text') {
                 $(this).attr('type', 'password');
                 $(this).val('');
             } //클릭시 input type="text" 가 input type="password"로 변경됨
         });
     }); */
	 
	/*  $(document).ready(function() {
		$('#m_pw').click(function() {
             var fieldType = $(this).attr('type');
             if (fieldType === 'text') {
                 $(this).attr('type', 'password');
                 $(this).val('');}

         $('#m_pw_check').click(function() {
             var fieldType = $(this).attr('type');
             if (fieldType === 'text') {
                 $(this).attr('type', 'password');
                 $(this).val('');

				 $('#m_pw_check').keyup(function() { //keyup : 버튼 누르지 않고 입력 즉시
             
					var m_pw = $('#m_pw').val();
             		var m_pw_check = $('#m_pw_check').val();

             // 비밀번호가 같은지 비교
            $.ajax({
                 url: 'jmCheckPasswordMatch', //컨트롤러 매핑 이름
                 type: 'POST',
                 data: {m_pw: m_pw, m_pw_check: m_pw_check}, //이 두 값을 보냄
                 success: function(response) { //가져오는거 성공시(= 일치 여부 서버에서 체크 후)
                     $('#m_pw_check_msg').text(response); //span, rsponse는 return 되는 문자열
                     //즉 사용 가능한 아이디입니다. 라고 알려줌
                     $('#signUpButton').prop('disabled', false);
                     //버튼 prop 비활성화된걸 false시킴 -> 활성화시킴
                 }
             });
         });
             }
         });
     });  */
     
/*      $(document).ready(function () {
         // 비밀번호 입력 필드 초기화 함수
         $("#m_pw").click(function () {
             $(this).val('');
         });

         // 비밀번호 입력 시 * 표시 함수
         $("#m_pw_check").on("input", function () {
             var password = $(this).val();
             var hiddenPassword = '';
             for (var i = 0; i < password.length; i++) {
                 hiddenPassword += '*';
             }
             $("#hiddenPassword").text(hiddenPassword);
         });
     }); */
     
 
</script>
</head>
<body>
	<h2>회원가입 ajax</h2>
	
	      <form action = "signup" method = "post">

            <div class="form-group" style="margin:3% 25%;">
               <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="mName" placeholder="이름" oninput="checkName(),activateSignupbtn()" name = "mName" autocomplete='off'>
                  <label for="floatingInput">이름</label>
                  <i id = "nEmo" class="fa fa-id-card-o"></i>
               </div>
               <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="mId"   placeholder="ID" oninput="checkId(), activateSignupbtn()" name = "mId" autocomplete='off'>
                  <label for="floatingInput">ID</label>
                  <i id="idEmo" class="fa-solid fa-id-card"></i>
                        <font color = "red" id = "failid" style = "display:none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font>
                        <font color = "red" id = "fail" style = "display:none">이미 존재하는 ID입니다.</font>
               </div>
               <div class="form-floating">
                  <input type="password" class="form-control" id="mPwd" placeholder="Password" oninput ="checkPwd(), checkPwd2()" name = "mPwd" >
                  <label for="floatingPassword">Password</label>
                  <i id= "pwEmo1"class="fa-solid fa-fingerprint"></i>
                  <font color = "red" id = "failpwd" style = "display:none">8~16자의 영문자와 숫자를 조합해서 입력해주세요.</font>
               </div>
               <div class="form-floating">
                  <input type="password" class="form-control" id="pwCheck" placeholder="Password 확인" oninput ="checkPwd2(), activateSignupbtn()" name = "pwcheck">
                  <label for="floatingPassword">Password 확인</label>
                  <i id = "pwEmo2" class="fa-solid fa-check-double"></i>
               </div>
               <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="mTel"   placeholder="전화번호" oninput="addhyphen(),checkTel(), activateSignupbtn()" name = "mTel" autocomplete='off'>
                  <label for="floatingInput">전화번호</label>
                  <i id = "telEmo" class="fa-solid fa-phone"></i>
               </div>
               <div>
               <input type = "button" onclick="authnum()" class = "authbtn" value = "인증번호받기">
                     <div style = "display:none;" class = "successMessage"><b >인증 번호가 발송 되었습니다 !</b></div>
                     <input type="text" name="authNum" id="authNum" > <input type = "button" onclick = "checkMessage()" value = "인증번호 확인">
                     <div style = "display:none;" class = "authsuccessMessage"><b >인증 성공 !</b></div>
               </div>
               
               <div>
                  <p>생년월일</p>
                   <select name="years" id = "years">
                        <script>
                            for(i=2022; i>1900; i--){
                                document.write("<option>" + [i] + "</option>");
                            }
                        </script>
                    </select>
                    <select name="month" id = "month">
                        <script>
                            for(i=1; i<13; i++) {
                                document.write("<option>" + [i] + "</option>");
                            }
                        </script>
                    </select>
                    <select name="day" id="day">
                        <script>
                       
                                for(i=1; i<32; i++) {
                                    document.write("<option>" + [i] + "</option>");
                                }
                        
                        </script>
                    </select>
                    <i id = "birthdayEmo" class="fa-solid fa-calendar"></i>  
               </div>
               <div style="display: grid; padding-top: 5%;">
               <button type="submit" class="btn btn-secondary" style="padding: 2% 0 2%;" id="signupbtn">회원가입</button>
               </div>
            </div>
         </form>
	
	
	
	
	<br> <br>
	<c:if test="${msg!=null}">${msg}</c:if> 
	<form:form action="jmSignUpAjax" method="post" name="frm"
		modelAttribute="member">	

			아이디
			 <br>
			<input type="text" name="m_id" required="required"
					maxlength="10" value="${m_id}"> 
			<input type="button"
					value="중복확인" onclick="chk()">
			<br>
			비밀번호
			<br>
			<input type="text" name="m_pw" id="m_pw" required="required" value="비밀번호를 입력해주세요">
			<br>
			비밀번호 확인
			<br>
			<input type="text" name="m_pw_check"id="m_pw_check" required="required" value="비밀번호를 한번 더 입력해주세요" size="30">
			<!-- 이거 넣어도 정상 작동 -->
			<br>
			<span id="m_pw_check_msg"></span><p>
			<br>
			이름
			<br>
			<input type="text" name="m_name" required="required">
			<br>
			나이
			<br>
			<input type="number" name="m_age" required="required">
			<br>
			성별
			<br>
			<input type="string" name="m_gender" required="required">
			<br>
			연락처<br>
			<input type="string" name="m_phone" required="required">
			<br>
			이메일 	<!-- 추후 이메일 인증 기능 사용 -->
			<br>
			<input type="string" name="m_email" required="required">
			<br>
			주소 <!-- 추후 우편번호 api 사용 -->
			<br>
			<input type="string" name="m_address" required="required">
			<br>
			<br>
			<input type="submit" id="signUpButton" value="가입하기"> <!-- 앞선부분이 제대로 되어이지 않으면 클릭되지 않도록 -->
	


	</form:form>
	<br> <br> <a href="jmMailTransport">이메일 테스트(클릭시 즉시 전송, 추후 가입 인증 시 사용)</a>
</body>
</html>