<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>체육관이 승인된 멤버 리스트 </h1>	
	
	<c:set var="num" value="${page.total-page.start+1}"></c:set>

	<table>
		<tr><th >멤버번호</th><th>아이디</th><th>이름</th><th>나이</th><th>전화번호</th></tr>
		<c:forEach var="member" items="${listMember}">
			<tr><td>${num}</td><td>${member.m_number}</td>
			<td><a href="listGymManager?m_number=${member.m_number}">${member.m_name}</a></td>
				<td>${member.m_age}</td><td>${member.m_phone}</td></tr>
			<c:set var="num" value="${num - 1}"></c:set>
		</c:forEach>
	</table>	
	
	<c:if test="${page.startPage > page.pageBlock }">
		<a href="listMember?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="listMember?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<a href="listMember?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
	</c:if>	


</body>
</html>