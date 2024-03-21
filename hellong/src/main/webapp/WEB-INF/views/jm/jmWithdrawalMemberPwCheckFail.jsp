<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 실패</title>
</head>
<body>
<!-- 상단 시작 -->
<div class="breadcrumbs">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 col-md-6 col-12">
          <div class="breadcrumbs-content">
            <h1 class="page-title">회원 탈퇴</h1>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-12">
          <ul class="breadcrumb-nav">
            <li>
              <a href="/jmMyPage"><i class="lni lni-home"></i>마이페이지</a>
            </li>
            <li>회원 탈퇴</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- 상단 끝 -->


    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="register-form"> 
                        <div class="card-body">
                            <div class="title">
                                <h3>회원 탈퇴 실패</h3>
								비밀번호가 일치하지 않습니다.
                            </div>

							<form method="get" action="jmWithdrawalMemberPwCheckForm">
                            <button type="submit" class="btn btn-primary">뒤로 가기</button>
							</form>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file="../footer.jsp"%>
</html>