<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="writeBoard" method="post">
		<table>
			<tr>
				<td>카테고리</td>
				<td></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="b_title" required="required" value="${board.b_title}"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${member.m_name}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="b_content" required="required" value="${board.b_content}"></td>
			</tr>
		</table>
		<p>
		<div style="text-align:center">
			<button type="button" class="btn btn-primary" onclick="location.href='communityBoard'">취소</button>
			<button type="submit" class="btn btn-primary">등록</button>
		</div>
	</form>
</body>
</html>