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
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

main {
	width: 60%;
	margin: auto;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

section {
	margin-bottom: 40px;
}

h2 {
	background-color: #007bff;
	color: white;
	padding: 10px;
	border-radius: 5px;
}

ul {
	list-style: none;
	padding: 0;
}

li {
	margin-bottom: 10px;
	padding: 10px;
	background-color: #e9ecef;
	border-radius: 5px;
}

li:hover {
	background-color: #dee2e6;
}
</style>
</head>
<body>
	<main>
		<section>
			<h2>게시판 검색 결과</h2>
			<ul>
				<c:forEach items="${results.boardResults}" var="board">
					<li>
                <a href="dySelectBodyProfile?b_number=${board.b_number}">
                    <span class="title">${board.b_title}</span> - 
                    <span class="content">${board.b_content}</span>
                </a>
            </li>
				</c:forEach>
			</ul>
		</section>
		<section>
			<h2>체육관 검색 결과</h2>
			<ul>
				<c:forEach items="${results.gymResults}" var="gym">
					<li>${gym.g_name}- ${gym.g_address} - ${gym.g_tel}</li>
				</c:forEach>
			</ul>
		</section>
		<section>
			<h2>체육관 게시판 검색 결과</h2>
			<ul>
				<c:forEach items="${results.gymBoardResults}" var="gymBoard">
					<li>${gymBoard.gb_title}- ${gymBoard.gb_machine} -
						${gymBoard.gb_amen} - ${gymBoard.gb_map}</li>
				</c:forEach>
			</ul>
		</section>
		<section>
			<h2>체육관 리뷰 검색 결과</h2>
			<ul>
				<c:forEach items="${results.gymReviewResults}" var="gymReview">
					<li>${gymReview.review_title}- ${gymReview.review_content} -
						${gymReview.review_star}</li>
				</c:forEach>
			</ul>
		</section>
	</main>
</body>
</html>