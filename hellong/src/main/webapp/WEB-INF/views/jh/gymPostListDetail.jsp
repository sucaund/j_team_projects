<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 이름</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 테일윈드 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- 폰트어썸 CDN 추가 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts 추가 -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <!-- Custom CSS 추가 -->
    <style>
        .gym-name {
            font-family: 'Roboto', sans-serif; 
            font-size: 24px; 
            margin-bottom: 20px; 
            border: none; 
            text-align: left; 
        }
        .container-md {
            max-width: 960px; 
        }
    </style>
</head>
<body class="bg-gray-100">

   <div class="container-md mx-auto py-8"> 
    <c:forEach var="board" items="${gymBoardDetail}"> 
        <div class="bg-white rounded-lg shadow-lg p-8 mb-8 border border-gray-300">
            <!-- 헬스장 이름을 폰트로 스타일링 -->
            <h2 class="gym-name text-3xl font-bold text-gray-800 mb-4">${board.g_name}</h2>
            <!-- 나머지 코드는 여기에 유지 -->
            <div class="mb-6 border border-gray-300 p-4">
                <h2 class="text-2xl font-bold text-gray-800 mb-4">${board.gb_title}</h2>
                <div class="text-lg text-gray-600 mb-4">
                    <p class="mb-2"><i class="fas fa-map-marker-alt mr-2"></i> ${board.g_address}</p>
                    <p class="flex items-center"><i class="fas fa-star text-yellow-500 mr-2"></i> 별점: <span class="font-bold">★★★★★</span></p>
                </div>
                <p class="text-lg text-gray-700">${board.gb_ment}</p>
            </div>
            
            


            <div class="mb-8 border border-gray-300 p-4">
                <div class="mb-4">
                    <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-tags mr-2"></i> 헬스장 이용권 목록:</h2>
                    <div class="flex flex-col gap-4">
                        <div class="bg-gray-200 rounded-lg p-4">
                            <h5 class="text-lg font-bold text-gray-800 mb-2">이용권1</h5>
                            <p class="text-gray-700">이용권1의 상세정보를 여기에 입력합니다. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <p class="text-gray-700">가격: $10</p>
                            <p class="text-gray-700">이용기간: 1 month</p>
                        </div>
                        <div class="bg-gray-200 rounded-lg p-4">
                            <h5 class="text-lg font-bold text-gray-800 mb-2">이용권2</h5>
                            <p class="text-gray-700">이용권2의 상세정보를 여기에 입력합니다. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <p class="text-gray-700">가격: $20</p>
                            <p class="text-gray-700">이용기간: 3 months</p>
                        </div>
                    </div>
                </div>
            </div>   
            
            
            <div class="mb-8 border border-gray-300 p-4">
                <div class="mb-4">
                    <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-user-friends mr-2"></i> 트레이너 목록</h2>
                    <ul class="list-disc list-inside">
                        <li class="text-gray-700">트레이너1: 사진, 이름, 경력사항</li>
                        <li class="text-gray-700">트레이너2: 사진, 이름, 경력사항</li>
                        <!-- 추가적인 트레이너 정보 -->
                    </ul>
                </div>
            </div>
          
            <div class="mb-8 border border-gray-300 p-4">
                <div class="mb-4">
                  <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-dumbbell mr-2"></i> 운동기구</h2>
                  <p class="text-lg text-gray-700">${board.gb_machine}</p>
                </div>
            </div>
          
            <div class="mb-8 border border-gray-300 p-4">
                <div class="mb-4">
                  <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-shower mr-2"></i> 편의시설</h2>
                  <p class="text-lg text-gray-700">${board.gb_amen}</p>
                </div>
            </div>

          
            
            
			 <div class="mb-8 border border-gray-300 p-4">
                <h2 class="text-lg font-bold text-gray-800 mb-4"><i class="fas fa-images mr-2"></i> 헬스장 이미지</h2>
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <c:forEach var="index" begin="0" end="${gymBoardFileList.size() - 1}">
                            <li data-target="#carouselExampleIndicators" data-slide-to="${index}" <c:if test="${index == 0}">class="active"</c:if>></li>
                        </c:forEach>
                    </ol>
        
                    <div class="carousel-inner">
                        <c:forEach var="file" items="${gymBoardFileList}" varStatus="status">
                            <div class="carousel-item <c:if test='${status.index == 0}'>active</c:if>">
                                <img class="w-full h-auto" src="<c:url value='/upload/${file.gbf_storedFileName}'/>" alt="헬스장 이미지">
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
            
            
	        <!-- 동영상 추가 -->
	        <div class="mb-8 border border-gray-300 p-4 bg-white">
	            <div class="video-container">
	                <h2 class="text-lg font-bold text-gray-800 mb-4"><i class="fas fa-video mr-2"></i> 헬스장 동영상</h2>
	                <div class="embed-responsive embed-responsive-16by9">
	                    <iframe class="embed-responsive-item" src="${board.gb_video}" allowfullscreen></iframe>
	                </div>
	            </div>
	        </div>
	        
	        
			<!-- 리뷰 카드 추가 -->
			<div class="mb-8 border border-gray-300 p-4">
			    <div class="review-card p-4">
			        <h2 class="text-lg font-bold text-gray-800 mb-4"><i class="fas fa-comment-alt mr-2"></i> 고객 리뷰</h2>
			        
			        <div class="flex items-center mb-4">
			            <h3 class="font-bold text-gray-800 mr-3">평균평점: <span class="text-yellow-500">4.5</span></h3>
			            <h3 class="font-bold text-gray-800">리뷰수: 20명</h3>
			        </div>
			        

			        <div class="flex items-center mb-4">
			            <i class="fas fa-user-circle text-gray-600 mr-3 text-4xl"></i>
			            <div>
			                <h5 class="font-bold text-gray-800">고객 이름 <i class="fas fa-check-circle text-green-500">결제고객</i> <span class="text-yellow-500">★★★★★</span></h5>
			                <p class="text-gray-700">리뷰 내용 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel dolor vitae neque consequat auctor.</p>
			            </div>
			        </div>
			        
			        <!-- Second Review -->
			        <div class="flex items-center mb-4">
			            <!-- Person Icon -->
			            <i class="fas fa-user-circle text-gray-600 mr-3 text-4xl"></i>
			            <div>
			                <!-- Customer Name with Payment Verification and Star Rating -->
			                <h5 class="font-bold text-gray-800">고객 이름 <i class="fas fa-check-circle text-green-500">결제고객</i> <span class="text-yellow-500">★★★★★</span></h5>
			                <!-- Review Content -->
			                <p class="text-gray-700">리뷰 내용 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel dolor vitae neque consequat auctor.</p>
			            </div>
			        </div>
			        
			        <button class="bg-blue-500 text-white py-2 px-4 rounded-lg mr-4">리뷰 쓰기</button>
			        <button class="bg-gray-500 text-white py-2 px-4 rounded-lg">리뷰 더보기</button>
			    </div>
			</div>     
	        
	        
	        
	        <div class="mb-8 border border-gray-300 p-4 bg-white">
	            <div id="map" class="h-96"></div>
	        </div>
            
            
       </div>
        
      
        
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