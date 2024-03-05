<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메일 전송 결과</h1> <!-- controller에서 check을 setAttribute로 가져옴 -->
	<c:if test="${check==1}"> 성공적으로 전송되었습니다</c:if>
	<c:if test="${check!=1}"> 메일전송이 실패되었습니다</c:if>
	<c:if test="${check==null}"> NULL 실패 </c:if>
</body>
</html>