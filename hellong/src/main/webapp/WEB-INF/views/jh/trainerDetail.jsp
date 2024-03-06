<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 트레이너 추가 이력서</title>
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
        <h1>헬스장 트레이너 등록 결과</h1>
    </header>

    <div class="container">
        <form>
        <c:forEach var="t" items="${trainer}">
            <label for="name">이름:</label>
            <input type="text" id="name" name="t_name" value="${t.t_name}" readonly>
            
			<div class="radio-container">
			    <label for="gender">성별:</label>
			    <label><input type="radio" name="t_gender" value="1" <c:if test="${t.t_gender == '1'}">checked</c:if> readonly> 남자</label>
			    <label><input type="radio" name="t_gender" value="2" <c:if test="${t.t_gender == '2'}">checked</c:if> readonly> 여자</label>
			</div>
            
            <label for="age">나이:</label>
            <input type="text" id="age" name="t_age" value="${t.t_age}" readonly>
            
            <label for="phone">전화번호:</label>
            <input type="text" id="phone" name="t_tel" value="${t.t_tel}" readonly>
            
            <label for="email">이메일:</label>
            <input type="email" id="email" name="t_email" value="${t.t_email}" readonly>

            <label for="address">주소</label>
            <textarea id="experience" name="t_address" rows="4" readonly>${t.t_address}</textarea>

            <label for="regdate">고용날짜:</label>
            <input type="text" id="regdate" name="t_regdate" value="${t.t_regdate}" readonly>

            <label for="sal">급여:</label>
            <input type="text" id="sal" name="t_sal" value="${t.t_sal}" readonly>

            <label for="certification">특이사항:</label>
            <textarea id="certification" name="t_matters" rows="4" readonly>${t.t_matters}</textarea>
		</c:forEach>
        </form>
    </div>
</body>
</html>
