<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scrollable Tables with Fixed Headers</title>
<style>
.scrollable-table {
	display: block;
	overflow-y: auto;
	max-height: 200px;
	border-collapse: collapse;
	width: 100%;
}

.scrollable-table thead tr th {
	position: sticky;
	top: 0;
	background-color: #f9f9f9;
}

.scrollable-table tbody tr td {
	border: 1px solid #ddd;
}

.scrollable-table th, .scrollable-table td {
	text-align: left;
	padding: 8px;
}

.search-bar {
	display: flex;
	align-items: center;
	margin: 10px;
}

.search-bar input {
	padding: 10px;
	margin-right: 10px;
	width: 20%;
	box-sizing: border-box;
}

.search-bar i {
	color: #666;
	font-size: 20px;
}

.scrollable-card-body {
	height: 150px; /* 또는 원하는 높이로 설정 */
	overflow-y: auto; /* 스크롤바가 필요한 경우에만 표시 */
}

.scrollable-table th, .scrollable-table td {
	max-width: 200px; /* 최대 너비 설정 */
	white-space: nowrap; /* 텍스트를 공백으로 감싸지 않음 */
	overflow: hidden; /* 넘치는 내용 숨김 */
	text-overflow: ellipsis; /* 넘치는 내용을 말줄임표로 표시 */
}

.scrollable-table th {
	position: sticky;
	top: 0;
	background-color: #fff;
	z-index: 10;
}

