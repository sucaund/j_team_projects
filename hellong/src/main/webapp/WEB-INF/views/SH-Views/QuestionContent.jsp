<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>헬스장 커뮤니티 - 1:1문의</title>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
		$('#repInsert').click(function() {// comment_body의 값 검증
					var commentBody = $('[name="comment_body"]').val();
						if (!commentBody) {
						alert('댓글을 입력 하세요.');
							$('[name="comment_body"]').focus();
								return false;}
						
							// 폼 데이터 직렬화
							var frmData = $('#comment_form').serialize();
							// jQuery의 $.post 메소드를 사용해 서버로 데이터 전송
		$.post("commentInsert",frmData,function(board){
							var newCommentHtml ='<li>' +
						    '<div class="comment-details">' +
						    '<h4 class="comment-author" style="font-size: 11px">' +
						    (board.m_number != board.b_comm_group ?  '관리자' : '질문자') +
						    '</h4>' +
						    '<p class="comment-description" style="font-size: 18px;">' + board.b_content + '</p>' +
						    '<span style="font-size: 12px; color: #757575;">' + board.b_regdate + '</span>' +
						    '<div>' +
						    '<a href="/deleteComment?Comm_number=' + board.b_number + '&bId=' + board.b_comm_group + '" onclick="return confirm(\'댓글을 삭제하시겠습니까?\');">삭제</a>' +
						    '</div>' +
						    '</div>' +
						    '</li><hr>';																$('.list_comments').prepend(newCommentHtml); // 새로운 <li>를 list_comments ul에 추가
																$('[name="comment_body"]').val(''); // 댓글 입력란을 비웁니다.
															}).fail(
															function() {alert('댓글 등록에 실패했습니다.');});
										});

					});
</script>
</head>
<body>

	<main id="main" class="main">
		<section class="section container">
			<div class="row align-items-top col-8" style="margin: 0 auto">
				<div class="pagetitle">
					<h1>
						<a href="qlist?mId=${board.m_number}">1:1문의내역 </a>
					</h1>
					<nav>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="qlist?mId=${board.m_number}">1:1문의목록</a></li>
						</ol>
					</nav>
				</div>

				<div class="card">
					<form action="modify" method="post">
						<input type="hidden" name="mId" value="${board.m_number}">
						<input type="hidden" name="bId" value="${board.b_number}">
						<input type="hidden" name="bContent" value="${board.b_content}">
						<input type="hidden" name="bTitle" value="${board.b_title}">

						&nbsp;&nbsp;
						<div class="d-flex justify-content-center">
							<div class="col-sm-10">
								<h3 class="card-title ml-auto">${board.b_title}</h3>
							</div>
						</div>
						<hr>
						<div class="card-body" style="min-height: 500px">
							<pre style="font-weight: bold; font-size: 20px;">${board.b_content}</pre>
						</div>

						<tr>
							<td colspan="2"><input type="submit" value="수정">
								&nbsp;&nbsp; <a href="qlist?mId=${board.m_number}">목록보기</a>
								&nbsp;&nbsp; <a href="delete?bId=${board.b_number}">삭제</a>
								&nbsp;&nbsp; <%-- <a href="reply_view?bId=${board.b_number}">답변</a></td> --%>
						</tr>
					</form>
					<hr>
					
					<div class="col-md-8 offset-md-1 col-lg-8 offset-lg-1"
						style="margin: 0 auto">
						
						
						<!-- 댓글!!! -->
						<div class="title-box-d">
							<h3 class="title-d">Comments</h3>
						</div>
						<div class="all_comments">
							<!-- 댓글 입력파트 -->
							<form id="comment_form">
								<input type="hidden" name="cmId" value="${M_NUMBER}">
								<input type="hidden" name="bId" value="${board.b_number}">

								<div class="row">
									<div class="col-md-11 mb-2" style="padding: 0">
										<textarea name="comment_body" class="form-control"
											style="height: 50px;" name="re_content"></textarea>
									</div>
									<div class="col-md-1 mb-2" style="padding: 0">
										<button type="button" class="btn btn-primary btn-block"
											style="width: 60px; height: 50px; font-size: 17px"
											id="repInsert">확인</button>
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
												            질문자
												    </c:if>
												    <c:if test="${CommList.m_number != board.m_number}">
												            관리자
												     </c:if>
												 </h4>
												 <p id="p_584" class="comment-description" style="font-size: 18px;">${CommList.b_content}</p>
												 <span style="font-size: 12px; color: #757575;">${CommList.b_regdate}</span>	
												        <div id="btn_584">
														<a href="/deleteComment?Comm_number=${CommList.b_number }&bId=${board.b_number}" onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
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
				</div>
		</section>
	</main>
	<script src="<%=request.getContextPath()%>/js/index.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/index.js"></script>
</body>
<%@ include file="../footer.jsp"%>
</html>