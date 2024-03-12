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
	<h1>포인트 내역</h1>
	<h3>${memberData.m_name }의 현재 포인트: ${memberData.m_currpoint }</h3>
	
	<input type="button" value="포인트 충전" 
				onclick="location.href='hsChargeFormPoint?m_number=${memberData.m_number}'">
	<form action="hsCondListPoint" method="post">
		<input type="hidden" name="m_number" value="${memberData.m_number}">
		<button type="submit" name="select" value="point_charge">충전	</button>
		<button type="submit" name="select" value="gym_order_deal">구매</button>
		<button type="submit" name="select" value="gym_order_refund">환불	</button>
	</form>
		
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	<table>
		<tr><th>번호</th><th>유형</th><th>내용</th><th>포인트</th><th>날짜</th></tr>
		<c:forEach var="listPoint" items="${listPoint }">
			<tr><td>${num }</td><td>${category }</td>
				<td>${listPoint.pl_content }   </td>
				<td>${listPoint.pl_point }</td>
				<td>${listPoint.pl_date }</td></tr>
		</c:forEach>

	</table>
	
	<c:if test="${page.startPage > page.pageBlock }">
		<a href="listEmp?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="listEmp?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<a href="listEmp?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
	</c:if>	
	
	
</body>
</html>