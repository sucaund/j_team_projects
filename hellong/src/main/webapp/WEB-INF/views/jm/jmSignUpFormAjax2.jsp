<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/signUp.js"></script>

</head>
<body>
	<h2>회원가입 ajax2</h2>
	 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>

  <c:if test="${m_number==null}">
	<form action="jmSignUpAjax2" method="post" name="frm"
		modelAttribute="member">

		<div class="form-group" style="margin: 3% 25%;">
			<!-- 아이디 -->
			<div class="form-floating mb-3">
				<label for="floatingInput">ID</label> <input type="text"
					class="form-control" id="m_id" placeholder="ID"
					oninput="checkId(), activateSignUpBtn()" name="m_id"
					autocomplete='off'> 
					<font color="red" id="failid"
					style="display: none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font> 
					<font
					color="red" id="fail" style="display: none">이미 존재하는 ID입니다.</font>
			</div>
			<!-- 비밀번호 -->
			<div class="form-floating">
				<label for="floatingPassword">비밀번호</label> <input type="password"
					class="form-control" id="m_pw" placeholder="Password"
					oninput="checkPwReg(), activateSignUpBtn(), checkPwSame()" name="m_pw"> <br>8~16자의
				영문자와 숫자를 조합해서 입력해주세요.
			</div>
			<!-- 비밀번호 중복 체크 -->
			<div class="form-floating">
				<label for="floatingPassword">비밀번호 확인</label> <input type="password"
					class="form-control" id="m_pw_check" placeholder="Password 확인"
					oninput="checkPwSame(), activateSignUpBtn()" name="m_pw_check">
				<br>동일한 비밀번호를 입력해주세요
			</div>

			<!-- 이름..일단 중복 구현은 x -->
			<div class="form-floating mb-3">
				<label for="floatingInput">이름</label> <br> <input type="text"
					class="form-control" id="m_name" placeholder="이름"  name="m_name"
					autocomplete='off'>
			</div>

			<div class="form-floting mb-3">
				<label for="age-select">나이 선택:</label> <select name="m_age"
					id="m_age">
					<script>
						for (i = 10; i < 100; i++) {
							document.write("<option>" + [ i ] + "</option>");
						}
					</script>
				</select>
			</div>

			<div class="form-floating mb-3">
				<label for="floatingInput">성별</label> 남<input type="radio"
					name='m_gender' class="m_gender" value="M"> 여<input
					type="radio" name='m_gender' class="m_gender" value="F">
			</div>


			<div class="form-floating mb-3">
				<label for="floatingInput">전화번호</label> <input type="text"
					class="form-control" id="m_phone" name="m_phone" placeholder="전화번호"
					oninput="addhyphen(),checkPhone(), activateSignUpBtn()"
					autocomplete='off'>

			</div>

			<div class="form-floating mb-3">
				<label for="floatingInput">이메일</label> <input type="text"
					class="form-control" id="m_email" placeholder="이메일을 입력해주세요"
					name="m_email" oninput="checkMailReg()" autocomplete='off'>
					<button type="button" id="sendMailBtn" name="sendMailBtn" onclick="sendMailNumber()">인증번호 받기</button>

			</div>
			<div class="form-floating mb-3" id="mail_check" name="mail_check" style="display: none">
               <input type="text" name="input_mail_number" id="input_mail_number" style="width:250px; margin-top: -10px" placeholder="인증번호 입력">
				<button type="button" name="confirmMailBtn" id="confirmMailBtn" onclick="confirmMailNumber(), activateSignUpBtn()">인증</button>
			</div>

			<!-- 주소 -->
			<div class="form-floating mb-3">
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기"><br> <input type="text"
					id="m_address" name="m_address" placeholder="주소"><br> <input
					type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				<!-- <input type="hidden" id="m_address" name="m_address" value="xm234jq"> -->
		</div>


		<div style="display: grid; padding-top: 5%;">
			<button type="submit" class="btn btn-secondary"
				style="padding: 2% 0 2%;" id="signupbtn" >회원가입</button>
		</div>
		</div>
	</form>
</c:if>


</body>
</html>