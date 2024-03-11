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
		안녕하세요. 헬롱 고객센터입니다. 무엇을 도와 드릴까요?
	</h1>
    <h2>자주 묻는 질문(여기서 그냥 게시판으로)   </h2> 
       

    
    ----------------------------
    <a href="/jmUpdateMemberForm">일대일 문의하기(문의하기)></a></p>
    <a href="/jmUpdateMemberForm">일대일 문의하기(문의내역)></a></p>
	<a href="/jmUpdateMemberForm">공지사항(게시판 글 몇개 보여줌)></a></p>

    비즈니스 개설하기: <a href="/dummy1">헬스장 등록 신청(체크 후 0이면~)</a></p>

    <a href="/dummypoint">결제 내역 보기(더미)</a></p>

    <a href="/dummyquestion">일대일 문의하기(더미)</a><p>

     <a href="/buisness">체육관 신청/관리하기(더미)</a><p>
            


</body>
</html>