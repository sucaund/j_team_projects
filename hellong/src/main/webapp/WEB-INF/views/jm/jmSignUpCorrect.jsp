<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료</title>
</head>
<body>

	<div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">회원가입</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<div class="account-login section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card login-form" method="get" id="login" action="jmLoginForm">
					<div class="card-body" >
						<div class="title" sytle="margin:0 auto;">
							<h3>회원가입이 완료되었습니다.</h3>
						</div>

						<div class="button">
							<button class="btn" type="submit" form="login">로그인</button>
						</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>