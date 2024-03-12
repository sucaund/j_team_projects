<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<script src="/js/dyBodyProfile.js"></script>
<meta charset="UTF-8">
<title>바디 프로필 게시판</title>

<style>
.grid-container {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	gap: 20px;
	margin-bottom: 20px;
	/* Adjusted to add space above the center-aligned elements */
}

.grid-item {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.grid-item img {
	width: 100%;
	height: auto;
	max-height: 150px;
	margin-bottom: 10px;
}

/* Center-aligned elements styles */
.center-aligned {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	margin-bottom: 20px;
}

.paging-search-container {
	text-align: center;
	margin: 20px 0; /* Adjust margin as needed */
}

.paging-links a, .paging-search-container form, .write-button {
	margin: 0 10px; /* Adds a little space between pagination links */
	text-decoration: none;
}
</style>
</head>
<body>

	<h2>바디 프로필 목록</h2>

	<p>총 게시글 수: ${totalBodyProfile}</p>

	<div class="grid-container" id="searchResults">
		<c:forEach items="${listBodyProfile}" var="board" varStatus="loop">
			<div class="grid-item">
				<c:choose>
					<c:when test="${empty firstImageMap[board.b_number]}">
						<!-- 이미지가 없는 경우 빈 이미지를 클릭하여 해당 게시글로 이동 -->
						<a href="dySelectBodyProfile?b_number=${board.b_number}"> <img
							src="이미지 없음 경로" alt="첨부된 사진이 없습니다">
						</a>
					</c:when>
					<c:otherwise>
						<!-- 이미지가 있는 경우 해당 이미지를 클릭하여 해당 게시글로 이동 -->
						<a href="dySelectBodyProfile?b_number=${board.b_number}"> <img
							src="${request.contextPath}/upload/${firstImageMap[board.b_number]}"
							alt="Board Image">
						</a>
					</c:otherwise>
				</c:choose>
				<p>
					<a href="dySelectBodyProfile?b_number=${board.b_number}">${board.b_title}</a>
				</p>
			</div>
		</c:forEach>
	</div>

	<div class="center-aligned">
		<div class="paging-search-container">
			<c:if test="${page.currentPage != 1}">
				<c:url var="prevPageUrl"
					value="?currentPage=${page.currentPage - 1}&search=${param.search}&keyword=${param.keyword}" />
				<a href="${prevPageUrl}">이전</a>
			</c:if>
			<c:forEach begin="1" end="${page.totalPage}" var="pageNum">
				<c:url var="pageUrl"
					value="?currentPage=${pageNum}&search=${param.search}&keyword=${param.keyword}" />
				<a href="${pageUrl}">${pageNum}</a>
			</c:forEach>
			<c:if test="${page.currentPage lt page.totalPage}">
				<c:url var="nextPageUrl"
					value="?currentPage=${page.currentPage + 1}&search=${param.search}&keyword=${param.keyword}" />
				<a href="${nextPageUrl}">다음</a>
			</c:if>
		</div>
		<form id="searchForm" action="dyBoardSearch" method="get">
			<select name="search">
				<option value="all">제목+내용</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="text" name="keyword" placeholder="바디프로필 검색"> 
			<button type="submit" class="btn btn-outline-dark">검색</button>
		</form>
		<button onclick="location.href='dyWriteFormBodyProfile'" type="button" class="btn btn-outline-dark">글쓰기</button>
		
	</div>

</body>
</html>