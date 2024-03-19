<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세게시판</title>

<script type="text/javascript">
function submitReport() {
	var reportSelect = $("#reportSelect").val();
	if(reportSelect) {
		var formAction = 'jjReported?b_number=${board.b_number}&m_number=${board.m_number}&common_bcd=400&common_mcd=' + reportSelect;
		$("#reportForm").attr('action', formAction).submit();
	} else {
		alert("신고 유형을 선택해주세요.");
	}
}

</script>
<style type="text/css">
	th{
		background-color: #BDBDBD;
		width: 100px;
		height: 30px;
		text-align: center;
		font-size: 20px;
	}
	td{
		background-color: #EAEAEA;
		padding-left: 10px;
		width: 300px;
	}
</style>
</head>
<body>

	
	<div style="padding: 5%;">
		<h3>게시글</h3>
		<hr />
		<span style="font-size: 20px;">${board.b_title}${board.b_number}</span>
		<p style="font-size: 11px;">${board.b_regdate}</p>
		<p style="text-align: right; font-size: 14px;">${board.m_name}</p>
		<p style="text-align: right; font-size: 12px;">추천: ${board.b_recomm_count}&ensp;|&ensp;신고: ${board.b_isreported}&ensp;|&ensp;조회: ${board.b_readcount}</p>
		<hr />
		<p>${board.b_content}</p>
		<hr />
		<p>
	<div style="text-align:center">		
		<!-- 수정, 삭제 버튼: 작성자 본인에게만 표시 -->
		<c:if test="${board.m_number == sessionScope.m_number}">
			<button type="button" class="btn btn-outline-secondary" 
		  		  onclick="location.href='updateFormBoard?b_number=${board.b_number}'">수정</button>
			<button type="button" class="btn btn-outline-secondary" 
		  		  data-bs-toggle="modal" data-bs-target="#delModal">삭제</button>
	  	</c:if>
		
		<!-- 신고, 추천 버튼: 다른 회원에게만 표시 -->
		<c:if test="${sessionScope.m_number != null && sessionScope.m_number != board.m_number}">
		<button type="button" class="btn btn-outline-primary" 
				data-bs-toggle="modal" data-bs-target="#recommModal">추천</button>
		<button type="button" class="btn btn-outline-danger" 
				data-bs-toggle="modal" data-bs-target="#reportedModal">신고</button>
		</c:if>
		
		<!-- 목록버튼: 모두에게 표시 -->  
	  	<button type="button" class="btn btn-outline-secondary" 
	  			onclick="location.href='communityBoard'">목록</button>

	</div>
	<!-- 이전글, 다음글 링크 수정 -->
	<p>
	<div style="display: flex; justify-content: space-between; align-items: center;">
		<button type="button" class="btn btn-outline-secondary" 
	  		  onclick="location.href='detailBoard?b_number=${board.prevPage}'">이전글
	  	</button>
		<button type="button" class="btn btn-outline-secondary" 
	  		  onclick="location.href='detailBoard?b_number=${board.nextPage}'">다음글
	  	</button>
	</div>	
	</div>
	






	<!-- ======================== Modal 구현 ======================== -->


	<!-- ======================== 삭제 Modal 구현 ======================== -->
	<div class="modal fade" id="delModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">삭제 확인</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">삭제 후에는 돌이킬 수 없습니다. 삭제하시겠습니까?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">아니오</button>
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal" data-bs-target="#delYes">네</button>
				</div>

			</div>
		</div>
	</div>

	<!-- DeleteYes -->
	<div class="modal fade" id="delYes">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">삭제 결과</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">정말 삭제하시겠습니까?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal"
						onclick="location.href='deleteBoard?b_number=${board.b_number}'">삭제</button>
				</div>

			</div>
		</div>
	</div>

	<!-- DeleteNo -->
	<div class="modal fade" id="delNo">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">삭제 결과</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">취소되었습니다.</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>






	<!-- ======================== 추천 Modal 구현 ======================== -->
	<div class="modal fade" id="recommModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">추천 확인</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">추천하시겠습니까?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">아니오</button>
					<button type="button" class="btn btn-outline-primary"
						data-bs-toggle="modal" data-bs-target="#recommYes">네</button>
				</div>

			</div>
		</div>
	</div>

	<!-- recommYes -->
	<div class="modal fade" id="recommYes">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">추천 결과</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">정말 추천하시겠습니까?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-outline-primary"
						data-bs-toggle="modal"
						onclick="location.href='hitCnt?b_number=${board.b_number}'">추천</button>
				</div>

			</div>
		</div>
	</div>

	<!-- recommNo -->
	<div class="modal fade" id="recommNo">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">추천 결과</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">취소되었습니다.</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>









	<!-- ======================== 신고 Modal 구현 ======================== -->
	<div class="modal fade" id="reportedModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">신고 확인</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">신고하시겠습니까?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">아니오</button>
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal" data-bs-target="#reportedYes">네</button>
				</div>

			</div>
		</div>
	</div>

	<!-- reportedYes -->
	<div class="modal fade" id="reportedYes">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">신고 결과</h4>
				</div>

 				<!-- Modal body -->
				<div class="modal-body">
					신고할 유형을 선택해주세요.(광고/욕설/음란)
					<form id="reportForm" method="post">
						<select name="reportSelect" id="reportSelect">
							<option value="">선택사항</option>
							<c:forEach var="reportType" items="${reportTypes}">
								<c:if test="${reportType.common_bcd == '400'}"> <!-- COMMON_BCD가 400인 경우에만 옵션을 생성 -->
									<option value="${reportType.common_mcd}" ${param.reportSelect == reportType.common_mcd ? 'selected' : ''}>
										${reportType.common_content}
									</option>
								</c:if>
							</c:forEach>
						</select>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal"
						onclick="submitReport()">신고</button>
				</div>

			</div>
		</div>
	</div>

	<!-- reportedNo -->
	<div class="modal fade" id="reportedNo">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">신고 결과</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">취소되었습니다.</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>