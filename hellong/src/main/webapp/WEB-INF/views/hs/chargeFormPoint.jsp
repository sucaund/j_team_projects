<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/windicss@3.0.14/css/windicss.min.css">
    
<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->

<script type="text/javascript">

   var IMP = window.IMP; // 생략 가능
   IMP.init("imp08244126"); // 예: imp00000000a
   
</script>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
       
        // 입력 칸에 포커스를 받았을 때 입력 안내 문구를 숨김
        $("#chargeAmountInput").focus(function() {
            $(this).attr('placeholder', '');
        });

        // 입력 칸에서 포커스가 벗어났을 때, 입력 안내 문구가 비어있으면 다시 표시
        $("#chargeAmountInput").blur(function() {
            if ($(this).val() === '') {
                $(this).attr('placeholder', '충전 금액을 입력해주세요');
            }
        });
        
        // 버튼 클릭 시 해당 버튼의 값이 입력 칸에 입력되도록 설정
        $(".charge-btn").click(function() {
            var chargeAmount = $(this).val(); // 버튼의 값 가져오기
            $("#chargeAmountInput").val(chargeAmount); // 입력 칸에 값 설정
        });
        
         // 결제 버튼 클릭 시
        $("#kakaopayBtn").click(function() {
            var charge_point = $("#chargeAmountInput").val(); // 입력 칸의 값 가져오기

            if (charge_point === '') {
                // 충전 금액이 비어 있을 때 알림 창 표시
                alert("충전 금액을 입력해주세요.");
                return; // 함수 종료
            }

            var m_number = ${memberData.m_number};
            
            $.ajax({
                type: "GET",
                url: "hsChargePoint", // 컨트롤러의 URL
                data: { m_number: m_number, 
                      charge_point: charge_point }, // 전송할 데이터
                success: function(response) {
                    // 성공 시 처리
          
                    var memberData = response.memberData;
                    var charge_point = response.charge_point;
                    
                    IMP.request_pay({
                        pg: "kakaopay",
                        pay_method: "card",
                        merchant_uid: "merchant_uid"+new Date().getTime(),
                        //merchant_uid: "merchant_uid"+new Date().getTime()+"-"+pointChargeData.charge_number;,
                        name: "헬롱 포인트 충전",
                        amount: charge_point, // 충전 금액 설정
                        buyer_email: memberData.m_email,
                        buyer_number : memberData.m_number,
                        buyer_name: memberData.m_name,
                        buyer_tel: memberData.m_phone,
                        buyer_addr: memberData.m_address,
                        
                    }, function(rsp) {
                       
                       if (rsp.success) {

                            console.log("결제성공1");

                            $.ajax({
                                        type: "GET",
                                        url: "hsInsertChargePoint", // 컨트롤러의 URL
                                        data: { m_number: m_number, 
                                              charge_point: charge_point,
                                              merchant_uid: rsp.merchant_uid,
                                                pg: "kakaopay"}, // 전송할 데이터
                                        success: function(response) {

                                            console.log("결제 성공22");
                                            alert("결제가 완료되었습니다.");
                                            
                                            window.location.href = "/Default";
                                            /*if (response.success) {
                                                // 결제 성공 시 비즈니스 로직 실행
                                                console.log("결제 성공2");
                                                window.location.href = "hsMemberIndex?m_number=" + m_number;
                                            } else {
                                                // 결제 실패 시 처리
                                                console.log("결제 실패");
                                            }*/
                                        },
                                        error: function(jqXHR, textStatus, errorThrown) {
                                            // 실패 시 처리
                                            console.log("충전 실패B ");
                                            console.log(m_number);
                                            console.log(charge_point);
                                            console.log(rsp.merchant_uid);

                                            // 여기에 필요한 처리를 추가하세요.
                                        }
                                    });
    
                        }
                       
                         else {
                            console.log(rsp);
                        }
                    });
                    
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // 실패 시 처리
                    console.log("충전 실패 " + charge_point);
                    // 여기에 필요한 처리를 추가하세요.
                }
            });
        }); 

        // 결제 버튼 클릭 시
        $("#creditpayBtn").click(function() {
            var charge_point = $("#chargeAmountInput").val(); // 입력 칸의 값 가져오기
            var m_number = ${memberData.m_number};
            
            $.ajax({
                type: "GET",
                url: "hsChargePoint", // 컨트롤러의 URL
                data: { m_number: m_number, 
                      charge_point: charge_point }, // 전송할 데이터
                success: function(response) {
                    // 성공 시 처리
          
                    var memberData = response.memberData;
                    var charge_point = response.charge_point;
                    
                    IMP.request_pay({
                        pg: "html5_inicis",
                        pay_method: "card",
                        merchant_uid: "merchant_uid"+new Date().getTime(),
                        //merchant_uid: "merchant_uid"+new Date().getTime()+"-"+pointChargeData.charge_number;,
                        name: "헬롱 포인트 충전",
                        amount: charge_point, // 충전 금액 설정
                        buyer_email: memberData.m_email,
                        buyer_number : memberData.m_number,
                        buyer_name: memberData.m_name,
                        buyer_tel: memberData.m_phone,
                        buyer_addr: memberData.m_address,
                        
                    }, function(rsp) {
                       
                       if (rsp.success) {

                            console.log("결제성공1");

                            $.ajax({
                                        type: "GET",
                                        url: "hsInsertChargePoint", // 컨트롤러의 URL
                                        data: { m_number: m_number, 
                                              charge_point: charge_point,
                                              merchant_uid: rsp.merchant_uid,
                                                pg: "카드결제"}, // 전송할 데이터
                                        success: function(response) {

                                            console.log("결제 성공22");
                                            alert("결제가 완료되었습니다.");
                                            window.location.href = "/Default";
                                            /*if (response.success) {
                                                // 결제 성공 시 비즈니스 로직 실행
                                                console.log("결제 성공2");
                                                window.location.href = "hsMemberIndex?m_number=" + m_number;
                                            } else {
                                                // 결제 실패 시 처리
                                                console.log("결제 실패");
                                            }*/
                                        },
                                        error: function(jqXHR, textStatus, errorThrown) {
                                            // 실패 시 처리
                                            console.log("충전 실패B ");
                                            console.log(m_number);
                                            console.log(charge_point);
                                            console.log(rsp.merchant_uid);

                                            // 여기에 필요한 처리를 추가하세요.
                                        }
                                    });
    
                        }
                       
                         else {
                            console.log(rsp);
                        }
                    });
                    
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // 실패 시 처리
                    console.log("충전 실패 " + charge_point);
                    // 여기에 필요한 처리를 추가하세요.
                }
            });
        }); 
        
    });
