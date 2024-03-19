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

</head>
<body>
	<header>
		<h1 class="title">바디프로필 조회</h1>
	</header>
	<nav class="navigation">
		<button>홈</button>
		<button>블로그</button>
		<button>프로젝트</button>
		<button>마이페이지</button>
	</nav>
	<div class="container">
		<div class="body-profile-details">
			<!-- 여기에 게시글 내용 표시 -->
			<h2>${board.b_title }</h2>
			<!--  여기에 사진첨부 ${board.b_images}-->
			<!-- 이미지를 여러 개 첨부할 수 있다고 가정하고 이미지 리스트를 반복하여 표시 -->
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
								class="d-block w-100" alt="...">
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

				<c:if
					test="${sessionScope.m_number != null }">
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal" data-bs-target="#reportedModal">
						<i class="bi bi-megaphone-fill"></i>신고
					</button>
				</c:if>
			</div>




			<!-- 댓글 섹션 -->
			<div class="comments-section">
				<h3>댓글</h3>
				<c:forEach var="comment" items="${comments}">
					<div class="comment">
						<p>${comment.comment_content}</p>
					</div>
				</c:forEach>
				<form action="addComment" method="post">
					<input type="hidden" name="cmId" value="${M_NUMBER}"> 
					<input type="hidden" name="bId" value="${board.b_number}">
					<textarea name="comment_content" rows="4" cols="50"></textarea>
					<br> <input type="hidden" name="b_number"
						value="${board.b_number}"> <input type="submit"
						value="댓글 작성">
				</form>
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

				<c:if test="${board.m_number != sessionScope.m_number}">
					<button type="button" class="btn btn-outline-dark" disabled>게시글
						삭제</button>
				</c:if>
				<c:if test="${board.m_number == sessionScope.m_number}">
					<button type="button" class="btn btn-outline-dark"
						data-b_number="${board.b_number}"
						onclick="return confirmDeletion(this);">게시글 삭제</button>
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
	<footer>
		<p>2024 Hellong. All rights reserved.</p>
	</footer>

</body>
</html>