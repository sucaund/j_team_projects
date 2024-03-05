<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 커뮤니티 - 1:1문의</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#repInsert').click(
						function() {
							// comment_body의 값 검증
							var commentBody = $('[name="comment_body"]').val();
							if (!commentBody) {
								alert('댓글을 입력 하세요.');
								$('[name="comment_body"]').focus();
								return false;
							}

							// 폼 데이터 직렬화
							var frmData = $('#comment_form').serialize();

							// jQuery의 $.post 메소드를 사용해 서버로 데이터 전송
							$.post(
									"commentInsert",
									frmData,
									function(board) {
										var newCommentHtml = 
											 '<li>댓글 : ' + board.b_content + 
									         ' <a href="/deleteComment?Comm_number=' + board.b_number + '&bId=' + board.b_comm_group + '" onclick="return confirm(\'댓글을 삭제하시겠습니까?\');">삭제</a></li>';
										$('.list_comments').prepend(
												newCommentHtml); // 새로운 <li>를 list_comments ul에 추가
										$('[name="comment_body"]').val(''); // 댓글 입력란을 비웁니다.
									}).fail(function() {
								// 에러 처리
								alert('댓글 등록에 실패했습니다.');
							});
						});
				
				

			});
</script>
</head>
<body>


	<form action="modify" method="post">
		<input type="hidden" name="mId" value="${board.m_number}">
		<input type="hidden" name="bId" value="${board.b_number}">
		<table border="1" style="width: 50%;">
			<tr>
				<td>번호</td>
				<td>${board.b_number}</td>
			</tr>

			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" value="${board.b_title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" name="bContent" style="width: 100%;">${board.b_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">
					&nbsp;&nbsp; <a href="qlist?mId=${board.m_number}">목록보기</a>
					&nbsp;&nbsp; <a href="delete?bId=${board.b_number}">삭제</a>
					&nbsp;&nbsp; <%-- <a href="reply_view?bId=${board.b_number}">답변</a></td> --%>
			</tr>
		</table>
	</form>

	<!-- 댓글!!! -->
	<div class="all_comments">
		<!-- 댓글 입력파트 -->
		<form id="comment_form">
			<input type="hidden" name="mId" value="${board.m_number}"> <input
				type="hidden" name="bId" value="${board.b_number}">
			<tr>
				<div style="padding-right: 5px">
					<textarea rows="6" name="comment_body" cols="60" class="input_"
						style="width: 50%;" title="덧글 내용입력" placeholder="건전한 댓글 나누기!"></textarea>
				</div>
				<td>
					<button type="button" id="repInsert">댓글입력!</button>
				</td>
			</tr>
		</form>


		<!-- 댓글리스트 -->
		<div id="slist">
			<div class="box_comments">
				<ul class="comments">
					<li class="list_comments">
					<c:forEach var="CommList"
							items="${boardCommList}">
							<td>
								<li>댓글 : ${CommList.b_content }
								<a href="/deleteComment?Comm_number=${CommList.b_number }&bId=${board.b_number}" onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
								</li>
							<p>
							</td>
						</c:forEach></li>
				</ul>
			</div>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/js/index.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/index.js"></script>
</body>
</html>