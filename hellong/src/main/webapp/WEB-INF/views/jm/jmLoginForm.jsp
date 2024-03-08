<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 페이지.. <br>
<c:if test="${msg!=null}">${msg}</c:if>

 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
  <c:if test="${m_number==null}">
  <form method="post" action="jmLoginCheck">
	아이디 : <input type="text" name="m_id" id="m_id">
	비밀번호 : <input type="password" name="m_pw" id="m_pw">
	<br>
	<input type="submit" value="로그인">
	<br>
	<a href="jmFindIdForm">아이디 찾기 </a> <a href="jmFindPwForm">비밀번호 찾기 </a>
	<br>
	<a href="/jmSignUpFormAjax2">회원가입</a><p>
	</form>
  </c:if>

</body>
</html>