<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
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
			<p>${board.b_content }</p>
			<!-- 게시글 내용을 적절히 표시할 것(조회수, 추천수, 댓글) -->
			<button id="list-btn" onclick="location.href='listBodyProfile'">게시판
				목록</button>
			<button id="update-btn"
				onclick="location.href='dyUpdateFormBodyProfile?b_number=${board.b_number}'">수정하기</button>
				<button id="hit-btn">추천하기</button>
			<button id="delete-btn"
				onclick="location.href='dyDeleteBodyProfile?b_number=${board.b_number}'">게시글
				삭제</button>
		</div>		
	</div>


	<footer>
		<p>2024 Hellong. All rights reserved.</p>
	</footer>
	<script src="<%=request.getContextPath()%>/js/dySelectBodyProfile.js"></script>
</body>
</html>
