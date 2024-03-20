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

// 댓글기능
$(document).ready(function() {
	
	$('#repInsert').click(function() {// comment_body의 값 검증
		var commentBody = $('[name="comment_body"]').val();
		if (!commentBody) {
			alert('댓글을 입력 하세요.');
			$('[name="comment_body"]').focus();
			return false;
		}
		
		// 폼 데이터 직렬화
		var frmData = $('#comment_form').serialize();
		// jQuery의 $.post 메소드를 사용해 서버로 데이터 전송
		$.post("commentInsert1",frmData,function(board){
			var newCommentHtml ='<li>' +
			    '<div class="comment-details">' +
			    '<h4 class="comment-author" style="font-size: 11px">' + board.m_name + '</h4>' +
			    '<p class="comment-description" style="font-size: 18px;">' + board.b_content + '</p>' +
			    '<span style="font-size: 12px; color: #757575;">' + board.b_regdate + '</span>' +
			    '<div>' +
			    '<a href="deleteComment1?Comm_number=' + board.b_number + '&bId=' + board.b_comm_group + '" onclick="return confirm(\'댓글을 삭제하시겠습니까?\');">삭제</a>' +
			    '</div>' +
			    '</div>' +
			    '</li><hr>';
			$('.list_comments').prepend(newCommentHtml); // 새로운 <li>를 list_comments ul에 추가
			$('[name="comment_body"]').val(''); // 댓글 입력란을 비웁니다.
		}).fail(function() {
			alert('댓글 등록에 실패했습니다.');
		});
	});
});


//추천기능 
document.addEventListener("DOMContentLoaded", function() {
   const recommendButton = document.getElementById("recommendButton");
   recommendButton.addEventListener("click", function() {
      const b_number = this.getAttribute("data-b_number"); // 버튼의 data-b_number 속성에서 b_number 값을 가져옵니다.

      fetch("recommends", {
         method: "POST",
         headers: {
            "Content-Type": "application/x-www-form-urlencoded",
         },
         body: `b_number=${b_number}`
      })
         .then(response => response.text()) // 이 부분을 response.json()에서 response.text()로 변경합니다.
         .then(data => {
            alert(data); // 서버로부터 받은 응답(메시지)를 알림으로 표시합니다.
            if (data === "추천되었습니다.") {
               let recommCountElement = document.getElementById("recommCount");
               recommCountElement.innerText = parseInt(recommCountElement.innerText) + 1;
            }
         })
         .catch(error => console.error('Error:', error));
   });
});

</script>
<style type="text/css">
</style>
</head>

<body>
	<div style="padding: 5%;">
		<h3>게시글</h3>
		<hr />
		<span style="font-size: 20px;">${board.b_title}</span>
		<p style="font-size: 11px;">${board.b_regdate}</p>
		<p style="text-align: right; font-size: 14px;">${board.m_name}</p>
		<p style="text-align: right; font-size: 12px;" id="recommCount">추천: ${board.b_recomm_count}&ensp;|&ensp;신고: ${board.b_isreported}&ensp;|&ensp;조회: ${board.b_readcount}</p>
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
			<!-- <button type="button" class="btn btn-outline-primary" id="recommendButton"
					data-bs-toggle="modal" data-bs-target="#recommModal">추천</button> -->
			<button type="button" id="recommendButton"
               class="btn btn-outline-primary" data-b_number="${board.b_number}">
               <i class="bi bi-hand-thumbs-up-fill"></i> 추천
            </button>
			<button type="button" class="btn btn-outline-danger" 
					data-bs-toggle="modal" data-bs-target="#reportedModal">신고</button>
			</c:if>
			
			<!-- 목록버튼: 모두에게 표시 -->  
		  	<button type="button" class="btn btn-outline-secondary" 
		  			onclick="location.href='communityBoard'">목록</button>
	
		</div>
		<!-- 이전글, 다음글 링크 수정 -->
		<%-- <p>
		<div style="display: flex; justify-content: space-between; align-items: center;">
			<button type="button" class="btn btn-outline-secondary" 
		  		  onclick="location.href='detailBoard?b_number=${board.prevPage}'">이전글
		  	</button>
			<button type="button" class="btn btn-outline-secondary" 
		  		  onclick="location.href='detailBoard?b_number=${board.nextPage}'">다음글
		  	</button>
		</div>	
		</div> --%>
		
		<!-- 댓글 기능 구현!!!!!!!!!!!!!!!!!!! -->
		<!-- 댓글 입력파트 -->
		<div>
			<form id="comment_form">
				<input type="hidden" name="cmId" value="${M_NUMBER}">
				<input type="hidden" name="bId" value="${board.b_number}">
				<div class="row">
					<div class="col-md-11 mb-2" style="padding: 0">
						<textarea name="comment_body" class="form-control" style="height: 50px;" id="re_content"></textarea>
					</div>
					<div class="col-md-1 mb-2" style="padding: 0">
						<button type="button" class="btn btn-primary btn-block" style="width: 60px; height: 50px; font-size: 17px" id="repInsert">확인</button>
					</div>
				</div>
			</form>
		</div>
		
	</div>
	
	
	<div style="padding: 5%;">
		<!-- 댓글!!! -->
		<div class="title-box-d">
			<h6 class="title-d">댓글</h3>
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
								${CommList.m_name}
							</h4>
							<p class="comment-description" style="font-size: 18px;">${CommList.b_content}</p>
							<span style="font-size: 12px; color: #757575;">${CommList.b_regdate}</span>	
								<div>
									<a href="deleteComment1?Comm_number=${CommList.b_number}&bId=${board.b_number}" onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
								</div> 
							</div>
							</li>
							<hr/>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/js/index.js"></script>





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






<%-- 	<!-- ======================== 추천 Modal 구현 ======================== -->
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
 --%>








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