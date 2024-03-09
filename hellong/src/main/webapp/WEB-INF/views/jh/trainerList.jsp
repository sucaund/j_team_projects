<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>헬스장 트레이너 리스트</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        .short-column {
            width: 8%; /* 등록번호 열의 가로 길이를 줄임 */
        }
        .long-column {
            width: 30%; /* 이메일 열의 가로 길이를 늘림 */
        }
        

        

        /* 모달 스타일 */
       .modal {
            display: none; 
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%; 
            overflow: auto; 
            background-color: rgba(0,0,0,0.4); 
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 10px; /* Add border radius for rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add shadow for depth */
        }

        .modal-content img {
            display: block;
            margin: 0 auto;
            border-radius: 10px;
            width: 150px; /* Adjust image width */
            height: 150px; /* Adjust image height */
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
        }

        .resume-table th,
        .resume-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .resume-table th {
            background-color: #f2f2f2;
        }
        
                 /* 홀수행 배경색 */
        tbody tr:nth-child(odd) {
            background-color: #f3f3f3;
        }
    
        /* 짝수행 배경색 */
        tbody tr:nth-child(even) {
            background-color: #ffffff;
        }
    </style>
</head>
<body class="bg-gray-100">
<div class="container mx-auto bg-white p-8 rounded-lg shadow-lg">
    <h2 class="text-2xl font-bold text-center mb-8"><i class="fas fa-dumbbell"></i> 헬스장 트레이너 리스트</h2>
    
    <!-- 검색창 및 트레이너 추가 버튼 -->
    <div class="flex flex-col md:flex-row items-center justify-center md:justify-between mb-4">
        <div class="w-full md:w-1/4 mb-4 md:mb-0 md:mr-2">
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

   <table class="w-full mb-8 border">
        <thead>
            <tr>
                <th class="py-2 px-4 bg-gray-200 short-column">등록번호</th>
                <th class="py-2 px-4 bg-gray-200">이름</th>
                <th class="py-2 px-4 bg-gray-200">나이</th>
                <th class="py-2 px-4 bg-gray-200">전화번호</th>
                <th class="py-2 px-4 bg-gray-200 long-column">이메일</th>
                <th class="py-2 px-4 bg-gray-200">상세정보</th>
                <th class="py-2 px-4 bg-gray-200">삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="num" value="${page.total - page.start + 1}"></c:set>
            <c:forEach var="trainer" items="${trainerList}">
                <tr>
                    <td class="py-2 px-4 text-center short-column">${num}</td>
                    <td class="py-2 px-4 text-center">${trainer.t_name}</td>
                    <td class="py-2 px-4 text-center">${trainer.t_age}</td>
                    <td class="py-2 px-4 text-center">${trainer.t_tel}</td>
                    <td class="py-2 px-4 text-center long-column">${trainer.t_email}</td>
                    <td class="py-2 px-4 text-center">
                        <div class="flex justify-center">
                            <a href="#" class="text-blue-500 hover:underline detail-icon"><i class="fas fa-info-circle"></i> 상세정보</a>
                        </div>
                    </td>
                    <td class="py-2 px-4 text-center">
                        <div class="flex justify-center">
                            <a href="trainerDelete?trainer_id=${trainer.t_id}" class="text-red-500 hover:underline"><i class="fas fa-trash-alt"></i> 삭제</a>
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


<<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <!-- Trainer Information Form -->
    <form class="w-full max-w-lg mx-auto">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <!-- Trainer Image -->
          <img src="path_to_trainer_image" alt="Trainer Image" class="rounded-full mx-auto mb-4">
        </div>
        <div class="flex flex-col">
          <!-- Trainer Information -->
          <div class="mb-4">
            <label for="trainerName" class="block text-gray-700 font-bold mb-2">이름:</label>
            <input type="text" id="trainerName" name="trainerName" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="트레이너 이름" readonly>
          </div>
          <div class="mb-4">
            <label for="trainerAge" class="block text-gray-700 font-bold mb-2">나이:</label>
            <input type="text" id="trainerAge" name="trainerAge" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="트레이너 나이" readonly>
          </div>
          <div class="mb-4">
            <label for="trainerPhone" class="block text-gray-700 font-bold mb-2">전화번호:</label>
            <input type="text" id="trainerPhone" name="trainerPhone" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="트레이너 전화번호" readonly>
          </div>
          <div class="mb-4">
            <label for="trainerEmail" class="block text-gray-700 font-bold mb-2">이메일:</label>
            <input type="email" id="trainerEmail" name="trainerEmail" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="트레이너 이메일" readonly>
          </div>
          <!-- Additional Information -->
          <!-- Additional details -->
        </div>
      </div>
    </form>
  </div>
</div>



<script>
// 모달 열기
function openModal() {
  var modal = document.getElementById("myModal");
  modal.style.display = "block";
}

// 모달 닫기
function closeModal() {
  var modal = document.getElementById("myModal");
  modal.style.display = "none";
}

// 상세정보 아이콘 클릭 시 모달 열기
var detailIcons = document.querySelectorAll(".detail-icon");
detailIcons.forEach(function(icon) {
  icon.addEventListener("click", function() {
    openModal();
  });
});

// 닫기 버튼 클릭 시 모달 닫기
var closeButtons = document.querySelectorAll(".close");
closeButtons.forEach(function(button) {
  button.addEventListener("click", function() {
    closeModal();
  });
});

// 모달이 닫히도록 x 버튼 및 모달 외부를 클릭하면 실행
var modal = document.getElementById("myModal");
window.onclick = function(event) {
  if (event.target == modal) {
    closeModal();
  }
}
</script>

</body>
</html>