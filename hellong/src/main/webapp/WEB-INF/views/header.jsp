<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="css/board.css" rel="stylesheet" type="text/css">

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
        여기까지 헤더
    </div>
   </body>
</html>
