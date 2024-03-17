<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 커뮤니티 - 1:1문의</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">



<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

</head>
<body>

<% if (request.getAttribute("errorMessage") != null) { %>
    <script>
        alert('<%= request.getAttribute("errorMessage") %>');
    </script>
<% } %>
	<c:set var="num" value="${page.total-page.start-1 }"></c:set>
	<table class="table" >
		<thead  style="background-color: #5494e8; color: white;">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>답글</th>
			</tr>
		</thead>

		<c:choose>
			<c:when test='${listBoard == null or empty listBoard}'>
				<td colspan="4">
					<p align="center">
						<b><span style=''>등록된 글이 없습니다.</span></b>

					</p>
				</td>
			</c:when>

			<c:when test="${listBoard != null }">
				<c:forEach var="board" items="${listBoard}">
					<tr>
						<td>${num}</td>
						<td><a href="QuestionContent?B_NUMBER=${board.b_number}">${board.b_title }</td>
						<td>${board.b_regdate}</td>
						<td>${commentCounts[board.b_number]}</td>
					</tr>
					<c:set var="num" value="${num - 1 }"></c:set>
				</c:forEach>

			</c:when>

		</c:choose>

	</table>
	<a href="write_view?M_NUMBER=${board.m_number}" class="float-end"
		style="text-decoration: none;"><i class="bi bi-pencil-fill"></i>&nbsp;글작성&nbsp;&nbsp;&nbsp;</a>
	<!-- ========================하단페이징=============================== -->
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="pagination d-flex justify-content-center">
					<c:if test="${page.startPage > page.pageBlock }">
						<li class="page-item"><a class="page-link"
							href="listque?currentPage=${page.startPage-page.pageBlock}">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<li class="page-item"><a class="page-link"
							href="listque?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<li class="page-item"><a class="page-link"
							href="listque?currentPage=${page.startPage+page.pageBlock}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>