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
        padding: 70px 20px 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        position: relative;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
        color: #333;
    }
    tr:hover {
        background-color: #f9f9f9;
    }
    .price {
        font-weight: bold;
    }
    .validity {
        font-style: italic;
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
        position: absolute;
        top: 20px;
        right: 20px;
    }
    .edit-service-btn, .delete-service-btn {
        background-color: #008CBA;
        border: none;
        color: white;
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        margin-left: 5px;
        border-radius: 5px;
        cursor: pointer;
        transition-duration: 0.4s;
    }
    .add-service-btn:hover {
        background-color: #45a049;
    }
    .edit-service-btn:hover, .delete-service-btn:hover {
        background-color: #005A7D;
    }

    .pagination {
        text-align: center;
        margin-top: 20px;
    }
    .pagination a {
        display: inline-block;
        padding: 8px 16px;
        text-decoration: none;
        color: black;
        background-color: #ddd;
        border-radius: 5px;
        margin: 0 5px;
    }
    .pagination a.active {
        background-color: #4CAF50;
        color: white;
    }
    .pagination a:hover:not(.active) {
        background-color: #ccc;
    }
</style>

<!-- 부트스트랩 CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 부트스트랩 자바스크립트 및 jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>   
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <header>
        <h1>헬스장 이용권 리스트</h1>
    </header>
    <div class="container">
    
    
	     <div class="d-flex justify-content-between align-items-center mb-3">
	        <h2>이용권 리스트</h2>
	        <!-- 검색창 추가 -->
	        <div class="input-group w-25">
	            <input type="text" class="form-control" placeholder="검색어 입력">
	            <div class="input-group-append">
	                <button class="btn btn-outline-secondary" type="button">검색</button>

	            </div>

	        </div>
	    </div>
 
    
    
    	<button class="add-service-btn" data-toggle="modal" data-target="#serviceModal">서비스 추가</button>
        <table>
            <thead>
                <tr>
                	<th>번호</th>
                    <th>이용권</th>
                    <th>가격</th>
                    <th>이용기간</th>
                    <th>내용</th>
                    <th>특이사항</th>
                    <th>활동</th>
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
	                    <td class="price">${service.s_price}</td>
	                    <td class="validity">${service.s_period}일</td>
	                    <td>
	                        <ul class="benefits">
	                            <li>${service.s_detail}</li>
	                        </ul>
	                    </td>
	                    <td>${service.s_matters}</td>
						<td>
							<a href ="#serviceModal" class="edit-service-btn"   data-toggle="modal">수정</a>
							<a href ="#confirmDeleteModal" class="delete-service-btn"  data-toggle="modal">삭제</a>
                        </td>             
                    <c:set var="num" value="${num - 1}"></c:set>
	                </tr>
				</c:forEach>
            </tbody>
        </table>
        
        
          
        
        
        
	<div class="pagination">
		<c:if test="${page.startPage > page.pageBlock}">
		    <a href="serviceList?g_id=${g_id}&currentPage=${page.startPage - page.pageBlock}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		    <c:choose>
		        <c:when test="${page.currentPage == i}">
		            <a href="#" class="active">${i}</a>
		        </c:when>
		        <c:otherwise>
		            <a href="serviceList?g_id=${g_id}&currentPage=${i}">${i}</a>
		        </c:otherwise>
		    </c:choose>
		</c:forEach>
		<c:if test="${page.endPage < page.totalPage}">
		    <a href="serviceList?g_id=${g_id}&currentPage=${page.startPage + page.pageBlock}">다음</a>
		</c:if>
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
