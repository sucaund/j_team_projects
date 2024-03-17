<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jhHeaderManagerG.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 회원관리</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- 폰트어썸 CDN 추가 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- 테일윈드 CDN 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        /* 가운데 정렬 */
        .table{
            text-align: center;
        }

        /* 홀수행 짝수행 배경색 지정 */
        .table tbody tr:nth-child(odd) {
            background-color: #f8f9fa; /* 홀수행 배경색 */
        }

        .table tbody tr:nth-child(even) {
            background-color: #e9ecef; /* 짝수행 배경색 */
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

	<!-- 서브 컨테이너 메뉴바 -->
    <div class="flex justify-center mt-4 ">
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="createGymForm?g_id=${g_id}">홍보 글 등록/수정</a>
	    </div> 
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="gymPostDetail?g_id=${g_id}">홍보 글 이동</a>
	    </div>
	
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="/gymMemberListDetail?g_id=${g_id}" style="color: blue;">회원 관리</a>
	    </div>
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="/trainerList?g_id=${g_id}" >트레이너 관리</a>
	    </div>
	    <div class="container sub-container text-center mx-2 p-4 border rounded-lg bg-white">
	        <a href="/serviceList?g_id=${g_id}">서비스 관리</a>
	    </div>
    </div>



    <div class="container mx-auto bg-white p-8 rounded-lg shadow-lg mb-4">
        <h1 class="text-center my-5 text-3xl"><i class="fas fa-users"></i> 헬스장 회원관리 <i
                class="fas fa-chart-pie"></i></h1>

        <!-- 누적 회원 수 및 누적 매출액 섹션 -->
        <div class="row mb-4 justify-content-center">
            <div class="col-md-6">
                <div class="card text-center p-4">
                    <h3 class="font-bold mb-3">누적 회원 수</h3>
                    <p class="text-4xl font-bold text-primary">${totalGymMemberList}명</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card text-center p-4">
                    <h3 class="font-bold mb-3">누적 매출액</h3>
                    <p class="text-4xl font-bold text-success" id="formattedPrice" >${sumSale}원</p>
                </div>
            </div>
        </div>

        <!-- 성비와 나이 비율 차트 섹션 -->
        <div class="row justify-content-center">
            <!-- 성비 차트 -->
            <div class="col-md-6 mb-4">
                <div class="card p-4">
                    <h3 class="font-bold mb-3">성비</h3>
                    <canvas id="genderChart" width="400" height="200"></canvas>
                </div>
            </div>
            <!-- 나이 비율 차트 -->
            <div class="col-md-6 mb-4">
                <div class="card p-4">
                    <h3 class="font-bold mb-3">나이 비율</h3>
                    <canvas id="ageRatioChart" width="400" height="200"></canvas>
                </div>
            </div>
        </div>

        <!-- 회원 테이블 및 검색창, 필터 추가 -->
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="회원 검색">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
							<div class="col-md-6">
							    <div class="input-group">
							        <select class="form-control">
							            <option>전체</option>
							            <option>회원 이름</option>
							            <option>이용 서비스</option>
							            <option>전화번호</option>
							            <option>이메일</option>
							        </select>
							        <div class="input-group-append">
							            <span class="input-group-text"><i class="fas fa-chevron-down"></i></span>
							        </div>
							    </div>
							</div>
                        </div>
                        <h3 class="font-bold mb-3  text-2xl">현재 이용 중인 회원목록</h3>
                        <div class="table-responsive">
                             <table class="table table-bordered table-header-bg mb-0">
                                <thead class="bg-primary text-white">
                                    <tr>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>나이</th>
                                        <th>성별</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                        <th>이용중인 서비스</th>
                                        <th>거래 일자</th>
                                        <th>시작 일자</th>
                                        <th>만료 일자</th>
                                    </tr>
                                </thead>
                                <tbody class="table-body-bg">
                                    <c:set var="num" value="${page.total - page.start + 1}"></c:set>
                                	<c:forEach var="gym" items="${gymMemberList}">
                                    <tr> 
                                        <td>${num}</td>
                                        <td>${gym.m_name}</td>
                                        <td>${gym.m_age}</td>
                                        <td>${gym.m_gender}</td>
                                        <td>${gym.m_phone}</td>
                                        <td>${gym.m_email}</td>
                                        <td>${gym.s_name}</td>
                                        <td>${gym.deal_date}</td>
                                        <td class="startdate">${gym.go_startdate}</td>
                                        <td class="enddate">${gym.go_enddate}</td>
                                        <c:set var="num" value="${num - 1}"></c:set>         
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                        <div class="d-flex justify-content-center mb-4">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                	<c:if test="${page.currentPage > page.pageBlock}">
                                    	<li class="page-item"><a class="page-link" href="gymMemberListDetail?g_id=${g_id}&currentPage=${page.startPage - page.pageBlock}">이전</a></li>
                                    </c:if>
                                    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						                <c:choose>
						                    <c:when test="${page.currentPage == i}">
						                        <li class="page-item"><a class="page-link" href="gymMemberListDetail?g_id=${g_id}&currentPage=${i}">${i}</a></li>
						                    </c:when>
						                    <c:otherwise>
						                        <li class="page-item"><a class="page-link" href="gymMemberListDetail?g_id=${g_id}&currentPage=${i}">${i}</a></li>
						                    </c:otherwise>
						                </c:choose>
						            </c:forEach>
									<c:if test="${page.endPage < page.totalPage}">
                                    	<li class="page-item"><a class="page-link" href="gymMemberListDetail?g_id=${g_id}&currentPage=${page.startPage + page.pageBlock}">다음</a></li>
                                	</c:if>
                                </ul>
                            </nav>
                        </div>
                                    
                  </div>
             </div>              
         </div>
        
        
    </div>

    <!-- 부트스트랩 및 폰트어썸, 차트 라이브러리 스크립트 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    <!-- 차트.js 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
	<script type="text/javascript">
	
		function formatDate(dateString) {
	        var date = new Date(dateString);
	        var year = date.getFullYear();
	        var month = (1 + date.getMonth()).toString().padStart(2, '0');
	        var day = date.getDate().toString().padStart(2, '0');
	        return year + '-' + month + '-' + day;
	    }
	
	
	    function numberWithCommas(x) {
	        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    }
	     
	    window.onload = function() {
	        var sumSale = ${sumSale}; 
	        document.getElementById("formattedPrice").innerText = numberWithCommas(sumSale) + "원";
	        
	        // "go_startdate"를 형식화하여 엘리먼트에 할당
	        var startdateElements = document.querySelectorAll(".startdate");
	        startdateElements.forEach(function(element) {
	            var dateString = element.innerText;
	            element.innerText = formatDate(dateString);
	        });

	        // "go_enddate"를 형식화하여 엘리먼트에 할당
	        var enddateElements = document.querySelectorAll(".enddate");
	        enddateElements.forEach(function(element) {
	            var dateString = element.innerText;
	            element.innerText = formatDate(dateString);
	        });
	        
	        
	    };
	</script>


    <!-- 성비 차트 스크립트 -->
    <script>
	    var maleRatio = ${genderRatio.MALERATIO};
	    var femaleRatio = ${genderRatio.FEMALERATIO};
	
	    var ctx = document.getElementById('genderChart').getContext('2d');
	
	    var genderChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: ['남성', '여성'],
	            datasets: [{
	                label: '성비',
	                data: [maleRatio, femaleRatio],
	                backgroundColor: [
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 99, 132, 0.2)',
	                ],
	                borderColor: [
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 99, 132, 1)',
	                ],
	                borderWidth: 1
	            }]
	        },
	        options: {
	            scales: {
	                yAxes: [{
	                    ticks: {
	                        min: 0, // 최소값을 0으로 설정
	                        max: 100, // 최대값을 100으로 설정
	                        stepSize: 10 // 간격 설정 (옵션)
	                    }
	                }]
	            }
	        }
	    });
	</script>

    <!-- 나이 비율 차트 스크립트 -->
    <script>
    	var age10 = ${ageRatio.age10};
    	var age20 = ${ageRatio.age20};
    	var age30 = ${ageRatio.age30};
    	var age40 = ${ageRatio.age40};
    	var age50 = ${ageRatio.age50};
    
    
        var ctx2 = document.getElementById('ageRatioChart').getContext('2d');
        var ageRatioChart = new Chart(ctx2, {
            type: 'line', 
            data: {
                labels: ['20대 미만', '20대', '30대', '40대', '50대 이상'],
                datasets: [{
                    label: '나이 비율',
                    data: [age10, age20, age30, age40, age50], 
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
	                        min: 0, // 최소값을 0으로 설정
	                        max: 100, // 최대값을 100으로 설정
	                        stepSize: 10 // 간격 설정 (옵션)
                        }
                    }]
                }
            }
        });
    </script>
</body>

</html>
