<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
</head>
<body>
	<main id="main" class="main">
		<section class="section col-10" style="margin: 0 auto">

			<div class="pagetitle">
				<h3>수정페이지</h3>
			</div>
			<!-- End Page Title -->
			<div class="row">
				<div style="margin: 0 auto">
					<div class="card" style="padding: 25px 10px 0 10px;">
						<div class="card-body">
							<form action="updateBoard" method="post">
								<input type="hidden" name="b_number" value="${board.b_number}">
								<input type="hidden" name="m_name" value="${board.m_name}">
								<div class="row mb-3">
									<label for="labelcate" class="col-sm-2 col-form-label">카테고리</label>
									<div class="col-sm-10">
										<select name="jjcategory" id ="labelcate" required="required">
											<option value="" selected disabled hidden>카테고리를 선택해주세요.</option>
											<option value="jjfree">자유글</option>
											<!-- <option value="jjbody">바디프로필</option>
											<option value="jjnotice">공지</option>
											<option value="jjquestion">문의</option> -->
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<label for="labelbnum" class="col-sm-2 col-form-label">글번호</label>
									<div class="col-sm-10" id="labelbnum">${board.b_number}</div>
								</div>
								<div class="row mb-3">
									<label for="labeltitle" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input type="text" style="width:100%;" id="labeltitle" name="b_title" required="required"
											value="${board.b_title}">
									</div>
								</div>
								<div class="row mb-3">
									<label for="titlereg" class="col-sm-2 col-form-label">작성일자</label>
									<div class="col-sm-10" id="titlereg">${board.b_regdate}</div>
								</div>
								<div class="row mb-3">
									<label for="labelmname" class="col-sm-2 col-form-label">작성자</label>
									<div class="col-sm-10" id="labelmname">${board.m_name}</div>
								</div>
								<div class="row mb-3">
									<label for="labelrecomm" class="col-sm-2 col-form-label">추천수</label>
									<div class="col-sm-10" id="labelrecomm">${board.b_recomm_count}</div>
								</div>
								<div class="row mb-3">
									<label for="lebelreadcount" class="col-sm-2 col-form-label">조회수</label>
									<div class="col-sm-10" id="lebelreadcount">${board.b_readcount}</div>
								</div>
								<div class="row mb-3">
									<label for="labelcontent" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" id="labelcontent" style="height: 300px"
											name="b_content" required="required">${board.b_content}</textarea>
									</div>
								</div>
								<div class="row mb-3">
									<div style="text-align: center">
										<button type="submit" class="btn btn-outline-primary">수정</button>
										<button type="button" class="btn btn-outline-secondary"
											onclick="location.href='detailBoard?b_number=${board.b_number}'">취소</button>
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