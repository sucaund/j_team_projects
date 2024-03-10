<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 이용권 리스트</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    header {
        background-color: #333;
        color: #fff;
        padding: 20px;
        text-align: center;
    }
    h1 {
        margin: 0;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px 20px 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        position: relative;
    }
	table {
	    width: 1110px; /* 테이블 너비를 고정 값으로 설정 */
	    table-layout: fixed; /* 테이블 레이아웃을 고정으로 설정 */
	    border-collapse: collapse;
	    margin-top: 20px;
	    text-align: center;
	}
	
	tbody {
    	font-size: 14px; 
    	text-align: center;
	}
	
	th, td {
	    border: 1px solid #ddd;
	    padding: 8px;
	    text-align: left;
	    white-space: nowrap; 
	    overflow: hidden; 
	    text-overflow: ellipsis; 
	    text-align: center;
	    
	}
	
	th {
	    background-color: #3b5998; /* 적당한 밝은 톤의 색상으로 변경 */
	    color: #fff; /* 글자색을 흰색으로 설정 */
	}
    
    
    th:first-child,th:nth-child(7),th:nth-child(8),
	td:first-child ,td:nth-child(7),td:nth-child(8){
		text-align: center;
	    width: 100px; 
	}   
    
    th:nth-child(3),th:nth-child(4),
	td:nth-child(3),td:nth-child(4) {
		text-align: center;
	    width: 120px; 
	}
	
	
	th:nth-child(5),
	td:nth-child(5) {
	    width: 250px; 
	    text-align: center;
	}
	
	th:nth-child(6),
	td:nth-child(6) {
	    width: 150px;
	    text-align: center; 
	}
			
    .price,
    .validity,
    .benefits li {
        font-size: 14px;
    }
    .benefits {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .benefits li {
        margin-bottom: 5px;
    }
   .add-service-btn {
	    background-color: #4CAF50;
	    border: none;
	    color: white;
	    padding: 10px 20px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    border-radius: 5px;
	    cursor: pointer;
	    transition-duration: 0.4s;
	    margin-left: 10px; 
    }
    .edit-service-btn,
    .delete-service-btn {
        border: none;
        color: blue;
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin-left: 5px;
        border-radius: 5px;
        cursor: pointer;
        transition-duration: 0.4s;
    }
    .delete-service-btn {
        color: #DC3545;
        background-color: transparent;
    }
    .add-service-btn:hover {
        background-color: #45a049;
    }
    .edit-service-btn:hover,
    .delete-service-btn:hover {
    }

    tbody tr:nth-child(odd) {
        background-color: #f9f9f9; /* 홀수 행 배경색 */
    }

    tbody tr:nth-child(even) {
        background-color: #ffffff; /* 짝수 행 배경색 */
    }
</style>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<!-- 부트스트랩 CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 폰트어썸 CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<!-- 부트스트랩 자바스크립트 및 jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>   
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
    <header>
        <h1>헬스장 이용권 리스트</h1>
    </header>
    <div class="container mt-4">
    
    	 <h2>서비스 리스트</h2>
	     <div class="d-flex justify-content-between align-items-center mb-3">
	        <!-- 검색창 추가 -->
	        <div class="input-group w-25">
	            <input type="text" class="form-control" placeholder="서비스 검색...">
	            <div class="input-group-append">
	                <button class="btn btn-outline-secondary" type="button">검색</button>
	            </div>
	        </div>
			<button class="add-service-btn" data-toggle="modal" data-target="#serviceModal">
			    <i class="fas fa-plus-circle"></i> 서비스 추가
			</button>
	    </div>
 
    
    

        <table class="mb-4"> 
            <thead>
                <tr>
                	<th>등록번호</th>
                    <th>서비스명</th>
                    <th>가격</th>
                    <th>이용기간</th>
                    <th>내용</th>
                    <th>특이사항</th>
			        <th>수정</th> 
			        <th>삭제</th> 
                </tr>
            </thead>
            <tbody>
            	<c:set var="num" value="${page.total - page.start + 1}"></c:set>
				<c:forEach var="service" items="${serviceList}" varStatus="status">
	                <tr id="service">
	                	<td>${num}</td>
	                    <td>
	                    	<input type="hidden" id="s_number" value="${service.s_number}">
	                    	<input type="hidden" id="g_id" value="${service.g_id}">
	                    	${service.s_name}
	                    </td>
	                    <td class="price">${service.s_price}원</td>
	                    <td class="validity">${service.s_period}일</td>
	                    <td>
	                        <ul class="benefits">
	                            <li>${service.s_detail}</li>
	                        </ul>
	                    </td>
	                    <td>${service.s_matters}</td>
						<td>
						    <a href="#serviceModal" class="edit-service-btn" data-toggle="modal"><i class="fas fa-edit" style="color: #008CBA;"></i>수정</a>
						</td>         
						<td>
						   <a href="#confirmDeleteModal" class="delete-service-btn" data-toggle="modal"><i class="fas fa-trash-alt" style="color: #DC3545;"></i>삭제</a>
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
                <a href="serviceList?g_id=${g_id}&currentPage=${page.startPage - page.pageBlock}" class="py-2 px-4 mr-2 border border-gray-300 rounded-md hover:bg-blue-500 hover:text-white transition duration-300"><i class="fas fa-chevron-left"></i> 이전</a>
            </c:if>
            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                <c:choose>
                    <c:when test="${page.currentPage == i}">
                        <a href="trainerList?g_id=${g_id}&currentPage=${i}" class="py-2 px-4 mr-2 bg-blue-500 text-white rounded-md hover:bg-blue-700 transition duration-300">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="serviceList?g_id=${g_id}&currentPage=${i}" class="py-2 px-4 mr-2 border border-gray-300 rounded-md hover:bg-blue-500 hover:text-white transition duration-300">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${page.endPage < page.totalPage}">
                 <a href="serviceList?g_id=${g_id}&currentPage=${page.startPage + page.pageBlock}" class="py-2 px-4 mr-2 border border-gray-300 rounded-md hover:bg-blue-500 hover:text-white transition duration-300">다음 <i class="fas fa-chevron-right"></i></a>
            </c:if>
       	 </div>
    	</div>
	</div>    
        
        
    
    <!-- 서비스 모달 폼 -->
    <div class="modal fade" id="serviceModal" tabindex="-1" role="dialog" aria-labelledby="serviceModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="serviceModalLabel">서비스 정보</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="serviceForm">
                        <input type="hidden" name="g_id" value="${g_id}">
                        <input type="hidden" name="s_number" id="s_number">
                        <div class="form-group">
                            <label for="serviceName">서비스 이름:</label>
                            <input type="text" name="s_name" class="form-control" id="serviceName">
                        </div>
                        <div class="form-group">
                            <label for="serviceDescription">서비스 설명:</label>
                            <textarea class="form-control" name="s_detail" id="serviceDescription" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="servicePrice">가격:</label>
                            <input type="text" class="form-control" name="s_price" id="servicePrice">
                        </div>
                        <div class="form-group">
                            <label for="serviceDuration">이용기간(일):</label>
                            <input type="text" class="form-control" name="s_period" id="serviceDuration">
                        </div>
                        <div class="form-group">
                            <label for="serviceNotes">특이사항:</label>
                            <textarea class="form-control" name="s_matters" id="serviceNotes" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" id="submitServiceBtn">저장</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    
    
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	        	<form>
		            <div class="modal-header">
		                <h5 class="modal-title" id="confirmDeleteModalLabel">삭제 확인</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body">
		                <p>삭제하시겠습니까?</p>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                <button type="submit"  value="삭제" class="btn btn-danger" id="confirmDeleteBtn">	삭제</button>	
		            </div>
	            </form>
	        </div>
	    </div>
	</div>
    
    



<!-- 스크립트 -->
<script type="text/javascript">
	//서비스 추가 및 수정 모달에 대한 AJAX
$(document).ready(function() {
	 // 가격을 통화 단위로 변환하는 함수
    function formatCurrency(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // 페이지 로드 시 가격을 통화 단위로 변환
    $('.price').each(function() {
        var priceText = $(this).text();
        var price = parseInt(priceText.replace(/[^\d]/g, '')); // 숫자만 추출
        $(this).text(formatCurrency(price) + "원"); // 통화 단위로 변환하여 설정
    });
	
	
	
	
    var sNumber; // sNumber 변수를 전역으로 정의
    
    // 서비스 추가 및 수정 모달이 열릴 때
    $('#serviceModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // 클릭된 버튼
        var modal = $(this);

        // 서비스 추가 모달인지 수정 모달인지 확인
        var isAddServiceModal = button.hasClass('add-service-btn');

        // 서비스 추가 모달일 경우에는 입력 필드 초기화 및 버튼 텍스트 설정
        if (isAddServiceModal) {
            modal.find('.modal-title').text('서비스 추가'); // 모달 제목 설정
            modal.find('#submitServiceBtn').text('저장'); // 저장 버튼 텍스트 설정
            // 서비스 추가 모달일 경우 입력 필드 초기화
            modal.find('#serviceName').val(''); // 서비스 이름 입력 필드 초기화
            modal.find('#serviceDescription').val(''); // 서비스 설명 입력 필드 초기화
            modal.find('#servicePrice').val(''); // 가격 입력 필드 초기화
            modal.find('#serviceDuration').val(''); // 이용기간 입력 필드 초기화
            modal.find('#serviceNotes').val(''); // 특이사항 입력 필드 초기화
        } else {
            // 수정 모달일 경우에는 해당 서비스에 대한 정보를 가져오기 위한 AJAX 요청
            sNumber = button.closest('tr').find('#s_number').val(); // 해당 서비스 번호 추출

            $.ajax({
                type: 'GET',
                url: 'jh/fetchServiceDetails/' + sNumber, // 실제 서비스 세부 정보를 가져오는 엔드포인트 URL로 교체해야 함
                dataType: 'json',
                success: function(response) {
                    // 가져온 서비스 세부 정보로 모달을 채움
                    modal.find('.modal-title').text('서비스 수정'); // 모달 제목 설정
                    modal.find('#submitServiceBtn').text('수정'); // 수정 버튼 텍스트 설정
                    modal.find('#serviceName').val(response.s_name);
                    modal.find('#serviceDescription').val(response.s_detail);
                    modal.find('#servicePrice').val(response.s_price);
                    modal.find('#serviceDuration').val(response.s_period);
                    modal.find('#serviceNotes').val(response.s_matters);
                },
                error: function(xhr, status, error) {
                    console.error('서비스 세부 정보 가져오기 오류:', error);
                }
            });
        }
    });

    // 서비스 저장 또는 수정 버튼 클릭 시
    $('#submitServiceBtn').on('click', function(event) {
        event.preventDefault(); // 기본 이벤트 방지

        // 서비스 폼 데이터 가져오기
        var formData = $('#serviceForm').serialize();

        // 서비스 추가 또는 수정 AJAX 요청
        var url = $(this).text() === '저장' ? 'jh/createService' : 'jh/updateService/' + sNumber;
        $.ajax({
            type: 'POST', // 메서드 설정
            url: url, // 서비스 추가 또는 수정 엔드포인트 URL로 교체해야 함
            data: formData,
            success: function(response) {
                // 서비스 추가 또는 수정에 성공했을 때의 동작
                alert("등록이 완료되었습니다");
                $('#serviceModal').modal('hide'); // 모달 닫기
                // 추가 또는 수정된 서비스 정보를 화면에 반영하거나 페이지 새로고침 등의 동작 수행
                location.reload();
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error('서비스 추가 또는 수정 오류:', error);
            }
        });
    });
    
 	// 서비스 삭제 버튼 클릭 시
    $('.delete-service-btn').on('click', function(event) {
        event.preventDefault(); // 기본 이벤트 방지
        
        // 클릭된 삭제 버튼이 속한 행에서 s_number 값을 가져옴
        var sNumber = $(this).closest('tr').find('#s_number').val();
        
        // 모달에 sNumber를 설정
        $('#confirmDeleteModal').data('sNumber', sNumber);
        
        // 모달 열기
        $('#confirmDeleteModal').modal('show');
    });

    // 확인 버튼 클릭 시 삭제 실행
    $('#confirmDeleteBtn').on('click', function(event) {
        event.preventDefault(); // 기본 이벤트 방지
        
        // 모달에 설정된 sNumber 가져오기
        var sNumber = $('#confirmDeleteModal').data('sNumber');
        
        // 서비스 삭제 AJAX 요청
        $.ajax({
            type: 'DELETE',
            url: 'jh/deleteService/' + sNumber, // 삭제하는 엔드포인트 URL로 교체해야 함
            success: function(response) {
                // 서비스 삭제에 성공했을 때의 동작
                alert("삭제되었습니다.");
                $('#confirmDeleteModal').modal('hide'); // 모달 닫기
                // 삭제된 서비스 정보를 화면에서 제거하거나 페이지를 다시 로드하여 업데이트
                location.reload();
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error('서비스 삭제 오류:', error);
            }
        });
    });

    
    
});



</script>
</body>
</html>
