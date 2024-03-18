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
    
    var currentPoint = parseInt("${memberData.m_currpoint}");
    var plannedPoint = parseInt("${gsDetailData.sd_price}");
    if (plannedPoint > currentPoint) {
        // 사용 예정 포인트가 현재 포인트를 초과하는 경우, 결제 버튼 비활성화
        $("#paymentBtn").prop("disabled", true);
        $("#error-message").text("사용 예정 포인트가 현재 포인트를 초과합니다."); // 오류 메시지 표시
    }
});

</script>
</head>
<body>
	<h1> GymOrder 값을 넘겨줄 결제창 </h1>
	<form action="hsBuyGymMembership?m_number=${memberData.m_number }&
									g_id=${gsDetailData.g_id}&
									s_number=${gsDetailData.s_number}&
									sd_number=${gsDetailData.sd_number}&
									s_period=${gsDetailData.s_period}&
									sd_price=${gsDetailData.sd_price}" method="post">
		<tr><td>회원이름: ${memberData.m_name }</td></tr>
		<tr><td>현재 포인트: ${memberData.m_currpoint }</td></tr>
		<tr><td>구매예정 회원권: ${gsDetailData.g_name }  ${gsDetailData.s_name }</td></tr>
		<tr><td>사용예정 포인트: ${gsDetailData.sd_price }</td></tr>
 		<div></div><input id="paymentBtn" type="submit" value="결제하기"></div>
 		<div id="error-message"></div>
	</form>
</body>
</html>