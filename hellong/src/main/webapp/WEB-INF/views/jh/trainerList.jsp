<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jhHeaderManager.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>헬스장 트레이너 리스트</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    
    <style>
        .short-column {
            width: 8%; 
        }
        
        .long-column {
            width: 30%; 
        } 
        
        /* 모달 스타일 */
		.modal {
		    display: none; 
		    position: fixed; 
		    z-index: 1000; 
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%; 
		    overflow: auto; 
		    background-color: rgba(0,0,0,0.4); 
		}

        .modal-content {
	    	background-color: #fefefe;
		    position: absolute;
		    left: 50%;
		    top: 50%;
		    transform: translate(-50%, -50%);
		    padding: 20px;
		    border: 1px solid #888;
		    border-radius: 10px; 
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		    max-width: 90%; /* 최대 너비 지정 */
		    width: auto; /* 너비 자동으로 조절 */
		}

        .modal-content img {
            display: block;
            margin: 0 auto;
            border-radius: 10px;
            width: 300px; /* Adjust image width */
            height: 300px; /* Adjust image height */
            object-fit: cover; /* Maintain aspect ratio */
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }
        
        /* 테이블 내용 디자인 */
        .resume-table {
            width: 100%;
            margin-top: 20px;
            text-align: center; /* 가운데 정렬 */
        }

        .resume-table th,
        .resume-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .resume-table th {
            background-color: #3498db; /* 헤더 배경색 변경 */
            color: white; /* 헤더 글자색 변경 */
            border: 1px solid #ddd; /* 테두리 추가 */
        }

        /* 홀수행 배경색 */
        tbody tr:nth-child(odd) {
            background-color: #f3f3f3;
        }
    
        /* 짝수행 배경색 */
        tbody tr:nth-child(even) {
            background-color: #ffffff;
        }

        /* 열 구분을 위한 보더 */
        .resume-table td:not(:last-child) {
            border-right: 1px solid #ddd;
        }
        
        .sub-container {
	        display: flex; 
	        justify-content: center; 
	        align-items: center; 
	        width: 10%;
	        border: 1px solid #ccc;
	        padding: 10px;
	        margin-bottom: 10px;
	        box-sizing: border-box;
	        text-align: center; 
	        height: 2rem; 
	    }

	    .sub-container a {
	        color: #333;
	        font-weight: bold;
	    }
               
        
    </style>
