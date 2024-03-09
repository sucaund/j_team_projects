<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
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
마이페이지
<c:if test="${msg!=null}">${msg}</c:if>

	<h1>
		${m_name}님 환영합니다	
	</h1>
    <a href="/jmUpdateMemberForm">내 정보></a></p>
	
    <!-- 가져온 값이 null인지 아닌지에 따라 로직 다르게-->
    <!--현재 헬스장
    없으면
    지점찾기
    페이지 링크 -->

    <a href="/point">작성글보기</a></p>

    <a href="/point">결제 내역 보기(더미)</a></p>

    <a href="/question">일대일 문의하기(더미)</a><p>

     <a href="/buisness">체육관 신청/관리하기(더미)</a><p>
            


</body>
</html>