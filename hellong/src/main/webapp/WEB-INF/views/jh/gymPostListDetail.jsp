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
        
    .custom-pre {
        background-color: #f0f0f0; /* 연한 회색 배경색으로 설정 */
        color: #333; /* 텍스트 색상을 어두운 회색으로 설정 */
        font-size: 18px; /* 원하는 폰트 크기로 설정 */
        padding: 20px; /* 내부 여백 설정 */
        border-radius: 5px; /* 둥근 테두리 설정 */
        overflow-x: auto; /* 가로 스크롤이 필요한 경우 스크롤 표시 */
        white-space: pre-wrap; /* 줄바꿈 유지 */
        font-family: 'Roboto', sans-serif; /* 글꼴을 Roboto로 설정 */
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
					     <span class="font-bold"><fmt:formatNumber type='number' value='${avgReviewSelect.avg_review_star}' maxFractionDigits='2' /></span>
					    <span class="ml-3 font-bold" style="color: #3366FF;">리뷰 ${avgReviewSelect.count_review_star}개</span>
					</p>
                </div>
                <pre class="text-lg text-gray-700 custom-pre">${board.gb_ment}</pre>
            </div>
            

			<div class="mb-8 border border-gray-300 p-4">
			    <div class="mb-4">
			        <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-tags mr-2"></i> 헬스장 이용권 목록</h2>
			        <div class="flex flex-col gap-4">
						<c:forEach var="service" items="${selectServiceList}" varStatus="loop">
						    <div class="bg-gray-100 rounded-lg p-4 shadow-md <c:if test='${loop.index > 2}'>more-services hidden</c:if>'">
						        <div class="flex items-center justify-between mb-2">
						            <h5 class="text-lg font-bold text-gray-800">
						                <strong style="font-size: 20px">${service.s_name}</strong>
						            </h5>
						            <span class="text-gray-700">
						                <i class="fas fa-icon-class-name"></i> 
						            </span>
						        </div>
						        <!-- Use <a> tag to pass parameters via URL -->
						        <a href="movePaymentForm?sd_number=${service.sd_number}&g_id=${service.g_id}&s_number=${service.s_number}">
						            <input type="hidden" name="sd_number" value="${service.sd_number}">
						            <input type="hidden" name="g_id" value="${service.g_id}">
						            <input type="hidden" name="s_number" value="${service.s_number}">
						            <p class="text-gray-700">- 서비스 내용: <strong>${service.s_detail}</strong> </p>
						            <p class="text-gray-700">- 이용기간: <strong>${service.s_period} 일</strong></p>
						            <p class="text-gray-700 text-right">
						                <strong style="font-size: 20px">
						                    가격: 
						                    <fmt:formatNumber type="number" value="${service.s_price}" pattern="#,###"/>원 
						                </strong>
						            </p>
						        </a>
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
			        <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-user-friends mr-2 mb-3"></i> 트레이너 목록</h2>
			        <div class="flex flex-col gap-4">
			            <c:forEach var="trainer" items="${selectTrainerList}">
			                <div class="flex items-center gap-4">
			                    <!-- 트레이너 사진 -->
			                    <img src="<c:url value='/trainerUpload/${trainer.t_photostoredname }'/>" alt="Trainer Image" class="w-24 h-24 rounded-full">
			                    <!-- 트레이너 이름 -->
			                    <div class="flex flex-col"> 
			                        <h5 class="font-bold text-gray-800">${trainer.t_name}</h5>
			                    </div>
			                </div>
			            </c:forEach>
			        </div>
			    </div>
			</div>
						
			
			
			<div class="mb-8 border border-gray-300 p-4">
                <div class="mb-4">
                  <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="far fa-clock mr-2"></i> 운영시간</h2>
                  <pre class="text-lg text-gray-700">${board.gb_time}</pre>
                </div>
            </div>
          
            <div class="mb-8 border border-gray-300 p-4">
                <div class="mb-4">
                  <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-dumbbell mr-2"></i> 운동기구</h2>
                  <pre class="text-lg text-gray-700">${board.gb_machine}</pre>
                </div>
            </div>
          
            <div class="mb-8 border border-gray-300 p-4">
                <div class="mb-4">
                  <h2 class="text-lg font-bold text-gray-800 mb-2"><i class="fas fa-shower mr-2"></i> 편의시설</h2>
                  <pre class="text-lg text-gray-700">${board.gb_amen}</pre>
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
			        
			        <!-- 리뷰 정보 및 평점 표시 -->
			        <div class="flex items-center mb-4">
			            <h3 class="font-bold text-gray-800 mr-3">평균평점: <span class="text-yellow-500"><fmt:formatNumber type='number' value='${avgReviewSelect.avg_review_star}' maxFractionDigits='2' /></span></h3>
			            <h3 class="font-bold text-gray-800">리뷰수: ${avgReviewSelect.count_review_star}명</h3>
			        </div>
			
			 		<c:forEach var="rv" items="${selectReviewList}" varStatus="status">
				        <div class="flex items-center mb-4">
				            <!-- 사용자 프로필 사진 -->
				            <i class="fas fa-user-circle text-gray-600 mr-3 text-5xl"></i>
				            <div>
				                <h5 class="font-bold text-gray-800">${rv.m_name}
				                    <!-- 관리자 인증 아이콘 -->
				                    <i class="fas fa-check-circle text-green-500">결제고객</i> 
				                    <!-- 별점 표시 -->
				                    <span class="text-yellow-500">★ ${rv.review_star}</span>
				                    <!-- 작성일자 표시 -->
				                    <span class="text-gray-500 ml-2"><fmt:formatDate value="${rv.review_regdate}" pattern="yyyy-MM-dd HH:mm"/></span>         
				                </h5>
				                <p class="text-gray-700">${rv.review_content}</p>
				            </div>
				            <input type="hidden" value="${rv.go_number}">
				                         <!-- 리뷰 답글 버튼 -->
							<c:if test="${gymManagerSelect ne null}">              
							    <button class="ml-auto bg-gray-200 text-gray-700 py-2 px-4 rounded-lg reply-review-btn">
							        <i class="fas fa-reply"></i> 답글 달기
							    </button>	
							</c:if>		       
						</div>
				        
				
				        <!-- 리뷰 답글 폼 -->
					    <c:if test="${not empty rv.review_comment}">
					        <div class="flex items-center mb-4 ml-8">
					            <i class="fas fa-user-circle text-blue-500 mr-3 text-5xl"></i>
					            <div>
					                <h5 class="font-bold text-gray-800">${board.g_name}
					                    <!-- 관리자 인증 아이콘 -->
					                    <i class="fas fa-check-circle text-blue-500"></i>
					                    <span class="text-gray-500 ml-2"><fmt:formatDate value="${rv.review_comment_date}" pattern="yyyy-MM-dd HH:mm"/></span>
					                </h5>
					                <p class="text-gray-700">${rv.review_comment}</p>
					            </div>
					        </div>
					    </c:if>
				    </c:forEach>
			
			        <!-- 리뷰 작성 버튼 및 더보기 버튼 -->
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
	            <input type="text" class="form-control" name="review_title" id="reviewTitle" required>
	          </div>
	          
			  <div class="form-group">
	            <label for="customerName">고객 이름</label>
	            <div class="input-group">
	              <div class="input-group-prepend">
	                <span class="input-group-text"><i class="fas fa-user"></i></span>
	              </div>
	              <input type="text" class="form-control" id="customerName" name="m_name" required>
	            </div>
	          </div>
	               
	          <div class="form-group">
	            <label for="serviceSelect">서비스 선택</label>
	            <select class="custom-select" id="serviceSelect" required>
	              <option selected disabled>서비스를 선택하세요</option>
	              <option value="fitness">휘트니스</option>
	              <option value="yoga">요가</option>
	              <option value="swimming">수영</option>
	              <option value="boxing">복싱</option>
	            </select>
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
	
	
	<!-- 리뷰 답글 모달 -->
	<div class="modal fade" id="replyReviewModal" tabindex="-1" role="dialog" aria-labelledby="replyReviewModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="replyReviewModalLabel">리뷰 답글 작성</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <!-- 리뷰 답글 작성 폼 -->
	        <form id="replyReviewForm">
	          <div class="form-group">
	            <label for="replyContent">리뷰 답글 내용</label>
	            <textarea class="form-control" id="replyContent" rows="3" required></textarea>
	          </div>
	          <button type="submit" class="btn btn-primary">답글 등록</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
  
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
	    var count = 0;
	    var buttonText = ["이용권 감추기", "이용권 더보기"];
	    var goNumber;

	    $("#toggleServicesBtn").click(function() {
	        $(".more-services").toggleClass("hidden"); // 이용권 목록 토글
	        $("#toggleIcon").toggleClass("fa-plus-circle fa-minus-circle"); // 아이콘 변경
	        $(this).text(buttonText[count % 2]); // 버튼 텍스트 변경
	        count++;
	    });
	    
        // 초기에 숨겨진 상태로 설정
        $(".more-services").addClass("hidden");
        
            
        
        
        // 리뷰 쓰기 버튼 누르면 서버로 로그인 여부 or 결제 고객인지 확인 -> 결제 고객이면 회원 정보 가져옴
		$('#writeReviewBtn').click(function () {
			console.log("******리뷰쓰기 모달 열림");
		    var gId = ${g_id};
		    $.ajax({
		        type: "GET",
		        url: "/getUserInfo/" + gId,
		        dataType: 'json',
		        success: function (response) {
		            var serviceSelect = $('#serviceSelect');
		            serviceSelect.empty();
		            serviceSelect.append($('<option selected disabled>서비스를 선택하세요</option>'));
		            $.each(response.services, function(index, service) {
		                var option = $('<option></option>').attr('value', service.s_number).text(service.s_name);
		                option.data('go-number', service.go_number); // go_number 데이터 속성 추가
		                option.data('sd-number', service.sd_number); // sd_number 데이터 속성 추가
		                serviceSelect.append(option);
		            });             
		            $('#customerName').val(response.m_name); 
		            $('#writeReviewModal').modal('show');
		        },
		        error: function () {
		            alert('결제 회원이 아닙니다.');
		        }
		    });
		});         
		        
		        
		$('#serviceSelect').change(function () {
		    var selectedOption = $(this).find('option:selected');
		    var goNumber = selectedOption.data('go-number');
		    var sdNumber = selectedOption.data('sd-number');
		    console.log("go_number: " + goNumber);
		    console.log("sd_number: " + sdNumber);
		});
		
		
		// 리뷰 작성 폼 제출 이벤트 처리
		$('#reviewForm').submit(function(event) {
		    event.preventDefault(); // 폼 제출 기본 동작 방지

		    // 선택한 서비스의 go_number, sd_number 가져오기
		    var goNumber = $('#serviceSelect option:selected').data('go-number');
		    var sdNumber = $('#serviceSelect option:selected').data('sd-number');
		    
		    // 리뷰 폼 데이터 가져오기
		    var formData = {
		        review_title: $('#reviewTitle').val(),
		        m_name: $('#customerName').val(),
		        s_number: $('#serviceSelect').val(),
		        go_number: goNumber,
		        sd_number: sdNumber,
		        review_star: $('#starRating').val(),
		        review_content: $('#reviewContent').val(),
		        g_id: ${g_id} 
		    };

		    // 서버로 데이터 전송 (AJAX)
		    $.ajax({
		        type: 'POST',
		        url: '/submitReview', 
		        data: formData,
		        success: function(response) {
		            console.log('리뷰가 성공적으로 등록되었습니다.');
		            alert("리뷰가 정상적으로 등록되었습니다!")
		            location.reload();
		        },
		        error: function(xhr, status, error) {
		            console.error('리뷰 등록 중 오류가 발생했습니다: ' + error);
		        }
		    });
		});
		
		
		
	    $('.reply-review-btn').click(function() {
	        // 해당 버튼이 속한 리뷰 엘리먼트를 찾기
	        var reviewElement = $(this).closest('.flex.items-center.mb-4');
	        // 해당 리뷰의 go_number 값을 가져오기
	        goNumber = reviewElement.find('input[type="hidden"]').val();

	        console.log("해당 리뷰의 go_number: " + goNumber);
	        $('#replyReviewModal').modal('show');
	    }); 

	   // 리뷰 답글 폼 제출 이벤트
	    $('#replyReviewForm').submit(function(event) {
	      event.preventDefault(); // 폼 제출 기본 동작 방지

	      var replyContent = $('#replyContent').val(); // 답글 내용 가져오기

	      // AJAX를 사용하여 리뷰 답글 서버로 전송
	      $.ajax({
	        type: 'POST',
	        url: '/submitReply/'+ goNumber, // 답글 전송 엔드포인트
	        data: {
	          replyContent: replyContent
	        },
	        success: function(response) {
	          console.log('리뷰 답글이 성공적으로 등록되었습니다.');
	          alert("리뷰 답글이 정상적으로 등록되었습니다!");
	          $('#replyReviewModal').modal('hide'); // 모달 닫기
	          location.reload();
	        },
	        error: function(xhr, status, error) {
	          console.error('리뷰 답글 등록 중 오류가 발생했습니다: ' + error);
	        }
	      });
	    }); 
	   
	   
	   
	 	// writeReviewModal이 닫힐 때 
	    $('#writeReviewModal').on('hidden.bs.modal', function () {
	        $('#reviewTitle').val('');
	        $('#customerName').val('');
	        $('#serviceSelect').val('');
	        $('#starRating').val('');
	        $('#reviewContent').val('');
	        $('#reviewDate').val('');
	    });

	    // replyReviewModal이 닫힐 때 
	    $('#replyReviewModal').on('hidden.bs.modal', function () {
	        $('#replyContent').val('');
	    });
	   
	   
	    
	    
	    
	  });
		
		
			
        // 현재 날짜 설정
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); 
        var yyyy = today.getFullYear();

        today = yyyy + '-' + mm + '-' + dd;
        document.getElementById("reviewDate").setAttribute("value", today);
               
	    
	



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