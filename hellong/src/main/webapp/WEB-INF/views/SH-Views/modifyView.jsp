<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<main id="main" class="main">
		<section class="section col-6" style="margin: 0 auto">

			<div class="pagetitle">
				<h1>1:1문의글 올리기</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="qlist?mId=${board.m_number}">1:1문의목록</a></li>
					</ol>
				</nav>
			</div>
			<!-- End Page Title -->
			<div class="row">
				<div style="margin: 0 auto">
					<div class="card" style="padding: 25px 10px 0 10px;">
						<div class="card-body">
							<form action="modifyaction" method="post">
								<input type="hidden" name="bId" value="${board.b_number}">


								<div class="row mb-3">
									<label for="title" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">

										<input type="text" name="bTitle" class="form-control"
											value="${board.b_title}">

									</div>
								</div>


								<div class="row mb-3">
									<label for="content" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">
										<textarea name="bContent" class="form-control" style="height: 300px" id="content" >${board.b_content}</textarea>
									</div>
								</div>


								<div class="row mb-3">
									<div class="col-sm-2"></div>
									<div class="col-sm-8">
										<button type="submit" class="btn btn-primary"
											style="width: 100%">수정</button>
									</div>
									<div class="col-sm-2">
										<button type="button" class="btn btn btn-outline-primary"
											style="width: 100%"
											onclick="location.href='/QuestionContent?B_NUMBER=${board.b_number}'">취소</button>
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