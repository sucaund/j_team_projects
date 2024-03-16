<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> GymOrder 값을 넘겨줄 결제창 </h1>
	<form action="hsBuyGymMembership?m_number=${memberData.m_number }$
									g_id=${gsDetailData.g_id}$
									s_number=${gsDetailData.s_number}$
									sd_number=${gsDetailData.sd_number}$" method="post">
		<tr><td>회원이름: ${memberData.m_name }</td></tr>
		<tr><td>현재 포인트: ${memberData.m_currpoint }</td></tr>
		<tr><td>구매예정 회원권: ${gsDetailData.g_name }  ${gsDetailData.s_name }</td></tr>
		
		<input type="submit" value="결제하기">
	</form>
</body>
</html>