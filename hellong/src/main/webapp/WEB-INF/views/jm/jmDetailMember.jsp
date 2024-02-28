<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>멤버상세정보detail</h2> <!-- controller에서 특정 member만 가져온 상태 -->
	<table>
		<tr><th>번호</th><td>${member.m_number}</td></tr>
		<tr><th>아이디</th><td>${member.m_id}</td></tr>
		<tr><th>비번</th><td>${member.m_pw}</td></tr>
		<tr><th>이름(닉네임)</th><td>${member.m_name}</td></tr>
		<tr><th>나이</th><td>${member.m_age}</td></tr>
		<tr><th>성별</th><td>${member.m_gender}</td></tr>
		<tr><th>전화번호</th><td>${member.m_phone}</td></tr>
		<tr><th>이메일</th><td>${member.m_email}</td></tr>
		<tr><th>주소</th><td>${member.m_address}</td></tr>
		<tr><th>가입일자</th><td><fmt:formatDate value="${member.m_regdate}" pattern="yyyy/MM/dd"></fmt:formatDate></td></tr>
		
		<tr><th>포인트잔액<td>${member.m_currpoint}</td></tr>
		<tr><th>삭제여부</th><td>${member.m_isdeleted}</td></tr>
		
		<tr><td colspan="2">
		    <input type="button" value="회원목록(isDeleted 0인것만)" 
				onclick="location.href='jmListMemberReal'"> <!-- 컨트롤러 -->
			<input type="button" value="수정" 
				onclick="location.href='jmUpdateMemberForm?m_number=${member.m_number}'">
			<input type="button" value="진짜삭제" 			
				onclick="location.href='jmDeleteMemberReal?m_number=${member.m_number}'">
			<input type="button" value="가짜삭제" 			
				onclick="location.href='jmDeleteMemberFake?m_number=${member.m_number}'"></td>
									<!-- 그냥 여기서 임의로 m_number 쓰기로 정한 것 -->
		</tr>
	</table>
</body>
</html>