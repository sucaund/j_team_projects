<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<script src="<%=request.getContextPath()%>/js/updateFormBodyProfile.js"></script>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style>



form#updateForm {
	display: flex;
	flex-direction: column;
}

form#updateForm label {
	margin-bottom: 5px;
	font-weight: bold;
}

form#updateForm input[type="text"], form#updateForm textarea, form#updateForm select
	{
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: calc(100% - 22px);
}

form#updateForm input[type="text"]:focus, form#updateForm textarea:focus
	{
	outline: none;
	border-color: #007bff;
	box-shadow: 0 0 0 2px rgba(0, 123, 255, .25);
}

form#updateForm input[type="submit"] {
	cursor: pointer;
	padding: 10px 20px;
	color: #fff;
	background-color: #007bff;
	border: none;
	border-radius: 4px;
	transition: background-color 0.2s;
}

form#updateForm input[type="submit"]:hover {
	background-color: #0056b3;
}

#imagePreview {
	max-width: 100%;
	height: auto;
	margin-bottom: 10px;
}

.btn-confirm, .btn-cancel {
    min-width: 100px; /* 버튼의 최소 너비 설정 */
    margin: 0 5px; /* 버튼 주변의 마진 설정 */
}

.btn-confirm:hover, .btn-cancel:hover {
	background-color: #007bff; /* 마우스 오버 시 배경색을 변경합니다. */
	color: #fff; /* 마우스 오버 시 텍스트 색상을 변경합니다. */
}

.btn-outline-dark {
	cursor: pointer;
	color: #007bff;
	background-color: transparent;
	border: 1px solid #007bff;
	border-radius: 4px;
	transition: background-color 0.2s, color 0.2s;
}

.btn-outline-dark:hover {
	background-color: #007bff;
	color: #fff;
}


</style>
</head>
<body>
	<div class="container mt-5">
        <h1 class="mb-4">게시글 수정</h1>
        <form id="updateForm" action="dyUpdateBodyProfile" method="post" enctype="multipart/form-data">
            <input type="hidden" name="b_number" value="${board.b_number}">
            <div class="mb-3">
                <label for="b_title" class="form-label">제목</label>
                <input type="text" class="form-control" id="b_title" name="b_title" required value="${board.b_title}">
            </div>
            <div class="mb-3">
                <label for="b_content" class="form-label">내용</label>
                <textarea class="form-control" id="b_content" name="b_content" required>${board.b_content}</textarea>
            </div>
            <div class="mb-3">
                <label for="b_images" class="form-label">이미지</label>
                <input type="file" class="form-control" id="files" name="files" required multiple onchange="displaySelectedImagesForUpdate(this)">
                <div id="imagePreview"></div>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-primary me-2">확인</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='dySelectBodyProfile?b_number=${board.b_number}'">취소</button>
            </div>
        </form>
    </div>
</body>
</html>