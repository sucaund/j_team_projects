<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <a href="hsListNoticeBoard?m_number=${m_number }">공지사항 목록</a><p>
   <a href="hsCreateFormNoticeBoard?m_number=${m_number }">공지사항 글 작성 폼 </a><p>
   <a href="hsListPoint?m_number=${m_number }">포인트 내역 </a><p>
   <a href="hsChargeFormPoint?m_number=${m_number }">포인트 충전 </a><p>
   <a href="hsDetailUsingGym?m_number=${m_number }">헬스장 이용내역 </a><p>
   <a href="hsRefundFormUsingGym?m_number=${m_number }">환불 </a><p>

</body>
</html>