<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function buttonVisibility() {
		var common_mcd = '${common_mcd}';
		
		var updateButton = document.getElementById('updateButton')
		var deleteButton = document.getElementById('deleteButton')
		
		if (common_mcd == 30) {
			updateButton.style.display = 'block';
			deleteButton.style.display = 'block';
		} else {
			updateButton.style.display = 'none';
			deleteButton.style.display = 'none';
		}
	}

</script>
</head>
<body onload="buttonVisibility()">
	<h2>공지사항</h2> 
	<table>
		<tr><th>제목</th><td>${noticeBoard.b_title }</td></tr>
		<tr><th>아이디</th><td>${noticeBoard.m_name }</td></tr>
		<tr><th>수정일자</th><td>${noticeBoard.b_regdate }</td></tr>
		<tr><th>조회수</th><td>${noticeBoard.b_readcount }</td></tr>
		<tr><th>내용</th><td>${noticeBoard.b_content }</td></tr>
		<div><td colspan="2">
		    <input type="button" value="목록" 
				onclick="location.href='hsListNoticeBoard?m_number=${m_number}'">
			<input type="button" id="updateButton" value="수정" 
				onclick="location.href='hsUpdateFormNoticeBoard?b_number=${noticeBoard.b_number}&m_number=${m_number}'">
			<input type="button" id="deleteButton" value="삭제" 
				onclick="location.href='hsDeleteNoticeBoard?b_number=${noticeBoard.b_number}&m_number=${m_number}'"></td>
		</div>
	</table>
</body>
</html>