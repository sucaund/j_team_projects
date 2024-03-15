<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
                <form class="card login-form" method="post"action="jmWithdrawalMemberPwCheckForm">
                <div class="card-body" >
                  <div class="title" sytle="margin:0 auto;">
                    <h3>회원 탈퇴에 실패했습니다.</h3>
                    <c:if test="${withdrawal_msg!=null}">${withdrawal_msg}</c:if>
                  </div>
                  <div class="button">
					<a href="/jmUpdateMemberForm" class="btn">뒤로가기</a>
                  </div>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
</body>
</html>