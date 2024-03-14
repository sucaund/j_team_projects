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
                        <h1 class="page-title">아이디찾기</h1>
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

  <c:if test="${m_number==null}">
<br>
		<div id="form-check-id-with-mail"> <!-- 결과 성공할 시 사라짐 -->
		등록되어있는 이메일을 입력해주세요.
		<br>
			<div class="form-floating mb-3">
				<label for="floatingInput">이메일</label> <input type="text"
					class="form-control" id="m_email" placeholder="이메일을 입력해주세요"
					name="m_email" oninput="checkMailReg()" autocomplete='off'>
					<button type="button" id="sendMailBtn" name="sendMailBtn" onclick="sendMailNumber()">인증번호 받기</button>

			</div>
			
			<div class="form-floating mb-3" id="mail_check" name="mail_check" style="display: none">
               <input type="text" name="input_mail_number" id="input_mail_number" style="width:250px; margin-top: -10px" placeholder="인증번호 입력">
				<button type="button" name="confirmMailBtn" id="confirmMailBtn" onclick="confirmMailNumber()">인증</button>
			</div>
		</div>
		
		<div id="form-view-id-with-mail"  style="display: none"> <!-- 결과 성공할 시 드러남 -->
			<div class="view-id" id="view-id" name="view-id">
					<!-- 여기에 아이디체크 결과값 드러남 -->
			</div>
			<div class="view-sign" id="view-sign" name="view-sign">
				<a href="jmLoginForm">로그인</a> <a href="jmMainPage">메인화면으로 이동</a>
			</div>
		</div>
		
	</c:if>
</body>
</html>