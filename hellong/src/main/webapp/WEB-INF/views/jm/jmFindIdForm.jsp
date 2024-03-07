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
 <c:if test="${m_id!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
  <c:if test="${m_id==null}">
<br>
가입시 사용한 이메일을 입력해주세요.
<br>
<form action="jmFindId" method="post" name="frm"
		modelAttribute="member">
<div class="form-floating mb-3">
				<label for="floatingInput">이메일</label> <input type="text"
					class="form-control" id="m_email" placeholder="이메일을 입력해주세요"
					name="m_email" autocomplete='off'>
					<button type="button" id="sendBtn" name="sendBtn" onclick="sendMailNumber()">인증번호 받기</button>

			</div>
			<div class="form-floating mb-3" id="mail_check" name="mail_check" style="display: none">
               <input type="text" name="input_mail_number" id="input_mail_number" style="width:250px; margin-top: -10px" placeholder="인증번호 입력">
				<input type="text" id="correct_mail_number" name="correct_mail_number" style="display: none" value=""> <!-- 중복 체크용 더미 -->
								<button type="button" name="confirmMailBtn" id="confirmMailBtn" onclick="confirmMailNumber()">인증</button>
				<!-- <button type="submit" class="btn btn-secondary"
				style="padding: 2% 0 2%;" id="signupbtn" >회원가입</button> -->
			</div>
	</form>
	</c:if>
</body>
</html>