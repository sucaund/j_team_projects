<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function confirmDelete(b_number, m_number) {
	    if (confirm('삭제하시겠습니까?')) {
	        // 확인을 눌렀을 때의 동작을 수행합니다.
	        window.location.href = "hsDeleteNoticeBoard?b_number="+b_number+"&m_number="+m_number;
	    } else {
	        // 취소를 눌렀을 때의 동작을 수행합니다. (옵션)
	    }
	}
</script>
</head>
<body>
	<div style="padding: 5%;">
	<h3>공지사항</h3> 
	<hr />
	<span style="font-size: 20px;">${noticeBoard.b_title}</span>
		<p style="font-size: 11px;">수정일: ${noticeBoard.b_update}</p>
			<p style="text-align: right; font-size: 12px;" id="recommCount">조회: ${noticeBoard.b_readcount}</p>
	<hr />
		<p>${noticeBoard.b_content}</p>
	<hr />
		
		<div style="text-align:center">
			<c:if test="${member.common_mcd == 30}">
			    <button type="button" class="btn btn-outline-secondary" 
			            onclick="location.href='hsUpdateFormNoticeBoard?b_number=${noticeBoard.b_number}&m_number=${member.m_number}'">수정</button>
			    <button type="button" class="btn btn-outline-secondary" 
			            onclick="confirmDelete(${noticeBoard.b_number},${member.m_number})">삭제</button>
			</c:if>
			    <button type="button" class="btn btn-outline-secondary" 
			            onclick="location.href='hsListNoticeBoard?m_number=${member.m_number}'">목록</button>
			</div>
		</div>

</body>
</html>