<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    

     <!-- 로그인 상태일 때(비정상 접근) -->
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
                                <c:if test="${signUpError!=null}">${signUpError}</c:if>
                            </div>
                            
                            <div class="form-group input-group">
                                <label for="reg-id">아이디</label>
                                <input type="text"
                                class="form-control" id="m_id" placeholder="5~15자의 영문자와 숫자를 조합"
                                oninput="checkId(), activateSignUpBtn()" name="m_id"
                                autocomplete='off' required="required"> 
                                <p style="color:red; display: none;" id="failid">
                                    5~15자의 영문자와 숫자를 조합해서 입력해주세요.</p> 
					            <p style="color:red; display: none" id="fail">이미 존재하는 ID입니다.</p>
                            </div>

                            <div class="form-group input-group">
                                <label for="reg-pass">비밀번호</label>
                                <input type="password"
					class="form-control" id="m_pw" placeholder="8~16자의 영문자와 숫자를 조합"
					oninput="checkPwReg(), activateSignUpBtn(), checkPwSame()" name="m_pw" required="required">
                                <p style="color:red; display: none" id="failpwreg">
                                    8~16자의 영문자와 숫자를 조합해서 입력해주세요.</p> 
                            </div>

                            <div class="form-group input-group">
                                <label for="reg-pass-confirm">비밀번호 확인</label>
                                <input type="password"
					class="form-control" id="m_pw_check" placeholder="동일한 비밀번호를 입력해주세요"
					oninput="checkPwSame(),activateSignUpBtn()" name="m_pw_check" required="required">
                                <p style="color:red; display: none" id="failpwsame">비밀번호가 일치하는지 확인해주세요</p>
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
                                <p style="color:black">남성 <input type="radio"
					name='m_gender' class="m_gender" value="M"> &nbsp; 여성 <input
					type="radio" name='m_gender' class="m_gender" value="F"> </p>
                            </div>

                            <!-- 전화번호-->
			                <div class="form-group input-group">
                                <label for="reg-phone">전화번호</label>
                                <input type="text"
					class="form-control" id="m_phone" placeholder="전화번호"  name="m_phone"
					oninput="addhyphen(),checkPhone(), activateSignUpBtn()"
                    autocomplete='off' required="required">
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

                            <!-- 이메일-->
			                <div class="form-group input-group">
                                <label for="reg-email">이메일</label>
                                <input type="text"
					class="form-control" id="m_email" placeholder="이메일"  name="m_email"
					oninput="checkMailReg(), activateSignUpBtn()"
                    autocomplete='off' required="required">
                    <p style="color:red; display: none;" id="failmailreg">
                        이메일 양식을 준수해주세요.</p> <pre>
                                    </pre>
                    <p style="color:red; display: none" id="failmailunique">이미 존재하는 이메일입니다.</p> <pre>
                                                               </pre>
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
<%@ include file="../footer.jsp"%>
</html>