</head>
<body class="bg-gray-100">

	 <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">시설 관리 페이지</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="javascript:void(0)">시설관리 Home</a></li>
                        <li>헬스장 이름</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->


	<!-- 서브 컨테이너 메뉴바 -->
    <div class="flex justify-center mt-4 ">
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="createGymForm?g_id=${gym}">홍보 글 등록/수정</a>
	    </div>
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="gymPostDetail?g_id=${gym}">홍보 글 이동</a>
	    </div>
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="/gymMemberListDetail?g_id=${gym}">회원 관리</a>
	    </div>
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="/trainerList?g_id=${gym}" style="color: blue;">트레이너 관리</a>
	    </div>
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="/serviceList?g_id=${gym}">서비스 관리</a>
	    </div>
    </div>



	<div class="container mx-auto bg-white p-8 rounded-lg shadow-lg mb-4">
	    <h2 class="text-2xl font-bold text-center mb-8"><i class="fas fa-dumbbell"></i> 헬스장 트레이너 리스트</h2>
	    
	    <!-- 검색창 및 트레이너 추가 버튼 -->
	    <div class="d-flex justify-content-between align-items-center mb-3">
	        <div class="w-full md:w-1/4 mb-1 md:mb-0 md:mr-2">
	            <form action="your_search_action" method="GET" class="flex items-center justify-center">
	                <input type="text" placeholder="트레이너 검색..." name="search" class="flex-1 py-2 px-4 rounded-l-lg border border-gray-300 focus:outline-none focus:border-blue-500">
	                <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded-r-lg"><i class="fas fa-search"></i> 검색</button>
	            </form>
	        </div>
	        <div>
	            <a href="trainerCreate?g_id=${gym}" class="bg-green-500 text-white py-2 px-4 rounded-lg">
	                <i class="fas fa-user-plus"></i> 트레이너 추가
	            </a>
	        </div>
	    </div>
	
	   <table class="w-full mb-8 border resume-table">
	        <thead>
	            <tr>
	                <th class="py-2 px-4 bg-indigo-600 short-column">등록번호</th> <!-- 헤더 배경색 및 글자색 변경 -->
	                <th class="py-2 px-4 bg-indigo-600">이름</th>
	                <th class="py-2 px-4 bg-indigo-600">나이</th>
	                <th class="py-2 px-4 bg-indigo-600">전화번호</th>
	                <th class="py-2 px-4 bg-indigo-600 long-column">이메일</th>
	                <th class="py-2 px-4 bg-indigo-600">상세정보</th>
	                <th class="py-2 px-4 bg-indigo-600">삭제</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:set var="num" value="${page.total - page.start + 1}"></c:set>
	            <c:forEach var="trainer" items="${trainerList}">
	                <tr>
	       				<td class="py-2 px-4" data-trainer-id="${trainer.t_id}">${num}</td>
	                    <td class="py-2 px-4">${trainer.t_name}</td>
	                    <td class="py-2 px-4">${trainer.t_age}</td>
	                    <td class="py-2 px-4">${trainer.t_tel}</td>
	                    <td class="py-2 px-4">${trainer.t_email}</td>
	                    <td class="py-2 px-4">
	                        <div class="flex justify-center">
	                            <a href="#" class="text-blue-500 hover:underline detail-icon"><i class="fas fa-info-circle"></i> 상세정보</a>
	                        </div>
	                    </td>
	                    <td class="py-2 px-4">
						    <div class="flex justify-center">
						        <a href="#" class="text-red-500 hover:underline delete-btn"><i class="fas fa-trash-alt"></i> 삭제</a>
						    </div>
	                    </td>
	                    <c:set var="num" value="${num - 1}"></c:set>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    
	    
	    <!-- 페이지 네비게이션 -->
	    <div class="flex justify-center">
	        <div class="flex">
	            <c:if test="${page.currentPage > page.pageBlock}">
	                <a href="trainerList?g_id=${gym}&currentPage=${page.currentPage - page.pageBlock}" class="py-2 px-4 mr-2 border border-gray-300 rounded-md hover:bg-blue-500 hover:text-white transition duration-300"><i class="fas fa-chevron-left"></i> 이전</a>
	            </c:if>
	            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
	                <c:choose>
	                    <c:when test="${page.currentPage == i}">
	                        <a href="trainerList?g_id=${gym}&currentPage=${i}" class="py-2 px-4 mr-2 bg-blue-500 text-white rounded-md hover:bg-blue-700 transition duration-300">${i}</a>
	                    </c:when>
	                    <c:otherwise>
	                        <a href="trainerList?g_id=${gym}&currentPage=${i}" class="py-2 px-4 mr-2 border border-gray-300 rounded-md hover:bg-blue-500 hover:text-white transition duration-300">${i}</a>
	                    </c:otherwise>
	                </c:choose>
	            </c:forEach>
	            <c:if test="${page.endPage < page.totalPage}">
	                <a href="trainerList?g_id=${gym}&currentPage=${page.endPage + 1}" class="py-2 px-4 mr-2 border border-gray-300 rounded-md hover:bg-blue-500 hover:text-white transition duration-300">다음 <i class="fas fa-chevron-right"></i></a>
	            </c:if>
	        </div>
	    </div>
	
	    
	</div>








	<div id="myModal" class="modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <div class="flex justify-center">
	      <div class="max-w-xl p-4 bg-white rounded-lg shadow-lg">
	        <div class="mb-4">
	
	          <img src="<c:url value='/trainerUpload/'/>" alt="Trainer Image" class="rounded-full mx-auto mb-4 w-64 h-64"  id="t_photo">
	
	          <h2 class="text-center text-xl font-bold" id=t_name ></h2>
	
	          <div class="mt-4">
	          	<input type="hidden" name="t_id" id="hiddenTrainerId" value="">
	            <p><i class="fas fa-user"></i> <span class="font-semibold" id="t_age">나이:</span></p>
	            <p><i class="fas fa-venus-mars"></i> <span class="font-semibold" id="t_gender">성별:</span></p>
	            <p><i class="fas fa-phone"></i> <span class="font-semibold" id="t_tel">전화번호:</span></p>
	            <p><i class="fas fa-map-marker-alt"></i> <span class="font-semibold" id="t_address">주소:</span></p>
	            <p><i class="fas fa-envelope"></i> <span class="font-semibold" id="t_email">이메일:</span></p>
	          </div>
	
	          <div class="mt-4">
	            <h3 class="text-xl font-semibold mb-2">추가 정보</h3>
	            <p><i class="fas fa-calendar-day"></i> <span class="font-semibold" id="t_regdate">계약날짜: </span> </p>
	            <p><i class="fas fa-money-bill-alt"></i> <span class="font-semibold" id="t_sal">급여: </span> </p>
	            <p><i class="fas fa-briefcase"></i> <span class="font-semibold">경력사항:</span></p>
	            <pre><span id="t_experience"></span></pre><p>
	            <p><i class="fas fa-certificate"></i> <span class="font-semibold">자격사항:</span></p>
	            <pre><span id="t_qualifications"></span></pre><p>
	            <p><i class="fas fa-sticky-note"></i> <span class="font-semibold">특이사항:</span></p>
	            <pre><span id="t_matters"></span></pre>
	          </div>
	          
	            <!-- 수정 버튼 -->
	          <div class="mt-4 flex justify-end">
	            <button id="editButton" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-700">수정</button>
	          </div>
	                    
	        </div>
	      </div>
	    </div>
	  </div>
	</div>




