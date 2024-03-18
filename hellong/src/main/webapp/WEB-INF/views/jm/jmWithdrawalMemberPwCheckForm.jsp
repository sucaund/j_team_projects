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

    <!-- 미로그인시 -->
    <c:if test="${m_number==null}">
	<div class="account-login section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card login-form" method="get" id="login" action="jmLogin">
					<div class="card-body">
						<div class="title">
							<h3>로그인된 회원만 접근할 수 있습니다.</h3>
							<p><c:if test="${msg!=null}">${msg}</c:if></p>
						</div>

						<div class="button">
							<button class="btn" type="submit" form="login">로그인</button>
						</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </c:if> 
	<!--닫기: c:if  -->

	 <!-- 로그인 되어있을때(즉 정상 접근 때)-->
     <c:if test="${m_number!=null}">
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="register-form"> 
                    <!-- 회원가입 디자인만 씀 -->

                        <div class="card-body">
                        
                            <div class="title">
                                <h3>탈퇴 전 비밀번호를 입력해주세요.</h3>
                            </div>

			                <div class="form-group input-group">
                                <label for="reg-pw">비밀번호</label>
                                <input type="password"
					class="form-control" id="m_pw" placeholder="8~16자리의 영문자와 숫자"  name="m_pw"
                    autocomplete='off' required="required">
					        </div>
							<form action="jmUpdateMemberForm" method="post" name="frm">
                            <button type="submit" class="btn btn-primary">탈퇴하지 않겠습니다</button>
							</form>
                            &nbsp; &nbsp;
							<form action="jmWithdrawalMemberPwCheck" method="post" name="frm">
                            	<button type="submit" class="btn btn-primary" 
                            style="border: 2px solid red; background-color: red;">탈퇴하기</button>
							</form>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>

</body>
</html>