<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h1>Login</h1>
<form action="authenticate" method="post">
ID : <input type="text" name="member_id"><br />
<input type="submit" value="Login">
</form>
<% if(request.getAttribute("loginError") != null && (boolean) request.getAttribute("loginError")) { %>
<script>
    alert("계정이 틀렸습니다.");
    window.location.href = "login.jsp"; // 여기서 login.jsp로 리디렉션
</script>
<% } %>
</body>
</html>



