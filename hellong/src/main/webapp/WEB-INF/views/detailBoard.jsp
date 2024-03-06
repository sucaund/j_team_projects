<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link href="css/board.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>상세게시판</title>
</head>
<body>

	<h1>상세게시판</h1>
	<table>
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
			<td>${member.m_name}</td>
		</tr>
		<tr>
			<th>추천수</th>
			<td>${board.b_recomm_count}</td>
			
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
	<!-- 이전글, 다음글 링크 수정 -->
	<div style="text-align:center">
		<button type="button" class="btn btn-primary" 
	  		  onclick="location.href='detailBoard?b_number=${board.prevPage}'">이전글
	  	</button>
		<button type="button" class="btn btn-primary" 
	  		  onclick="location.href='detailBoard?b_number=${board.nextPage}'">다음글
	  	</button>
	</div>
	<p>
	<div style="text-align:center">
		<button type="button" class="btn btn-primary" 
	  		  onclick="location.href='updateFormBoard?b_number=${board.b_number}'">수정</button>
		<button type="button" class="btn btn-primary" 
	  		  data-bs-toggle="modal" data-bs-target="#myModal">삭제</button>
	  	<button type="button" class="btn btn-primary" 
	  		  onclick="location.href='hitCnt?b_number=${board.b_number}'">추천</button>
	  	<button type="button" class="btn btn-primary" 
	  		  onclick="location.href='신고'">신고</button>
	  	<button type="button" class="btn btn-primary" 
	  		  onclick="location.href='communityBoard'">목록</button>
	</div>
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
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
	        <button type="button" class="btn btn-danger"  data-bs-toggle="modal" data-bs-target="#modalNo">아니오</button>
	      	<button type="button" class="btn btn-danger"  data-bs-toggle="modal" data-bs-target="#modalYes">네</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<!-- DeleteYes -->
	<div class="modal fade" id="modalYes">
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
	      	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
	      	<button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="location.href='deleteBoard?b_number=${board.b_number}'">삭제</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<!-- DeleteNo -->
	<div class="modal fade" id="modalNo">
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
	      	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
		
</body>
</html>