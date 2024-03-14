<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script type="text/javascript" src="js/resetPw.js"></script>
</head>
<body>
	<div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">비밀번호 재설정</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="register-form"> 

                        <div class="card-body">
                        <form action="jmResetPw" method="post" name="frm">
                            <div class="title">
                                <h3>비밀번호 재설정</h3>
                                <p>변경할 비밀번호를 입력해주세요.</p>
								<p><c:if test="${reset_msg!=null}">${reset_msg}</c:if></p>
                            </div>

                        <!-- 세션에 findM_number 남아있는 상태 : ${findM_number} 받음 -->
						<!-- 회원정보 수정에서 왔다면 findM_number가 없으니 m_number 사용할 예정 -->

                            
			                <div class="form-group input-group">
                                <label for="reg-pw">새 비밀번호</label>
                                <input type="password"
					class="form-control" id="m_pw" placeholder="5~15자리의 영문자와 숫자"  name="m_pw"
                    autocomplete='off' oninput="checkPw()"  required="required">
                                <font color="red" id="failPwReg"
					style="display: none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font> 
					            <font color="red" id="failPwSame"
					style="display: none">비밀번호가 일치하지 않습니다.</font> 
					            <font
					color="red" id="failPwDuple" style="display: none">기존의 비밀번호와 다른 비밀번호로 설정해주세요.</font>
					        </div>


			                <div class="form-group input-group">
                                <label for="reg-pw_check">비밀번호 확인</label>
                                <input type="password"
					class="form-control" id="m_pw_check" placeholder="위 비밀번호와 동일하게 입력해주세요"  name="m_pw_check"
					oninput="checkPw()"
                    autocomplete='off' required="required">
					        </div>

                            <button type="submit" class="btn btn-primary" id="checkpwbtn" disabled>완료</button>
                        </form>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>