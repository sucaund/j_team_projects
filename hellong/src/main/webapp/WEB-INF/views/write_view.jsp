<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="write" method="post">
		<input type="hidden" name="mId" value="${board.m_number}">
		<table width="500" border="1">

			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="50"></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea name="bContent" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="입력">&nbsp;&nbsp;
				<a href="qlist?mId=${board.m_number}">취소</a></td>
			</tr>
		</table>
	</form>
</body>
</html>