<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 트레이너 추가 이력서</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    #preview {
        width: 200px;
        height: auto;
        margin-bottom: 10px;
    }
    .custom-file-label::after {
        content: "사진 선택";
    }
</style>
</head>
<body>
<header class="bg-dark text-white text-center py-4" id="formTitle">
    <h1><i class="fas fa-dumbbell"></i> 헬스장 트레이너 추가</h1>
</header>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 my-4">
        	<c:if test="${msg!=null}">${msg}</c:if>
            <form action="${pageContext.request.contextPath}/jh/saveTrainerForm" method="post" id="trainerForm" enctype="multipart/form-data" >
                <input type="hidden" name="g_id" value="${gym}" required>

                <div class="form-group">
                    <label for="photo"><i class="fas fa-camera"></i> 트레이너 사진:</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="photo" name="trainerPhotoFile" onchange="previewImage(event)">
                        <label class="custom-file-label" for="photo">사진 선택</label>
                    </div>
                </div>

                <div class="form-group">
                    <img id="preview" src="#" alt="미리보기" style="display:none;">
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="name"><i class="fas fa-user"></i> 이름:</label>
                        <input type="text" class="form-control" id="name" name="t_name" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="age"><i class="fas fa-birthday-cake"></i> 나이:</label>
                        <input type="text" class="form-control" id="age" name="t_age" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="gender"><i class="fas fa-venus-mars"></i> 성별:</label>
                        <select id="gender" class="form-control" name="t_gender" required>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="phone"><i class="fas fa-phone"></i> 전화번호:</label>
                        <input type="text" class="form-control" id="phone" name="t_tel" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email"><i class="fas fa-envelope"></i> 이메일:</label>
                    <input type="email" class="form-control" id="email" name="t_email" required>
                </div>

                <div class="form-group">
                    <label for="address"><i class="fas fa-map-marker-alt"></i> 주소:</label>
                    <textarea class="form-control" id="address" name="t_address" rows="4" required></textarea>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="regdate"><i class="fas fa-calendar-alt"></i> 고용날짜:</label>
                        <input type="date" class="form-control" id="regdate" name="t_regdate" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="sal"><i class="fas fa-won-sign"></i> 급여:</label>
                        <input type="text" class="form-control" id="sal" name="t_sal" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="certification"><i class="fas fa-certificate"></i> 자격사항:</label>
                    <textarea class="form-control" id="certification" name="t_qualifications" rows="4" required></textarea>
                </div>

                <div class="form-group">
                    <label for="experience"><i class="fas fa-briefcase"></i> 경력사항:</label>
                    <textarea class="form-control" id="experience" name="t_experience" rows="4" required></textarea>
                </div>

                <div class="form-group">
                    <label for="matters"><i class="fas fa-exclamation-circle"></i> 특이사항:</label>
                    <textarea class="form-control" id="matters" name="t_matters" rows="4" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary" onclick="handleFormSubmission()"><i class="fas fa-plus"></i> 등록</button>
            	<button type="button" class="btn btn-secondary" onclick="window.history.back()">취소</button>
            </form>
        </div>
    </div>
</div>

<script>
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('preview');
            output.src = reader.result;
            output.style.display = "block";
        }
        reader.readAsDataURL(event.target.files[0]);
    }
    
    function handleFormSubmission() {
        alert("등록이 완료되었습니다.");        
    } 
    
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

