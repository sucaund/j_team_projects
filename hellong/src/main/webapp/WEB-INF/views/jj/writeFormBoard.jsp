<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
<!-- <script type="text/javascript">
function changeCategory() {
	const category = document.getElementById("jjcategory").value;
	const commonBcd = document.getElementById("common_bcd");
	const commonMcd = document.getElementById("common_mcd");
	
	switch (category) {
		case "jjfree":
			commonBcd.value = 200;
			commonMcd.value = 10;
			break;
		case "jjnotice";
			commonBcd.value = 200;
			commonMcd.value = 110;
			break;
		case "jjquestion";
			commonBcd.value = 200;
			commonMcd.value = 120;
			break;
	}
}
</script> -->
</head>
<body>
	<h3>글쓰기</h3>
	<form action="writeBoard" method="post">
		<table>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="jjcategory">
						<option value="999">글유형</option>
						<option value="jjfree">자유글</option>
						<option value="jjbody">바디프로필</option>
						<option value="jjnotice">공지</option>
						<option value="jjquestion">문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="b_title" required="required" value="${board.b_title}"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${m_name} </td>
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
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='communityBoard'">취소</button>
			<button type="submit" class="btn btn-outline-primary">등록</button>
		</div>
	</form>
</body>
</html>