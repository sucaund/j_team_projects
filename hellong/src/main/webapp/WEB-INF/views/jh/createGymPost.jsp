<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>헬스장 홍보 등록 폼</title>
 <style type="text/css">
body {
font-family: Arial, sans-serif;
margin: 0;
padding: 0;
background-color: #f5f5f5;
}

.container {
    max-width: 700px; /* 수정: 폼의 최대 너비를 더 넓게 조정 */
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: bold;
    display: block;
}


.remove-file {
    cursor: pointer;
    color: black;
}

.preview-image {
    max-width: 150px; /* 최대 너비 설정 */
    max-height: 150px; /* 최대 높이 설정 */
    margin-right: 10px; /* 이미지 간격 설정 */
}

.close-button {
    background-color: white;
    border: none;
    color: red;
    font-weight: bold;
    font-size: 16px;
    cursor: pointer;
    padding: 0;
}


input[type="text"],
input[type="tel"],
input[type="url"],
textarea,
input[type="file"] {
    width: calc(100% - 22px); /* 수정: 입력 필드의 너비를 조금 더 좁게 조정 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

button {
    flex: 1;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button[type="submit"] {
    background-color: #007bff;
    color: #fff;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}

button[type="button"] {
    background-color: #ccc;
    margin-right: 10px;
}

button[type="button"]:hover {
    background-color: #bbb;
}
 </style>
</head>
<body>

<div class="container">
    <h1>헬스장 홍보 등록</h1>
    <c:if test="${msg!=null}">${msg}</c:if>
   <c:forEach var="gym" items="${gymDetail}">
        <form id="gymForm" action="${pageContext.request.contextPath}/jh/saveGymForm" method="post" enctype="multipart/form-data">
            <input type="hidden" name="g_id" value="${gym.g_id}">
            <input type="hidden" name="m_number" value="${gym.m_number}">
            <div class="form-group">
                <label>헬스장 이름</label>
                <input type="text" class="form-control" name="g_name" value="${gym.g_name}" readonly>
            </div>
            <div class="form-group">
                <label>제목</label>
                <textarea class="form-control" name="gb_title" required></textarea>
            </div>
            <div class="form-group">
                <label>헬스장 기본소개</label>
                <textarea class="form-control" name="gb_ment" rows="30" required></textarea>
            </div>
            <div class="form-group">
                <label>위치</label>
                <input type="text" class="form-control" name="g_address" value="${gym.g_address}" readonly>
            </div>
            <div class="form-group">
                <label>연락처</label>
                <input type="text" class="form-control" name="g_tel" value="${gym.g_tel}" readonly>
            </div>
            <div class="form-group">
                <label>운동기구</label>
                <textarea class="form-control" name="gb_machine" rows="10"></textarea>
            </div>
            <div class="form-group">
                <label>편의시설</label>
                <textarea class="form-control" name="gb_amen" rows="5"></textarea>
            </div>
            <div class="form-group">
                <label>운영시간</label>
                <textarea class="form-control" name="gb_time" rows="5"></textarea>
            </div>
            
			<div class="form-group">
			    <label>사진 첨부</label>
			    <input type="file" class="form-control-file" id="gymBoardFile" name="gymBoardFile" multiple onchange="previewImages(event)">
			    <div id="filePreview" class="mt-2"></div>
			</div>

            
            
            <div class="form-group">
                <label>동영상 URL</label>
                <textarea class="form-control" name="gb_video"></textarea>
            </div>
            <div class="form-group">
                <label>작성날짜</label>
                <input type="text" class="form-control" name="gb_regdate" readonly>
            </div>
            <div class="button-group">
                <button type="submit" class="btn btn-primary" onclick="handleFormSubmission()">등록</button>
                <button type="button" class="btn btn-secondary" onclick="window.history.back()">취소</button>
            </div>
        </form>
    </c:forEach>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<script>

	function previewImages(event) {
	    var fileList = event.target.files; // 파일 목록 가져오기
	    var preview = document.getElementById('filePreview'); // 미리보기 요소 가져오기
	    preview.innerHTML = ''; // 미리보기 요소 초기화
	
	    for (var i = 0; i < fileList.length; i++) {
	        var file = fileList[i];
	        var reader = new FileReader(); // 파일 리더 생성
	
	        // 파일 읽기 완료 시 호출되는 콜백 함수
	        reader.onload = function (event) {
	            var image = document.createElement('img'); // 이미지 요소 생성
	            image.setAttribute('src', event.target.result); // 이미지 소스 설정
	            image.setAttribute('class', 'preview-image'); // 이미지 클래스 설정
	
	            // X 버튼 생성
	            var closeButton = document.createElement('button');
	            closeButton.innerHTML = 'x';
	            closeButton.setAttribute('class', 'close-button');
	            closeButton.setAttribute('onclick', 'removeImage(this)');
	            
	            // 이미지와 X 버튼을 미리보기 요소에 추가
	            preview.appendChild(image);
	            preview.appendChild(closeButton);
	        };
	
	        reader.readAsDataURL(file); // 파일 읽기 시작
	    }
	}
	
	// 이미지 제거 함수
	function removeImage(button) {
	    var image = button.previousSibling; // X 버튼의 이전 형제 요소(이미지) 가져오기
	    image.remove(); // 이미지 제거
	    button.remove(); // X 버튼 제거
	}


    function validateForm() {
        var inputs = document.querySelectorAll('textarea, input[type="file"]');
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].required && !inputs[i].value) {
                alert("모든 필수 항목을 입력하세요.");
                return false;
            }
        }
        return true;
    } 
    
	// 등록 성공시 알림창을 띄우고 페이지를 이동하는 함수
    function showSuccessMessageAndRedirect() {
        alert("등록이 완료되었습니다.");
        // 수정 후에 페이지 이동을 원한다면 주석 해제
        // window.location.href = "${pageContext.request.contextPath}/jh/gymManager"; // 이동할 페이지의 URL
    }

    // 폼 제출 후에 알림을 표시하고 페이지 이동하는 함수
    function handleFormSubmission() {
        if (validateForm()) {
            showSuccessMessageAndRedirect();         
        }
    } 
    
    // 현재 날짜를 가져와서 작성날짜 필드에 입력하는 함수
	function setTodayDate() {
	    var today = new Date();
	    document.querySelector('input[name="gb_regdate"]').value = today.toISOString().slice(0, 10);
	}

    // 페이지가 로드될 때 현재 날짜를 설정하는 함수 호출
    window.onload = setTodayDate;
</script>

</body>
</html>