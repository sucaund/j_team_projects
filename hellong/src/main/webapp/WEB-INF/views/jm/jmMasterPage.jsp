<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
관리자 전용 페이지
<c:if test="${msg!=null}">${msg}</c:if>
회원중분류: ${member_common_mcd}
</body>
</html>