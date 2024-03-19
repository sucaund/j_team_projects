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
	font-family: 'Noto Sans KR', sans-serif; /* 폰트는 취향에 맞게 조정하세요 */
}

/* 컨테이너 설정 */
.container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}

/* 제품 그리드 */
.row {
	display: flex;
	flex-wrap: wrap;
	margin: -15px; /* 그리드 간격 조절용 */
	justify-content: space-between;
	
}

.single-product {
    width: calc(100% + 50px); /* 기존 너비에서 50px 늘림 */
    height: auto; /* 높이는 자동으로 설정되도록 변경 */
    padding: 25px; /* 내부 여백을 추가하여 내용물이 컨테이너 경계에 닿지 않도록 함 */
    background-color: #fff;
    border: 1px solid #f0f0f0;
    border-radius: 8px;
    overflow: hidden;
    transition: transform .3s ease;
    margin-bottom: 50px; /* 하단 마진 추가로 각 요소 간격 늘림 */
    margin: 60px;
}

.product-image img, .img-container img {
    width: auto; /* 이미지 너비를 자동으로 설정하여 비율 유지 */
    height: calc(100% + 50px); /* 이미지 높이를 기존보다 50px 늘림 */
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
  height: 200px; /* 이미지 컨테이너의 높이. 필요에 따라 조정하세요. */
  overflow: hidden; /* 컨테이너를 벗어나는 이미지 숨김 처리 */
}

.img-container img {
  height: auto; /* 이미지의 높이를 자동으로 설정하여 비율 유지 */
  max-width: 100%; /* 이미지의 최대 너비를 100%로 설정해 넘치지 않도록 */
  object-fit: cover; /* 이미지 비율을 유지하면서 컨테이너를 꽉 채움 */
}
.col-lg-2 col-md-4 col-sm-6 col-12 {
	display: flex;
  flex-direction: row; /* 기본값이므로, 생략 가능합니다. */
  justify-content: center; /* 가로축을 기준으로 중앙 정렬합니다. */
  align-items: center;
}

</style>
</head>
<body>

	<div class="container">
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
							<li><a href="index.html"><i class="lni lni-home"></i>
									Home</a></li>
							<li>BodyProfile</li>
						</ul>
					</div>
				</div>
			</div>
		</div>



		<%-- <div class="grid-container" id="searchResults">
			<c:forEach items="${listBodyProfile}" var="board" varStatus="loop">
				<div class="grid-item">

					<a href="dySelectBodyProfile?b_number=${board.b_number}"> <img
						src="${request.contextPath}/upload/${firstImageMap[board.b_number]}"
						alt="Board Image">

					</a>


					<p>
						<a href="dySelectBodyProfile?b_number=${board.b_number}">${board.b_title}</a>
					</p>
				</div>
			</c:forEach>
		</div> --%>



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
								<li><span><i class="bi bi-hand-thumbs-up-fill"></i>${board.b_recomm_count}</span></li>
							</ul>
							<div class="price">
								<span>$199.00</span>
							</div>
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

		<div class="paging-search-container">
			<form id="searchForm" action="dyBoardSearch" method="get">
				<select name="search">
					<option value="all">제목+내용</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> <input type="text" name="keyword" placeholder="바디프로필 검색">
				<button type="submit" class="btn btn-outline-dark">검색</button>
			</form>
			<button onclick="location.href='dyWriteFormBodyProfile'"
				type="button" class="btn btn-outline-dark">글쓰기</button>
		</div>
	</div>

</body>
</html>