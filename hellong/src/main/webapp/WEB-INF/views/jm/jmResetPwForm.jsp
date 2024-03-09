<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script type="text/javascript" src="js/resetPw.js"></script>
</head>
<body>
비밀번호 재설정
 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
  <c:if test="${m_number==null}">
	<form action="jmResetPw" method="post" name="frm">
<br>									
						<!-- 세션에 findM_number 남아있는 상태 : ${findM_number} 받음 -->
		변경할 비밀번호를 입력해주세요
		<br>
		새 비밀번호
		<br>
			<div class="form-floating mb-3">
				<input type="password"
					class="form-control" id="m_pw" placeholder="새 비밀번호 입력"
					name="m_pw" oninput="checkPw()" autocomplete='off'>
					<font color="red" id="failPwReg"
					style="display: none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font> 
					<font color="red" id="failPwSame"
					style="display: none">비밀번호가 일치하지 않습니다</font> 
					<font
					color="red" id="failPwDuple" style="display: none">기존의 비밀번호와 다른 비밀번호로 설정해주세요.</font>
			</div>
		<br>
		
			<div class="form-floating mb-3">
				<input type="password"
					class="form-control" id="m_pw_check" placeholder="비밀번호 확인"
					name="m_pw_check" oninput="checkPw()" autocomplete='off'>
		</div>
		<button type="submit" class="btn btn-secondary"
			style="padding: 2% 0 2%;" id="checkpwbtn" disabled >완료</button>
		</form>
	</c:if>
</body>
</html>