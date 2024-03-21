<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="/js/dyBodyProfile.js"></script>
<meta charset="UTF-8">
<title>바디 프로필 게시판</title>

<style>
/* 기본 설정 */
body, html {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

/* 컨테이너 설정 */
.container1 {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
	justify-content: space-between;
	align-items: center;
	text-align: center;
}

.row {
	display: flex;
	flex-wrap: wrap;
	margin-right: -15px; /* 오른쪽 마진 제거 */
	margin-left: -15px; /* 왼쪽 마진 제거 */
}

.single-product {
	margin: 15px 0; /* single-product의 상단과 하단 마진을 추가로 조정 */
	padding: 15px;
	background-color: #fff;
	border: 1px solid #f0f0f0;
	border-radius: 8px;
	overflow: hidden;
	transition: transform .3s ease;
	
}

.product-image img, .img-container img {
	width: auto; /* 이미지 너비를 자동으로 설정하여 비율 유지 */
	height: calc(100% + 30px); /* 이미지 높이를 기존보다 30px 늘림 */
	object-fit: cover; /* 이미지가 컨테이너를 꽉 채우도록 설정 */
}

.single-product:hover {
	transform: translateY(-5px); /* 호버 시 위로 올라가는 효과 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.product-image img {
	width: 100%;
	height: auto;
	border-bottom: 1px solid #f0f0f0;
}

.product-info {
	padding: 15px;
	text-align: center;
}

.product-info h4.title {
	margin: 10px 0;
	font-size: 1rem; /* 제목 크기 조절 */
	color: #333;
}


.product-info .review {
	list-style: none;
	padding: 0;
	margin: 0;
}
.review3 {
	color: #0167F3;
}

.product-info .price {
	font-size: 1.2rem;
	color: #333;
	font-weight: bold;
	margin-top: 5px;
}

/* 페이지 네이션 */
.pagination {
	margin-top: 20px;
}

.pagination .page-item.active .page-link {
	background-color: #007bff;
	border-color: #007bff;
	color: #fff;
}

.pagination .page-link {
	color: #007bff;
}

/* 검색 및 글쓰기 버튼 컨테이너 */
.paging-search-container {
	margin-top: 20px;
	text-align: center;
}

.paging-search-container button, .paging-search-container input,
	.paging-search-container select {
	margin: 5px;
}

/* 반응형 디자인 */
@media ( max-width : 768px) {
	.row {
		flex-direction: column;
	}
}

.img-container {
	display: flex; /* Flexbox 레이아웃 사용 */
	justify-content: center; /* 가로 방향으로 중앙 정렬 */
	align-items: center; /* 세로 방향으로 중앙 정렬 - 필요한 경우 */
	height: 220px; /* 이미지 컨테이너의 높이. 필요에 따라 조정하세요. */
	overflow: hidden; /* 컨테이너를 벗어나는 이미지 숨김 처리 */
}

.img-container img {
	height: auto; /* 이미지의 높이를 자동으로 설정하여 비율 유지 */
	max-height: 200px;
	min-height: 200px;
	max-width: 100%; /* 이미지의 최대 너비를 100%로 설정해 넘치지 않도록 */
	object-fit: cover; /* 이미지 비율을 유지하면서 컨테이너를 꽉 채움 */
}

.btn-custom {
	padding: .375rem .75rem; /* 부트스트랩 기본 버튼 패딩과 동일하게 설정 */
	font-size: 1rem; /* 부트스트랩 기본 버튼 폰트 크기와 동일하게 설정 */
	line-height: 1.5; /* 부트스트랩 기본 버튼 라인 높이와 동일하게 설정 */
}
</style>
</head>
<body>

	<div class="container1">
		<div class="breadcrumbs">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-6 col-12">
						<div class="breadcrumbs-content">
							<h1 class="page-title">바디프로필</h1>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-12">
						<ul class="breadcrumb-nav">
							<li><a href="/Default"><i class="lni lni-home"></i>
									Home</a></li>
							<li>BodyProfile</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="searchResults">
			<c:forEach items="${listBodyProfile}" var="board" varStatus="loop">
				<div class="col-lg-2 col-md-4 col-sm-6 col-12">
					<div class="single-product">
						<div class="product-image">
							<a href="dySelectBodyProfile?b_number=${board.b_number}">
								<div class="img-container">
									<img
										src="${request.contextPath}/upload/${firstImageMap[board.b_number]}"
										alt="Board Image">
								</div>
							</a>
						</div>
						<div class="product-info">
							<h4 class="title">
								<a href="dySelectBodyProfile?b_number=${board.b_number}">${board.b_title}</a>
							</h4>
							<ul class="review">
								<li><span><i class="bi bi-hand-thumbs-up-fill"></i>추천
										${board.b_recomm_count}</span></li>
							</ul>
							<ul class="review">
								<li><span><i class="bi bi-hand-thumbs-up-fill"></i>조회수
										${board.b_readcount}</span></li>
							</ul>
							<ul class="review">
								<li><span><i class="bi bi-hand-thumbs-up-fill "></i>
										${board.m_name}</span1></li>
							</ul>
						</div>
					</div>
				</div>
				<c:if test="${loop.index % 5 == 4}">
		</div>
		<div class="row">
			</c:if>
			</c:forEach>
		</div>

		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<c:if test="${page.currentPage != 1}">
					<c:url var="prevPageUrl"
						value="?currentPage=${page.currentPage - 1}&search=${param.search}&keyword=${param.keyword}" />
					<li class="page-item"><a class="page-link"
						href="${prevPageUrl}" aria-label="Previous">&laquo;</a></li>
				</c:if>
				<c:forEach begin="1" end="${page.totalPage}" var="pageNum">
					<c:url var="pageUrl"
						value="?currentPage=${pageNum}&search=${param.search}&keyword=${param.keyword}" />
					<li
						class="page-item ${pageNum == page.currentPage ? 'active' : ''}">
						<a class="page-link" href="${pageUrl}">${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${page.currentPage lt page.totalPage}">
					<c:url var="nextPageUrl"
						value="?currentPage=${page.currentPage + 1}&search=${param.search}&keyword=${param.keyword}" />
					<li class="page-item"><a class="page-link"
						href="${nextPageUrl}" aria-label="Next">&raquo;</a></li>
				</c:if>
			</ul>
		</nav>

		<div class="paging-search-container mt-3">
			<div class="d-flex justify-content-center">
				<div class="col-lg-8">
					<form id="searchForm" action="dyBoardSearch" method="get"
						class="d-flex">
						<div class="input-group">
							<select name="search" class="form-select me-2"
								style="width: 30px;">
								<!-- 여기서 셀렉트바의 가로 길이를 조정했습니다. -->
								<option value="all">제목+내용</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> <input type="text" name="keyword" class="form-control"
								placeholder="바디프로필 검색" style="flex-grow: 1;">
							<!-- 검색란의 가로 길이를 flex-grow를 사용하여 늘렸습니다. -->
							<button type="submit"
								class="btn btn-outline-dark ms-2 btn-custom">검색</button>
							<button onclick="location.href='dyWriteFormBodyProfile'"
								type="button" class="btn btn-outline-dark ms-2 btn-custom"
								style="margin-top: 0;">글쓰기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>