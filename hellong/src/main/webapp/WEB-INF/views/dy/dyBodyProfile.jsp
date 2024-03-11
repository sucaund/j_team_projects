<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바디 프로필 게시판</title>


<style>
.grid-container {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	gap: 20px;
	margin-bottom: 40px;
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
</style>
</head>
<body>

	<h2>바디 프로필 목록</h2>

	<p>총 게시글 수: ${totalBodyProfile}</p>

	<div class="grid-container">
    <c:forEach items="${listBodyProfile}" var="board" varStatus="loop">
        <div class="grid-item">
            <!-- 이미지 파일 리스트 대신 게시글과 연결된 이미지를 직접 찾아서 표시 -->
            <c:forEach items="${listFileBodyProfile}" var="file">
                <c:if test="${file.b_number == board.b_number}">
                    <!-- 컨텍스트 경로와 파일 이름을 올바르게 연결 -->
                    <img src="${request.contextPath}/upload/${file.bf_savedName}" alt="Board Image">
                </c:if>
            </c:forEach>
            <p>
                <a href="dySelectBodyProfile?b_number=${board.b_number}">${board.b_title}</a>
            </p>
        </div>
    </c:forEach>
</div>
	<div>
		<c:if test="${page.currentPage != 1}">
			<a href="?currentPage=${page.currentPage - 1}">이전</a>
		</c:if>
		<c:forEach begin="1" end="${page.totalPage}" var="pageNum">
			<a href="?currentPage=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${page.currentPage lt page.totalPage}">
			<a href="?currentPage=${page.currentPage + 1}">다음</a>
		</c:if>
		<form action="dyBoardSearch" method="get">
			<select name="search">
				<option value="all">제목+내용</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="text" name="keyword" placeholder="바디프로필 검색"> 
			<input type="submit" value="검색">
		</form>
		<a href="dyWriteFormBodyProfile" class="write-button">글쓰기</a>
	</div>

</body>
</html>
