<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

    function validateForm() {
        // 제목과 내용 입력란의 값을 가져옴
        var title = document.getElementsByName("b_title")[0].value;
        var content = document.getElementsByName("b_content")[0].value;

        // 제목 또는 내용이 비어있는지 확인 
        if (title == ""  ) {
            // 비어있을 경우 alert 표시
            alert("제목을 입력해주세요.");
            return false; // 폼 제출 취소
        } else if (content == "" ) {
        	alert("내용을 입력해주세요.");
        	return false;
        } 
        return true; // 제출 가능한 상태
    }
</script>

</head>
<body>
	<main id="main" class="main">
			<section class="section col-10" style="margin: 0 auto">
	
				<div class="pagetitle">
					<h3>공지사항 수정</h3>
				</div>
				
				<div class="row">
				<div style="margin: 0 auto">
					<div class="card" style="padding: 25px 10px 0 10px;">
						<div class="card-body">
								<form action="hsUpdateNoticeBoard" method="post" onsubmit="return validateForm();">
								  <input type="hidden" name="b_number" value="${noticeBoard.b_number }">
								  				<div class="row mb-3">
									<label for="labelcate" class="col-sm-2 col-form-label">카테고리</label>
									<div class="col-sm-10">
										공지사항
									</div>
								</div>
								<div class="row mb-3">
									<label for="labelbnum" class="col-sm-2 col-form-label">글번호</label>
									<div class="col-sm-10" id="labelbnum">${noticeBoard.b_number}</div>
								</div>
								<div class="row mb-3">
									<label for="labeltitle" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input type="text" id="labeltitle" name="b_title" value="${noticeBoard.b_title}">
									</div>
								</div>
								<div class="row mb-3">
									<label for="titlereg" class="col-sm-2 col-form-label">최근 수정일자</label>
									<div class="col-sm-10" id="titlereg">${noticeBoard.b_update}</div>
								</div>
								<div class="row mb-3">
									<label for="labelmname" class="col-sm-2 col-form-label">작성자</label>
									<div class="col-sm-10" id="labelmname">${noticeBoard.m_name}</div>
								</div>
								<div class="row mb-3">
									<label for="lebelreadcount" class="col-sm-2 col-form-label">조회수</label>
									<div class="col-sm-10" id="lebelreadcount">${noticeBoard.b_readcount}</div>
								</div>
								<div class="row mb-3">
									<label for="labelcontent" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" id="labelcontent" style="height: 300px"
											name="b_content">${noticeBoard.b_content}</textarea>
									</div>
								</div>
								<div class="row mb-3">
									<div style="text-align: center">
										<button type="submit" class="btn btn-outline-primary">확인</button>
										<button type="button" class="btn btn-outline-secondary"
											onclick="location.href='hsListNoticeBoard?b_number=${noticeBoard.b_number}'">취소</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

</body>
<%@ include file="../footer.jsp"%>
</html>