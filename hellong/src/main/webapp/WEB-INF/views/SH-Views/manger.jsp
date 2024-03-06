<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
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
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(
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
			
			
			
			
				 $('#submitGym').click(function() {
				        var formData = new FormData();

				        // 모든 텍스트 필드 데이터 추가
				        formData.append('m_number', $('input[name="m_number"]').val());//파트너넘
				        formData.append('g_name', $('input[name="g_name"]').val());    //상호명
				        formData.append('g_address', $('input[name="g_address"]').val()); // 주소
				        formData.append('g_tel', $('input[name="g_tel"]').val()); // 전화번호
				        formData.append('g_companynumber', $('input[name="g_companynumber"]').val()); // 사업자 등록번호

				        // 파일 데이터 추가
				        var imageFile = $('#imageInput')[0].files[0]; //사업자 등록서류
				        formData.append('image', imageFile);

				        $.ajax({
				            url: 'registerGym', // 서버 엔드포인트 URL
				            type: 'POST',
				            data: formData,
				            processData: false,
				            contentType: false,
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
			
			
			});
	
	 $(document).on('click','#applyChanges', function() {
	        // 선택된 'admin' 라디오 버튼의 값 가져오기
	        var adminValue = $('input[name="ckcommon_mcd"]:checked').val();
	        // 회원 번호 가져오기 (회원 번호 입력 필드 예시: <input type="hidden" name="m_number" value="회원번호">)
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
	                // 모달 닫기
	                $('#MemberModal').modal('hide');
	            },
	            error: function(xhr, status, error) {
	                // 요청 처리 중 오류가 발생했을 때 실행할 코드
	                alert('오류 발생: ' + error);
	            }
	        });
	    });

	// 검색 기능을 구현하는 함수
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
	//회원삭제!
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
	
	
</script>

</head>
<body>



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
					<td><button type="button" class="btn btn-primary edit-btn"
							data-bs-toggle="modal" data-bs-target="#MemberModal"
							data-memberid="${Member.m_number}">회원정보수정</button></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>



	<h2>헬스장 정보</h2>
	<div class="search-bar">
		<input type="text" id="gymSearchInput" placeholder="헬스장 검색...">
		<button type="button" onclick="searchGymTable()">찾기</button>
	</div>

	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#insertGym">헬스장 등록</button>

	<table class="scrollable-table" id=scrollable-gym>
		<thead>
			<tr>
				<th>상호명</th>
				<th>대표회원번호</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:forEach var="gym" items="${allGym}">
					<tr>
						<td>${gym.g_name}</td>
						<td>${gym.m_number }</td>
						<td>${gym.g_regdate }</td>
						<td><select class="form-select form-select-sm"
							aria-label=".form-select-sm example">
								<option selected>Open this select menu</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
						</select>
						<td><button type="button">헬스장삭제</button></td>
				</c:forEach>
		</tbody>
	</table>

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
										<label> <input type="radio" name="ckcommon_mcd" value="10">
											일반회원
										</label> <label> <input type="radio" name="ckcommon_mcd" value="20">
											헬스장
										</label> <label> <input type="radio" name="ckcommon_mcd" value="30">
											관리자
										</label>
									</form>

								</td>
							</tr>
							<tr>
								<td colspan="2">${message }</td>
							</tr>
						</table>
					</form>
					<button type="button"  id="deleteMember">회원삭제</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<button type="button" id="applyChanges" class="btn btn-primary">적용</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 	헬스장 추가  -->
	<div class="modal fade" id="insertGym" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">헬스장 추가 </h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

						<table>
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
								<td><input type="text" name="g_companynumber" value="${mVo.email }"></td>
							</tr>
							<tr>
								<td>등록신청서류</td>
								<td><input type="file" id="imageInput" name="image" /></td>
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

	<!-- 	헬스장 페이지 정보  -->
	<div class="modal fade" id="Gym_Content" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">헬스장 추가 </h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

						<table>
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
								<td><input type="text" name="g_companynumber" value="${mVo.email }"></td>
							</tr>
							<tr>
								<td>등록신청서류</td>
								<td><input type="file" id="imageInput" name="image" /></td>
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
</body>

</html>
