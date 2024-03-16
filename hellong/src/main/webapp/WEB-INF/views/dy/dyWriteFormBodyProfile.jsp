<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/dyBodyProfileWrite.css">
</head>
<body>
    <header>
        <h1 class="title">헬롱 - 글쓰기</h1>
        
    </header>
    <nav class="navigation">
        <button>홈</button>
        <button>블로그</button>
        <button>프로젝트</button>
        <button>마이페이지</button>
    </nav>
    <div class="container">
        <form id="writeForm" method="post" action="dyWriteBodyProfile" enctype="multipart/form-data">
            <label for="category">카테고리</label>
            <select id="category" name="category">
                <option value="자유게시판">자유게시판</option>
                <option value="바디프로필">바디프로필</option>
            </select>
            <br>
            <label for="title">제목</label>
            <input type="text" id="b_title" name="b_title" required="required">
            <br>
            <label for="content">내용</label>
            <textarea id="b_content" name="b_content" rows="10" cols="50" required="required"></textarea>
            <br>
           	<input type="text" id="b_images" name="b_images">
            <br>
            <input type="submit" value="등록">
            <input type="button" onclick="location.href='listBodyProfile'" value="취소">
            
        </form>
    </div>
    <footer>
        <p>2024 Hellong. All rights reserved.</p>
    </footer>
    <script src="<%= request.getContextPath() %>/js/write.js"></script>
</body>
</html>
