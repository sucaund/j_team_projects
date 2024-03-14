<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 작성</title>
<style>
/* 전체 페이지에 대한 스타일 */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	color: #333;
	margin: 0;
	padding: 20px;
}

header {
	text-align: center;
	margin-bottom: 20px;
}

h1.title {
	color: #444;
}

/* 폼 컨테이너 스타일 */
.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	max-width: 800px;
	margin: 0 auto;
}

/* 폼 요소 스타일 */
form#writeForm {
	display: flex;
	flex-direction: column;
}

form#writeForm label {
	margin-bottom: 5px;
	font-weight: bold;
}

form#writeForm input[type=text], form#writeForm textarea, form#writeForm select
	{
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: calc(100% - 22px); /* Correct padding and border */
}

form#writeForm input[type=text]:focus, form#writeForm textarea:focus,
	form#writeForm select:focus {
	outline: none;
	border-color: #007bff;
	box-shadow: 0 0 0 2px rgba(0, 123, 255, .25);
}

form#writeForm input[type=file] {
	margin-bottom: 15px;
}

/* 버튼 스타일 */
form#writeForm input[type=submit], form#writeForm input[type=button] {
	cursor: pointer;
	padding: 10px 20px;
	color: #fff;
	background-color: #007bff;
	border: none;
	border-radius: 4px;
	transition: background-color 0.2s;
}

form#writeForm input[type=submit]:hover, form#writeForm input[type=button]:hover
	{
	background-color: #0056b3;
}

/* 푸터 스타일 */
footer {
	margin-top: 20px;
	text-align: center;
	font-size: 0.8em;
	color: #666;
}

#imagePreview {
	max-width: 100%;
	height: auto;
	margin-bottom: 10px;
}
/* 버튼 컨테이너 스타일 */
.buttons-container {
	display: flex;
	justify-content: flex-end; /* 우측 정렬 */
	margin-top: 10px;
}
</style>
</head>
<body>
	<header>
		<h1 class="title">헬롱 - 글쓰기</h1>

	</header>

	<div class="container">
		<form id="writeForm" method="post" action="dyWriteBodyProfile"
			enctype="multipart/form-data">
			<!-- 나머지 폼 요소들은 여기에 작성 -->
			<label for="category">카테고리</label> <select id="category"
				name="category">
				<option value="자유게시판">자유게시판</option>
				<option value="바디프로필">바디프로필</option>
			</select> <br> <label for="title">제목</label> <input type="text"
				id="b_title" name="b_title" required="required"> <br> <label
				for="content">내용</label>
			<textarea id="b_content" name="b_content" rows="10" cols="50"
				required="required"></textarea>
			<br> <label for="b_images">이미지 첨부</label> <input type="file"
				id="b_images" name="b_images" required="required" multiple
				onchange="displaySelectedImages(this)"> <br>
			<!-- 이미지 미리보기를 표시할 영역 -->
			<div id="imagePreview"></div>
			<div class="buttons-container">
				<input type="submit" value="등록" style="margin-right: 10px;">
				<!-- 마진 추가로 버튼 사이 간격 조정 -->
				<input type="button" onclick="location.href='listBodyProfile'"
					value="취소">
			</div>
		</form>
	</div>
	<footer>
		<p>2024 Hellong. All rights reserved.</p>
	</footer>
	<script
		src="<%=request.getContextPath()%>/js/writeFormBodyProfile.js"></script>
</body>
</html>
