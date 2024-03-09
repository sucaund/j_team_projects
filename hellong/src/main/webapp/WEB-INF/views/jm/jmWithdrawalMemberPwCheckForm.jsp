<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
회원 탈퇴를 위한 인증 절차를 진행합니다.<br>
<c:if test="${m_number==null}">
<p>로그인을 먼저 해주세요</p>
</c:if>

  <c:if test="${m_number!=null}">
  비밀번호를 입력해주세요. <br>
  <form method="post" action="jmWithdrawalMemberPwCheck">
	<input type="password"
					class="form-control" id="m_pw" name="m_pw" placeholder="비밀번호를 입력해주세요"> <br>
	<input type="button" value="탈퇴하지 않겠습니다" onclick="history.back();" /> 뒤로가기가 아닌 특정 페이지로 이동 필요
    <button type="submit" class="btn btn-secondary"
				style="background-color: red" >탈퇴하기</button>
	</form>
  </c:if>

</body>
</html>