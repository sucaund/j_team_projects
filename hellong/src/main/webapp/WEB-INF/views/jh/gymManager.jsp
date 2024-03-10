<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f5f5f5;
}

.dashboard-container {
    max-width: 1200px; /* 두 개의 dashboard가 나란히 배치되도록 충분한 공간을 확보 */
    margin: 0 auto;
}

.dashboard {
    width: calc(50% - 20px); /* 가로로 2개씩 배치하므로 너비는 50%로 설정 */
    float: left; /* 왼쪽으로 부유시킴 */
    margin-right: 20px; /* 오른쪽 여백 추가 */
    margin-bottom: 20px; /* 아래쪽 여백 추가 */
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

h1, h2 {
    color: #333;
    text-align: center;
}

.menu {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.menu-item {
    background-color: #007bff;
    color: #ffffff;
    padding: 10px 15px;
    text-decoration: none;
    text-align: center;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.menu-item:hover {
    background-color: #0056b3;
}

</style>
<!-- <link rel="stylesheet" href="css/gymManager.css" type="text/css"> -->


</head>
<body>

    <h2>보유하고 있는 헬스장</h2>

    <div class="dashboard-container">
        <c:forEach var="gym" items="${ManageList}">
            <div class="dashboard">
                <h1>${gym.g_name}</h1>
                <div class="menu">
                    <a href="createGymForm?g_id=${gym.g_id}" class="menu-item">헬스장 글 등록/수정</a>
                    <a href="gymPostDetail?g_id=${gym.g_id}" class="menu-item">홍보 글 이동</a>
                    <a href="serviceList?g_id=${gym.g_id}" class="menu-item">서비스 관리</a>
                    <a href="gymMemberListDetail?g_id=${gym.g_id}" class="menu-item">회원 관리</a>
                    <a href="trainerList?g_id=${gym.g_id}" class="menu-item">트레이너 관리</a>
                </div>
            </div>
        </c:forEach>
    </div>
    
    <input type="button" value="목록" onclick="location.href='confirmedGymMember'">

</body>
</html>
