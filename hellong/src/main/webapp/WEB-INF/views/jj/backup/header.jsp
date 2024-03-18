<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="css/board.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <title>My Website</title>
</head>
<body>
<div id="header">
  
        <% if (session.getAttribute("m_name") != null) { %>
            
            <p>Welcome, ${sessionScope.m_name}</p>
            <form action="jmLogOut" method="post">
                <input type="submit" value="Logout">
            </form>
        <% } else { %>
            <a href="jmLoginForm">Login</a>
        <% } %>
        <br>
        여기까지 헤더-----
    </div>
   </body>
</html>
