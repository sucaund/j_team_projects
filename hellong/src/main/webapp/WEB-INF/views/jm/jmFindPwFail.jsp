<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

</head>
<body>
비밀번호 찾기
 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
  <c:if test="${m_number==null}">
<br>
해당 아이디나 이메일로 가입된 계정이 없습니다.
<br>
<a href="/jmFindIdForm">비밀번호 찾기</a><p></p>
<a href="/jmFindPwForm">아이디 찾기</a><p>
<a href="/jmLoginForm">로그인</a><p>
<a href="/jmMainPage">메인페이지로 이동</a><p>
</c:if>
</body>
</html>