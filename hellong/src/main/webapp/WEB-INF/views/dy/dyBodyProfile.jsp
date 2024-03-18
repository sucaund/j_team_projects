<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="/js/dyBodyProfile.js"></script>
<meta charset="UTF-8">
<title>바디 프로필 게시판</title>

<style>
.grid-container {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	gap: 20px;
	margin-bottom: 20px;
}

.grid-item {
    border: 1px solid #ddd;
    padding: 20px;
    text-align: center;
    display: flex;
    flex-direction: column;
     justify-content: space-between; /* 이미지와 제목 사이에 공간을 균등하게 배분 */ 
    align-items: center;
    min-height: 300px; /* 최소 높이 지정 */
}

.grid-item img {
    max-height: 200px;
    max-width: 100%;
    object-fit: cover;
    margin-bottom: 10px; /* 이미지 아래 여백 추가 */
}

.grid-item p {
    margin-top: 10px; /* 이미지와 제목 사이의 공간 */
    word-wrap: break-word; /* 긴 단어가 있을 경우 줄 바꿈 */
    text-align: center; /* 제목을 가운데 정렬 */
    overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 생략 부호로 처리 */
    white-space: nowrap; /* 텍스트를 한 줄로 처리 */
    width: 100%; /* 제목 너비를 grid-item 너비와 동일하게 설정 */
}

.paging-links a {
    margin: 0 5px; /* 페이지 링크 간격 조정 */
}

.paging-search-container {
    text-align: center; /* 검색 폼을 가운데 정렬합니다. */
    margin-bottom: 20px; /* 하단 여백 추가 */
}

.paging-search-container form {
    display: inline-block; /* 검색 폼을 인라인으로 배치합니다. */
}

.paging-search-container button {
    margin-left: 10px; /* 검색 버튼과 글쓰기 버튼 사이 여백 추가 */
}
</style>
</head>
<body>

	<div class="container">
    <h2>BODY PROFILE</h2>

  

    <div class="grid-container" id="searchResults">
        <c:forEach items="${listBodyProfile}" var="board" varStatus="loop">
    <div class="grid-item">
        <c:choose>
            <c:when test="${empty firstImageMap[board.b_number]}">
                <a href="dySelectBodyProfile?b_number=${board.b_number}">
                    <img src="이미지 없음 경로" alt="첨부된 사진이 없습니다">
                </a>
            </c:when>
            <c:otherwise>
                <a href="dySelectBodyProfile?b_number=${board.b_number}">
                    <img src="${request.contextPath}/upload/${firstImageMap[board.b_number]}" alt="Board Image">
                </a>
            </c:otherwise>
        </c:choose>
        <p><a href="dySelectBodyProfile?b_number=${board.b_number}">${board.b_title}</a></p>
    </div>
</c:forEach>
    </div>

    <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
        <c:if test="${page.currentPage != 1}">
            <c:url var="prevPageUrl" value="?currentPage=${page.currentPage - 1}&search=${param.search}&keyword=${param.keyword}" />
            <li class="page-item">
                <a class="page-link" href="${prevPageUrl}" aria-label="Previous">&laquo;</a>
            </li>
        </c:if>
        <c:forEach begin="1" end="${page.totalPage}" var="pageNum">
            <c:url var="pageUrl" value="?currentPage=${pageNum}&search=${param.search}&keyword=${param.keyword}" />
            <li class="page-item ${pageNum == page.currentPage ? 'active' : ''}">
                <a class="page-link" href="${pageUrl}">${pageNum}</a>
            </li>
        </c:forEach>
        <c:if test="${page.currentPage lt page.totalPage}">
            <c:url var="nextPageUrl" value="?currentPage=${page.currentPage + 1}&search=${param.search}&keyword=${param.keyword}" />
            <li class="page-item">
                <a class="page-link" href="${nextPageUrl}" aria-label="Next">&raquo;</a>
            </li>
        </c:if>
    </ul>
</nav>

    <div class="paging-search-container">
        <form id="searchForm" action="dyBoardSearch" method="get">
            <select name="search">
                <option value="all">제목+내용</option>
                <option value="title">제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" name="keyword" placeholder="바디프로필 검색">
            <button type="submit" class="btn btn-outline-dark">검색</button>
        </form>
        <button onclick="location.href='dyWriteFormBodyProfile'" type="button" class="btn btn-outline-dark">글쓰기</button>
    </div>
</div>

</body>
</html>