<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	// 가격 형식화 함수
	function formatNumber(salary) {
		return salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	// 상세정보 아이콘 클릭 시 모달 열기
	$(".detail-icon").click(function() {
	  var trainerId = $(this).closest("tr").find("td").data("trainer-id");
	  openModalWithTrainerInfo(trainerId);
	});
	
	function openModalWithTrainerInfo(trainerId) {
	  $.ajax({
	    type: "GET",
	    url: "/getTrainerInfo/" + trainerId,
	    success: function(trainerInfo) {
	      // 트레이너 정보를 모달에 적용

	      $("#hiddenTrainerId").val(trainerId);
	      $("#t_name").text("이름: " + trainerInfo.t_name);
	      $("#t_age").text("나이: " + trainerInfo.t_age);
	      $("#t_gender").text("성별: " + trainerInfo.t_gender);
	      $("#t_tel").text("전화번호: " + trainerInfo.t_tel);
	      $("#t_address").text("주소: " + trainerInfo.t_address);
	      $("#t_email").text("이메일: " + trainerInfo.t_email);
	      $("#t_regdate").text("계약날짜: " + trainerInfo.t_regdate);
	      $("#t_sal").text("급여: " + formatNumber(trainerInfo.t_sal) +"원");
	      $("#t_experience").text(trainerInfo.t_experience);
	      $("#t_qualifications").text(trainerInfo.t_qualifications);
	      $("#t_matters").text(trainerInfo.t_matters);
	      
	      // 트레이너 이미지 설정
   		  $("#t_photo").attr("src", "<c:url value='/trainerUpload/" + trainerInfo.t_photostoredname + "'/>");
	      
	      // 모달 열기
   		  $("#myModal").show();
	    }
	  });
	}
	
	// 모달 수정 버튼 클릭 시 트레이너 ID를 가지고 추가 페이지로 이동
	$("#editButton").click(function() {
	    // 트레이너의 ID 가져오기
	    var trainerId = $("#hiddenTrainerId").val(); // hidden 필드에 설정된 트레이너 아이디 가져오기
	    
	    // 트레이너 아이디를 가지고 컨트롤러로 이동
	    window.location.href = "/trainerUpdate/" + trainerId;
	        
	});
	
	
	 // 트레이너 삭제 버튼 클릭 시 알림창 띄우기
    $('.delete-btn').on('click', function(event) {
        event.preventDefault(); // 기본 동작 중단
        
        var trainerId = $(this).closest("tr").find("td").data("trainer-id");
        
        // 삭제 확인 알림창 띄우기
        var confirmation = confirm("정말로 이 트레이너를 삭제하시겠습니까?");
        
        // 확인 버튼을 눌렀을 때만 삭제 진행
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "/deleteTrainer/" + trainerId,
                success: function(response) {
                    alert("삭제되었습니다.");
                    location.reload(); // 페이지 새로고침
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }
    });
	
	// 닫기 버튼 클릭 시 모달 닫기
	$(".close").click(function() {
		$("#myModal").hide();
	});
	
	// 모달이 닫히도록 x 버튼 및 모달 외부를 클릭하면 실행
	$("#myModal").click(function(event) {
	  if (event.target === this) {
		 $("#myModal").hide();
	  }
	});
</script>

</body>
</html>