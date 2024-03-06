<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자유게시판</title>
</head>
<body>
	
	<h1>자유게시판</h1>
	<h3>총 글수: ${totalBoard}</h3>
	<ul style="text-align:left">대분류 중분류 컨텐츠
		<li>100 ::: 999멤버권한 / 10일반 / 20점주 / 30관리자</li>
		<li>200 ::: 999글유형 / 10자유글 / 20바디프로필 / 110공지 / 120문의</li>
		<li>400 ::: 999신고유형 / 10광고 / 20욕설</li>
		<li>500 ::: 999체육관대기상태 / 10대기 / 20승인 / 30노출</li>
	</ul>
	<table style="text-align:center">
		<tr>
			<th>번호</th><th>카테고리</th><th>제목</th><th>아이디</th><th>작성일</th><th>추천수</th><th>조회수</th>
		</tr>
		<c:forEach var="board" items="${listBoard}">
			<tr>
				<td>${board.b_number}</td>
				<td>카테고리 값</td>
				<td><a href="detailBoard?b_number=${board.b_number}" >${board.b_title}</a></td> 
				<td>${member.m_name}</td>
				<td>${board.b_regdate}</td>
 				<td>${board.b_recomm_count}</td>
				<td>${board.b_readcount}</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<div style="text-align:center">
		<c:if test="${page.startPage > page.pageBlock}">
			<a href="communityBoard?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			<a href="communityBoard?currentPage=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${page.endPage < page.totalPage}">
			<a href="communityBoard?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
		</c:if>
	</div>
	<p>
	<div style="text-align:center">
		<button type="button" class="btn btn-primary" 
	  		  onclick="location.href='writeFormBoard'">글쓰기</button>
	</div>
</body>
</html>