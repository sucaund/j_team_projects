<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세게시판</title>

<script type="text/javascript">

</script>
</head>
<body>

	<h3>상세게시판</h3>
		<table>
			<tr><th>글번호</th><td>${board.b_number}</td></tr>
			<tr><th>글제목</th><td>${board.b_title}</td></tr>
	 		<tr><th>작성일자</th><td>${board.b_regdate}</td></tr>
			<tr><th>작성자</th><td>${board.m_name}</td></tr>
			<tr><th>추천수</th><td>${board.b_recomm_count}</td></tr>
			<tr><th>신고수</th><td>${board.b_isreported}</td></tr>
			<tr><th>조회수</th><td>${board.b_readcount}</td></tr>
			<tr><th>내용</th><td>${board.b_content}</td></tr>
		</table>
	<p>
	<div style="text-align:center">
		<button type="button" class="btn btn-outline-secondary" 
	  		  onclick="location.href='updateFormBoard?b_number=${board.b_number}'">수정</button>
		<button type="button" class="btn btn-outline-secondary" 
	  		  data-bs-toggle="modal" data-bs-target="#delModal">삭제</button>
	  	<button type="button" class="btn btn-outline-primary" 
	  		  data-bs-toggle="modal" data-bs-target="#recommModal">추천</button>
	  	<button type="button" class="btn btn-outline-danger" 
	  		  data-bs-toggle="modal" data-bs-target="#reportedModal">신고</button>
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

	<hr />
	<div style="display: grid; place-items: center;">
		<form action="commentForm">
			<input style="width:768px;" type="text" id="commentInput" name="comment" placeholder="댓글을 입력해주세요" />
			<input type="submit" value="입력" />
		</form>
	</div>
	<hr />
	<h6 id="commentCount">댓글 0개</h6>
	<div id="commentsContainer">
		<table>
			<tr><th>${board.m_name}</th><td rowspan="2">&emsp;${board.b_title}</td></tr>
			<tr><td style="font-size:10px">${board.b_regdate}</td></tr>
			
		</table>
	</div>






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
					정말 신고하시겠습니까?
					<form action="" method="get">
						<select name="cateSearch" id="cateSearch"
							onchange="goCateSearch()">
							<option value="">선택사항</option>
							<option value="cate-free"
								${param.cateSearch == 'cate-free' ? 'selected' : ''}></option>
							<option value="cate-body"
								${param.cateSearch == 'cate-body' ? 'selected' : ''}>광고</option>
							<option value="cate-notice"
								${param.cateSearch == 'cate-notice' ? 'selected' : ''}>욕설</option>
							<option value="cate-question"
								${param.cateSearch == 'cate-question' ? 'selected' : ''}>음란</option>
						</select>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal"
						onclick="location.href='jjReported?b_number=${board.b_number}&m_number=${board.m_number}&common_bcd=${board.common_bcd}&common_mcd=${board.common_mcd}'">신고</button>
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