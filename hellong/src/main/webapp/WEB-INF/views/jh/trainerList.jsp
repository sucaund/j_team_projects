<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>헬스장 트레이너 리스트</title>
    <style>
        body {
            text-align: center;
        }

        .container {
            width: 80%;
            margin: 0 auto;
        }

        .button-container {
            text-align: right;
            margin-bottom: 10px;
        }

        .button-container button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none; 
            display: inline-block; 
        }

        .button-container button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>헬스장 트레이너 리스트</h2>
    
    <!-- 트레이너 추가 버튼 -->
    <div class="button-container">
            <a href="trainerCreate?g_id=${gym}">
                <button>트레이너 추가</button>
            </a> 
    </div>
    
    <!-- 트레이너 리스트 테이블 -->
    <table>
        <thead>
            <tr>
                <th>등록번호</th>
                <th>이름</th>
                <th>나이</th>
                <th>전화번호</th>
                <th>이메일</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="num" value="${page.total - page.start + 1}"></c:set>
            <c:forEach var="trainer" items="${trainerList}">
                <tr>
                    <td>${num}</td>
                    <td>${trainer.t_name}</td>
                    <td>${trainer.t_age}</td>
                    <td>${trainer.t_tel}</td>
                    <td>${trainer.t_email}</td>
                    <c:set var="num" value="${num - 1}"></c:set>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
	<!-- 페이지 네비게이션 -->
	<c:if test="${page.currentPage > page.pageBlock}">
	    <a href="trainerList?g_id=${gym}&currentPage=${page.currentPage - page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
	    <c:choose>
	        <c:when test="${page.currentPage == i}">
	            <strong>[${i}]</strong>
	        </c:when>
	        <c:otherwise>
	            <a href="trainerList?g_id=${gym}&currentPage=${i}">[${i}]</a>
	        </c:otherwise>
	    </c:choose>
	</c:forEach>
	<c:if test="${page.endPage < page.totalPage}">
	    <a href="trainerList?g_id=${gym}&currentPage=${page.endPage + 1}">[다음]</a>
	</c:if>
</div>
</body>
</html>
