<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
</head>
<body>
	<main id="main" class="main">
		<section class="section col-10" style="margin: 0 auto">

			<div class="pagetitle">
				<h3>글쓰기</h3>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#" onclick="location.href='communityBoard?m_number=${sessionScope.m_number}'">내가 쓴 글 목록</a></li>
					</ol>
				</nav>
			</div>
			<!-- End Page Title -->
			<div class="row">
				<div style="margin: 0 auto">
					<div class="card" style="padding: 25px 10px 0 10px;">
						<div class="card-body">
							<form action="writeBoard" method="post">
								<div class="row mb-3">
									<label for="title" class="col-sm-2 col-form-label">카테고리</label>
									<div class="col-sm-10">
										<select name="jjcategory" required="required">
											<option value="" selected disabled hidden>카테고리를 선택해주세요.</option>
											<option value="jjfree">자유글</option>
											<!-- <option value="jjbody">바디프로필</option>
											<option value="jjnotice">공지</option>
											<option value="jjquestion">문의</option> -->
										</select>
									</div>
								</div>

								<div class="row mb-3">
									<label for="title" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input type="text" style="width:100%;" name="b_title" required="required" value="${board.b_title}">
									</div>
								</div>
								
								<div class="row mb-3">
									<label for="title" class="col-sm-2 col-form-label">아이디</label>
									<div class="col-sm-10">
										${m_name}
									</div>
								</div>

								<div class="row mb-3">
									<label for="content" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">										
										<textarea class="form-control" style="height: 300px" name="b_content" required="required" id="${board.b_content}"></textarea>
									</div>
								</div>
								<div class="row mb-3">
									<div style="text-align:center">
										<button type="button" class="btn btn-outline-secondary" onclick="location.href='communityBoard'">취소</button>
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
<%@ include file="../footer.jsp"%>
</html>