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
    <!-- 스타일 수정 -->
    <style>
        /* 추가한 CSS 스타일 */
        .card {
            height: 100%;
            cursor: pointer;
        }

        /* 검색창 스타일 ... */

        /* 주소 폰트 스타일 */
        .address {
            font-family: 'Nanum Gothic', sans-serif; /* 나눔고딕 폰트 적용 */
            color: #1a202c; /* 주소 색상 변경 */
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
        .card-body,
        .card-footer {
            text-align: left;
        }

        /* 카드 타이틀 스타일 */
        .card-title {
            font-size: 24px; /* 타이틀 폰트 사이즈 조정 */
            font-weight: bold; /* 타이틀 폰트 굵기 설정 */
            color: #1a202c; /* 타이틀 색상 설정 */
            font-family: 'Arial', sans-serif; /* 다른 폰트 적용 */
            display: flex; /* Flexbox 사용 */
            justify-content: space-between; /* 요소들을 좌우 정렬 */
            align-items: center; /* 요소들을 수직 정렬 */
        }

        /* 아이콘 스타일 */
        .icon {
            color: #fbbf24; /* 아이콘 색상 설정 */
            margin-right: 5px; /* 아이콘과 텍스트 사이 간격 조정 */
        }

        /* 좋아요 버튼 스타일 */
        .like-btn {
            cursor: pointer;
            font-size: 16px;
            color: #ccc; /* 빈 하트의 색상 */
        }

        /* 좋아요 버튼 클릭 시 색상 변경 */
        .like-btn.active {
            color: #ff0000; /* 클릭 시 빨간색으로 변경 */
        }

        /* 주소 아이콘 색상 변경 */
        .address .icon {
            color: #ff4500; /* 다른 색상으로 변경 */
        }

        /* 가격 요소 스타일 */
        .price {
            text-align: right;
            font-size: 25px; /* 가격 폰트 사이즈 조정 */
            color: #ff6b6b; /* 가격 색상 변경 */
            font-weight: bold; /* 가격 폰트 굵기 설정 */
            font-family: 'Arial', sans-serif; /* 다른 폰트 적용 */
            margin-top: 10px; /* 가격과 좋아요 버튼 사이 간격 조정 */
        }

        /* 가격 아이콘 스타일 */
        .price i {
            margin-right: 5px; /* 아이콘과 텍스트 사이 간격 조정 */
            color: #ff6b6b; /* 아이콘 색상 변경 */
        }

        /* 카드 푸터 스타일 */
        .card-footer {
            padding: 0; /* 푸터 내부 패딩 제거 */
            margin-top: 10px; /* 카드와 페이지 네비게이션 사이 간격 조정 */
        }

        /* 카드 바닥부분 패딩 제거 */
        .card-body {
            padding-bottom: 0;
        }
    </style>
</head>

<body>

<div class="container">
    <h1 class="text-center my-5"><i class="fas fa-dumbbell"></i> 헬스장 리스트 <i class="fas fa-dumbbell"></i></h1>


  
    <!-- 검색창 및 필터 -->
    <div class="row mb-4 justify-content-center">
        <div class="col-md-6">
            <form class="form-inline" id="searchForm">
                <select class="form-control mr-2" id="filterOptions">
                    <option value="all" selected>모두</option>
                    <option value="4.0">별점 4.0 이상</option>
                    <option value="500">리뷰 수 500 이상</option>
                    <!-- 필요한 다른 필터 옵션들을 추가-->
                </select>
                <input type="text" class="form-control mr-2 search-input" id="searchInput" placeholder="헬스장 검색" style="width: 50%;">
                <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> 검색</button>
            </form>
        </div>
    </div>

	<!-- 카드 내용 -->
    <div class="row justify-content-center">
    	<c:set var="num" value="${page.total - page.start + 1}"></c:set>
        <c:forEach var="board" items="${gymImformation}" varStatus="boardLoop">
            <!-- 각 헬스장 카드 -->
            <div class="col-md-5 mb-3">
                <div class="card h-100 p-4 bg-gray-100 rounded-lg shadow-md" onclick="location.href='gymPostDetail?g_id=${board.g_id}'">
                    <img class="card-img-top" src="<c:url value='/upload/${gymBoardFileList[boardLoop.index].gbf_storedFileName}'/>" alt="헬스장 이미지">
                    <div class="card-body">
                    	<input type="hidden" value="${num}">
                        <div class="card-title">
						    <h4 class="text-3xl font-bold mb-2">
						        <strong>${board.g_name}</strong>
						    </h4>
						    <div class="like-btn" onclick="toggleLike(this)">
						        <i class="fas fa-heart"></i> 찜하기
						    </div>
						</div>
						<div class="card-subtitle text-3xl font-bold mb-2" style="color: #800080;">
						    <span style="font-style: italic; color: #00008b;">${board.gb_title}</span>
						</div>
                        <p class="address text-gray-600"><i class="fas fa-map-marker-alt icon"></i>${board.g_address}</p>
                        <p class="stars text-yellow-500"><i class="fas fa-star icon"></i>
                        								 ${avgReview[boardLoop.index].avg_review_star} 
                        								<span class="review">(리뷰 수:${avgReview[boardLoop.index].count_review_star})</span>
                        </p>
                        <!-- 가격 정보 -->
                        <p class="price"><i class="fas fa-won-sign"></i>${minPrice[boardLoop.index].min_s_price}원부터~</p>
                        <c:set var="num" value="${num - 1}"></c:set> 
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
  
                     

    <!-- 페이지 번호 -->
	<div class="row mt-4 justify-content-center">
	    <div class="col-md-6">
	        <nav aria-label="페이지 네비게이션">
	            <ul class="pagination justify-content-center">
	                <li class="page-item ${page.startPage == 1 ? 'disabled' : ''}">
	                    <a class="page-link" href="GymPostList?currentPage=${page.startPage - page.pageBlock}" tabindex="-1" aria-disabled="true">이전</a>
	                </li>
	                <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		                <c:choose>
		                    <c:when test="${page.currentPage == i}">
		                        <li class="page-item"><a class="page-link" href="GymPostList?&currentPage=${i}">${i}</a></li>
		                    </c:when>
		                    <c:otherwise>
		                        <li class="page-item"><a class="page-link" href="GymPostList?&currentPage=${i}">${i}</a></li>
		                    </c:otherwise>
		                </c:choose>
		             </c:forEach>
	                <li class="page-item ${page.endPage == page.totalPage ? 'disabled' : ''}">
	                    <a class="page-link" href="GymPostList?currentPage=${page.startPage + page.pageBlock}">다음</a>
	                </li>
	            </ul>
	        </nav>
	    </div>
	</div>
     
    
    
</div>
  
  
    <!-- 전체 글 수 표시 -->
    <div class="row justify-content-center mb-3">
        <div class="col-md-6">
            <p class="text-center"><strong><span id="totalPosts" style="color: blue;">전체 게시글 수: ${gymImformationCount}개</span></strong></p>
        </div>
    </div>
  
  

<!-- 부트스트랩 및 jQuery CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 폰트어썸 CDN 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

<script>
    $(document).ready(function () {
        $('#searchForm').submit(function (event) {
            event.preventDefault();
            var searchText = $('#searchInput').val().toLowerCase();
            var filterOption = $('#filterOptions').val();

            $('.card').each(function () {
                var cardText = $(this).text().toLowerCase();
                var stars = parseFloat($(this).find('.stars').text().trim());
                var reviews = parseInt($(this).find('.review').text().match(/\d+/)[0]);

                var showCard = true;

                // 검색어로 필터링
                if (searchText !== '') {
                    if (cardText.indexOf(searchText) === -1) {
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

        // 각 카드의 좋아요 버튼에 대한 이벤트 핸들링
        $('.like-btn').click(function (event) {
            event.stopPropagation(); // 이벤트 버블링 중단

            $(this).toggleClass('active'); // 찜하기 버튼 활성화/비활성화 토글
        });

        // 각 카드를 클릭했을 때 이벤트 핸들링
        $('.card').click(function (event) {
            var target = event.target; // 클릭된 요소

            // 만약 클릭된 요소가 찜하기 버튼이면 화면 이동을 막음
            if ($(target).hasClass('like-btn') || $(target).parents('.like-btn').length > 0) {
                event.preventDefault();
            }
        });
        
        $('.price').each(function () {
            var priceText = $(this).text(); // 가격 텍스트 가져오기
            var priceNumber = parseInt(priceText.replace(/\D/g, '')); // 숫자로 변환

            // 세 자리마다 쉼표 추가
            var formattedPrice = numberWithCommas(priceNumber);

            // 가격을 변환된 값으로 변경
            $(this).text(formattedPrice + '원부터~');
        });

        // 세 자리마다 쉼표를 추가하는 함수
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }     
            
    });
 
    
</script>
</body>

</html>