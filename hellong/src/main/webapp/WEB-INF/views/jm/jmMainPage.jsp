<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
-------------- <br>
메인페이지
<c:if test="${msg!=null}">${msg}</c:if>
<%
    Date time = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!-- 로그인 상태에선 -->
<c:if test="${sessionScope.m_name != null}">
	<h1>
		${sessionScope.m_name}님 환영합니다	
	</h1>
	세션ID: <%=session.getId()%> <br>
	<%
    time.setTime(session.getCreationTime());
%>
세션생성시간: <%=formatter.format(time)%><br>
<%
    time.setTime(session.getLastAccessedTime());
%>
최근접근시간: <%=formatter.format(time)%> <br> 
세션 남은 시간 : <%=session.getLastAccessedTime()%>
</c:if>

<!-- 비로그인 상태에선 -->
<c:if test="${sessionScope.m_id == null}"> 
<br> <br>
<!-- 회원가입 -->
<input type="button" value="회원가입" onclick="location.href='/jmSignUpFormAjax2'">
<!-- 로그인 로그아웃 -->
<input type="button" value="로그인" onclick="location.href='/jmLoginForm'">
</c:if>

<input type="button" value="인덱스 페이지로 이동" onclick="location.href='/'">
</body>
</html>