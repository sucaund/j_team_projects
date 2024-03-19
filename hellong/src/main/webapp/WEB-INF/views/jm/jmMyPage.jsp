<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">마이 헬롱</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Blog Singel Area -->
    <section class="section blog-section blog-list">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12 col-12" style="margin:0 auto; ">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <!-- Start Single Blog -->
                            <div class="single-blog">
                                <div class="blog-content">
                                    <a class="category">마이 헬롱</a>
                                    <h4 style="color: #0167F3;">
                                            ${m_name}님, 환영합니다.
                                    </h4>
                                    <br>
                                    <h5><c:if test="${member.common_mcd==10}">헬롱 회원</c:if>
                                        <c:if test="${member.common_mcd==20}">사장님</c:if>
                                        <c:if test="${member.common_mcd==30}">관리자</c:if></h5>
                                    <br>
                                    <h6>  
                                        ${member.m_age}세  <br><br> 
                                        ${member.m_address} 거주 <br><br> 
                                        <c:if test="${member.m_gender=='F'}">여성</c:if>
                                        <c:if test="${member.m_gender=='M'}">남성</c:if> 
                                        <br><br>
                                        ${member.m_email} <br><br>
                                        <fmt:formatDate value="${member.m_regdate}" pattern="yyyy/MM/dd"></fmt:formatDate> 가입
                                        <br><br> 

                                    </h6>
                                    <div class="button">
                                        <a href="/jmUpdateMemberForm" class="btn">회원 정보 수정</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Blog -->
                        </div>
                        <div class="col-lg-6 col-md-6 col-12">
                            <!-- Start Single Blog -->
                            <div class="single-blog">
                                <div class="blog-content">
                                    <a class="category">서비스</a>

                                    <c:if test="${g_id==0}">
                                    <h4>
                                        <a href="blog-single-sidebar.html">현재 이용중인 헬스장이 없습니다.</a>
                                    </h4>
                                    <p>헬롱에 등록된 다양한 헬스장을 만나보세요.</p>
                                    <div class="button">
                                        <a href="/GymPostList" class="btn">지점찾기</a>
                                    </div>
                                    </c:if>

                                    <c:if test="${g_id>0}">
                                        <h4>
                                            <a href="blog-single-sidebar.html">현재 헬스장: &nbsp; &nbsp; <a style="color: #0167F3;">
                                                ${gym.g_name}
                                        </a></a>
                                        </h4>
                                        <p>${s_name}</p> <!-- 서비스명 -->

                                        ${gymOrder.go_enddate}"까지
                                        <!-- 이용종료일 -->

                                        <p>${gym.g_address}</p>
                                        <div class="button">
                                            <a href="/gymPostDetail?g_id=${g_id}" class="btn">자세히 보기</a>
                                        </div>

                                    </c:if>
                                </div>
                            </div>
                            <!-- End Single Blog -->
                        </div>
                        <div class="col-lg-6 col-md-6 col-12">
                            <!-- Start Single Blog -->
                            <div class="single-blog">
                                <div class="blog-content">
                                    결제
                                    <h4>
                                        <a href="blog-single-sidebar.html">현재 포인트: &nbsp; &nbsp; <a style="color: #0167F3;">${member.m_currpoint}원</a>
                                        </a>
                                    </h4>
                                    <p>이용중인 서비스 가격: ${gymOrder.use_point}</p>
                                    <p>마지막 결제일자:  ${gymOrder.deal_date}
                                    <div class="button">
                                        <a href="hsListChargePoint?m_number=${m_number }" class="btn">결제 내역 보기</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Blog -->
                        </div>
                        <div class="col-lg-6 col-md-6 col-12">
                            <!-- Start Single Blog -->
                            <div class="single-blog">
                                <div class="blog-content">
                                    <a class="category" href="/jmCustomerCenter">고객센터</a>
                                    <h4>
                                        <a href="blog-single-sidebar.html" 
                                        style="text-decoration: underline; color: #03E041;">일대일 문의하기</a>
                                        <br>
                                        <br>
                                        <a href="/listGymManager"
                                        style="text-decoration: underline; color:#00BFFD">비즈니스 개설/관리하기</a>
                                    </h4>
                                   
                                    <div class="button">
                                        <a href="/jmCustomerCenter" class="btn">고객센터로 이동</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Blog -->
                        </div>
            
                    </div>
                    
                </div>
                
                            </div>
                        </div>
                        <!-- End Single Widget -->
                        </section>

</body>
</html>