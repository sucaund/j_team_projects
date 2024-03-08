<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더</title>
    <style>
        /* CSS 스타일링 */
        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        form {
            display: inline-block;
            margin-right: 20px;
        }

        input[type="text"] {
            padding: 8px;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 8px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <header>
        <h1>통합 검색</h1>
        <form action="dyTotalSearch" method="get">
            <input type="text" name="query" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </header>
</body>
</html>

