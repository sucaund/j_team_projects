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
<c:if test="${msg!=null}">${msg}</c:if>
	딱히 controller나 header에서 get으로 가져오지 않은 상태
	<h2>멤버상세정보detail</h2> <!-- controller에서 특정 member만 가져온 상태 -->
	회원명 : ${sessionScope.m_name}
	<table>
		<tr><th>번호</th><td>${sessionScope.m_number}</td></tr> 
		<tr><th>아이디</th><td>${m_id}</td></tr>
		<tr><th>회원소분류</th><td>${sessionScope.member_common_bcd}</td></tr>
		<tr><th>회원중분류</th><td>${member_common_mcd}</td></tr>
		<!-- 여기까진 정상출력 -->
		
		<!-- 여기서부턴 member를 잡아주지 않았기 때문에 출력되지 않음 -->
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
		
		이렇게 로그인된 유저에 대한 정보만 가져오는 문서 만들 수 있고
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