<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (!frm.m_id.value) {
			alert("아이디를 입력한 후에 확인하세요");
			frm.m_id.focus();
			return false;
		} else
			location.href = "confirm?m_id=" + frm.m_id.value;

	}
</script>
</head>
<body>
	<h2>회원가입</h2>
	<c:if test="${msg!=null}">${msg}</c:if>
	<form:form action="jmSignUp" method="post" name="frm"
		modelAttribute="member">
		<table>
			<tr>
				<th>멤버번호 m_number(시퀀스)</th>
				<td></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="m_id" required="required"
					maxlength="10" value="${m_id}"> <input type="button"
					value="중복확인" onclick="chk()"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="m_pw" required="required">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="m_name" required="required"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="m_age" required="required"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="string" name="m_gender" required="required"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="string" name="m_phone" required="required"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="string" name="m_email" required="required"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="string" name="m_address" required="required"></td>
			</tr>
			<tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>

		</table>
	</form:form>
</body>
</html>