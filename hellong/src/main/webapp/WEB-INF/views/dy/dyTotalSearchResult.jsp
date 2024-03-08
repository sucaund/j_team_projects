<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>통합 검색 결과</title>
</head>
<body>
<main>
    <section>
        <h2>게시글 검색 결과</h2>
        <ul>
            <c:forEach items="${results.boardResults}" var="board">
                <li>${board.b_title} - ${board.b_content}</li>
            </c:forEach>
        </ul>
    </section>
    <section>
        <h2>체육관 검색 결과</h2>
        <ul>
            <c:forEach items="${results.gymResults}" var="gym">
                <li>${gym.g_name} - ${gym.g_address} - ${gym.g_tel}</li>
            </c:forEach>
        </ul>
    </section>
    <section>
        <h2>체육관 게시글 검색 결과</h2>
        <ul>
            <c:forEach items="${results.gymBoardResults}" var="gymBoard">
                <li>${gymBoard.gb_title} - ${gymBoard.gb_machine} - ${gymBoard.gb_amen} - ${gymBoard.gb_map}</li>
            </c:forEach>
        </ul>
    </section>
    <section>
        <h2>체육관 리뷰 검색 결과</h2>
        <ul>
            <c:forEach items="${results.gymReviewResults}" var="gymReview">
                <li>${gymReview.review_title} - ${gymReview.review_content} - ${gymReview.review_star}</li>
            </c:forEach>
        </ul>
    </section>
</main>
</body>
</html>