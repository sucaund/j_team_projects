<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="js/updateMember.js"></script>
  </head>
  <body>
    <!-- 로그인/비로그인 막는건 컨트롤러에서 -->
    <c:if test="${msg!=null}">${msg}</c:if>
    <h2>회원정보 수정</h2>
    <!-- controller에서 특정 member만 가져온 상태 -->
    회원명 : ${m_name}
    <form action="jmUpdateMember" method="post" modelAttribute="member">
      <table>
        <tr>
          <th>아이디</th>
          <td>${m_id}</td>
        </tr>
        <tr>
          <th>회원유형</th>
          <td>
            <c:if test="${member.common_mcd==10}">헬롱 회원</c:if>
            <c:if test="${member.common_mcd==20}">사장님</c:if>
            <c:if test="${member.common_mcd==30}">관리자</c:if>
          </td>
        </tr>

        <tr>
          <th>비밀번호</th>
          <td>
            <input type="button" value="비밀번호 변경" onclick="resetPw()" />
          </td>
        </tr>

        <tr>
          <th>이름(닉네임)</th>
          <td>
            <input
              type="text"
              id="m_name"
              name="m_name"
              required="required"
              value="${member.m_name}"
            />
          </td>
        </tr>
        <tr>
          <th>나이</th>
          <td>
            <select name="m_age" id="m_age" value="${member.m_age}">
              <script>
                for (i = 10; i < 100; i++) {
                  document.write("<option>" + [i] + "</option>");
                }
              </script>
            </select>
          </td>
        </tr>

        <tr>
          <th>성별</th>
          <td>
            <c:if test="${member.m_gender=='F'}">여성</c:if>
            <c:if test="${member.m_gender=='M'}">남성</c:if>
          </td>
        </tr>

        <tr>
          <th>전화번호</th>
          <td>
            <input
              type="text"
              class="form-control"
              id="m_phone"
              name="m_phone"
              placeholder="전화번호"
              value="${member.m_phone}"
              oninput="addhyphen(),checkPhone(),activateUpdateBtn()"
              autocomplete="off"
            />
			   <!-- , activateUpdateBtn() -->
          </td>
        </tr>

        <tr>
          <th class="email_old">이메일</th>
          <td>
            ${member.m_email}
            <input type="button" value="이메일 변경" onclick="changeMail()" />
          </td>
        </tr>

        <tr class="email_change" style="display: none">
          <th>변경할 이메일</th>
          <td>
            <input
              type="text"
              class="form-control"
              id="m_email"
              placeholder="변경할 이메일을 입력해주세요"
              name="m_email"
              oninput="checkMailReg()"
              autocomplete="off"
            />
            <button
              type="button"
              id="sendMailBtn"
              name="sendMailBtn"
              onclick="sendMailNumber()"
            >
              인증번호 받기
            </button>
          </td>
        </tr>

        <tr class="mail_check" style="display: none">
          <th>인증번호 입력</th>
          <td>
            <input
              type="text"
              name="input_mail_number"
              id="input_mail_number"
              style="width: 250px; margin-top: -10px"
              placeholder="인증번호 입력"
            />
            <button
              type="button"
              name="confirmMailBtn"
              id="confirmMailBtn"
              onclick="confirmMailNumber(),activateUpdateBtn()"
            >
						  <!-- , activateUpdateBtn() -->
              인증
            </button>
          </td>
        </tr>

        <tr class="address_old" style="display: block">
          <th id="address_old_value">주소</th>
          <td>
            ${member.m_address}
            <input type="button" value="주소 변경" onclick="changeAdress()" />
          </td>
        </tr>

        <tr class="address_change" style="display: none">
          <th></th>
          <td>
            <input type="text" id="sample6_postcode" placeholder="우편번호" />
            <input
              type="button"
              onclick="sample6_execDaumPostcode()"
              value="우편번호 찾기"
            />
          </td>
        </tr>

        <tr class="address_change" style="display: none">
          <th></th>
          <td>
            <input
              type="text"
              id="m_address"
              name="m_address"
              placeholder="주소"
            />
          </td>
        </tr>

        <tr class="address_change" style="display: none">
          <th></th>
          <td>
            <input
              type="text"
              id="sample6_detailAddress"
              placeholder="상세주소"
            />
            <input
              type="text"
              id="sample6_extraAddress"
              placeholder="참고항목"
            />
          </td>
        </tr>
      </table>

      <a href="/jmWithdrawalMemberForm">회원 탈퇴</a> <br />

      <input type="button" value="취소" onclick="location.reload();" />

      <button
        type="submit"
        class="btn btn-secondary"
        style="padding: 2% 0 2%"
        id="updatebtn"
      >
        완료
      </button>
    </form>
  </body>
</html>