</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("Gym_g_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
	
	$(document).ready(
//===================================회원정보 가져오기===============================
			function() {
				$('.edit-btn').on(
						'click',
						function() {
							// data-memberid 속성에서 회원 ID를 가져옵니다.
							var memberId = $(this).data('memberid');

							// AJAX를 사용하여 서버에 회원 정보를 요청합니다.
							$.ajax({
								url : 'getMemberDetails', // 서버의 URL을 지정해야 합니다.
								type : 'GET',
								data : {
									'id' : memberId
								}, // 서버로 보낼 데이터
								dataType : 'json', // 응답 받을 데이터의 타입
								success : function(data) {
									// 성공 시 모달의 필드에 데이터를 채웁니다.
									// 모달의 각 입력 필드에 ID를 설정하고 해당 ID를 사용하여 값을 설정합니다.
									$('#MemberModal input[name="m_number"]')
											.val(data.m_number);
									$('#MemberModal input[name="m_name"]').val(
											data.m_name);
									$('#MemberModal input[name="m_id"]').val(
											data.m_id);
									$('#MemberModal input[name="m_age"]').val(
											data.m_age);
									$('#MemberModal input[name="m_gender"]')
											.val(data.m_gender);
									$('#MemberModal input[name="m_phone"]')
											.val(data.m_phone);
									$('#MemberModal input[name="m_email"]')
											.val(data.m_email);
									$('#MemberModal input[name="m_address"]')
											.val(data.m_address);
									$('#MemberModal input[name="m_currpoint"]')
											.val(data.m_currpoint);
									$('#MemberModal input[name="m_regdate"]')
											.val(data.m_regdate);
									// 여기에 다른 필드에 대한 데이터 설정을 추가합니다.
									 if(data.common_mcd === 10) { // 일반회원
									        $('#MemberModal input[name="ckcommon_mcd"][value="10"]').prop('checked', true);
									    } else if(data.common_mcd === 20) { // 헬스장
									        $('#MemberModal input[name="ckcommon_mcd"][value="20"]').prop('checked', true);
									    } else if(data.common_mcd === 30) { // 관리자
									        $('#MemberModal input[name="ckcommon_mcd"][value="30"]').prop('checked', true);
									    }
									// 모달을 표시합니다.
									$('#MemberModal').modal('show');
								},
								error : function(xhr, status, error) {
									// 오류 처리
									console.error("AJAX Error: " + status
											+ error);
								}
							});
						});
			
			
			
//==============================헬스장 추가=======================================
				 		console.log('Submit gym clicked');
						$('#submitGym').click(function() {
						console.log('Submit gym clicked 문제없이 실행된다');
				        
						var formData = new FormData();


				        formData.append('m_number', $('input[name="Gym_m_number"]').val());
				        formData.append('g_name', $('input[name="Gym_g_name"]').val());
				        formData.append('g_address', $('input[name="Gym_g_address"]').val());
				        formData.append('g_tel', $('input[name="Gym_g_tel"]').val());
				        formData.append('g_companynumber', $('input[name="Gym_g_companynumber"]').val());
				        formData.append('image', $('#imageInput')[0].files[0]);
				        // 모든 텍스트 필드 데이터 추가


				        //console.log('formData 추가오나료');
						

				        $.ajax({
				            url: '/registerGym', // 서버 엔드포인트 URL
				            type: 'POST',
					        
				            data: formData,
				            processData: false,
				            contentType: false,
							dataType:'text',
				            success: function(response) {
				                alert('헬스장 정보가 성공적으로 등록되었습니다.');
								$('#insertGym').modal('hide'); // 모달 숨기기
				                location.reload(); // 페이지 새로 고침 또는 목록 업데이트
				            },
				            error: function(xhr, status, error) {
				                alert('등록 실패: ' + error);
				            }
				        });
				    });
						
						//$('#insertGym').modal('hide'); // 모달 숨기기
						//contentType: 'application/json',
//=========================헬스장 정보 가져오기============================
					
					
					$('.GymEdit-btn').on('click',
							function() {
								
								var memberId = $(this).data('memberid');
								// AJAX를 사용하여 서버에 체육관 정보를 요청합니다.
								$.ajax({
									url : 'getGymDetails', // 서버의 URL을 지정해야 합니다.
									type : 'GET',
									data : {
										'id' : memberId
									}, // 서버로 보낼 데이터
									dataType : 'json', // 응답 받을 데이터의 타입
									success : function(data) {
										console.log(data);
										var imageUrl = '/upload3/' + data.g_document;
										// 성공 시 모달의 필드에 데이터를 채웁니다.
										// 모달의 각 입력 필드에 ID를 설정하고 해당 ID를 사용하여 값을 설정합니다.
										$('#Gym_Content input[name="g_number"]').val(data.g_id);//헬스장 번호
										$('#Gym_Content input[name="m_number"]').val(data.m_number);//파트너 번호
										$('#Gym_Content input[name="g_name"]').val(data.g_name);//상호명
										$('#Gym_Content input[name="g_address"]').val(data.g_address);//주소
										$('#Gym_Content input[name="g_tel"]').val(data.g_tel);//전화번호
										$('#Gym_Content input[name="g_companynumber"]').val(data.g_companynumber);//사업자 등록번호
										$('#Gym_Content img[name="g_document"]').attr('src', imageUrl);//사업자 등록증

										
										
										// 여기에 다른 필드에 대한 데이터 설정을 추가합니다.
										 if(data.common_mcd === 10) { // 대기
										        $('#Gym_Content input[name="GymOpen_mcd"][value="10"]').prop('checked', true);
										    } else if(data.common_mcd === 20) { // 승인
										        $('#Gym_Content input[name="GymOpen_mcd"][value="20"]').prop('checked', true);
										    } else if(data.common_mcd === 30) { // 노출
										        $('#Gym_Content input[name="GymOpen_mcd"][value="30"]').prop('checked', true);
										    }
										// 모달을 표시합니다.
										$('#Gym_Content').modal('show');
									},
									error : function(xhr, status, error) {
										// 오류 처리
										console.error("AJAX Error: " + status
												+ error);
									}
								});
							});
			});
	//=========================헬스장 권리 변경==================================
	 $(document).on('click','#OpenGym', function() {
	        // 선택된 'admin' 라디오 버튼의 값 가져오기
	        var OpenValue = $('input[name="GymOpen_mcd"]:checked').val();
	        // 회원 번호 가져오기 (회원 번호 입력 필드 예시: <input type="hidden" name="m_number" value="회원번호">)
	        var gNumber = $('input[name="g_number"]').val();

	        // AJAX 요청을 통해 서버에 데이터 전송
	        $.ajax({
	            url: 'updateOpenGym', // 요청을 처리할 서버의 URL
	            type: 'POST',
	            data: {
	                'g_id': gNumber, // 서버에 전달할 헬스장 번호
	                'common_mcd': OpenValue // 서버에 전달할 헬스장 오픈 등급
	            },
	            success: function(response) {
	                // 요청이 성공적으로 처리되었을 때 실행할 코드
	                alert('헬스장 오픈이 성공적으로 업데이트되었습니다.');
	                
	                location.reload();
	                // 모달 닫기
	                //$('#Gym_Content').modal('hide');
	            },
	            error: function(xhr, status, error) {
	                // 요청 처리 중 오류가 발생했을 때 실행할 코드
	                alert('오류 발생: ' + error);
	            }
	        });
	    });
	//==========================회원 권리 변경===============================
	 $(document).on('click','#applyChanges', function() {
	        // 선택된 'admin' 라디오 버튼의 값 가져오기
	        var adminValue = $('input[name="ckcommon_mcd"]:checked').val();
	        // 헬스장 번호 가져오기 (회원 번호 입력 필드 예시: <input type="hidden" name="m_number" value="회원번호">)
	        var mNumber = $('input[name="m_number"]').val();

	        // AJAX 요청을 통해 서버에 데이터 전송
	        $.ajax({
	            url: 'updateMemberAdmin', // 요청을 처리할 서버의 URL
	            type: 'POST',
	            data: {
	                'm_number': mNumber, // 서버에 전달할 회원 번호
	                'admin': adminValue // 서버에 전달할 회원 등급
	            },
	            success: function(response) {
	                // 요청이 성공적으로 처리되었을 때 실행할 코드
	                alert('회원 등급이 성공적으로 업데이트되었습니다.');
	                
	                location.reload();
	                // 모달 닫기
	                //$('#MemberModal').modal('hide');
	            },
	            error: function(xhr, status, error) {
	                // 요청 처리 중 오류가 발생했을 때 실행할 코드
	                alert('오류 발생: ' + error);
	            }
	        });
	    });

	// ======================회원 검색 기능을 구현하는 함수===========================
	function searchTable() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("searchInput"); // 검색어 입력 필드의 ID
		filter = input.value.toUpperCase(); // 대소문자를 구분하지 않기 위해 모두 대문자로 변환
		table = document.querySelector(".scrollable-table"); // 검색을 적용할 테이블
		tr = table.getElementsByTagName("tr"); // 테이블의 모든 행

		// 모든 행을 순회하며 검색어와 일치하는지 확인
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0]; // 첫 번째 열(회원이름)만 검색 대상으로 함
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = ""; // 검색어와 일치하면 행을 보여줌
				} else {
					tr[i].style.display = "none"; // 일치하지 않으면 행을 숨김
				}
			}
		}
	}
	// ======================헬스장 검색 기능을 구현하는 함수===========================
	function searchGymTable() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("gymSearchInput"); // 헬스장 검색어 입력 필드의 ID
		filter = input.value.toUpperCase(); // 대소문자 구분 없이 모두 대문자로 변환
		table = document.querySelector("#scrollable-gym"); // 검색을 적용할 두 번째 테이블
		tr = table.getElementsByTagName("tr"); // 테이블의 모든 행

		// 모든 행을 순회하며 검색어와 일치하는지 확인
		for (i = 0; i < tr.length; i++) {
			// 이 예제에서는 첫 번째 열(상호명)을 검색 대상으로 함
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = ""; // 검색어와 일치하면 행을 보여줌
				} else {
					tr[i].style.display = "none"; // 일치하지 않으면 행을 숨김
				}
			}
		}
	}
	//===============================회원삭제!===============================
	$(document).on('click',"#deleteMember",function (){
		var mNumber = $('input[name="m_number"]').val();
	    if(confirm('정말로 회원을 삭제하시겠습니까?')) {
	        $.ajax({
	            url: 'deleteMember', // 요청을 처리할 서버의 URL
	            type: 'POST',
	            data: {
	                'm_number': mNumber
	            },
	            success: function(response) {
	                alert('회원이 성공적으로 삭제되었습니다.');
	                location.reload(); // 페이지를 새로고침하여 변경사항 반영
	            },
	            error: function(xhr, status, error) {
	                alert('회원 삭제 중 오류가 발생했습니다: ' + error);
	            }
	        });
	    }
	});
	//=========================헬스장 삭제==================================
	$(document).on('click',"#deleteGym",function (){
		var gNumber = $('input[name="g_number"]').val();
	    if(confirm('정말로 헬스장을 삭제하시겠습니까?')) {
	        $.ajax({
	            url: 'deleteGym', // 요청을 처리할 서버의 URL
	            type: 'POST',
	            data: {
	                'g_id': gNumber
	            },
	            success: function(response) {
	                alert('헬스장이 성공적으로 삭제되었습니다.');
	                location.reload(); // 페이지를 새로고침하여 변경사항 반영
	            },
	            error: function(xhr, status, error) {
	                alert('헬스장 삭제 중 오류가 발생했습니다: ' + error);
	            }
	        });
	    }
	});
	//=========================신고글 삭제==================================
	function deleteReport(bNumber) {
    if(confirm('정말로 삭제하시겠습니까?')) {
        document.getElementById('deleteReportId').value = bNumber; // 신고 ID 설정
        document.getElementById('deleteReportForm').submit(); // 폼 제출
    }
	}
	//=========================문의글 관리창에서만 지우기==================================
    function deleteThisTable(bNumber) {
    if(confirm('정말로 삭제하시겠습니까?')) {
        document.getElementById('ThisTableId').value = bNumber; // 신고 ID 설정
        document.getElementById('ThisTableForm').submit(); // 폼 제출
    }
	}

	
