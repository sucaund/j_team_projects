<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	function chk() {
		alert('chk Start...');
		if (!frm.b_number.value) {
			alert("사번을 입력한 후에 확인하세요");
			frm.b_number.focus();
			return false;
		} else location.href="confirm?empno="+frm.empno.value;
	}

</script> -->
</head>
<body>
	<h2>공지사항 작성</h2>
	 <c:if test="${msg!=null}">${msg}</c:if>
	 <form action="hsCreateNoticeBoard" method="post" name="frm">
	   
	   <table>
			<tr><th>제목</th><td><input type="text" name="b_title" required="required"></td></tr>
			<tr><th>멤버아이디</th><td>${member.m_name }</td></tr>
			<input type="hidden" name="m_number" value="${member.m_number}">
			<tr><th>첨부파일</th><td>미적용</td></tr>
			<tr><th>내용</th><td><input type="text" name="b_content" required="required"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="location.href='hsListNoticeBoard?m_number=${m_number}'"></td></tr> 
				 
	   </table>
	 </form>
	
</body>
</html>