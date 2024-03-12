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
회원 탈퇴 실패<br>
비밀번호가 일치하지 않습니다.
	<input type="button" value="뒤로 이동" onclick="history.back();" />
	뒤로 이동하면 당연히 컨트롤러 거쳐서 작업 수행해 오류나므로, 특정 링크로 이동 필요
</body>
</html>