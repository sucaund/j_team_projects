<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $("#paymentBtn").click(function() {
         var m_number = ${memberData.m_number };
         var g_id = ${gsDetailData.g_id};
         var s_number = ${gsDetailData.s_number};
         var sd_number = ${gsDetailData.sd_number};
         var sd_price = ${gsDetailData.sd_price};
         
         if (${memberData.m_currpoint } < sd_price) {
                $("#paymentBtn").prop("disabled", true); // 결제 버튼 비활성화
                $("#insufficientMessage").text("잔액이 부족합니다. 구매를 진행할 수 없습니다."); // 잔액 부족 메시지 표시
                return; // 결제 진행 중지
            }

            $.ajax({
                type: "GET", // 요청 방식
                url: "hsBuyGymMembership", // 결제 처리를 담당하는 엔드포인트 URL
                data: {   m_number: m_number,
                  g_id: g_id,
                  s_number: s_number,
                  sd_number: sd_number,
                  sd_price: sd_price
            }, // 폼의 데이터를 직렬화하여 전송
                success: function(response) {
                    alert("결제가 성공적으로 완료되었습니다!");
               window.location.href = "hsMemberIndex?m_number=" + m_number;
                },
                error: function(jqXHR, textStatus, errorThrown) {

                    alert("결제에 실패했습니다. 다시 시도해주세요.");
                }
            });
        }); 
    });
</script>
</head>
<body>
   <h1> GymOrder 값을 넘겨줄 결제창 </h1>

      <div>회원이름: ${memberData.m_name }</div>
      <div>현재 포인트: ${memberData.m_currpoint }</div>
      <div>구매예정 회원권: ${gsDetailData.g_name }  ${gsDetailData.s_name }</div>
      <div id="insufficientMessage" style="color: red;"></div>
      <button id="paymentBtn" type="submit">구매</button>


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
            <button class="btn" type="submit" form="logout">로그인</button>
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
              <form class="card login-form" method="post"action="jmWithdrawalMemberPwCheckForm">
              <div class="card-body" >
                <div class="title" sytle="margin:0 auto;">
                  <h3>탈퇴하시겠습니까?</h3>
                  이 선택은 되돌릴 수 없습니다.
                </div>
      
                <div class="button">
                  <a class="btn" href="/jmUpdateMemberForm">아니오, 탈퇴하지 않겠습니다</a>
                  <button class="btn" type="submit" style="background-color: red;
                  margin-top: 10px;">
                      네, 탈퇴하겠습니다</button>
                </div>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      </c:if> 

</body>
</html>