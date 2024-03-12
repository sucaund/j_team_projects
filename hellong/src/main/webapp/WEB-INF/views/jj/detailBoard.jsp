<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세게시판</title>
<script type="text/javascript">
// 가정: 서버로부터 댓글 데이터를 가져오는 fetchComments 함수가 있음
function fetchComments() {
	// 서버로부터 댓글 데이터 가져오는 코드 여기에 작성
	// 이 예시에서는 임시 데이터 사용
	return [
		{m_name: "홍길동", b_title: "댓글 내용 예시", b_regdate: "2024-03-15"}
		// 실제 구현에서는 서버로부터 댓글 목록을 가져와서 반환합니다.
	]
}

function updateComments() {
	const comments = fetchComments(); // 서버로부터 댓글 목록 가져옴
	const commentsContainer = document.getElementById('commentsContainer');
	const commentCount = document.getElementById('commentCount');
	
	commentsContainer.innerHTML = ''; // 댓글 컨테이너 초기화
	comments.forEach(comment => {
		const commentElement = `<div><strong>${comment.m_name}</strong>: ${comment.b_title} <small>${comment.b_regdate}</small></div>`;
		commentsContainer.innerHTML += commentElement; // 댓글 추가
	})
	
	commentCount.innerText = `댓글 ${comments.length}개`; // 댓글 수 업데이트
}

document.getElementById('commentForm').addEventListener('submit', function(event) {
	event.preventDefault(); // 폼 제출 기본 동작 방지
	const commentInput = document.getElementById('commentInput');
	// 댓글 데이터를 서버로 전송하는 로직을 여기에 작성
	// 예시: 서버에 댓글 데이터를 전송하는 함수ㅡㄹ 호출
	
	commentInput.value = ''; // 입력 필드 초기화
	updateComments(); // 댓글 목록 업데이트
});

// 페이지 로드 시 댓글 목록 업데이트
updateComments();
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
	<!-- 이전글, 다음글 링크 수정 -->
	<div style="display: flex; justify-content: space-between; align-items: center; padding: 0 5%;">
		<button type="button" class="btn btn-outline-secondary" 
	  		  onclick="location.href='detailBoard?b_number=${board.prevPage}'">이전글
	  	</button>
		<button type="button" class="btn btn-outline-secondary" 
	  		  onclick="location.href='detailBoard?b_number=${board.nextPage}'">다음글
	  	</button>
	</div>
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
	      <div class="modal-body">
	        삭제 후에는 돌이킬 수 없습니다. 삭제하시겠습니까?
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-Secondary"  data-bs-toggle="modal" data-bs-target="#delNo">아니오</button>
	      	<button type="button" class="btn btn-outline-danger"  data-bs-toggle="modal" data-bs-target="#delYes">네</button>
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
	      <div class="modal-body">
	        정말 삭제하시겠습니까?
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
	      	<button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal" onclick="location.href='deleteBoard?b_number=${board.b_number}'">삭제</button>
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
	      <div class="modal-body">
	        취소되었습니다.
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-Secondary" data-bs-dismiss="modal">닫기</button>
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
	      <div class="modal-body">
	        추천하시겠습니까?
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-Secondary"  data-bs-toggle="modal" data-bs-target="#recommNo">아니오</button>
	      	<button type="button" class="btn btn-outline-Primary"  data-bs-toggle="modal" data-bs-target="#recommYes">네</button>
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
	      <div class="modal-body">
	        정말 추천하시겠습니까?
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-Secondary" data-bs-dismiss="modal">취소</button>
	      	<button type="button" class="btn btn-outline-Primary" data-bs-dismiss="modal" onclick="location.href='hitCnt?b_number=${board.b_number}'">추천</button>
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
	      <div class="modal-body">
	        취소되었습니다.
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-Secondary" data-bs-dismiss="modal">닫기</button>
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
	      <div class="modal-body">
	        신고하시겠습니까?
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-Secondary"  data-bs-toggle="modal" data-bs-target="#reportedNo">아니오</button>
	      	<button type="button" class="btn btn-outline-danger"  data-bs-toggle="modal" data-bs-target="#reportedYes">네</button>
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
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
	      	<button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal" onclick="location.href='jjReported?b_number=${board.b_number}&m_number=${board.m_number}&common_bcd=${board.common_bcd}&common_mcd=${board.common_mcd}'">신고</button>
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
	      <div class="modal-body">
	        취소되었습니다.
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-Secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>