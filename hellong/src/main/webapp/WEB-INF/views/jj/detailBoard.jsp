<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>상세게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	//=========================댓글start=============================

	$(document)
			.ready(
					function() {

						$('#repInsert')
								.click(
										function() {// comment_body의 값 검증
											var commentBody = $(
													'[name="comment_body"]')
													.val();
											if (!commentBody) {
												alert('댓글을 입력 하세요.');
												$('[name="comment_body"]')
														.focus();
												return false;
											}

											// 폼 데이터 직렬화
											var frmData = $('#comment_form')
													.serialize();
											// jQuery의 $.post 메소드를 사용해 서버로 데이터 전송
											$.post("commentInsert1",frmData,function(board) {
																var newCommentHtml = '<li>'
																		+ '<div class="comment-details">'
																		+ '<h4 class="comment-author" style="font-size: 11px">'
																		+ (board.m_number != board.b_comm_group ? '글쓴이'
																				: '유동닉')
																		+ '</h4>'
																		+ '<p class="comment-description" style="font-size: 18px;">'
																		+ board.b_content
																		+ '</p>'
																		+ '<span style="font-size: 12px; color: #757575;">'
																		+ board.b_regdate
																		+ '</span>'
																		+ '<div>'
																		+ '<a href="/PdeleteComment?Comm_number='
																		+ board.b_number
																		+ '&bId='
																		+ board.b_comm_group
																		+ '" onclick="return confirm(\'댓글을 삭제하시겠습니까?\');">삭제</a>'
																		+ '</div>'
																		+ '</div>'
																		+ '</li><hr>';
																$(
																		'.list_comments')
																		.prepend(
																				newCommentHtml); // 새로운 <li>를 list_comments ul에 추가
																$(
																		'[name="comment_body"]')
																		.val(''); // 댓글 입력란을 비웁니다.
															})
													.fail(
															function() {
																alert('댓글 등록에 실패했습니다.');
															});
										});

					});

	//=========================댓글 END=============================

	function submitReport() {
		var reportSelect = $("#reportSelect").val();
		if (reportSelect) {
			var formAction = 'jjReported?b_number=${board.b_number}&m_number=${board.m_number}&common_bcd=400&common_mcd='
					+ reportSelect;
			$("#reportForm").attr('action', formAction).submit();
		} else {
			alert("신고 유형을 선택해주세요.");
		}
	}
</script>
</head>
<body>

	<h3>상세게시판</h3>
	<table>
		<tr>
			<th>글번호</th>
			<td>${board.b_number}</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td>${board.b_title}</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${board.b_regdate}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.m_name}</td>
		</tr>
		<tr>
			<th>추천수</th>
			<td>${board.b_recomm_count}</td>
		</tr>
		<tr>
			<th>신고수</th>
			<td>${board.b_isreported}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.b_readcount}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.b_content}</td>
		</tr>
	</table>
	<p>
	<div style="text-align: center">
		<!-- 수정, 삭제 버튼: 작성자 본인에게만 표시 -->
		<c:if test="${board.m_number == sessionScope.m_number}">
			<button type="button" class="btn btn-outline-secondary"
				onclick="location.href='updateFormBoard?b_number=${board.b_number}'">수정</button>
			<button type="button" class="btn btn-outline-secondary"
				data-bs-toggle="modal" data-bs-target="#delModal">삭제</button>
		</c:if>

		<!-- 신고, 추천 버튼: 다른 회원에게만 표시 -->
		<c:if
			test="${sessionScope.m_number != null && sessionScope.m_number != board.m_number}">
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
	<div
		style="display: flex; justify-content: space-between; align-items: center;">
		<button type="button" class="btn btn-outline-secondary"
			onclick="location.href='detailBoard?b_number=${board.prevPage}'">이전글
		</button>
		<button type="button" class="btn btn-outline-secondary"
			onclick="location.href='detailBoard?b_number=${board.nextPage}'">다음글
		</button>
	</div>

	<!-- 댓글 -->
	<hr />


	<div class="col-md-8 offset-md-1 col-lg-8 offset-lg-1"
		style="margin: 0 auto">
		<!-- 댓글!!! -->
		<div class="title-box-d">
			<h3 class="title-d">Comments</h3>
		</div>
		<div class="all_comments">
			<!-- 댓글 입력파트 -->
			<form id="comment_form">
				<input type="hidden" name="cmId" value="${M_NUMBER}"> <input
					type="hidden" name="bId" value="${board.b_number}">

				<div class="row">
					<div class="col-md-11 mb-2" style="padding: 0">
						<textarea name="comment_body" class="form-control"
							style="height: 50px;" name="re_content"></textarea>
					</div>
					<div class="col-md-1 mb-2" style="padding: 0">
						<button type="button" class="btn btn-primary btn-block"
							style="width: 60px; height: 50px; font-size: 17px" id="repInsert">확인</button>
					</div>
				</div>
			</form>


			<!-- 댓글리스트 -->
			<div id="slist">
				<div class="box_comments">
					<ul class="list_comments">
						<c:forEach var="CommList" items="${boardCommList}">
							<li>
								<div class="comment-details">
									<h4 class="comment-author" style="font-size: 11px">
										<c:if test="${CommList.m_number == board.m_number}">
								            글쓴이
								    </c:if>
										<c:if test="${CommList.m_number != board.m_number}">
								            유동닉
								     </c:if>
									</h4>
									<p id="p_584" class="comment-description"
										style="font-size: 18px;">${CommList.b_content}</p>
									<span style="font-size: 12px; color: #757575;">${CommList.b_regdate}</span>
									<div id="btn_584">
										<c:if test="${CommList.m_number == M_NUMBER}">
										<a
											href="/PdeleteComment?Comm_number=${CommList.b_number }&bId=${board.b_number}"
											onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a></c:if>
											
									</div>
								</div>
							</li>
							<hr>
						</c:forEach>
					</ul>
				</div>
			</div>
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
								<c:if test="${reportType.common_bcd == '400'}">
									<!-- COMMON_BCD가 400인 경우에만 옵션을 생성 -->
									<option value="${reportType.common_mcd}"
										${param.reportSelect == reportType.common_mcd ? 'selected' : ''}>
										${reportType.common_content}</option>
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
						data-bs-toggle="modal" onclick="submitReport()">신고</button>
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