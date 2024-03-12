<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
</head>
<body>
    <h1>게시글 수정</h1>
    <form action="dyUpdateBodyProfile" method="post" enctype="multipart/form-data">
        <input type="hidden" name="b_number" value="${board.b_number}" />
        <label for="b_title">제목</label><br/>
        <input type="text" id="b_title" name="b_title" required="required" value="${board.b_title}" /><br/>
        <label for="b_content">내용</label><br/>
        <textarea id="b_content" name="b_content" required="required">${board.b_content}</textarea><br/>
         <label for="b_images">이미지</label><br/>
         <input type="file" id="files" name="files" required="required" multiple/><br/>
        <label for="b_regdate">등록일</label><br/>
        <input type="text" id="b_regdate" name="b_regdate" value="${board.b_regdate}" /><br/>  
        <input type="submit" value="확인" />
    </form>
</body>
</html>