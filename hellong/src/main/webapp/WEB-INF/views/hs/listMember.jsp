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
	<h1>멤버관리 </h1>
	
	<h3>사원수 : ${totalMember }</h3>
	
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>

	<table>
		<tr><th >번호</th><th>멤버번호</th><th>멤버이름</th><th>포인트</th><th>가입일</th></tr>
		<c:forEach var="member" items="${listMember }">
			<tr><td>${num }</td><td>${member.m_number }</td>
				<td><a href="hsMemberIndex?m_number=${member.m_number}">${member.m_name}</a></td>
				<td>${member.m_currpoint }</td>
				<td>${member.m_regdate }</td></tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>	
	
	<c:if test="${page.startPage > page.pageBlock }">
		<a href="hsListMember?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="hsListMember?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<a href="hsListMember?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
	</c:if>	



</body>
</html>