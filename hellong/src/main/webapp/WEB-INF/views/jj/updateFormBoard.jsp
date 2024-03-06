<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수정페이지</title>
</head>
<body>
	<h1>수정페이지</h1>
	<form action="updateBoard" method="post">
	    <input type="hidden" name="b_number" value="${board.b_number}">
		<input type="hidden" name="m_name" value="${board.m_name}">
		<table>
			<tr>
				<th>글번호</th><td>${board.b_number}</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="b_title"
				required="required" value="${board.b_title}"></td>
			</tr>
 			<tr>
				<th>작성일자</th><td>${board.b_regdate}</td>
			</tr>
 			<tr>
				<th>작성자</th><td>${board.m_name}</td>
			</tr>
			<tr>
				<th>추천수</th><td>${board.b_recomm_count}</td>
			</tr>
			<tr>
				<th>조회수</th><td>${board.b_readcount}</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><input type="text" name="b_content" required="required" value="${board.b_content}"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-primary" onclick="location.href='detailBoard?b_number=${board.b_number}'">취소</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>