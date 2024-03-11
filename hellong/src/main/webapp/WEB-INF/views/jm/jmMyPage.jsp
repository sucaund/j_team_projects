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
    <h2><c:if test="${member.common_mcd==10}">헬롱 회원</c:if>
        <c:if test="${member.common_mcd==20}">사장님</c:if>
        <c:if test="${member.common_mcd==30}">관리자</c:if>
        <br>
        <c:if test="${member.common_mcd==10}">등록 헬스장: </c:if>
        
        아이디 ${member.m_id} <br> 
        나이 ${member.m_age}  <br>
        이메일 ${member.m_email} <br>
        주소 ${member.m_address} <br>
        성별 <c:if test="${member.m_gender=='F'}">여성</c:if>
        <c:if test="${member.m_gender=='M'}">남성</c:if><br>
        가입일자 <fmt:formatDate value="${member.m_regdate}" pattern="yyyy/MM/dd"></fmt:formatDate> <br>
        현재 포인트 ${member.m_currpoint}
    </h2>
    <a href="/jmUpdateMemberForm">회원 정보 수정></a></p>
	
    <!-- 가져온 값이 null인지 아닌지에 따라 로직 다르게-->
    <!--현재 헬스장
    없으면
    지점찾기
    페이지 링크 -->

    <a href="/dummy1">작성글보기</a></p>

    <a href="/dummypoint">결제 내역 보기(더미)</a></p>

    <a href="/dummyquestion">일대일 문의하기(더미)</a><p>

     <a href="/buisness">체육관 신청/관리하기(더미)</a><p>
            


</body>
</html>