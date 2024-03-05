<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="modifyaction" method="post">
		<input type="hidden" name="bId" value="${board.b_number}">
		<table width="500" border="1">

			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="50" value="${board.b_title}"></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea name="bContent" rows="10">${board.b_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="수정">&nbsp;&nbsp;
				<a href="/QuestionContent?B_NUMBER=${board.b_number}">취소</a></td>
			</tr>
		</table>
	</form>
</body>
</html>