<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/windicss@3.0.14/css/windicss.min.css">
<script>

    function validateForm() {
        var title = document.getElementsByName("b_title")[0].value;
        var content = document.getElementsByName("b_content")[0].value;

        if (title == ""  ) {
            alert("제목을 입력해주세요.");
            return false;
        } else if (content == "" ) {
        	alert("내용을 입력해주세요.");
        	return false;
        } 
        return true;
    }
</script>

</head>
<body>
<main id="main" class="main">
		<section class="section col-6" style="margin: 0 auto">

			<div class="pagetitle">
				<h3 style="text-align:left; margin-bottom: 10px;">공지사항 작성</h3>
			</div>
			<!-- End Page Title -->
			<div class="row">
				<div style="margin: 0 auto">
					<div class="card" style="padding: 25px 10px 0 10px;">
						<div class="card-body">
				 <form action="hsCreateNoticeBoard" method="post" onsubmit="return validateForm();">
	   					<div class="row mb-3">
									<label for="title" class="col-sm-2 col-form-label">카테고리</label>
									<div class="col-sm-10">
	   								공지사항
	   								</div>
   								</div>
	  								<div class="row mb-3">
									<label for="title" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input type="text" name="b_title" value="${board.b_title}">
									</div>
								</div>
								
								<div class="row mb-3">
									<label for="title" class="col-sm-2 col-form-label">아이디</label>
									<div class="col-sm-10">
										${member.m_name}
										<input type="hidden" name="m_number" value="${member.m_number}">
									</div>
								</div>

								<div class="row mb-3">
									<label for="content" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">										
										<textarea class="form-control" style="height: 300px" name="b_content" id="${board.b_content}"></textarea>
									</div>
								</div>
								<div class="row mb-3">
									<div style="text-align:center">
										<button type="button" class="btn btn-outline-secondary" onclick="location.href='hsListNoticeBoard?m_number=${member.m_number}'">취소</button>
										<button type="submit" class="btn btn-outline-primary">등록</button>
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
</html>