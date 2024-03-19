<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

            $.ajax({
                type: "GET", // 요청 방식
                url: "hsBuyGymMembership", // 결제 처리를 담당하는 엔드포인트 URL
                data: {	m_number: m_number,
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

		<button id="paymentBtn" type="submit">구매</button>

</body>
</html>