<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<div class="error-area">
		<div class="d-table">
		  <div class="d-table-cell">
			<div class="container">
			  <div class="error-content">
				<h1>Error</h1>
				<h2>알 수 없는 에러가 발생했습니다.</h2>
				<div class="button">
				  <a href="index.html" class="btn" onclick="history.back();">뒤로 가기</a>
				  <a href="/" class="btn">메인페이지로 이동</a>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </div>
</body>
</html>