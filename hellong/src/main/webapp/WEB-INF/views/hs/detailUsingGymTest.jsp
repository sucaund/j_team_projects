<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../jh/jhHeaderGymList.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 리스트</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/windicss@3.0.14/css/windicss.min.css">
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
	    /* 페이지 번호 활성화 스타일 */
	    .page-item.active .page-link {
	        background-color: #007bff; /* 배경색 변경 */
	        color: #ffffff; /* 텍스트 색상 변경 */
	    }
        
		.bg-light-p3 {
		    background-color: #f8f9fa; /* 배경색 추가 */
		    padding: 1.5rem; /* 내부 여백 조정 */
		    border-radius: 10px; /* 모서리를 둥글게 만듦 */
		    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
		}
		
			    /* 추가된 CSS */
	    .search-container {
	        display: flex;
	        flex-direction: column;
	        align-items: center; /* 요소를 수직 방향으로 가운데 정렬 */
	        text-align: center; /* 내부 텍스트를 가운데 정렬 */
	    }
	
	    .filter-buttons {
	        width: 100%; /* 부모 요소에 꽉 차게 설정 */
	        max-width: 600px; /* 최대 너비 설정 */
	        /* 다른 스타일은 유지 */
	    }
		.search-input {
	        width: 900px; /* 원하는 너비로 설정 */
	    }	
			    /* 추가된 CSS */
		.search-box {
	      max-width: 600px; /* 최대 너비 설정 */
	      margin: 0 auto; /* 가운데 정렬 */
	    }
	
	    /* 너비 조정 */
	    #filterOptions {
	      width: 100px; /* 필터 옵션 너비 */
	    }
	
	    .search-input {
	      width: 100px; /* 검색창 너비 조정 */
	    }
	
		#searchInput{
			 width: 300px;
		}
	
	
	     .active-sort {
	        background-color: #007bff; /* 배경색 변경 */
	        color: #ffffff; /* 텍스트 색상 변경 */
	    }
			
		.page-link:hover {
	        background-color: #007bff; /* 호버 시 배경색 변경 */
	        color: #ffffff !important; /* 호버 시 텍스트 색상 변경 */
	        border-color: #007bff !important; /* 호버 시 테두리 색상 변경 */
	    }
	
		
	    /* price 버튼 활성화 스타일 */
	    .active-price {
	        background-color: #87CEEB; /* 배경색 변경 */
	        color: #ffffff; /* 텍스트 색상 변경 */
	    }
	
	    /* reviews 버튼 활성화 스타일 */
	    .active-reviews {
	        background-color: #28a745; /* 배경색 변경 */
	        color: #ffffff; /* 텍스트 색상 변경 */
	    }
	
	    /* stars 버튼 활성화 스타일 */
	    .active-stars {
	        background-color: #FFD700; /* 배경색 변경 */
	        color: #ffffff; /* 텍스트 색상 변경 */
	    }
        
    </style> 
</head>

<body>

<div class="container bo">



	<!-- 카드 내용 -->
    <div class="row justify-content-center mt-4">
    
		<div class="search-container mt-4">
		        
    
    	<c:set var="num" value="${page.total - page.start + 1}"></c:set>
        <c:forEach var="board" items="${listUsingGym}" varStatus="boardLoop">
            <!-- 각 헬스장 카드 -->
            <div class="col-md-5 mb-3">
                <div class="card h-100 p-4 bg-gray-100 rounded-lg shadow-md" onclick="location.href='gymPostDetail?g_id=${board.g_id}'">
                    <img class="card-img-top" src="<c:url value='/upload/${board.gbf_storedFileName}'/>" alt="헬스장 이미지">
                    <div class="card-body">
                    	<input type="hidden" value="${num}">
                        <div class="card-title">
						    <h4 class="text-3xl font-bold mb-2">
						        <strong>${board.g_name}</strong>
						    </h4>
						</div>
						<div class="card-subtitle text-3xl font-bold mb-2" style="color: #800080;">
						    <span style="font-style: italic; color: #00008b;">${board.g_address}</span>
						</div>
						
                        <p class="address text-gray-600"><i class="fa-solid fa-calendar-days" style="color: #CD5C5C;"></i> 첫 등록일: ${board.first_regist_date}</p>
                        <p class="stars text-yellow-500"><i class="fa-solid fa-dumbbell" style="color: #4682B4;"></i>
                        								 누적 개월수: ${board.period_of_use}</p>
                        <c:set var="num" value="${num - 1}"></c:set> 
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
  
                     

   <!-- 페이지 번호 -->
	<div class="row mt-1 justify-content-center">
	    <div class="col-md-6">
	        <nav aria-label="페이지 네비게이션">
	            <ul class="pagination justify-content-center">
	                <!-- 이전 버튼 -->
	                <li class="page-item ${page.startPage == 1 ? 'disabled' : ''}">
	                    <a class="page-link" href="hsDetailUsingGym?currentPage=${page.startPage - page.pageBlock}&sortType=${param.sortType}&search=${param.search}&keyword=${param.keyword}" tabindex="-1" aria-disabled="true">이전</a>
	                </li>
	                
	                <!-- 페이지 번호 -->
	                <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
	                    <c:choose>
	                        <c:when test="${page.currentPage == i}">
	                            <li class="page-item active"> <!-- 현재 페이지에 active 클래스 추가 -->
	                                <a class="page-link" href="hsDetailUsingGym?currentPage=${i}&sortType=${param.sortType}&search=${param.search}&keyword=${param.keyword}">${i}</a>
	                            </li>
	                        </c:when>
	                        <c:otherwise>
	                            <li class="page-item">
	                                <a class="page-link" href="hsDetailUsingGym?currentPage=${i}&sortType=${param.sortType}&search=${param.search}&keyword=${param.keyword}">${i}</a>
	                            </li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                
	                <!-- 다음 버튼 -->
	                <li class="page-item ${page.endPage == page.totalPage ? 'disabled' : ''}">
	                    <a class="page-link" href="hsDetailUsingGym?currentPage=${page.startPage + page.pageBlock}&sortType=${param.sortType}&search=${param.search}&keyword=${param.keyword}">다음</a>
	                </li>
       	            <li class="col-md-6 text-right">
	            	<input type="button" value="환불하기" 
						onclick="location.href='hsRefundFormUsingGym?m_number=${m_number}'">
            		</li>
	            </ul>

	        </nav>
	    </div>
	</div>


     
    
    
</div>
  
  

<!-- 부트스트랩 및 jQuery CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 폰트어썸 CDN 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

<script>
    
</script>
</body>
<%@ include file="../footer.jsp"%>
</html>