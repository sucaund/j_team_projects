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
                <div class="col-lg-8 col-md-12 col-12">
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

                                    <c:if test="${g_id==null}">
                                    <h4>
                                        <a href="blog-single-sidebar.html">현재 이용중인 헬스장이 없습니다.</a>
                                    </h4>
                                    <p>헬롱에 등록된 다양한 헬스장을 만나보세요.</p>
                                    <div class="button">
                                        <a href="/GymPostList" class="btn">지점찾기</a>
                                    </div>
                                    </c:if>

                                    <c:if test="${g_id!=null}">
                                        <h4>
                                            <a href="blog-single-sidebar.html">현재 헬스장: &nbsp; &nbsp; <a style="color: #0167F3;">
                                                ${gym.g_name}
                                        </a></a>
                                        </h4>
                                        <p>${s_name}</p> <!-- 서비스명 -->

                                        <fmt:formatDate value="${gymOrder.go_enddate}" pattern="yyyy/MM/dd"></fmt:formatDate> 까지
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
                                    <p>마지막 결제일자:  <fmt:formatDate value="${gymOrder.deal_date}" pattern="yyyy/MM/dd"></fmt:formatDate></p>
                                    <div class="button">
                                        <a href="javascript:void(0)" class="btn">결제 내역 보기</a>
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
                                        <a href="blog-single-sidebar.html"
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
                <aside class="col-lg-4 col-md-12 col-12">
                    <div class="sidebar blog-grid-page">
                        <!-- Start Single Widget -->
                        <div class="widget search-widget">
                            <h5 class="widget-title">작성글 보기</h5>
                            <form action="#">
                                input 또는 버튼으로 작성글 보기 페이지로 링크
                                <input type="text" placeholder="Search Here...">
                                <button type="submit"><i class="lni lni-search-alt"></i></button>
                            </form>
                        </div>
                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <div class="widget popular-feeds">
                            <h5 class="widget-title">작성글보기 2? &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="color:#0167F3;" href="/dyMyPageList">전체보기</a></h5>
                            <div class="popular-feed-loop">
                                <div class="single-popular-feed">
                                    <div class="feed-desc">
                                        <h6 class="post-title"><a href="blog-single-sidebar.html">${board.b_title}</a></h6>
                                        <span class="time"><i class="lni lni-calendar"></i> ${board.b_regdate}</span>
                                    </div>
                                </div>
                                <div class="single-popular-feed">
                                    <div class="feed-desc">
                        
                                        <h6 class="post-title"><a href="blog-single-sidebar.html">2</a></h6>
                                        <span class="time"><i class="lni lni-calendar"></i> 24th March 2023</span>
                                    </div>
                                </div>
                                <div class="single-popular-feed">
                                    <div class="feed-desc">
                                  
                                        <h6 class="post-title"><a href="blog-single-sidebar.html">3 </a></h6>
                                        <span class="time"><i class="lni lni-calendar"></i> 30th Jan 2023</span>
                                                                            <div class="button">
                                     
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Widget -->

</body>
</html>