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
					<p class="flex items-center">
					    <i class="fas fa-star text-yellow-500 mr-2"></i> 
					    <span class="font-bold">${avgReviewSelect.avg_review_star}</span>
					    <span class="ml-3 font-bold" style="color: #3366FF;">리뷰 ${avgReviewSelect.count_review_star}개</span>
					</p>
                </div>
                <p class="text-lg text-gray-700">${board.gb_ment}</p>
            </div>
            

            <div class="mb-8 border border-gray-300 p-4">
                <div class="mb-4">
                    <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-tags mr-2"></i> 헬스장 이용권 목록</h2>
                    <div class="flex flex-col gap-4">
					 <c:forEach var="service" items="${selectServiceList}" varStatus="loop">
					       <div class="bg-gray-200 rounded-lg p-4 <c:if test='${loop.index > 2}'>more-services hidden</c:if>">
                            <h5 class="text-lg font-bold text-gray-800 mb-2">${service.s_name}</h5>
                            <p class="text-gray-700">${service.s_detail}</p>
                            <p class="text-gray-700">가격: ${service.s_price}원</p>
                            <p class="text-gray-700">이용기간: ${service.s_period} 일</p>
                        </div>
                        
  
                    </c:forEach>
                    
                   	<!-- 추가된 이용권 더보기 버튼 -->
				    <button id="toggleServicesBtn" class="bg-blue-500 text-white py-2 px-4 rounded-lg 
				    	<c:choose>
				    		<c:when test="${selectServiceList.size() > 3}"></c:when>
				    		<c:otherwise>hidden</c:otherwise>
				    	</c:choose>"
				    >
				        <i id="toggleIcon" class="fas fa-plus-circle mr-2"></i> 이용권 더보기
				    </button>
                    
                    </div>
                </div>
            </div>   

            
            
			<!-- 트레이너 목록 -->
			<div class="mb-8 border border-gray-300 p-4">
			    <div class="mb-4">
			        <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-user-friends mr-2"></i> 트레이너 목록</h2>
			        <div class="flex flex-col gap-4">
			            <!-- 트레이너 정보 반복문 시작 -->
			            <c:forEach var="trainer" items="${trainerList}">
			                <div class="flex items-center gap-4">
			                    <!-- 트레이너 사진 -->
			                    <img src="${trainer.photoUrl}" alt="Trainer" class="w-16 h-16 rounded-full">
			                    <!-- 트레이너 이름 -->
			                    <div>
			                        <h5 class="font-bold text-gray-800">${trainer.name}</h5>
			                        <!-- 추가적인 트레이너 정보 표시 가능 -->
			                    </div>
			                </div>
			            </c:forEach>
			            <!-- 트레이너 정보 반복문 끝 -->
			        </div>
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
                                <img class="w-full h-auto" style="width: 100%; max-height: 500px;" src="<c:url value='/upload/${file.gbf_storedFileName}'/>" alt="헬스장 이미지">
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
                    
                    <button class="bg-blue-500 text-white py-2 px-4 rounded-lg mr-4" id="writeReviewBtn"><i class="fas fa-pencil-alt mr-2"></i> 리뷰 쓰기</button>
                    <button class="bg-gray-500 text-white py-2 px-4 rounded-lg"><i class="fas fa-eye mr-2"></i> 리뷰 더보기</button>
                </div>
            </div>     
            
            
            
            <div class="mb-8 border border-gray-300 p-4 bg-white">
                <div id="map" class="h-96"></div>
            </div>
            
            
       </div>
        
      
        
    </c:forEach>
   </div>

<!-- 리뷰 작성 모달 -->
<div class="modal fade" id="writeReviewModal" tabindex="-1" role="dialog" aria-labelledby="writeReviewModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="writeReviewModalLabel">리뷰 작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 리뷰 작성 폼 -->
        <form id="reviewForm">
          <div class="form-group">
            <label for="reviewTitle">리뷰 제목</label>
            <input type="text" class="form-control" id="reviewTitle" required>
          </div>
          
		  <div class="form-group">
            <label for="customerName">고객 이름</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
              </div>
              <input type="text" class="form-control" id="customerName" required>
            </div>
          </div>
               
          
          <div class="form-group">
            <label for="starRating">별점</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text text-yellow"><i class="fas fa-star"></i></span>
              </div>
              <select class="custom-select" id="starRating" required>
                <option selected disabled>별점을 선택하세요</option>
                <option value="1">★☆☆☆☆</option>
                <option value="2">★★☆☆☆</option>
                <option value="3">★★★☆☆</option>
                <option value="4">★★★★☆</option>
                <option value="5">★★★★★</option>
              </select>
            </div>
          </div>
          
          <div class="form-group">
            <label for="reviewContent">리뷰 내용</label>
            <textarea class="form-control" id="reviewContent" rows="3" required></textarea>
          </div>

          <div class="form-group">
            <label for="reviewDate">등록 날짜</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
              </div>
              <input type="date" class="form-control" id="reviewDate" readonly required>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">리뷰 등록</button>
        </form>
      </div>
    </div>
  </div>
</div>
  
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
	    var count = 0;
	    var buttonText = ["이용권 감추기", "이용권 더보기"];

	    $("#toggleServicesBtn").click(function() {
	        $(".more-services").toggleClass("hidden"); // 이용권 목록 토글
	        $("#toggleIcon").toggleClass("fa-plus-circle fa-minus-circle"); // 아이콘 변경
	        $(this).text(buttonText[count % 2]); // 버튼 텍스트 변경
	        count++;
	    });
	    
        // 초기에 숨겨진 상태로 설정
        $(".more-services").addClass("hidden");
	    
	});



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

    // 리뷰 작성 모달 열기
    $('#writeReviewBtn').click(function() {
        $('#writeReviewModal').modal('show');
    });

    // 현재 날짜 설정
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); 
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("reviewDate").setAttribute("value", today);
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
</body>
</html>
