<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h1>Login</h1>
<form action="authenticate" method="post">
ID : <input type="text" name="member_id"><br />
PW : <input type="password" name="member_pw"><br />
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


=======
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="loginAction" method="post">
        사용자 이름: <input type="text" name="member_id"><br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
>>>>>>> a2eb340de3f281bcfb7bc5ae683c3561c9560d47
