<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
</head>

<body>
	<div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">로그인</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                    </ul>
                </div>
            </div>
        </div>
    </div>

     <!-- 로그인 상태일 때 로그인 버튼 클릭(비정상 접근) -->
    <c:if test="${m_number!=null}">
	<div class="account-login section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card login-form" method="get" id="logout" action="jmLogOut">
					<div class="card-body">
						<div class="title">
							<h3>이미 로그인된 계정입니다.</h3>
							<p><c:if test="${msg!=null}">${msg}</c:if></p>
						</div>

						<div class="button">
							<button class="btn" type="submit" form="logout">로그아웃</button>
						</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </c:if> <!--닫기: c:if m_number != null -->

 <!-- 로그인 안되어있을때(즉 정상 접근 때) -->
<c:if test="${m_number==null}">
    
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" method="get" id="login" action="jmLoginCheck">
                        <div class="card-body">
                            <div class="title">
                                <h3>로그인</h3>
                                <p><c:if test="${msg!=null}">${msg}</c:if></p>
                            </div>

                            
                            
                            <div class="form-group input-group">
                                <label for="reg-fn">아이디</label>
                                <input class="form-control" type="text" id="m_id" name="m_id" required="required">
                            </div>
                            <div class="form-group input-group">
                                <label for="reg-fn">비밀번호</label>
                                <input class="form-control" type="password" id="m_pw" name="m_pw" required="required">
                            </div>

                            <div style="float:right;">
                                <a class="lost-pass" href="jmFindIdForm">아이디 찾기</a> &nbsp;
                                <a class="lost-pass" href="jmFindPwForm">비밀번호 찾기</a>
                            </div>
                            <br>
                            <div class="button">
                                <button class="btn" type="submit" form="login">로그인</button>
                            </div>

                            <p class="outer-link">계정이 없으신가요? &nbsp; &nbsp; <a href="/jmSignUpFormAjax2">회원가입</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</c:if> 
<!--닫기: 로그인 안되어있을시(즉 정상 접근 시) c:if m_number == null -->


    
    <!-- ========================= scroll-top ========================= -->
    <a href="/jmLoginForm" class="scroll-top" style="display: none;">
        <i class="lni lni-chevron-up"></i>
    </a>

	</body>
</html>