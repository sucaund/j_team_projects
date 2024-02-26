<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    
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
		<tr><th>주소</th>${member.m_address}</tr>
		<tr><th>가입일자</th><td>${member.m_regdate}</td></tr>
		<tr><th>포인트잔액<td>${member.m_currpoint}</td></tr>
		<tr><th>멤버등급(권한)</th><td>${member.m_rank}</td></tr>
		<tr><th>삭제여부</th><td>${member.m_isdeleted}</td></tr>
		
		<tr><td colspan="2">
		    <input type="button" value="회원목록" 
				onclick="location.href='jmListMember'"> <!-- jsp -->
			<input type="button" value="수정" 
				onclick="location.href='updateFormEmp?empno=${member.m_number}'">
			<input type="button" value="삭제" 
				onclick="location.href='deleteEmp?empno=${member.m_number}'"></td>
		</tr>
	</table>
</body>
</html>