<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 리스트</h1>
			<!-- jmcontroller에서 attribute로 쏨 -->
	<h3>회원수 : ${jmTotalMember}</h3>


	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
					<!-- page도 jmcontroller에서 attribute로 쏨 -->
	<table>
		<tr>
			<th>멤버번호</th>
			<th>멤버아이디</th>			
			<th>멤버비밀번호</th>
			<th>멤버이름(닉네임)</th>
			<th>나이</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>위치(주소)</th>
			<th>멤버가입일</th>
			<th>포인트잔액</th>
			<th>삭제여부</th>
																					
																								
		</tr>					
		<c:forEach var="member" items="${jmListMember}">
			<tr>					<!-- jmcontroller에서 attribute로 쏨 -->
				<td>${member.m_number}</td>
				<td><a href="jmDetailMember?m_number=${member.m_number}">${member.m_id}</td>
				 <!-- 멤버 이름 클릭시 멤버detail로 링크 걸리게.. -->
				<td>${member.m_pw}</td>   
				<td>${member.m_name}</a></td>                 
				<td>${member.m_age}</td>
				<td>${member.m_gender}</td>
				<td>${member.m_phone}</td>
				<td>${member.m_email}</td>
				<td>${member.m_address}</td>
				<td>${member.m_regdate}</td>
				<td>${member.m_currpoint}</td>
				<td>${member.m_isdeleted}</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>

	<c:if test="${page.startPage > page.pageBlock }">
		<a href="jmListMember?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="jmListMember?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<a href="jmListMember?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
	</c:if>


</body>
</html>