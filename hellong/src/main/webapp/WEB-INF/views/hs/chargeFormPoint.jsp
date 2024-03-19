<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
                                            window.location.href = "hsMemberIndex?m_number=" + m_number;
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
                                            window.location.href = "hsMemberIndex?m_number=" + m_number;
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
	<h1>충전페이지 api사용 예정</h1>

    <input type="text" id="chargeAmountInput" name="chargeAmount" placeholder="충전 금액을 입력해주세요">
    <br><br>
    <!-- 버튼을 클릭하면 해당 버튼의 값이 입력 칸에 입력됩니다. -->
    <button class="charge-btn" value="10000">1만원</button>
    <button class="charge-btn" value="50000">5만원</button>
    <button class="charge-btn" value="100000">10만원</button>
    <button class="charge-btn" value="300000">30만원</button>
    <button class="charge-btn" value="500000">50만원</button>
    <button class="charge-btn" value="1000000">100만원</button>
    <br><br>
    <button id="creditpayBtn" type="submit">카드결제</button>
    <button id="kakaopayBtn" type="submit">카카오페이</button>

</body> 
</html>