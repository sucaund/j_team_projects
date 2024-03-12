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
회원 탈퇴<br>
<c:if test="${m_number==null}">
<p>로그인을 먼저 해주세요</p>
</c:if>

  <c:if test="${m_number!=null}">
  <form method="post" action="jmWithdrawalMemberPwCheckForm">
	탈퇴하시겠습니까? <br>
    이 선택은 되돌릴 수 없습니다.
	<input type="button" value="아니오, 탈퇴하지 않겠습니다" onclick="history.back();" />
    <button type="submit" class="btn btn-secondary"
				style="background-color: red" >네. 탈퇴하겠습니다</button>
	</form>
  </c:if>

</body>
</html>