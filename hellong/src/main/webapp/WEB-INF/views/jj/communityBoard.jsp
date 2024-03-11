<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자유게시판</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function goCateSearch() {
			var cateSearch =   $("#cateSearch").val(); 
			
			// 행동강령 :  JavaScript로 jjCategorySearch 이동 (cateSearch)
			location.href="jjCategorySearch?cateSearch="+cateSearch;
		}
	
		// Page와 조회조건들을 Mix해서  Controller  jjCategorySearch
		function jjCategorySearchSubmit(pageCnt) {
			var sendData = $("#formCateSearch").serialize();
			sendData = sendData + "&currentPage="+pageCnt;
			// 행동강령 :  JavaScript로 jjCategorySearch 이동 (cateSearch)
			location.href="jjCategorySearch?"+sendData;

		}
	</script>
</head>
<body>
	
	<h1>자유게시판</h1>
	<p style="text-align:center">(총 글수: ${totalBoard})</p>
	<a href="http://localhost:8484/">메인페이지로</a><br>
	<a href="communityBoard">자유게시판</a>
	<ul style="text-align:left">대분류 중분류 컨텐츠
		<li>100 ::: 999멤버권한 / 10일반 / 20점주 / 30관리자</li>
		<li>200 ::: 999글유형 / 10자유글 / 20바디프로필 / 110공지 / 120문의</li>
		<li>400 ::: 999신고유형 / 10광고 / 20욕설</li>
		<li>500 ::: 999체육관대기상태 / 10대기 / 20승인 / 30노출</li>
	</ul>
	<table style="text-align:center">
		<tr>
			<th>번호</th>
			<th>
				<form action="" method="get">
					<select name="cateSearch"   id="cateSearch" onchange="goCateSearch()">
						<option value="cate-all" ${param.cateSearch == 'cate-all' ? 'selected' : ''}>전체</option>
				        <option value="cate-free" ${param.cateSearch == 'cate-free' ? 'selected' : ''}>자유글</option>
				        <option value="cate-body" ${param.cateSearch == 'cate-body' ? 'selected' : ''}>바디프로필</option>
				        <option value="cate-notice" ${param.cateSearch == 'cate-notice' ? 'selected' : ''}>공지</option>
				        <option value="cate-question" ${param.cateSearch == 'cate-question' ? 'selected' : ''}>문의</option>
					</select>
				</form>
			</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>추천수</th>
			<th>신고수</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${listBoard}">
			<tr data-category="${board.common_mcd}">
				<td>${board.b_number}</td>
				<td>
					<c:choose>
						<c:when test="${board.common_mcd == 10}">자유글</c:when>
						<c:when test="${board.common_mcd == 20}">바디프로필</c:when>
						<c:when test="${board.common_mcd == 110}">공지</c:when>
						<c:when test="${board.common_mcd == 120}">문의</c:when>
						<c:otherwise>기타</c:otherwise>
					</c:choose>
				</td>
				<td><a href="detailBoard?b_number=${board.b_number}">${board.b_title}</a></td> 
				<td>${board.m_name}</td>
				<td>${board.b_regdate}</td>
 				<td>${board.b_recomm_count}</td>
 				<td>${board.b_isreported}</td>
				<td>${board.b_readcount}</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<p>
	<div style="text-align: right; padding: 0 5%;">
		<button type="button" class="btn btn-primary" 
	  		  onclick="location.href='writeFormBoard'">글쓰기</button>
	</div>
	<div style="display: grid; place-items: center;">
		<form action="jjCategorySearch" id="formCateSearch" method="get">
			<select name="search" >
				<option value="all"     <c:if test ="${board.search eq 'all'}">selected="selected"</c:if>>전체</option>
				<option value="title"   <c:if test ="${board.search eq 'title'}">selected="selected"</c:if>>제목</option>
				<option value="name"    <c:if test ="${board.search eq 'name'}">selected="selected"</c:if>>작성자</option>
				<option value="content" <c:if test ="${board.search eq 'content'}">selected="selected"</c:if>>내용</option>
			</select>
			<input type="hidden" name="cateSearch" value="${board.cateSearch}">
			
			<input type="text" name="keyword"  value="${board.keyword}"  placeholder="게시글 검색">
			<input type="submit" value="검색">
		</form>
	</div>
	<div style="display: grid; place-items: center;">
		<c:if test="${page.startPage > page.pageBlock}">
			<a href="jjCategorySearch?currentPage=${page.startPage-page.pageBlock}&cateSearch=${param.cateSearch}">[이전]</a>
		</c:if>
		<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
            	<button type="button" class="btn btn-primary" onclick="jjCategorySearchSubmit(${i})">${i}</button>
 			</c:forEach>
 		
 		</div>
		<c:if test="${page.endPage < page.totalPage}">
			<a href="jjCategorySearch?currentPage=${page.startPage+page.pageBlock}&cateSearch=${param.cateSearch}">[다음]</a>
		</c:if>
	</div>
	<p>
</body>
</html>