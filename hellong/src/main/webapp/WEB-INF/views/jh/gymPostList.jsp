<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>헬스장 리스트</title>
  <!-- 부트스트랩 CDN 추가 -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- 폰트어썸 CDN 추가 -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <!-- 나눔고딕 폰트 추가 -->
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- 윈드테일 CDN 추가 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/windicss@3.0.14/css/windicss.min.css">
  <style>
    /* 추가한 CSS 스타일 */
    .card {
      margin-bottom: 20px;
      height: 100%;
      cursor: pointer;
    }

    /* 검색창 스타일 ... */

    /* 주소 폰트 스타일 */
    .address {
      font-family: 'Nanum Gothic', sans-serif; /* 나눔고딕 폰트 적용 */
      color: #9f7aea; /* 주소 색상 변경 */
      text-shadow: 1px 1px 2px #ccc;
      font-size: 16px; /* 폰트 사이즈 조정 */
    }

    /* 리뷰 수 폰트 스타일 ... */

    /* 별점 스타일 ... */

    .card-img-top {
      width: auto;
      height: 250px;
      object-fit: cover;
      max-width: 100%;
    }

    /* 카드 컨테이너 스타일 ... */

    /* 카드 내부 요소 정렬 */
    .card-body, .card-footer {
      text-align: left;
    }

    /* 카드 타이틀 스타일 */
    .card-title {
      font-size: 24px; /* 타이틀 폰트 사이즈 조정 */
      font-weight: bold; /* 타이틀 폰트 굵기 설정 */
      color: #1a202c; /* 타이틀 색상 설정 */
    }

    /* 아이콘 스타일 */
    .icon {
      color: #fbbf24; /* 아이콘 색상 설정 */
      margin-right: 5px; /* 아이콘과 텍스트 사이 간격 조정 */
    }

    /* 좋아요 버튼 스타일 */
    .like-btn {
      color: #f44336; /* 좋아요 버튼 색상 설정 */
      cursor: pointer;
    }

    /* 좋아요 버튼 클릭 시 색상 변경 */
    .like-btn.active {
      color: #ff5722;
    }
  </style>
</head>
<body>
  
  <div class="container">
    <h1 class="text-center my-5"><i class="fas fa-dumbbell"></i> 헬스장 리스트 <i class="fas fa-dumbbell"></i></h1>
  
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
          <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> 검색</button>
        </form>
      </div>
    </div>
  
    <div class="row" id="cardContainer">
      <c:forEach var="board" items="${gymBoardList}" varStatus="boardLoop">
        <!-- 각 헬스장 카드 -->
        <div class="col-md-6 mb-4">
          <div class="card h-100 p-4 bg-gray-100 rounded-lg shadow-md" onclick="location.href='gymPostDetail?g_id=${board.g_id}'">
            <img class="card-img-top" src="<c:url value='/upload/${gymBoardFileList[boardLoop.index].gbf_storedFileName}'/>" alt="헬스장 이미지">
            <div class="card-body">
              <h4 class="card-title text-3xl font-bold mb-2">${gymImformation[boardLoop.index].g_name}</h4>
              <h4 class="card-title text-2xl font-bold mb-2">${board.gb_title}</h4>
              <p class="address text-gray-600"><i class="fas fa-map-marker-alt icon"></i>${gymImformation[boardLoop.index].g_address}</p>
              <p class="stars text-yellow-500"><i class="fas fa-star icon"></i> 4.0 <span class="review">(리뷰 수:100)</span></p>
            </div>
            <!-- 좋아요 버튼 -->
            <div class="card-footer">
              <button class="like-btn" onclick="toggleLike(this)">
                <i class="fas fa-heart"></i> 좋아요
              </button>
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
<!-- 폰트어썸 CDN 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

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

  // 좋아요 버튼 토글 함수
  function toggleLike(btn) {
    $(btn).toggleClass('active');
  }
</script>
</body>
</html>
