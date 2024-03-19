<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 검색 결과</title>
<style>
    body {
        background-color: #f0f0f0;
    }

    main {
        padding-top: 20px;
    }

    .result-section {
        margin-bottom: 40px;
    }

    .result-list li:hover {
        background-color: #dee2e6;
    }

    .bg-primary, .bg-success, .bg-info, .bg-warning {
        padding: 10px;
        margin-bottom: 20px;
        color: white;
    }

    .list-group-item {
        padding: 15px;
    }
</style>
</head>
<body>
<main class="container">
    <section class="result-section">
        <h2 class="bg-primary rounded">게시판 검색 결과</h2>
        <ul class="list-group">
            <c:forEach items="${results.boardResults}" var="board">
                <li class="list-group-item">
                    <span class="title">${board.b_title}</span> - <span class="content">${board.b_content}</span>
                    <br>
                    조회수: ${board.b_readcount}  추천수: ${board.b_recomm_count}  글유형: ${board.common_mcd == 10 ? '자유글' : '바디프로필'}
                </li>
            </c:forEach>
        </ul>
    </section>

    <section class="result-section">
        <h2 class="bg-success rounded">체육관 검색 결과</h2>
        <ul class="list-group">
            <c:forEach items="${results.gymResults}" var="gym">
                <li class="list-group-item">
                    상호명: ${gym.g_name}  주소: ${gym.g_address}  전화번호: ${gym.g_tel}
                </li>
            </c:forEach>
        </ul>
    </section>

    <section class="result-section">
        <h2 class="bg-info rounded">체육관 게시판 검색 결과</h2>
        <ul class="list-group">
            <c:forEach items="${results.gymBoardResults}" var="gymBoard">
                <li class="list-group-item">
                    제목: ${gymBoard.gb_title}  대표멘트: ${gymBoard.gb_machine}  운동기구: ${gymBoard.gb_amen}  조회수: ${gymBoard.gb_hit}
                </li>
            </c:forEach>
        </ul>
    </section>

    <section class="result-section">
        <h2 class="bg-warning rounded">체육관 리뷰 검색 결과</h2>
        <ul class="list-group">
            <c:forEach items="${results.gymReviewResults}" var="gymReview">
                <li class="list-group-item">
                    리뷰제목: ${gymReview.review_title}  리뷰내용: ${gymReview.review_content}  별점: ${gymReview.review_star}
                </li>
            </c:forEach>
        </ul>
    </section>
	</main>

	<!-- Bootstrap JS 추가 -->
	
</body>
</html>