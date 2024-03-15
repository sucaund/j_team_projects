<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="js/updateMember.js"></script>
    <style>
      a.btn {
          margin-top: 10px;
          margin-bottom: 10px;
              }
    </style>
  </head>
  <body>
    <!-- 상단 시작 -->
    <div class="breadcrumbs">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 col-md-6 col-12">
            <div class="breadcrumbs-content">
              <h1 class="page-title">회원 정보 수정</h1>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-12">
            <ul class="breadcrumb-nav">
              <li>
                <a href="/jmMyPage"><i class="lni lni-home"></i>마이페이지</a>
              </li>
              <li>회원정보수정</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- 상단 끝 -->


      <!-- 비로그인 상태일 때(비정상 접근) -->
      <c:if test="${m_number==null}">
        <div class="account-login section">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
              <form class="card login-form" method="get" id="login" action="jmLoginForm">
                <div class="card-body">
                  <div class="title">
                    <h3>로그인을 해주세요.</h3>
                    <p><c:if test="${msg!=null}">${msg}</c:if></p>
                  </div>
      
                  <div class="button">
                    <button class="btn" type="submit" form="login">로그아웃</button>
                  </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
          </c:if> 
        <!--닫기: c:if m_number != null -->
      
         <!-- 로그인 안되어있을때(즉 정상 접근 때) : member를 받아온 상태 -->
          <c:if test="${m_number!=null}">
          <div class="account-login section">
              <div class="container">
                  <div class="row">
                      <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                          <form class="register-form" action="jmUpdateMember" method="post" name="frm"
                          modelAttribute="member">
                              <div class="card-body">
                                  <div class="title">
                                      <h3>회원 정보 수정</h3>
                                      <c:if test="${update_msg!=null}">${update_msg}</c:if>
                                  </div>
                                  
      
                                  <div class="form-group input-group">
                                      <label for="reg-id">아이디</label>
                                      <p style="color:black;">${m_id}</p>
                                  </div>
      
                                  <div class="form-group input-group">
                                      <label for="reg-rank">회원 유형</label>
                                      <p style="color:black;">
                                          <c:if test="${member.common_mcd==10}">헬롱 회원</c:if>
                                          <c:if test="${member.common_mcd==20}">사장님</c:if>
                                          <c:if test="${member.common_mcd==30}">관리자</c:if>
                                      </p>
                                  </div>
      
                                  <div class="form-group input-group">
                                      <label for="reg-pass">비밀번호</label>
                                      <input type="button" class="btn btn-primary" onclick="resetPw()" value="비밀번호 변경" >   
                                  </div>
      
                  
                                  <!-- 이름-->
                            <div class="form-group input-group">
                                      <label for="reg-fn">이름</label>
                                      <input type="text"
                class="form-control" id="m_name" placeholder="이름 또는 닉네임"  name="m_name"
                autocomplete='off' required="required" value="${m_name}">
                                  </div>
      
                                  <div class="form-group input-group">
                                      <label for="age-select">나이</label>
                                      <select name="m_age"
                                id="m_age" value="${member.m_age}">
                        <option value="${member.m_age}">${member.m_age}</option>
                                <script>
                              for (i = 10; i < 100; i++) {
                            document.write("<option>" + [ i ] + "</option>");
                              }
                                </script>
                              </select>
                                  </div>
      
                                  <!-- 성별-->
                            <div class="form-group input-group">
                                      <label for="reg-gender">성별</label>
                                      <p style="color:black;">
                                          <c:if test="${member.m_gender=='F'}">여성</c:if>
                                          <c:if test="${member.m_gender=='M'}">남성</c:if> 
                                      </p>
                                  </div>
      
                                  <!-- 전화번호-->
                            <div class="form-group input-group">
                                      <label for="reg-phone">전화번호</label>
                                      <input type="text" value="${member.m_phone}"
                class="form-control" id="m_phone" placeholder="전화번호"  name="m_phone"
                oninput="addhyphen(),checkPhone(), activateUpdateBtn()"
                          autocomplete='off' required="required">
                                  </div>
      
                                  <!-- 이메일-->
                                  <div class="form-group input-group">
                                      <label for="reg-email" id="email_old">이메일</label>
                                      <p style="color:black;">${member.m_email}</p> 
                                      <pre>                                                       </pre>
                                      <input type="button" class="btn btn-primary" value="이메일 변경" 
                                      onclick="changeMail()"/>
                                  </div>
      
                                  <!-- 변경할 이메일-->
                            <div class="form-group input-group" id="email_change" style="display: none;">
                                      <label for="reg-email">변경할 이메일</label>
                                      <input type="text"
                class="form-control" id="m_email" placeholder="변경할 이메일을 입력해주세요"  name="m_email"
                oninput="checkMailReg()"
                          autocomplete='off'>
                          <button type="button" class="btn btn-primary" id="sendMailBtn" name="sendMailBtn" onclick="sendMailNumber()" style="margin-top: 10px;">인증번호 받기</button>
                                  </div>
      
                                  <!-- 인증번호 입력-->
                            <div class="form-group input-group" id="mail_check" name="mail_check" style="display: none">
                                      <label for="reg-email-check">인증번호 입력</label>
                                      <input type="text"
                class="form-control" id="input_mail_number" placeholder="이메일로 인증번호가 전송되었습니다."  name="input_mail_number"
                autocomplete='off'>
                          <button type="button" class="btn btn-primary" id="confirmMailBtn" name="confirmMailBtn" onclick="confirmMailNumber(), activateUpdateBtn()" style="margin-top: 10px;">인증</button>
                                  </div>
      
                                  <!-- 주소-->
                            <div class="form-group input-group" id="address_old" style="display: block;">
                                      <label for="reg-email-check" id="address_old_value">주소</label>
                                      <p style="color:black;">${member.m_address}</p> 
                                      <button type="button" class="btn btn-primary" onclick="changeAdress()" 
                                      style="margin-top: 10px; margin-bottom: 10px;">주소 변경</button>
                                  </div>
                            
                              <!-- 버튼 누를시 보여지는 변경 주소란 -->
                                  <div class="form-group input-group" id="address_change" style="display: none;">
                                      <label for="reg-email-check">변경할 주소</label>
      
                                      <input type="text"
                                      class="form-control" id="m_address" name="m_address" placeholder="변경할 주소"
                                      autocomplete='off' >
      
                                      <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="주소 찾기" style="margin-top: 10px; margin-bottom: 10px;">
                                     
                                      <input type="text"
                class="form-control" id="sample6_postcode" placeholder="우편번호"
                autocomplete='off'>
                                  </div> <!-- 주소 끝 -->
                                      
         
                                  <div class="button">
                                      <button class="btn" id="updatebtn" type="submit" 
                                      style="margin-bottom: 10px;">회원 정보 수정</button>
                                      <button class="btn" onclick="location.reload();" 
                                      style="margin-bottom: 10px; background-color: #8258FA">취소</button>
                                      <a href="/jmWithdrawalMemberForm" style="color: #A4A4A4;"
                                      >회원 탈퇴하기</a>
                                  </div>
                                  
                              </div> <!-- card-body -->
                          </form> <!-- form : register -->
                      </div>
                  </div>
              </div>
          </div>
          </c:if>
  </body>
</html>
