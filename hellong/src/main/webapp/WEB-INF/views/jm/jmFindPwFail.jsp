<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
  a.btn {
      margin-top: 10px;
      margin-bottom: 10px;
          }
</style>

</head>
<body>
  <div class="breadcrumbs">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">비밀번호 찾기 실패</h1>
                </div>
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
</c:if> 
<!--닫기: c:if m_number != null -->


 <!-- 정상접근 : 가입 후 아직 로그인 되기 전 나오는 화면 -->
<c:if test="${m_number==null}">
<div class="account-login section">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
        <div class="card login-form">
        <div class="card-body" >
          <div class="title" sytle="margin:0 auto;">
            <h3>해당 아이디나 이메일로 가입된 계정이 없습니다.</h3>
          </div>

          <div class="button">
            <a class="btn" onclick="history.back();">뒤로 가기</a>
            <a href="/jmFindIdForm" class="btn">아이디 찾기</a>
            <a href="/jmFindForm" class="btn">비밀번호 찾기</a>
            <a href="/jmLoginForm" class="btn">로그인</a>
            <a href="/Default" class="btn">메인페이지로 이동</a>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
</div>
</c:if> 
</body>
<%@ include file="../footer.jsp"%>
</html>