<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/dySelectBodyProfile.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>바디프로필 조회</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/dySelectBodyProfile.css">
<script type="text/javascript">
	//댓글기능
	$(document)
			.ready(
					function() {

						var isLoggedIn =
<%out.print(session.getAttribute("m_number") != null ? "true" : "false");%>
	;

						$('#repInsert')
								.click(
										function() {// comment_body의 값 검증
											if (!isLoggedIn) {
												alert("로그인 후 이용하세요.");
												return false; // 로그인이 되어 있지 않으면 댓글 등록을 중단합니다.
											}

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
											$
													.post(
															"commentInsert2",
															frmData,
															function(board) {
																var newCommentHtml = '<li>'
																		+ '<div class="comment-details">'
																		+ '<h4 class="comment-author" style="font-size: 11px">'
																		+ board.m_name
																		+ '</h4>'
																		+ '<p class="comment-description" style="font-size: 18px;">'
																		+ board.b_content
																		+ '</p>'
																		+ '<span style="font-size: 12px; color: #757575;">'
																		+ board.b_regdate
																		+ '</span>'
																		+ '<div>'
																		+ '<a href="deleteComment2?Comm_number='
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
</script>
</head>
<body>

	<div class="breadcrumbs">
		<div class="container2">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">바디프로필</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="/Default"><i class="lni lni-home"></i>
								Home</a></li>
						<li><a href="listBodyProfile"><i
								class="lni lni-listbodyprofile"></i> BodyProfile</a></li>
						<li>${board.b_title }</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container1">
		<div class="body-profile-details">

			<h2>${board.b_title }</h2>

			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel">
				<!-- Indicators 동적 생성 -->
				<div class="carousel-indicators">
					<c:forEach items="${boardFile}" var="file" varStatus="status">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="${status.index}"
							class="${status.first ? 'active' : ''}"
							aria-current="${status.first ? 'true' : 'false'}"
							aria-label="Slide ${status.index + 1}"></button>
					</c:forEach>
				</div>

				<!-- Carousel 내부 이미지 항목 동적 생성 -->
				<div class="carousel-inner">
					<c:forEach items="${boardFile}" var="file" varStatus="status">
						<div class="carousel-item ${status.first ? 'active' : ''}">
							<img
								src="<%=request.getContextPath()%>/upload/${file.bf_savedName}"
								class="d-block w-100">
						</div>
					</c:forEach>
				</div>

				<!-- 이전 버튼 -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<i class="bi bi-arrow-left-circle-fill"
						style="font-size: 2rem; color: black;"></i> <span
						class="visually-hidden">Previous</span>
				</button>
				<!-- 다음 버튼 -->
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<i class="bi bi-arrow-right-circle-fill"
						style="font-size: 2rem; color: black;"></i> <span
						class="visually-hidden">Next</span>
				</button>
			</div>

			<div class="body-profile-details">
				<p class="content">${board.b_content}</p>
			</div>
			<div class="row mt-4">
				<div class="col-md-4">
					<p>조회수 : ${board.b_readcount}</p>
				</div>
				<div class="col-md-4">
					<p>
						추천수 : <span id="recommCount">${board.b_recomm_count}</span>
					</p>
				</div>
				<div class="col-md-4">
					<p>등록일 : ${board.b_regdate}</p>
				</div>
			</div>
			<div class="body-profile-actions">
				<button type="button" id="recommendButton"
					class="btn btn-outline-dark" data-b_number="${board.b_number}">
					<i class="bi bi-hand-thumbs-up-fill"></i> 추천
				</button>

				<c:if test="${sessionScope.m_number != null }">
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal" data-bs-target="#reportedModal">
						<i class="bi bi-megaphone-fill"></i> 신고
					</button>
				</c:if>
			</div>




			<!-- 댓글 기능 구현!!!!!!!!!!!!!!!!!!! -->
			<!-- 댓글 입력파트 -->
			<div>
				<form id="comment_form">
					<input type="hidden" name="cmId" value="${M_NUMBER}"> <input
						type="hidden" name="bId" value="${board.b_number}">
					<div class="row">
						<div class="col-md-11 mb-2" style="padding: 0">
							<textarea name="comment_body" class="form-control"
								style="height: 50px;" id="re_content"></textarea>
						</div>
						<div class="col-md-1 mb-2" style="padding: 0">
							<button type="button" class="btn btn-primary btn-block"
								style="width: 60px; height: 50px; font-size: 17px"
								id="repInsert">확인</button>
						</div>
					</div>
				</form>
			</div>

		</div>


		<div style="padding: 5%;">
			<!-- 댓글!!! -->
			<div class="title-box-d">
				<h6 class="title-d">
					댓글
					</h3>
			</div>
			<hr />
			<div class="all_comments">
				<!-- 댓글리스트 -->
				<div id="slist">
					<div class="box_comments">
						<ul class="list_comments">
							<c:forEach var="CommList" items="${boardCommList}">
								<li>
									<div class="comment-details">
										<h4 class="comment-author" style="font-size: 11px">
											${CommList.m_name}</h4>
										<p class="comment-description" style="font-size: 18px;">${CommList.b_content}</p>
										<span style="font-size: 12px; color: #757575;">${CommList.b_regdate}</span>
										<div>
											<a
												href="deleteComment2?Comm_number=${CommList.b_number}&bId=${board.b_number}"
												onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
										</div>
									</div>
								</li>
								<hr />
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="d-flex justify-content-center flex-wrap">
			<button type="button" class="btn btn-outline-dark"
				onclick="location.href='listBodyProfile'">게시판 목록</button>

			<c:if test="${board.m_number != sessionScope.m_number}">
				<button type="button" class="btn btn-outline-dark" disabled>게시글
					수정</button>
			</c:if>
			<c:if test="${board.m_number == sessionScope.m_number}">
				<button type="button" class="btn btn-outline-dark"
					onclick="location.href='dyUpdateFormBodyProfile?b_number=${board.b_number}'">게시글
					수정</button>
			</c:if>

			<c:if test="${board.b_isreported != 1}">
				<c:if test="${board.m_number != sessionScope.m_number}">
					<button type="button" class="btn btn-outline-dark" disabled>게시글
						삭제</button>
				</c:if>
				<c:if test="${board.m_number == sessionScope.m_number}">
					<button type="button" class="btn btn-outline-dark"
						data-b_number="${board.b_number}"
						onclick="return confirmDeletion(this);">게시글 삭제</button>
				</c:if>
			</c:if>
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
						<input type="hidden" id="b_number" value="${board.b_number}" /> <input
							type="hidden" id="m_number" value="${board.m_number}" /> <select
							name="reportSelect" id="reportSelect">
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
<%@ include file="../footer.jsp"%>
</html>