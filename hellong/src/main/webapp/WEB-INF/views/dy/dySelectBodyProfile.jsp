<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/dySelectBodyProfile.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>바디프로필 조회</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/dySelectBodyProfile.css">

</head>
<body>
	<header>
		<h1 class="title">바디프로필 조회</h1>
	</header>
	<nav class="navigation">
		<button>홈</button>
		<button>블로그</button>
		<button>프로젝트</button>
		<button>마이페이지</button>
	</nav>
	<div class="container">
    <div class="body-profile-details">
        <!-- 여기에 게시글 내용 표시 -->
        <h2>${board.b_title }</h2>
        <!--  여기에 사진첨부 ${board.b_images}-->
        <!-- 이미지를 여러 개 첨부할 수 있다고 가정하고 이미지 리스트를 반복하여 표시 -->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <!-- Indicators 동적 생성 -->
            <div class="carousel-indicators">
                <c:forEach items="${boardFile}" var="file" varStatus="status">
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="${status.index}"
                        class="${status.first ? 'active' : ''}"
                        aria-current="${status.first ? 'true' : 'false'}"
                        aria-label="Slide ${status.index + 1}"></button>
                </c:forEach>
            </div>

            <!-- Carousel 내부 이미지 항목 동적 생성 -->
            <div class="carousel-inner">
                <c:forEach items="${boardFile}" var="file" varStatus="status">
                    <div class="carousel-item ${status.first ? 'active' : ''}">
                        <img src="<%=request.getContextPath()%>/upload/${file.bf_savedName}" class="d-block w-100" alt="...">
                    </div>
                </c:forEach>
            </div>

            <!-- 이전 버튼 -->
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <i class="bi bi-arrow-left-circle-fill" style="font-size: 2rem; color: black;"></i> <span class="visually-hidden">Previous</span>
            </button>
            <!-- 다음 버튼 -->
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <i class="bi bi-arrow-right-circle-fill" style="font-size: 2rem; color: black;"></i> <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="body-profile-details">
            <p>${board.b_content}</p>
        </div>

        <!-- 조회수, 추천수, 등록일자 -->
        <div class="row mt-4">
            <div class="col-md-4">
                <p>조회수 : ${board.b_readcount}</p>
            </div>
            <div class="col-md-4" >
                <p>추천수 : ${board.b_recomm_count}</p>
            </div>
            <div class="col-md-4">
                <p>등록일 : ${board.b_regdate}</p>
            </div>
        </div>

        <div class="body-profile-actions">
            <button type="button" class="btn btn-outline-dark">추천하기</button>
            <button type="button" class="btn btn-outline-dark">신고하기</button>
        </div>

        <!-- 댓글 섹션 -->
        <div class="comments-section">
            <h3>댓글</h3>
            <c:forEach var="comment" items="${comments}">
                <div class="comment">
                    <p>${comment.comment_content}</p>
                </div>
            </c:forEach>
            <form action="addComment" method="post">
                <textarea name="comment_content" rows="4" cols="50"></textarea>
                <br>
                <input type="hidden" name="b_number" value="${board.b_number}">
                <input type="submit" value="댓글 작성">
            </form>
        </div>
        <div class="d-flex justify-content-center flex-wrap">
            <button type="button" class="btn btn-outline-dark" onclick="location.href='listBodyProfile'">게시판 목록</button>

            <c:if test="${board.m_number != sessionScope.m_number}">
                <button type="button" class="btn btn-outline-dark" disabled>게시글 수정</button>
            </c:if>
            <c:if test="${board.m_number == sessionScope.m_number}">
                <button type="button" class="btn btn-outline-dark" onclick="location.href='dyUpdateFormBodyProfile?b_number=${board.b_number}'">게시글 수정</button>
            </c:if>

            <c:if test="${board.m_number != sessionScope.m_number}">
                <button type="button" class="btn btn-outline-dark" disabled>게시글 삭제</button>
            </c:if>
            <c:if test="${board.m_number == sessionScope.m_number}">
                <button type="button" class="btn btn-outline-dark" data-bnumber="${board.b_number}" onclick="return confirmDeletion(this);">게시글 삭제</button>
            </c:if>
        </div>
    </div>
</div>


	<footer>
		<p>2024 Hellong. All rights reserved.</p>
	</footer>

</body>
</html>