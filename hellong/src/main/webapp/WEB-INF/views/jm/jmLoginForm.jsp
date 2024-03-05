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
<form method="post" action="jmLoginCheck">
	아이디 : <input type="text" name="m_id" id="m_id">
	비밀번호 : <input type="password" name="m_pw" id="m_pw">
	<a href="jmFindIdForm">아이디 찾기 </a> <a href="jmFindPwForm">비밀번호 찾기 </a>
	<input type="submit" value="로그인">
</form>
</body>
</html>