<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 게시글 조회</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.board-table {
	width: 100%;
	border-collapse: collapse;
}

.board-table th, .board-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.board-table th {
	background-color: #f2f2f2;
}

.board-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

.board-table tr:hover {
	background-color: #ddd;
}
</style>
</head>
<body>


	<div class="container">
		<div class="breadcrumbs">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-6 col-12">
						<div class="breadcrumbs-content">
							<h1 class="page-title">내 작성글</h1>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-12">
						<ul class="breadcrumb-nav">
							<li><a href="/Default"><i class="lni lni-home"></i>
									Home</a></li>
							<li><a href="jmMyPage"><i class="lni lni-mypage"></i> My
									Page</a></li>
							<li>작성글 보기</li>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<table class="board-table">
			<thead>
				<tr>
					<th>제목</th>
					<th>내용</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>작성일</th>
					<th>분류</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${myPageBoardList}">
					<tr>
						<td><a href="dySelectBodyProfile?b_number=${board.b_number}">${board.b_title}</a></td>
						<td>${board.b_content}</td>
						<td>${board.b_readcount}</td>
						<td>${board.b_recomm_count}</td>
						<td>${board.b_regdate}</td>

						<td><c:choose>
								<c:when test="${board.common_mcd == 10}">자유글</c:when>
								<c:when test="${board.common_mcd == 20}">바디프로필</c:when>
							</c:choose></td>




					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
<%@ include file="../footer.jsp"%>
</html>