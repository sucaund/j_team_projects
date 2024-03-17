<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"
	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/LineIcons.3.0.css" />
    <link rel="stylesheet" type="text/css" href="/css/tiny-slider.css" />
    <link rel="stylesheet" type="text/css" href="/css/glightbox.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />

	<!-- ========================= JS here ========================= -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/tiny-slider.js"></script>
	<script src="/js/glightbox.min.js"></script>
<!-- 	<script src="/js/main.js"></script> -->
	
	
	
	<style>

	  .header {
	    position: fixed; 
	    top: 0; 
	    width: 100%; 
	    z-index: 1000; 
	    background-color: #fff; 
	    padding: 10px 0; 
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
	  }
	  /* 헤더 아래 컨텐츠 패딩 설정 */
	  .bo {
	    padding-top: 200px; /* 고정된 헤더의 높이만큼 추가 */
	  }
  	</style> 
	

</head>




<body>


    <!-- Start Header Area -->
    <header class="header navbar-area">
        <!-- Start Topbar -->
       
        <!-- Start Header Middle -->
        <div class="header-middle">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3 col-7">
                        <!-- Start Header Logo -->
                        <a class="navbar-brand" href="index.html">
                            <img src="/images/logo/logo.svg" alt="Logo">
                        </a>
                        <!-- End Header Logo -->
                    </div>
                    <div class="col-lg-5 col-md-7 d-xs-none">
                        <!-- Start Main Menu Search -->
                        <div class="main-menu-search">
                            <!-- navbar search start -->
                            <div class="navbar-search search-style-5">
                                <div class="search-select">
                                    <div class="select-position">
                                        <select id="select1">
                                            <option selected="">All</option>
                                            <option value="1">option 01</option>
                                            <option value="2">option 02</option>
                                            <option value="3">option 03</option>
                                            <option value="4">option 04</option>
                                            <option value="5">option 05</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="search-input">
                                    <form
                      id="dyTotalSearch"
                      action="dyTotalSearch"
                      method="get"
                    >
                    <input
                    type="text"
                    name="totKeyword"
                    placeholder="검색어를 입력하세요"
                  />
                </form>
                                </div>
                                <div class="search-btn">
                                    <button type="submit" form="dyTotalSearch"><i class="lni lni-search-alt"></i></button>
                                </div>
                            </div>
                            <!-- navbar search Ends -->
                        </div>
                        <!-- End Main Menu Search -->
                    </div>



                    <div class="col-lg-4 col-md-2 col-5">
                        <div class="middle-right-area">
                            <div class="nav-hotline">
                                <h3><% if (session.getAttribute("m_name") != null) { %>
                                    <span><a href="jmMyPage">${sessionScope.m_name}님</a>, 안녕하세요</span>
									<a href="jmLogOut">로그아웃</a>
                                    <% } else { %>
                                        <a href="jmLoginForm">로그인</a> &nbsp; &nbsp;
                                        <a href="jmSignUpFormAjax2">회원가입</a>
                                        <% } %>
                                </h3>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header Middle -->
        <!-- Start Header Bottom -->
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 col-md-6 col-12">
                    <div class="nav-inner">
                        <!-- Start Mega Category Menu -->
                        <div class="mega-category-menu">
                            <span class="cat-button"><i class="lni lni-menu"></i>메뉴</span>
                            <ul class="sub-category">
                                <li><a href="/GymPostList">헬스장(지점찾기)</i></a>
                                </li>
                                <li><a href="/communityBoard">자유게시판</a></li>
                                <li><a href="/listBodyProfile">바디프로필</a></li>
                                <li><a href="/jmMyPage">마이페이지</a></li>
                                <li><a href="https://demo.graygrids.com/themes/shopgrids/product-grids.html">작성글</a></li>
                                <li><a href="https://demo.graygrids.com/themes/shopgrids/product-grids.html">결제</a></li>
                                <li><a href="/jmUpdateMemberForm">개인정보수정</a></li>
                                <li><a href="/listGymManager">비즈니스 개설/관리</a></li>
                                <li><a href="/GymPostList">헬스장(지점찾기)</a></li>
                                <li>
                                    <a href="/communityBoard"
                                      >고객센터 <i class="lni lni-chevron-right"></i
                                    ></a>
                                    <ul class="inner-sub-category">
                                        <li><a href="product-grids.html">1대1 문의</a></li>
                                        <li><a href="/listBodyProfile">공지사항</a></li>
                                    </ul>
                                </li>
                                <li><a href="product-grids.html">관리자페이지</a></li>
                            </ul>
                        </div>
                        <!-- End Mega Category Menu -->
                        <!-- Start Navbar -->
                        <nav class="navbar navbar-expand-lg">
                            <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                                <ul id="nav" class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                        <a href="index.html"  aria-label="Toggle navigation">홈</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/GymPostList"  class="active" aria-label="Toggle navigation">헬스장(지점찾기)</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#submenu-1-3" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">커뮤니티</a>
                                        <ul class="sub-menu collapse" id="submenu-1-3">
                                            <li class="nav-item"><a href="/communityBoard">자유게시판</a></li>
                                            <li class="nav-item"><a href="/listBodyProfile">바디프로필</a></li>
                                            
                                        </ul>
                                    </li>

                                    <li class="nav-item">
                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#submenu-1-4" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">내 정보</a>
                                        <ul class="sub-menu collapse" id="submenu-1-4">
                                            <li class="nav-item"><a href="/jmMyPage">마이페이지</a></li>
                                            <li class="nav-item"><a href="blog-grid-sidebar.html">작성글</a></li>
                                            <li class="nav-item"><a href="https://demo.graygrids.com/themes/shopgrids/blog-single-sidebar.html">결제</a></li>
                                            <li class="nav-item"><a href="/jmUpdateMemberForm">개인정보수정</a></li>
                                            
                                        </ul>
                                    </li>

                                    <li class="nav-item">
                                        <a href="https://demo.graygrids.com/themes/shopgrids/contact.html" aria-label="Toggle navigation">고객센터</a>
                                    </li>
                                </ul>
                            </div> <!-- navbar collapse -->
                        </nav>
                        <!-- End Navbar -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header Bottom -->
    </header>
    <!-- End Header Area -->
  </body>
</html>