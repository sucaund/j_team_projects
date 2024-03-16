<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>
비밀번호 재설정 <br>
 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
  <c:if test="${m_number==null}">
비밀번호 변경 완료<br>
비밀번호 변경이 완료되었습니다. 변경된 비밀번호로 다시 로그인해주세요. <br>
	<a href="/jmLoginForm">로그인</a><p>
	<a href="/jmMainPage">메인페이지로 이동</a><p>
	
	</c:if>
</body>
</html>