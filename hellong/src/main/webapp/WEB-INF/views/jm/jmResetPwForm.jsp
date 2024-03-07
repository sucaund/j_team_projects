<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<form action="jmFindPw" method="post" name="frm">
<br>
		변경할 비밀번호를 입력해주세요
		<br>
		새 비밀번호
		<br>
			<div class="form-floating mb-3">
				<input type="text"
					class="form-control" id="pw1" placeholder="새 비밀번호 입력"
					name="pw1" autocomplete='off'>
					<font color="red" id="failpwreg"
					style="display: none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font> 
					<font
					color="red" id="fail" style="display: none">이미 존재하는 ID입니다.</font>
			</div>
		<br>
		
			<div class="form-floating mb-3">
				<input type="text"
					class="form-control" id="pw2" placeholder="비밀번호 확인"
					name="pw2" oninput="checkMailReg()" autocomplete='off'>
		</div>
		<button type="submit" class="btn btn-secondary"
			style="padding: 2% 0 2%;" id="checkpwbtn" disabled >변경 완료</button>
		</form>
	</c:if>
</body>
</html>