<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>헬스장 리스트</title>
  <!-- 부트스트랩 CDN 추가 -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* 추가한 CSS 스타일 */
    .card {
      margin-bottom: 20px; /* 카드 사이의 간격 조정 */
    }

    /* 검색창 스타일 */
    .search-input {
      font-size: 18px;
      padding: 15px;
      width: 100%; /* 검색박스의 너비를 조정 */
      max-width: 500px; /* 최대 너비 지정 */
    }

    /* 주소 폰트 스타일 */
    .address {
      font-family: Arial, sans-serif;
      color: #666; /* 주소 색상 */
      text-shadow: 1px 1px 2px #ccc; /* 주소에 음영 추가 */
    }

    /* 리뷰 수 폰트 스타일 */
    .review {
      color: black; /* 리뷰 수 색상 */
    }

    /* 별점 스타일 */
    .stars {
      color: #ffd700; /* 별점 색상 */
    }
  </style>
</head>
<body>
	
	<div class="container">
	  <h1 class="text-center my-5">헬스장 리스트</h1>
	
	  <!-- 검색창 및 필터 -->
	  <div class="row mb-4">
	    <div class="col-md-6 offset-md-3 order-md-2">
	      <form class="form-inline" id="searchForm">
	        <select class="form-control mr-2" id="filterOptions">
	          <option value="all" selected>모두</option>
	          <option value="4.0">별점 4.0 이상</option>
	          <option value="500">리뷰 수 500 이상</option>
	          <!-- 필요한 다른 필터 옵션들을 추가-->
	        </select>
	        <input type="text" class="form-control mr-2 search-input" id="searchInput" placeholder="헬스장 검색">
	        <button type="submit" class="btn btn-primary">검색</button>
	      </form>
	    </div>
	  </div>
	
	  <div class="row" id="cardContainer">
	  	<c:forEach var="board" items="${gymBoardList}" varStatus="loop">
	    <!-- 각 헬스장 카드 -->
	    <div class="col-md-6">
	      <div class="card">
	       <c:forEach var="file" items="${gymBoardFileList}"> 
	        <!-- Carousel 추가 -->
	        <div id="carouselExample" class="carousel slide" data-ride="carousel">
	          <div class="carousel-inner">
	            <div class="carousel-item active">
	              <img class="card-img-top" src="<c:url value='/upload/${gymBoardFileList[0].storedFileName}'/>" alt="헬스장 이미지">
	            </div>
	            <!-- 추가 이미지는 여기에 추가 -->
	            <c:if test="${loop.index > 0}">
		            <div class="carousel-item ">
		              <img class="card-img-top" src="<c:url value='/upload/${file.storedFileName}'/>" alt="헬스장 이미지">
		            </div>
		        </c:if>    
	          </div>
	          <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="sr-only">이전</span>
	          </a>
	          <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="sr-only">다음</span>
	          </a> 
	        </div>
	        </c:forEach> 
	        <!-- Carousel 끝 -->
	        <div class="card-body">
	          <h4 class="card-title">${board.gb_title}</h4>
<!-- 	          <p class="card-text">헬스장 소개 또는 설명</p> -->				
	          <p class="address">${gymAddress[loop.index].g_address}</p>
	          <p class="stars">&#9733; 4.0 <span class="review">(리뷰 수:100)</span></p>
	        </div>
	        <div class="card-footer">
	          <a href="gymPostDetail?g_id=${board.g_id}" class="btn btn-primary btn-sm">자세히 보기</a>
	        </div>
	      </div>
	    </div>
		
		</c:forEach>
	  </div>
	
	  <!-- 페이지 번호 -->
	  <div class="row mt-4">
	    <div class="col-md-6 offset-md-3">
	      <nav aria-label="페이지 네비게이션">
	        <ul class="pagination justify-content-center">
	          <li class="page-item disabled">
	            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
	          </li>
	          <li class="page-item active" aria-current="page">
	            <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
	          </li>
	          <li class="page-item"><a class="page-link" href="#">2</a></li>
	          <li class="page-item"><a class="page-link" href="#">3</a></li>
	          <li class="page-item">
	            <a class="page-link" href="#">다음</a>
	          </li>
	        </ul>
	      </nav>
	    </div>
	  </div>
	</div>

<!-- 부트스트랩 및 jQuery CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
  $(document).ready(function(){
    $('#searchForm').submit(function(event){
      event.preventDefault();
      var searchText = $('#searchInput').val().toLowerCase();
      var filterOption = $('#filterOptions').val();

      $('.card').each(function(){
        var cardText = $(this).text().toLowerCase();
        var stars = parseFloat($(this).find('.stars').text().trim());
        var reviews = parseInt($(this).find('.review').text().match(/\d+/)[0]);

        var showCard = true;

        // 검색어로 필터링
        if (searchText !== '') {
          if(cardText.indexOf(searchText) === -1){
            showCard = false;
          }
        }

        // 선택한 필터 옵션에 따라 필터링
        if (filterOption === '4.0') {
          if (stars < 4.0) {
            showCard = false;
          }
        } else if (filterOption === '500') {
          if (reviews < 500) {
            showCard = false;
          }
        }

        // 카드 보이기 또는 숨기기
        if (showCard) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    });
  });
</script>
</body>
</html>

