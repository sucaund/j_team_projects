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
h1.title {
	color: #444;
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
.footer {
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

	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col">
					<div class="breadcrumbs-content">
						<h1 class="page-title">게시글 작성</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="index.html"><i class="lni lni-home"></i>
								Home</a></li>
						<li><a href="listBodyProfile">BodyProfile</a></li>
						<li>글쓰기</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-5">
		<form id="writeForm" method="post" action="dyWriteBodyProfile"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="category">카테고리</label> <select id="category"
					name="category" class="form-control">
					<option value="바디프로필" selected>바디프로필</option>


				</select>
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="b_title"
					name="b_title" required="required" class="form-control">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea id="b_content" name="b_content" rows="10"
					class="form-control" required="required"></textarea>
			</div>
			<div class="form-group">
				<label for="b_images">이미지 첨부</label> <input type="file"
					id="b_images" name="b_images" required="required" multiple
					onchange="displaySelectedImages(this)" class="form-control-file">
			</div>
			<div id="imagePreview"></div>
			<div class="buttons-container text-right">
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="button" onclick="location.href='listBodyProfile'"
					class="btn btn-secondary">취소</button>
			</div>
		</form>
	</div>
	<footer>
		<p>2024 Hellong. All rights reserved.</p>
	</footer>
	<script src="<%=request.getContextPath()%>/js/writeFormBodyProfile.js"></script>
</body>
</html>