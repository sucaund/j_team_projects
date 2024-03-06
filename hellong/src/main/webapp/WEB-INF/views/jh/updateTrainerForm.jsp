<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 트레이너 추가 이력서</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    header {
        background-color: #333;
        color: #fff;
        padding: 20px;
        text-align: center;
    }
    h1 {
        margin: 0;
    }
    .container {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    form {
        display: flex;
        flex-direction: column;
    }
    label {
        margin-bottom: 8px;
        font-weight: bold;
    }
    .radio-container {
        display: flex;
        justify-content: space-between;
        margin-bottom: 16px;
    }
    .radio-container label {
        flex: 1;
    }
    input[type="text"],
    input[type="email"],
    textarea {
        padding: 8px;
        margin-bottom: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="date"] {
        padding: 8px;
        margin-bottom: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="submit"] {
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #555;
    }
</style>
</head>
<body>
    <header>
        <h1>헬스장 트레이너 추가</h1>
    </header>

    <div class="container">
        <form action="${pageContext.request.contextPath}/jh/saveTrainerForm" method="post" id="trainerForm">
            <input type="hidden" name="g_id" value="${g_id}" required>
            <label for="name">이름:</label>
            <input type="text" id="name" name="t_name" value="${t_name}" required>
            
            <div class="radio-container">
	            <label for="gender">성별:</label>
	            <label><input type="radio" name="t_gender" value="1" required> 남자</label>
	            <label><input type="radio" name="t_gender" value="2" required> 여자</label>
			</div>
			
			<label for="age">나이:</label>
            <input type="text" id="age" name="t_age"  value="${t_age}" required>
			
			<label for="phone">전화번호:</label>
            <input type="text" id="phone" name="t_tel" value="${t_tel}" required>
            
            <label for="email">이메일:</label>
            <input type="email" id="email" name="t_email" value="${t_email}" required>

            <label for="address">주소</label>
            <textarea id="experience" name="t_address" value="${t_address}" rows="4" required></textarea>

			<label for="regdate">고용날짜:</label>
            <input type="date" id="regdate" name="t_regdate" value="${t_regdate}"  required>

			<label for="sal">급여:</label>
            <input type="text" id="sal" name="t_sal" value="${t_sal}" required>

            <label for="certification">특이사항:</label>
            <textarea id="certification" name="t_matters" value="${t_matters}" rows="4" required></textarea>

            <input type="submit" value="등록">
        </form>
    </div>

</body>
</html>
