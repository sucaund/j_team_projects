<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  
<!DOCTYPE html>
<html>
<head>

<script src="<%= request.getContextPath() %>/js/updateFormBodyProfile.js"></script>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
     <style>
         body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 20px;
        } 

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 0 auto;
        }

        form#updateForm {
            display: flex;
            flex-direction: column;
        }

        form#updateForm label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        form#updateForm input[type="text"],
        form#updateForm textarea,
        form#updateForm select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: calc(100% - 22px);
        }

        form#updateForm input[type="text"]:focus,
        form#updateForm textarea:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 0 2px rgba(0,123,255,.25);
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
    </style>
</head>
<body>
     <div class="container">
        <h1 class="title">게시글 수정</h1>
        <form id="updateForm" action="dyUpdateBodyProfile" method="post" enctype="multipart/form-data">
            <input type="hidden" name="b_number" value="${board.b_number}" />
            <label for="b_title">제목</label>
            <input type="text" id="b_title" name="b_title" required="required" value="${board.b_title}" />
            <label for="b_content">내용</label>
            <textarea id="b_content" name="b_content" required="required">${board.b_content}</textarea>
            <label for="b_images">이미지</label>
            <input type="file" id="files" name="files" required="required" multiple onchange="displaySelectedImagesForUpdate(this)"/>
            <!-- 이미지 미리보기를 표시할 영역 -->
<div id="imagePreview"></div>
            <label for="b_regdate">등록일</label>
            <input type="text" id="b_regdate" name="b_regdate" value="${board.b_regdate}" readonly/>  
            <input type="submit" value="확인" />
        </form>
    </div>
</body>
</html>