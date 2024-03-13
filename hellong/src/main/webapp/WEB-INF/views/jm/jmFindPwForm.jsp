<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="js/findPw.js"></script>
</head>
<body>
비밀번호 찾기
 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
  <c:if test="${m_number==null}">
	<form action="jmFindPw" method="post" name="frm">
<br>
		아이디를 입력해주세요
		<br>
			<div class="form-floating mb-3">
				<label for="floatingInput">아이디</label> <input type="text"
					class="form-control" id="m_id" placeholder="아이디를 입력해주세요"
					name="m_id" autocomplete='off'>
			</div>
		<br>
		가입시 사용한 이메일을 입력해주세요. <br>
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
	
			<button type="submit" class="btn btn-secondary"
			id="checkpwbtn" disabled >비밀번호 찾기</button>
		</form>
	</c:if>
</body>
</html>