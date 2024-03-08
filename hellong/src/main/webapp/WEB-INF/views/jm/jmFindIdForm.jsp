<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript" src="js/findId.js"></script>
</head>
<body>
아이디 찾기
 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
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