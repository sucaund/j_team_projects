<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
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
    </style>
</head>

<body>

    <div class="container">
        <h1 class="text-center my-5 text-4xl"><i class="fas fa-users"></i> 헬스장 회원관리 <i
                class="fas fa-chart-pie"></i></h1>

        <!-- 누적 회원 수 및 누적 매출액 섹션 -->
        <div class="row mb-4 justify-content-center">
            <div class="col-md-6">
                <div class="card text-center p-4">
                    <h3 class="font-bold mb-3">누적 회원 수</h3>
                    <p class="text-4xl font-bold text-primary">1000명</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card text-center p-4">
                    <h3 class="font-bold mb-3">누적 매출액</h3>
                    <p class="text-4xl font-bold text-success">100,000원</p>
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
                                <select class="form-control">
                                    <option>전체</option>
                                    <option>피트니스</option>
                                    <option>요가</option>
                                    <option>수영</option>
                                </select>
                            </div>
                        </div>
                        <h3 class="font-bold mb-3  text-2xl">회원 목록</h3>
                        <div class="table-responsive">
                            <table class="table table-bordered table-header-bg">
                                <thead class="bg-primary text-white">
                                    <tr>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>나이</th>
                                        <th>성별</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                        <th>이용중인 서비스</th>
                                        <th>만료 일자</th>
                                    </tr>
                                </thead>
                                <tbody class="table-body-bg">
                                    <tr>
                                        <td>1</td>
                                        <td>홍길동</td>
                                        <td>30</td>
                                        <td>남성</td>
                                        <td>010-1234-5678</td>
                                        <td>example@example.com</td>
                                        <td>피트니스</td>
                                        <td>30일</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>홍길동</td>
                                        <td>30</td>
                                        <td>남성</td>
                                        <td>010-1234-5678</td>
                                        <td>example@example.com</td>
                                        <td>피트니스</td>
                                        <td>30일</td>
                                    </tr>
                                     <tr>
                                        <td>1</td>
                                        <td>홍길동</td>
                                        <td>30</td>
                                        <td>남성</td>
                                        <td>010-1234-5678</td>
                                        <td>example@example.com</td>
                                        <td>피트니스</td>
                                        <td>30일</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                        <div class="d-flex justify-content-center mb-4">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
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

    <!-- 성비 차트 스크립트 -->
    <script>
        var ctx = document.getElementById('genderChart').getContext('2d');
        var genderChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['남성', '여성'],
                datasets: [{
                    label: '성비',
                    data: [60, 40], // 남성과 여성 비율 (예시)
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
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>

    <!-- 나이 비율 차트 스크립트 -->
    <script>
        var ctx2 = document.getElementById('ageRatioChart').getContext('2d');
        var ageRatioChart = new Chart(ctx2, {
            type: 'line', // 라인 차트로 변경
            data: {
                labels: ['10대', '20대', '30대', '40대', '50대 이상'],
                datasets: [{
                    label: '나이 비율',
                    data: [10, 30, 25, 20, 15], // 각 연령대 비율 (예시)
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
</body>

</html>
