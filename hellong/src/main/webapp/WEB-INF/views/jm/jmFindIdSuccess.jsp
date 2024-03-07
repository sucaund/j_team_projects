<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript" src="js/findId.js"></script>
</head>
<body>
아이디 찾기
 <c:if test="${m_number!=null}">
<p>로그아웃을 먼저 해주세요</p>

 </c:if>
  <c:if test="${m_number==null}">
<br>
${MailAtFindId} 이메일 계정으로 가입된 계정은 <br>
${getIdFromMail} 입니다. <br>

<br>

</c:if>
</body>
</html>