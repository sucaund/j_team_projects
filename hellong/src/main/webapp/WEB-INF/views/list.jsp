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
	<h1>회원관리</h1>
	<a href="writeFormEmp">writeFormEmp 입력</a>
	<p>
		<a href="writeFormEmp3">writeFormEmp3 입력(Validation)</a>
	<h3>사원수 : ${totalEmp }</h3>
	<p>
		uptCnt 수정시 전달 EMssage : ${uptCnt} <br>
	<p>
		kk3 수정시 전달 Message" ${kk3} <br>
	<form action="listSearch3">
		<select name="search">
			<option value="s_job">업무조회</option>
			<option value="s_ename">이름조회</option>
			<!-- 둘중에 하나 선택 -->
		</select> <input type="text" name="keyword" placeholder="keyword를 입력하세요">
		<!-- 검색창 -->

		<button type="submit">keyword검색</button>
		<br>
		<!-- 검색버튼 -->


	</form>

	<c:set var="num" value="${page.total-page.start+1 }"></c:set>

	<table>
		<tr>
			<th>번호</th>
			<th>사번</th>
			<th>이름</th>
			<th>업무</th>
			<th>급여</th>
		</tr>
		<c:forEach var="emp" items="${listEmp }">
			<tr>
				<td>${num }</td>
				<td>${emp.empno }</td>
				<td><a href="detailEmp?empno=${emp.empno}">${emp.ename}</a></td>
				<td>${emp.job }</td>
				<td>${emp.sal }</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
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