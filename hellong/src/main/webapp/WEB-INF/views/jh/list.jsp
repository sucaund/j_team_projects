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
	<h1>헬스장 리스트</h1>
	<c:set var="num" value="${page.total-page.start+1}"></c:set>
	
	<table>
		<tr><th>번호</th><th>체육관id</th><th>체육관 이름</th><th>체육관 등록날짜</th><th>체육관 전화번호</th></tr>
		<c:forEach var="gym" items="${listGym}">
			<tr><td>${num}</td><td>${gym.g_id}</td>
				<td><a href="gymManager?m_number=${gym.g_id}">${gym.g_name}</a></td>
				<td>${gym.g_regdate}</td><td>${gym.g_tel}</td>
			</tr>
			<c:set var="num" value="${num-1}"></c:set>
		</c:forEach>
	</table>
	
	<c:if test="${page.startPage>page.pageBlock}">
		<a href="listGym?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="listGym?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.startPage<page.pageBlock}">
		<a href="listGym?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
	</c:if>
	

</body>
</html>