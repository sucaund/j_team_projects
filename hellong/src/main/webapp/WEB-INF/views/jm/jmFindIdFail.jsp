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
 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
  <c:if test="${m_number==null}">
<br>
${MailAtFindId} 이메일 계정으로 가입된 계정이 없습니다.
<br>
<a href="/jmFindIdForm">아이디 찾기로 돌아가기</a><p>
<a href="/jmLoginForm">로그인</a><p>
<a href="/jmMainPage">메인페이지로 이동</a><p>
</c:if>
</body>
</html>