</script>
</head>
<body>
   <!-- 상단 시작 -->
    <div class="breadcrumbs">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="breadcrumbs-content">
                <h1 class="page-title">충전</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li>
                  <a href="hsListUsePoint?m_number=${m_number }"><i class="lni lni-home"></i>포인트 관리</a>
                </li>
                <li>환불</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- 상단 끝 -->
    
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
          </div>
          </c:if> 
    
          <c:if test="${m_number!=null}">
        <div class="account-login section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                        <div class="register-form" style="width: 570px;"> 
                            <div class="card-body">
                                <div class="title" style="width: 570px;">
                                    <h3><i class="fa-solid fa-coins" style="color: #FFD700;"></i> 충전하기</h3>
                                    <br>
                                    충전 금액 <a style="color: black;"> &nbsp;
                                        <input type="text" id="chargeAmountInput" name="chargeAmount" placeholder="금액을 입력해주세요">
                                                </a><br><br>
                                    <button type="submit" id="paymentBtn" class="btn btn-primary charge-btn" value="10000">1만원</button>
                                    <button type="submit" id="paymentBtn" class="btn btn-primary charge-btn" value="30000">3만원</button>
                                    <button type="submit" id="paymentBtn" class="btn btn-primary charge-btn" value="100000">10만원</button>
                                    <button type="submit" id="paymentBtn" class="btn btn-primary charge-btn" value="300000">30만원</button>
                                    <button type="submit" id="paymentBtn" class="btn btn-primary charge-btn" value="500000">50만원</button>
                                    <button type="submit" id="paymentBtn" class="btn btn-primary charge-btn" value="1000000">100만원</button>
                                    
                                    <br><br>
                                     <button id="creditpayBtn" class="btn btn-primary" type="submit"
                                     style="background-color:#8258FA; border-color: #8258FA;">카드결제</button>
                                      <button id="kakaopayBtn" class="btn btn-primary" type="submit" 
                                      style="background-color: yellow; border-color: yellow;"> <a style="color: black;">카카오페이</a></button>
                        
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