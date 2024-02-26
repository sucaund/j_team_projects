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
			<!-- jmcontroller -->
	<h3>사원수 : ${jmTotalMember }</h3>
	<p>
		uptCnt 수정시 전달 EMssage : ${uptCnt} <br>
	<p>
		kk3 수정시 전달 Message" ${kk3} <br>


	<c:set var="num" value="${page.total-page.start+1 }"></c:set>

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
			<th>멤버등급(권한)</th>
			<th>삭제여부</th>
																					
																								
		</tr>					
		<c:forEach var="member" items="${jmListMember}">
			<tr>
				<td>${member.m_number}</td>
				<td>${member.m_id}</td>
				<td>${member.m_pw}</td>                     <!-- 멤버 이름 클릭시 멤버detail로 링크 걸리게.. -->
				<td><a href="jmDetailMember?m_number=${member.m_number}">${member.m_name}</a></td>
				<td>${member.m_name}</td>
				<td>${member.m_age}</td>
				<td>${member.m_gender}</td>
				<td>${member.m_phone}</td>
				<td>${member.m_email}</td>
				<td>${member.m_address}</td>
				<td>${member.m_regdate}</td>
				<td>${member.m_currpoint}</td>
				<td>${member.m_rank}</td>
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