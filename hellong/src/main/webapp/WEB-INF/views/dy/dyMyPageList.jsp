<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 게시글 조회</title>
<style>
        body {
            font-family: Arial, sans-serif;
        }
        .board-table {
            width: 100%;
            border-collapse: collapse;
        }
        .board-table th, .board-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .board-table th {
            background-color: #f2f2f2;
        }
        .board-table tr:nth-child(even) {background-color: #f9f9f9;}
        .board-table tr:hover {background-color: #ddd;}
    </style>
</head>
<body>
<h2>My Page Board List</h2>

<table class="board-table">
    <thead>
    <tr>
        <th>Title</th>
        <th>Content</th>
        <th>Read Count</th>
        <th>Creation Date</th>
        <th>Update Date</th>
        <th>Recommendations</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="board" items="${myPageBoardList}">
        <tr>
            <td><a href="dySelectBodyProfile?b_number=${board.b_number}">${board.b_title}</a></td>
            <td>${board.b_content}</td>
            <td>${board.b_readcount}</td>
            <td>${board.b_regdate}</td>
            <td>${board.b_update}</td>
            <td>${board.b_recomm_count}</td>
  
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>