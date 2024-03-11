<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세게시판</title>
</head>
<body>

	<h1>상세게시판</h1>
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
	  		  onclick="location.href='jjReported?b_number=${board.b_number}&m_number=${board.m_number}&common_bcd=${board.common_bcd}&common_mcd=${board.common_mcd}'">신고</button>
	  	<button type="button" class="btn btn-outline-secondary" 
	  		  onclick="location.href='communityBoard'">목록</button>
	</div>
	
	<!-- 삭제 Modal 구현 -->
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
	
	<!-- 추천 Modal 구현 -->
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
		
</body>
</html>