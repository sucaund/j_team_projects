<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">


</head>
<body class="bg-gray-100">
	
	<!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">시설 관리 페이지</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li>시설관리 Home</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	
	
	
	
    <div class="container mx-auto bg-white p-8 rounded-lg shadow-lg mb-4 mt-4">
      
		<div class="container mx-auto p-8">
		    <h2 class="text-2xl font-bold mb-4">보유하고 있는 헬스장</h2>
		    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
		        <c:forEach var="gym" items="${ManageList}">
		            <div class="bg-white rounded-lg shadow-lg p-6">
		                <h1 class="text-lg font-bold mb-4">${gym.g_name}</h1>
		                <div class="flex flex-col space-y-2">
		                    <a href="createGymForm?g_id=${gym.g_id}" class="py-2 px-4 bg-blue-500 text-white rounded-lg text-center hover:bg-blue-600 transition duration-300">헬스장 글 등록/수정</a>
		                    <a href="gymPostDetail?g_id=${gym.g_id}" class="py-2 px-4 bg-blue-500 text-white rounded-lg text-center hover:bg-blue-600 transition duration-300">홍보 글 이동</a>
		                    <a href="serviceList?g_id=${gym.g_id}" class="py-2 px-4 bg-blue-500 text-white rounded-lg text-center hover:bg-blue-600 transition duration-300">서비스 관리</a>
		                    <a href="gymMemberListDetail?g_id=${gym.g_id}" class="py-2 px-4 bg-blue-500 text-white rounded-lg text-center hover:bg-blue-600 transition duration-300">회원 관리</a>
		                    <a href="trainerList?g_id=${gym.g_id}" class="py-2 px-4 bg-blue-500 text-white rounded-lg text-center hover:bg-blue-600 transition duration-300">트레이너 관리</a>
		                </div>
		            </div>
		        </c:forEach>
		    </div>
		</div>
	       
    </div>



</body>
</html>
