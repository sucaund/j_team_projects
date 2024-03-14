<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/signUp.js"></script>

</head>
<body>
	
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">회원가입</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

     <!-- 로그인 상태일 때 로그인 버튼 클릭(비정상 접근) -->
    <c:if test="${m_number!=null}">
	<div class="account-login section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card login-form" method="get" id="logout" action="jmLogOut">
					<div class="card-body">
						<div class="title">
							<h3>이미 로그인된 계정입니다.</h3>
							<p><c:if test="${msg!=null}">${msg}</c:if></p>
						</div>

						<div class="button">
							<button class="btn" type="submit" form="logout">로그아웃</button>
						</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </c:if> 
	<!--닫기: c:if m_number != null -->

	 <!-- 로그인 안되어있을때(즉 정상 접근 때) -->
    <c:if test="${m_number==null}">
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="register-form" action="jmSignUpAjax2" method="post" name="frm"
                    modelAttribute="member">
                        <div class="card-body">
                            <div class="title">
                                <h3>회원가입</h3>
                                <p>Hellong의 회원이 되어주세요.</p>
                            </div>
                            
                            <div class="form-group input-group">
                                <label for="reg-id">아이디</label>
                                <input type="text"
                                class="form-control" id="m_id" placeholder="5~15자의 영문자와 숫자를 조합"
                                oninput="checkId(), activateSignUpBtn()" name="m_id"
                                autocomplete='off' required="required"> 
                                <font color="red" id="failid"
					            style="display: none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font> 
					            <font
					            color="red" id="fail" style="display: none">이미 존재하는 ID입니다.</font>
                            </div>

                            <div class="form-group input-group">
                                <label for="reg-pass">비밀번호</label>
                                <input type="password"
					class="form-control" id="m_pw" placeholder="8~16자의 영문자와 숫자를 조합"
					oninput="checkPwReg(), activateSignUpBtn(), checkPwSame()" name="m_pw" required="required">
                                <font color="red" id="failpwreg"
					style="display: none">8~16자의 영문자와 숫자를 조합해서 입력해주세요.</font> 
                            </div>

                            <div class="form-group input-group">
                                <label for="reg-pass-confirm">비밀번호 확인</label>
                                <input type="password"
					class="form-control" id="m_pw_check" placeholder="동일한 비밀번호를 입력해주세요"
					oninput="checkPwSame(),activateSignUpBtn()" name="m_pw_check" required="required">
                    <font
					color="red" id="failpwsame" style="display: none">비밀번호가 일치하는지 확인해주세요</font>
                                </div>

                            <!-- 이름-->
			                <div class="form-group input-group">
                                <label for="reg-fn">이름</label>
                                <input type="text"
					class="form-control" id="m_name" placeholder="이름 또는 닉네임"  name="m_name"
					autocomplete='off' required="required">
                            </div>

                            <div class="form-group input-group">
                                <label for="age-select">나이</label>
                                <select name="m_age"
					                id="m_age">
									<option value="none">선택</option>
					                <script>
						            for (i = 10; i < 100; i++) {
							        document.write("<option>" + [ i ] + "</option>");
						            }
					                </script>
				                </select>
                            </div>

                            <!-- 성별-->
			                <div class="form-group input-group">
                                <label for="reg-gender">성별</label>
                                <font color="black">남성 <input type="radio"
					name='m_gender' class="m_gender" value="M"> &nbsp; 여성 <input
					type="radio" name='m_gender' class="m_gender" value="F"> </font>
                            </div>

                            <!-- 전화번호-->
			                <div class="form-group input-group">
                                <label for="reg-phone">전화번호</label>
                                <input type="text"
					class="form-control" id="m_phone" placeholder="전화번호"  name="m_phone"
					oninput="addhyphen(),checkPhone(), activateSignUpBtn()"
                    autocomplete='off' required="required">
                            </div>

                            <!-- 이메일-->
			                <div class="form-group input-group">
                                <label for="reg-email">이메일</label>
                                <input type="text"
					class="form-control" id="m_email" placeholder="이메일"  name="m_email"
					oninput="checkMailReg()"
                    autocomplete='off' required="required">
                    <button type="button" class="btn btn-primary" id="sendMailBtn" name="sendMailBtn" onclick="sendMailNumber()" style="margin-top: 10px;">인증번호 받기</button>
                    
                            </div>

                            <!-- 인증번호 입력-->
			                <div class="form-group input-group" id="mail_check" name="mail_check" style="display: none">
                                <label for="reg-email-check">인증번호 입력</label>
                                <input type="text"
					class="form-control" id="input_mail_number" placeholder="이메일로 인증번호가 전송되었습니다."  name="input_mail_number"
					autocomplete='off' required="required">
                    <button type="button" class="btn btn-primary" id="confirmMailBtn" name="confirmMailBtn" onclick="confirmMailNumber(), activateSignUpBtn()">인증</button>
                            </div>

                            <!-- 주소-->
			                <div class="form-group input-group">
                                <label for="reg-email-check">주소</label>
                                <input type="text"
					class="form-control" id="m_address" name="m_address" placeholder="주소"
					autocomplete='off' required="required">
								<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="주소 찾기" style="margin-top: 10px; margin-bottom: 10px;">

								<input type="text"
					class="form-control" id="sample6_postcode" placeholder="우편번호"
					autocomplete='off'>

                            </div>
                            
                            <div class="button">
                                <button class="btn" id="signupbtn" type="submit">회원가입</button>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </c:if>


</body>
</html>