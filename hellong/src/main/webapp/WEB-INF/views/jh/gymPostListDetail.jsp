<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 이름</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .promotion-container {
            max-width: 800px;
            margin: 50px auto;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
        }
        .carousel-container {
            margin-top: 50px;
        }
        .review-card {
            margin-top: 20px; /* 리뷰 간격 조정 */
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
        }
        #map {
            height: 500px;
            margin-top: 50px;
        }
        .content-container {
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
        }
        .section-title {
            background-color: #6c757d; /* 회색 배경 */
            color: #fff; /* 흰색 텍스트 */
            padding: 10px 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .section-container {
            margin-top: 30px; /* 컨테이너 위 간격 */
        }
        .btn-custom {
            margin-top: 10px;
        }
        /* 주소 정보 스타일 */
        .address-info {
            font-size: 14px; /* 글꼴 크기 조정 */
            font-family: Arial, sans-serif; /* 다른 글꼴 지정 */
        }
        /* 헬스장 이름 폰트 두껍게 */
        .section-main-title {
            font-weight: bold;
        }
        /* 별모양 스타일 */
        .star-rating {
            color: #FFD700; /* 금색으로 별모양 채우기 */
        }
        /* 이미지 크기 지정 */
        img {
            max-width: 820px;
            height: 500;
        }
    </style>
</head>
<body>
	<div class="container promotion-container">
	<c:forEach var="board" items="${gymBoardDetail}"> 
	    <div class="promotion-content">
	        <div class="section-container">
	        	<h2> ${board.g_name} </h2><p>
	            <h2 class="section-main-title"> ${board.gb_title}
	                <div class="content-container">
	                    <p class="address-info">헬스장의 주소: ${board.g_address}</p>
	                    <!-- 별점 추가 -->
	                    <p class="address-info">별점: <span class="star-rating">★★★★★</span></p>
	                </div>
	            </h2>
	            <!-- 주소와 별점 추가 -->
	            <div class="content-container">
	                ${board.gb_ment}
	            </div>
	        </div>
			<div class="carousel-container">
			    <h2 class="section-title">헬스장 이미지</h2>
			    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			        <ol class="carousel-indicators">
			            <c:forEach var="index" begin="0" end="${gymBoardFileList.size() - 1}">
			                <li data-target="#carouselExampleIndicators" data-slide-to="${index}" <c:if test="${index == 0}">class="active"</c:if>></li>
			            </c:forEach>
			        </ol>
			
			        <div class="carousel-inner">
			            <c:forEach var="file" items="${gymBoardFileList}" varStatus="status">
			                <div class="carousel-item <c:if test='${status.index == 0}'>active</c:if>">
			                    <img class="d-block w-100" src="<c:url value='/upload/${file.gbf_storedFileName}'/>" alt="헬스장 이미지">
			                </div>
			            </c:forEach>
			        </div>
			
			        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			            <span class="sr-only">이전</span>
			        </a>
			        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			            <span class="carousel-control-next-icon" aria-hidden="true"></span>
			            <span class="sr-only">다음</span>
			        </a>
			    </div>
			</div>

			 <div class="section-container">
			    <div class="content-container">
			        <h2 class="section-title">헬스장 이용권 목록:</h2>
			        <div class="card">
			            <div class="card-body">
			                <h5 class="card-title">이용권1</h5>
			                <p class="card-text">이용권1의 상세정보를 여기에 입력합니다. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
			                <p class="card-text">가격: $10</p>
			                <p class="card-text">이용기간: 1 month</p>
			            </div>
			        </div>
			        <p>
			        <div class="card">
			            <div class="card-body">
			                <h5 class="card-title">이용권2</h5>
			                <p class="card-text">이용권2의 상세정보를 여기에 입력합니다. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
			                <p class="card-text">가격: $20</p>
			                <p class="card-text">이용기간: 3 months</p>
			            </div>
			        </div>
			    </div>
			</div>   
		    
		    
		    
	        <div class="section-container">
	            <div class="content-container">
	                <h2 class="section-title">트레이너 목록</h2>
	                <ul>
	                    <li>트레이너1: 사진, 이름, 경력사항</li>
	                    <li>트레이너2: 사진, 이름, 경력사항</li>
	                    <!-- 추가적인 트레이너 정보 -->
	                </ul>
	            </div>
	        </div>
	        
	      
	        <div class="section-container">
	            <div class="content-container">
	              <h2 class="section-title">운동기구</h2>
	              ${board.gb_machine}
	            </div>
	        </div>
	      
	        <div class="section-container">
	            <div class="content-container">
	              <h2 class="section-title">편의시설</h2>
	              ${board.gb_amen }
	            </div>
	        </div>
	   

	        
	        <!-- 리뷰 카드 추가 -->
	        <div class="review-card">
	            <h2 class="section-title">고객 리뷰</h2>
	            <div class="media">
	                <img src="https://via.placeholder.com/50" class="mr-3" alt="...">
	                <div class="media-body">
	                    <h5 class="mt-0">고객 이름</h5>
	                    리뷰 내용 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel dolor vitae neque consequat auctor.
	                </div>
	            </div>
	            <div class="media mt-3">
	                <img src="https://via.placeholder.com/50" class="mr-3" alt="...">
	                <div class="media-body">
	                    <h5 class="mt-0">고객 이름</h5>
	                    리뷰 내용 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel dolor vitae neque consequat auctor.
	                </div>
	            </div>
	            <button class="btn btn-primary btn-custom">리뷰 쓰기</button>
	            <button class="btn btn-secondary btn-custom">리뷰 더보기</button>
	        </div>
	    </div>
	    

	    
	    <!-- 동영상 추가 -->
	    <div class="video-container mt-4">
	        <h2 class="section-title">헬스장 동영상</h2>
	           <iframe width="750" height="400" src="${board.gb_video}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	    </div>
	    
	    <div id="map"></div>
	    
	    
	</c:forEach>
	</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function initMap() {
        var healthClubLocation = { lat: 37.12345, lng: 127.12345 };
        var mapElement = document.getElementById('map');
        var map = new google.maps.Map(mapElement, {
            center: healthClubLocation,
            zoom: 15
        });
        var marker = new google.maps.Marker({
            position: healthClubLocation,
            map: map,
            title: '헬스장 위치'
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
</body>
</html>
