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
	<h2>회원정보 수정</h2> <!-- member를 받아온 상태 -->
	<form action="jmUpdateMember" method="post"> 
	<!-- 컨트롤러의 jmUpdateMember로 보냄 -->
	  <input type="hidden" name="m_number" value="${member.m_number}">
	  <input type="hidden" name="m_id" value="${member.m_id}">
	  <table>  
		<tr><th>멤버번호</th><td>${m_number}</td></tr> <!-- 수정불가 -->
		<tr><th>아이디</th><td>${m_id}</td></tr> <!-- 수정불가 -->
		<tr><th>비밀번호</th><td>										<!-- 끌어오기(기본값) -->
		    <input type="text"   name="m_pw" required="required" value="${member.m_pw}" ></td></tr>
		<tr><th>이름(닉네임)</th><td>
		    <input type="text"   name="m_name" required="required" value="${member.m_name}" ></td></tr>
		<tr><th>나이</th><td>
		    <input type="number"   name="m_age"   required="required" value="${member.m_age}"></td></tr>
		<tr><th>성별</th><td>
		    <input type="string"   name="m_gender"   required="required" value="${member.m_gender}"></td></tr>
		<tr><th>연락처</th><td>
		    <input type="string" name="m_phone"   required="required" value="${member.m_phone}"></td></tr>
		<tr><th>이메일</th><td>
		    <input type="string" name="m_email"   required="required" value="${member.m_email}"></td></tr>
		<tr><th>주소</th><td>
		    <input type="string" name="m_address"   required="required" value="${member.m_address}"></td></tr>
		
		<tr><th>가입일</th><td>${member.m_regdate} </td></tr>
		<tr><th>현재 포인트</th><td>${member.m_currpoint} </td></tr>
		<tr><th>삭제 여부</th><td>${member.m_isdeleted} </td></tr>
		<tr><td colspan="2">
		   <input type="submit" value="확인">
		   </td>
		</tr>
	  </table>
	</form>

</body>
</html>