</script>
</head>
<body>

	<div class="container mt-3">
		<div class="row">
			<div class="col-12">
				<!-- 큰 테두리가 있는 박스 -->
				<div class="border p-3">
					<div class="row">
						<!-- 1번 박스 -->
						<div class="col-sm-12 mb-3">
							<div class="border p-3">

								<div>
									<h2>회원 정보</h2>
									<div class="search-bar">
										<input type="text" id="searchInput" placeholder="검색...">
										<!-- id 추가 -->
										<button type="button" onclick="searchTable()">찾기</button>
										<!-- 검색 함수 실행 -->
									</div>
									<table class="scrollable-table">
										<thead>
											<tr>
												<th>회원이름</th>
												<th>회원등급</th>
												<th>가입일</th>
												<th>회원정보</th>

											</tr>
										</thead>
										<tbody>

											<c:forEach var="Member" items="${allMember}">
												<input type="hidden" name="mId" value="${Member.m_number}">
												<tr>
													<td>${Member.m_name}</td>
													<td><c:choose>
															<c:when test="${Member.common_mcd == 10}">
                    일반회원
                </c:when>
															<c:when test="${Member.common_mcd == 20}">
                    헬스장
                </c:when>
															<c:when test="${Member.common_mcd == 30}">
                    관리자
                </c:when>
															<c:otherwise>
                    알 수 없음
                </c:otherwise>
														</c:choose></td>
													<td>${Member.m_regdate }</td>
													<td><button type="button"
															class="btn btn-primary edit-btn" data-bs-toggle="modal"
															data-bs-target="#MemberModal"
															data-memberid="${Member.m_number}">회원정보수정</button></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>

							</div>
						</div>
						<!-- 2번 박스 -->
						<div class="col-sm-12 mb-3">
							<div class="border p-3">

								<h2>헬스장 정보</h2>
								<div class="search-bar">
									<input type="text" id="gymSearchInput" placeholder="헬스장 검색...">
									<button type="button" onclick="searchGymTable()">찾기</button>
								</div>

								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#insertGym">헬스장
									등록</button>

								<table class="scrollable-table" id=scrollable-gym>
									<thead>
										<tr>
											<th>상호명</th>
											<th>대표회원번호</th>
											<th>등록일</th>
											<th>노출등급</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach var="gym" items="${allGym}">
												<tr>
													<td>${gym.g_name}</td>
													<td>${gym.m_number }</td>
													<td>${gym.g_regdate }</td>
													<td><c:choose>
															<c:when test="${gym.common_mcd == 10}">
                   				 대기
               						</c:when>
															<c:when test="${gym.common_mcd == 20}">
                   				 승인
              						</c:when>
															<c:when test="${gym.common_mcd == 30}">
                   			 	 노출
                					</c:when>
															<c:otherwise>
                    			알 수 없음
                			</c:otherwise>
														</c:choose></td>

													<td><button type="button"
															class="btn btn-primary GymEdit-btn"
															data-bs-toggle="modal" data-bs-target="#Gym_Content"
															data-memberid="${gym.g_id}">헬스장 정보</button></td>
											</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>
					<div class="row">
						<!-- 3번 박스 -->
						<div class="col-sm-12 mb-3">
							<div class="border p-3">
								<form id="deleteReportForm" action="/delReport" method="post"
									style="display: none;">
									<input type="hidden" name="b_number" id="deleteReportId">
								</form>

								<h2>신고관리</h2>
								<table class="scrollable-table" id=scrollable-Report>
									<thead>
										<tr>
											<th>신고사유</th>
											<th>글제목</th>
											<th>신고일자</th>
											<th>신고누적횟수</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach var="report" items="${allReport}">
												<tr>
													<td><c:choose>
															<c:when test="${report.common_mcd == 10}">
                   				 		 광고
               						</c:when>
															<c:when test="${report.common_mcd == 20}">
                   						 욕설
              						</c:when>
															<c:when test="${report.common_mcd == 30}">
                   			 			 음란
                					</c:when>
															<c:otherwise>
                    					알 수 없음
                				</c:otherwise>
														</c:choose></td>
													<td>${report.b_title }</td>
													<td>${report.report_date }</td>
													<td>${report.report_count }</td>
													<td>${report.b_number}</td>


													<td><button type="button" class="btn btn-primary"
															onclick="deleteReport(${report.b_number})">신고글
															삭제</button></td>
											</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 4번 박스 -->
						<div class="col-sm-12 mb-3">
							<div class="border p-3">
								<form id="ThisTableForm" action="/delThisTable" method="post"
									style="display: none;">
									<input type="hidden" name="b_number" id="ThisTableId">
								</form>
								
											<h2>문의글</h2>
											<table class="scrollable-table" id=scrollable-Report>
												<thead>
													<tr>
														<th>글제목</th>
														<th>작성일</th>
														<th>작성 회원번호</th>
														<th>댓글</th>
														<th>목록에서 삭제</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<c:forEach var="QnA" items="${allQnA}">
															<tr>
																<td><a href="/QuestionContent?B_NUMBER=${QnA.b_number}">${QnA.b_title }</td>
																<td>${QnA.b_regdate }</td>
																<td>${QnA.m_number }</td>
																<td>${commentCounts[QnA.b_number]}</td>

																<td>
																	<button type="button" class="btn btn-primary"
																		onclick="deleteThisTable(${QnA.b_number})">목록에서
																		삭제</button>
																</td>
														</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
		






		<!-- ===================================신고관리======================================= -->





		

		<!-- =====================문의글 관리======================= -->



		<!-- 	헬스장 추가  -->
		<div class="modal fade" id="insertGym" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">헬스장 추가</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<table>
							<tr>
								<td>파트너번호</td>
								<td><input type="text" name="Gym_m_number"></td>
							</tr>
							<tr>
								<td>상호명</td>
								<td><input type="text" name="Gym_g_name"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" id="sample6_postcode"
									placeholder="우편번호"> <input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="Gym_g_address" name="Gym_g_address"
									placeholder="주소"><br> <input type="text"
									id="sample6_extraAddress" placeholder="참고항목"></td>
								<!-- <td><input type="text" name="Gym_g_address"></td> -->
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" name="Gym_g_tel"></td>
							</tr>

							<tr>
								<td>사업자 등록번호</td>
								<td><input type="text" name="Gym_g_companynumber"></td>
							</tr>
							<tr>
								<td>등록신청서류</td>
								<td><input type="file" id="imageInput" name="image"
									multiple="multiple" /></td>
							</tr>

							<tr>
								<td colspan="2">${message }</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" id="submitGym" class="btn btn-primary">등록</button>
					</div>
				</div>
			</div>
		</div>


		<!-- 회원정보-->
		<div class="modal fade" id="MemberModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">회원정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table>

							<tr>
								<td>회원번호</td>
								<td><input type="text" name="m_number" readonly="readonly"
									value=""></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="m_name" readonly="readonly"
									value=""></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="m_id" readonly="readonly"></td>
							</tr>

							<tr>
								<td>나이</td>
								<td><input type="text" name="m_age"></td>
							</tr>

							<tr>
								<td>성별</td>
								<td><input type="text" name="m_gender"></td>
							</tr>

							<tr>
								<td>전화번호</td>
								<td><input type="text" name="m_phone"></td>
							</tr>


							<tr>
								<td>이메일</td>
								<td><input type="text" name="m_email"></td>
							</tr>

							<tr>
								<td>지역</td>
								<td><input type="text" name="m_address"></td>
							</tr>

							<tr>
								<td>보유보인트</td>
								<td><input type="text" name="m_currpoint"></td>
							</tr>
							<tr>
								<td>가입일</td>
								<td><input type="text" name="m_regdate"></td>
							</tr>

							<tr>
								<td>등급</td>

								<td>
									<!-- 회원 등급 선택 라디오 버튼 -->
									<form id="adminForm">
										<label> <input type="radio" name="ckcommon_mcd"
											value="10"> 일반회원
										</label> <label> <input type="radio" name="ckcommon_mcd"
											value="20"> 헬스장
										</label> <label> <input type="radio" name="ckcommon_mcd"
											value="30"> 관리자
										</label>
									</form>

								</td>
							</tr>
							<tr>
								<td colspan="2">${message }</td>
							</tr>
						</table>
						</form>
						<button type="button" id="deleteMember">회원삭제</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" id="applyChanges" class="btn btn-primary">적용</button>
					</div>
				</div>
			</div>
		</div>



		<!-- 	헬스장 페이지 정보  -->
		<div class="modal fade" id="Gym_Content" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">헬스장 정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<table>
							<tr>
								<form id="GymForm">
									<label> <input type="radio" name="GymOpen_mcd"
										value="10"> 대기
									</label> <label> <input type="radio" name="GymOpen_mcd"
										value="20"> 승인
									</label> <label> <input type="radio" name="GymOpen_mcd"
										value="30"> 노출
									</label>
								</form>
							</tr>
							<tr>
								<td>헬스장 번호</td>
								<td><input type="text" name="g_number" readonly="readonly"></td>
							</tr>
							<tr>
								<td>파트너번호</td>
								<td><input type="text" name="m_number" readonly="readonly"></td>
							</tr>
							<tr>
								<td>상호명</td>
								<td><input type="text" name="g_name" readonly="readonly"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="g_address" readonly="readonly"></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" name="g_tel"></td>
							</tr>

							<tr>
								<td>사업자 등록번호</td>
								<td><input type="text" name="g_companynumber"></td>
							</tr>
							<tr>
								<td>등록신청서류</td>
								<td><img id="g_document" name="g_document" src=""
									alt="체육관 이미지" style="width: 100%; height: auto;"></td>
							</tr>


							<tr>
								<td colspan="2">${message }</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" id="deleteGym" class="btn btn-primary">헬스장삭제</button>
						<button type="button" id="OpenGym" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
</body>
<script src="<%=request.getContextPath()%>/js/index.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>



</html>