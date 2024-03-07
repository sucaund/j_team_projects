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
<main>
    <section>
        <h2>헬스장 리뷰</h2>
        <ul>
            <c:forEach items="${results.gymReviews}" var="gymreview">
                <li>${review.title} - ${review.summary}</li>
            </c:forEach>
        </ul>
    </section>
    <section>
        <h2>게시글</h2>
        <ul>
            <c:forEach items="${results.posts}" var="post">
                <li>${post.title} - ${post.content}</li>
            </c:forEach>
        </ul>
    </section>
    <section>
        <h2>체육관</h2>
        <ul>
            <c:forEach items="${results.gyms}" var="gym">
                <li>${gym.name} - ${gym.location}</li>
            </c:forEach>
        </ul>
    </section>
    <section>
        <h2>체육관 게시글</h2>
        <ul>
            <c:forEach items="${results.gymPosts}" var="gymPost">
                <li>${gymPost.title} - ${gymPost.content}</li>
            </c:forEach>
        </ul>
    </section>
</main>
</body>
</html>