<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript" src="js/findId.js"></script>
</head>
<body> 
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">아이디 찾기</h1>
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


    <c:if test="${m_number==null}"> <!-- 로그인 안되어있을때(즉 정상 접근 때) -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="register-form"> 
                    <!-- 회원가입 디자인만 씀 -->

                        <div class="card-body">
                        <div id="form-check-id-with-mail"> <!-- 인증 성공 시 사라지는 곳 -->
                            <div class="title">
                                <h3>아이디 찾기</h3>
                                <p>회원에 등록된 이메일을 입력해주세요.</p>
                            </div>

                            <!-- 이메일-->
			                <div class="form-group input-group">
                                <label for="reg-email">이메일</label>
                                <input type="text"
					class="form-control" id="m_email" placeholder="이메일을 입력해주세요"  name="m_email"
					oninput="checkMailReg()"
                    autocomplete='off' required="required">
					<font color="red" id="failmailreg"
					style="display: none">이메일 양식에 맞게 작성해주세요.<pre>
                                                                        </pre>
                    </font>
                    <button class="btn btn-primary" id="sendMailBtn" name="sendMailBtn" onclick="sendMailNumber()" style="margin-top: 10px;">인증번호 받기</button>
                            </div>

                            <!-- 인증번호 입력, 버튼 클릭시 출력-->
			                <div class="form-group input-group" name="mail_check" style="display: none">
                                <label for="reg-email-check">인증번호 입력</label>
                                <input type="text"
					class="form-control" id="input_mail_number" placeholder="이메일로 인증번호가 전송되었습니다."  name="input_mail_number"
					autocomplete='off' required="required">
                    <button type="button" class="btn btn-primary" id="confirmMailBtn" name="confirmMailBtn" onclick="confirmMailNumber()">인증</button>
                            </div>
                        </div> <!-- 인증 성공 시 사라지는 곳 -->


                         <!-- 인증 성공 시 나타나는 곳 -->
                        <div id="form-view-id-with-mail" style="display: none">
                            <div class="title" id="view-id" name="view-id">
                                <h3>아이디 찾기</h3>
                                <p>dfdf</p>
                            </div>
                            
                            <div class="button" id="view-sign" name="view-sign">
                                <button class="btn" onclick="location.href='jmLoginForm' " style="margin-bottom: 10px;">로그인</button>
                                <button class="btn" onclick="location.href='/' ">메인페이지로 이동</button>
                            </div>
                            
                        </div> <!-- 인증 성공 시 나타나는 곳 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
</body>
</html>