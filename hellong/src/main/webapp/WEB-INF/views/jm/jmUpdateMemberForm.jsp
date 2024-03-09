<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/updateMember.js"></script>
</head>
<body>
	<!-- 로그인/비로그인 막는건 컨트롤러에서 -->
<c:if test="${msg!=null}">${msg}</c:if>
	<h2>회원정보 수정</h2> <!-- controller에서 특정 member만 가져온 상태 -->
	회원명 : ${m_name}
	<form action="jmUpdateMember" method="post"> 
	<table> 
		<tr><th>아이디</th><td>${m_id}</td></tr>
		<tr><th>회원유형</th><td>
			<c:if test="${member.common_mcd==10}">헬롱 회원</c:if>
			<c:if test="${member.common_mcd==20}">사장님</c:if>
			<c:if test="${member.common_mcd==30}">관리자</c:if>
		</td></tr>

		<tr><th>새 비밀번호 </th><td><input type="password"   name="m_pw" required="required" 
			placeholder="새 비밀번호" ></td></tr> 
			<button type="button" id="sendMailBtn" name="sendMailBtn" 
			onclick="sendMailNumber()">비밀번호 변경</button>
			
		<tr><th>비밀번호 확인</th><td><input type="password" name="m_pw_check" required="required" 
			placeholder="새 비밀번호 확인" ></td></tr>

		<tr><th>이름(닉네임)</th><td><input type="text"   name="m_pw_check" required="required" value="${member.m_pw}" ></td></tr>
		<tr><th>나이</th><td>${member.m_age}</td></tr> 변경-> 회원가입 때 사용...
		<tr><th>성별</th><td>${member.m_gender}</td></tr> 
		<tr><th>전화번호</th><td>${member.m_phone}</td></tr> 
		<div class="email">
		<tr><th>이메일</th><td><input type="text"  name="m_email" required="required" 
			value="${member.m_email}" ></td></tr> 변경(버튼 누를 때 이메일 인증)
		</div>
		<div class="address">
		<tr><th>주소</th><td>${member.m_address}</td></tr> 변경(버튼 누를 때 여기 닫히고 아래에 지도 api)
		</div>
		<tr><th>가입일자</th><td><fmt:formatDate value="${member.m_regdate}" pattern="yyyy/MM/dd"></fmt:formatDate></td></tr>
		<tr><th>현재 포인트<td>${member.m_currpoint}</td></tr>
		<tr><td colspan="2">
		
		<a href="/jmWithdrawalMemberForm">회원 탈퇴</a> <br>

		<input type="button" value="취소" 
		onclick="'">
			<button type="submit" class="btn btn-secondary"
			style="padding: 2% 0 2%;" id="submitbtn" disabled >완료</button>
		</tr>
	</table>
	</form>
</body>
</html>