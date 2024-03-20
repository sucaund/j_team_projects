<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
				<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	
	<h3 style="text-align:center">자유게시판</h3>
	<p style="text-align:right">(총 글수: ${totalBoard})</p>
	
	<table class="table" >
	
	<!-- thead 부분 -->
	
		<thead  style="background-color: #5494e8; color: white;">
			<tr>
				<th>번호</th>
			<th>
				<form action="" method="get">
					<select name="cateSearch"   id="cateSearch" onchange="goCateSearch()">
						<option value="" selected disabled hidden>카테고리</option>
						<%-- <option value="cate-all" ${param.cateSearch == 'cate-all' ? 'selected' : ''}>전체</option> --%>
				        <option value="cate-free" ${param.cateSearch == 'cate-free' ? 'selected' : ''}>자유글</option>
				        <%-- <option value="cate-body" ${param.cateSearch == 'cate-body' ? 'selected' : ''}>바디프로필</option>
				        <option value="cate-notice" ${param.cateSearch == 'cate-notice' ? 'selected' : ''}>공지</option>
				        <option value="cate-question" ${param.cateSearch == 'cate-question' ? 'selected' : ''}>문의</option> --%>
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
		</thead>
		
		<!-- tbody 부분 -->
		
		<c:choose>
			<c:when test='${listBoard == null or empty listBoard}'>
				<td colspan="4">
					<p align="center">
						<b><span style=''>등록된 글이 없습니다.</span></b>

					</p>
				</td>
			</c:when>

			<c:when test="${listBoard != null }">
				<%-- <c:forEach var="board" items="${listBoard}">
					<tr>
						<td>${num}</td>
						<td><a href="QuestionContent?B_NUMBER=${board.b_number}">${board.b_title }</td>
						<td>${board.b_regdate}</td>
						<td>${commentCounts[board.b_number]}</td>
					</tr>
					<c:set var="num" value="${num - 1 }"></c:set>
				</c:forEach> --%>
				<c:forEach var="board" items="${listBoard}">
					<tr data-category="${board.common_mcd}">
						<td>${board.b_number}</td>
						<td>
							<c:choose>
								<c:when test="${board.common_mcd == 10}">자유글</c:when>
								<%-- <c:when test="${board.common_mcd == 20}">바디프로필</c:when>
								<c:when test="${board.common_mcd == 110}">공지</c:when>
								<c:when test="${board.common_mcd == 120}">문의</c:when>
								<c:otherwise>기타</c:otherwise> --%>
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

			</c:when>

		</c:choose>

	</table>
	
	<!-- 글작성 버튼 -->
	
	<c:if test="${sessionScope.m_number != null}">
		<div style="text-align: right; padding: 0 5%;">
			<button type="button" class="btn btn-primary" 
		  		  onclick="location.href='writeFormBoard'"><i class="bi bi-pencil-fill"></i>글작성</button>
		</div>
	</c:if>
	
	<!-- 게시글 검색 -->
	
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
		
	</div>
	
	<!-- 게시글 페이징 -->
	
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="pagination d-flex justify-content-center">
					<c:if test="${page.startPage > page.pageBlock}">
						<li class="page-item"><a class="page-link" href="jjCategorySearch?currentPage=${page.startPage-page.pageBlock}&cateSearch=${param.cateSearch}">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		            	<li class="page-item"><a class="page-link" href="#" onclick="jjCategorySearchSubmit(${i})">${i}</a></li>
		 			</c:forEach>
					<c:if test="${page.endPage < page.totalPage}">
						<li class="page-item"><a class="page-link" href="jjCategorySearch?currentPage=${page.startPage+page.pageBlock}&cateSearch=${param.cateSearch}">다음</a></li>
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