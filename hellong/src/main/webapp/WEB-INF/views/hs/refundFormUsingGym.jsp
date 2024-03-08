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
	<h1> 헬스장 환불 페이지 </h1>
	<form action="hsRefundUsingGym" method="post">
		<table>
			<c:forEach var="gymOrder" items="${listGymOrder }">
				<tr><th>헬스장명</th><td><option value="${gymOrder.g_id }">${gymOrder.g_id }</td></tr>
				<tr><th>주문번호</th><td>임의번호</td></tr>
				<tr><th>고객명</th><td>${memberName }</td></tr>
				<tr><th>환불금액</th><td>임의금액</td></tr>
				<tr><th>환불사유</th><td>임의사유</td></tr>
			</c:forEach>
		</table>	
		
		<button type="submit">환불 </button><p>
	</form>


</body>
</html>