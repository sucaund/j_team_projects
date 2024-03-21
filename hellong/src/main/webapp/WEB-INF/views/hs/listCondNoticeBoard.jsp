<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> 
	function buttonVisibilty() {
		var common_mcd = '${common_mcd}';
		
		var createButton = document.getElementById('createButton')
		
		if (common_mcd == 30) {
			createButton.style.display = 'block';
		} else {
			createButton.style.display = 'none';
		}
	}
</script>
</head>
<body onload="buttonVisibilty()">
	<h1>공지사항 리스트</h1>

	<c:set var="num" value="${page.total-page.start+1 }"></c:set>

	<table>
		<tr><th >번호</th><th>제목</th><th>아이디</th><th>수정일</th><th>조회수</th></tr>
		<c:forEach var="noticeBoard" items="${ListNoticeBoard }">
			<tr><td>${num }</td>
				<td><a href="hsDetailNoticeBoard?b_number=${noticeBoard.b_number}&
													m_number=${m_number}">${noticeBoard.b_title }</a></td>
				<td>${noticeBoard.m_name}</td>
				<td>${noticeBoard.b_update }
				</td><td>${noticeBoard.b_readcount }</td></tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>	
	
	<c:if test="${page.startPage > page.pageBlock }">
		<a href="hsSearchNoticeBoard?currentPage=${page.startPage-page.pageBlock}&m_number=${m_number}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="hsSearchNoticeBoard?currentPage=${i}&m_number=${m_number}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<a href="hsSearchNoticeBoard?currentPage=${page.startPage+page.pageBlock}&m_number=${m_number}">[다음]</a>
	</c:if>	

				
	<form action="hsSearchNoticeBoard">
		<input type="hidden" name="m_number" value="${m_number}">
		<select name="search">
			<option value="b_title">제목조회</option>
			<option value="b_content">내용조회</option>
		</select> 
		<input type="text" name="keyword" placeholder="keyword를 입력하세요">
		<button type="submit">검색</button>
	</form>
	<input type="button" id="createButton" value="글쓰기" 
			onclick="location.href='hsCreateFormNoticeBoard?m_number=${m_number}'">


</body>
<%@ include file="../footer.jsp"%>
</html>