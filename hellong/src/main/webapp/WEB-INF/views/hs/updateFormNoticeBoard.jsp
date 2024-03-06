<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>직원정보</h2>
	<form action="hsUpdateNoticeBoard" method="post">
	  <input type="hidden" name="b_number" value="${noticeBoard.b_number }">
	  <table>  
		<tr><th>제목</th><td><input type="text" name="b_title" required="required" value="${noticeBoard.b_title }" ></td></tr>
		<tr><th>멤버번호</th><td>${noticeBoard.m_number }</td></tr>
		<tr><th>첨부파일</th><td>${noticeBoard.b_images}</td></tr>
		<tr><th>내용</th><td><input type="text" name="b_content" required="required" value="${noticeBoard.b_content }"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="확인">
			<input type="button" value="취소" onclick="location.href='hsListNoticeBoard'"></td></tr> 
	  </table>
	</form>
	
	   <table>
		
	   </table>

</body>
</html>