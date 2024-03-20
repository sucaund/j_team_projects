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
	<h1>헬스장 이용내역 페이지</h1>
	
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>

	<table>
		<tr><th >번호</th><th>헬스장명</th><th>헬스장사진1</th><th>첫 등록일</th><th>누적개월 수</th></tr>
		<c:forEach var="listGym" items="${listUsingGym }">
			<tr><td>${num }</td>
				<td>${listGym.g_name }</td>
				<td><a href="hsMemberIndex?m_number=${listGym.m_number}&g_id=${listGym.g_id }
													">헬스장 이미지</a></td>
				<td>${listGym.first_regist_date}</td>
				<td>누적 이용일: ${listGym.period_of_use} </td></tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>	
	
	<c:if test="${page.startPage > page.pageBlock }">
		<a href="hsListNoticeBoard?currentPage=${page.startPage-page.pageBlock}&m_number=${m_number}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="hsListNoticeBoard?currentPage=${i}&m_number=${m_number}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<a href="hsListNoticeBoard?currentPage=${page.startPage+page.pageBlock}&m_number=${m_number}">[다음]</a>
	</c:if>	
	
	<input type="button" value="환불하기" 
		onclick="location.href='hsRefundFormUsingGym?m_number=${m_number}'">

</body>
</html>