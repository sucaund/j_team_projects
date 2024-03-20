<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/windicss@3.0.14/css/windicss.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script> 

</script>
	<style type="text/css">
		th, td {text-align: center;}
	</style>
</head>
<body>
		<main id="main" class="main">
		<section class="section container">
			<div class="row align-items-top col-8" style="margin: 0 auto">
				<% if (request.getAttribute("errorMessage") != null) { %>
				    <script>
				        alert('<%= request.getAttribute("errorMessage") %>');
				    </script>
				<% } %>
				
				<form action="/listNoticeBoard" method="GET">
					<input type="hidden" name="search" value="${param.search}">
				</form>

				<c:set var="num" value="${page.total-page.start+1 }"></c:set>
				
	<h3 style="text-align:center">공지사항 <i class="fa-solid fa-bullhorn" style="color: #CC0000;"></i></h3>
	<p style="text-align:right">(총 글수: ${totalNoticeBoard})</p>

	<table class="table" >
	
		<thead  style="background-color: #5494e8; color: white;">
		
			<tr><th >번호</th><th>제목</th><th>아이디</th><th>수정일</th><th>조회수</th></tr>
				</thead>
				
				<c:choose>
			<c:when test='${ListNoticeBoard == null or empty ListNoticeBoard}'>
				<td colspan="4">
					<p align="center">
						<b><span style=''>등록된 글이 없습니다.</span></b>
					</p>
				</td>
			</c:when>
			<c:when test="${ListNoticeBoard != null }">
			
		<c:forEach var="noticeBoard" items="${ListNoticeBoard }">
			<tr><td>${num }</td>
				<td><a href="hsDetailNoticeBoard?b_number=${noticeBoard.b_number}&">${noticeBoard.b_title }</a></td>
				<td>${noticeBoard.m_name}</td>
				<td>${noticeBoard.b_update }
				</td><td>${noticeBoard.b_readcount }</td></tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
			</c:when>
			</c:choose>
	</table>	
	
	<div style="text-align: right; padding: 0 5%;">
		<c:if test="${member.common_mcd == 30}">
			<button type="button" class="btn btn-primary" 
					onclick="location.href='hsCreateFormNoticeBoard'"><i class="bi bi-pencil-fill"></i> 글작성</button>
		</c:if>
	</div>
	
	<div style="display: grid; place-items: center;">
		<form action="hsListNoticeBoard" id="formCateSearch" method="get">
			<select name="search">
				<option value="b_title" <c:if test ="${param.search == 'b_title'}">selected</c:if>>제목조회</option>
				<option value="b_content" <c:if test ="${param.search == 'b_content'}">selected</c:if>>내용조회</option>
			</select> 
			<input type="text" name="keyword" value="${board.keyword}" placeholder="keyword를 입력하세요">
			<button type="submit">검색</button>
		</form>
	</div>
	
	<div style="display: grid; place-items: center;">
		
	</div>
		<div class="container">
		<div class="row">
			<div class="col">
				<ul class="pagination d-flex justify-content-center">
		<c:if test="${page.startPage > page.pageBlock }">
		<li class="page-item"><a class="page-link" href="hsListNoticeBoard?currentPage=${page.startPage-page.pageBlock}&search=${param.search }&keyword=${board.keyword}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<li class="page-item"><a class="page-link" href="hsListNoticeBoard?currentPage=${i}&search=${param.search }&keyword=${board.keyword}">${i}</a>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage }">
		<li class="page-item"><a class="page-link" href="hsListNoticeBoard?currentPage=${page.startPage+page.pageBlock}&search=${param.search }&keyword=${board.keyword}">[다음]</a>
	</c:if>	
			</ul>
			</div>
		</div>
	</div>
	</div>
		</section>
	</main>	
	
	
</body>
</html>