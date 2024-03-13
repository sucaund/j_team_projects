<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <title>헤더</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/LineIcons.3.0.css" />
    <link rel="stylesheet" type="text/css" href="/css/tiny-slider.css" />
    <link rel="stylesheet" type="text/css" href="/css/glightbox.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/tiny-slider.js"></script>
    <script src="/js/glightbox.min.js"></script>
    <script src="/js/main.js"></script>
  </head>
  <body>
    <header class="header navbar-area">
      <div class="header-middle">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-3 col-md-3 col-7">
              <!-- Start Header Logo -->
              <a class="navbar-brand" href="index.html">
                <img src="/images/logo/logo.svg" alt="Logo" />
              </a>
            </div>
            <!-- col-lg-3 col-md-3 col-7-->

            <!-- 검색 -->
            <div class="col-lg-5 col-md-7 d-xs-none">
              <!-- Start Main Menu Search -->
              <div class="main-menu-search">
                <!-- navbar search start -->
                <div class="navbar-search search-style-5">
                  <div class="search-select">
                    <div class="select-position">
                      <select id="select1">
                        <option selected>All</option>
                        <option value="1">option 01</option>
                        <option value="2">option 02</option>
                        <option value="3">option 03</option>
                        <option value="4">option 04</option>
                        <option value="5">option 05</option>
                      </select>
                    </div>
                  </div>
                  <!-- search select-->

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
                    <button type="submit" form="dyTotalSearch">
                      <i class="lni lni-search-alt"></i>
                    </button>
                  </div>

                  <!-- search input-->
                  <!-- search 관련 다-->
                </div>
                <!-- navbar search search-->
                <!-- navbar search Ends -->
              </div>
              <!-- main menu search-->
              <!-- End Main Menu Search -->
            </div>
            <!-- col lg 5-->

            <!-- 로그인 로그아웃 -->
            <div class="col-lg-4 col-md-2 col-5">
              <div class="top-end">
                <ul class="user-login">
                  <% if (session.getAttribute("m_name") != null) { %>
                  <li>
                    <a href="jmMyPage">${sessionScope.m_name}님</a>, 안녕하세요
                  </li>
                  <li><a href="jmLogOut">로그아웃</a></li>
                  <% } else { %>
                  <li><a href="jmLoginForm">로그인</a></li>
                  <li><a href="jmSignUpFormAjax2">회원가입</a></li>
                  <% } %>
                </ul>
                <!-- ul userlogin -->
              </div>
              <!-- top-end -->
            </div>
            <!-- col lg 4-->
          </div>
          <!-- row align-items-center -->
        </div>
        <!-- container -->
      </div>
      <!-- header-middle -->

      <!-- nav 시작 -->
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-8 col-md-6 col-12">
            <div class="nav-inner">
              <!-- 왼쪽 펼침 메뉴바 -->
              <div class="mega-category-menu">
                <span class="cat-button"><i class="lni lni-menu"></i>메뉴</span>
                <ul class="sub-category">
                  <li><a href="/GymPostList">헬스장(지점찾기)</a></li>

                  <li><a href="/communityBoard">자유게시판</a></li>
                  <li><a href="/listBodyProfile">바디프로필</a></li>

                  <li><a href="/jmMyPage">마이페이지</a></li>
                  <li><a href="product-grids.html">작성글</a></li>
                  <li><a href="product-grids.html">스크랩(x)</a></li>
                  <li><a href="product-grids.html">찜(x)</a></li>
                  <li><a href="product-grids.html">결제</a></li>
                  <li><a href="/jmUpdateMemberForm">개인정보수정</a></li>
                  <li><a href="product-grids.html">비즈니스 개설/관리</a></li>
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
              <!-- 펼침 메뉴바 끝 -->

              <!-- 가운데 nav -->
              <nav class="navbar navbar-expand-lg">
                <button
                  class="navbar-toggler mobile-menu-btn"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#navbarSupportedContent"
                  aria-controls="navbarSupportedContent"
                  aria-expanded="false"
                  aria-label="Toggle navigation"
                >
                  <span class="toggler-icon"></span>
                  <span class="toggler-icon"></span>
                  <span class="toggler-icon"></span>
                </button>
                <div
                  class="collapse navbar-collapse sub-menu-bar"
                  id="navbarSupportedContent"
                >
                  <ul id="nav" class="navbar-nav ms-auto">
                    <li class="nav-item">
                      <a
                        href="index.html"
                        class="active"
                        aria-label="Toggle navigation"
                        >홈(메인페이지)</a
                      >
                    </li>
                    <li class="nav-item">
                      <!-- <a
                        class="dd-menu collapsed"
                        href="/GymPostList"
                        data-bs-toggle="collapse"
                        data-bs-target="#submenu-1-2"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >헬스장(지점찾기)</a
                      > -->

                      <a href="/GymPostList" aria-label="Toggle navigation"
                        >헬스장(지점찾기)</a
                      >
                      <!-- <ul class="sub-menu collapse" id="submenu-1-2">
                        <li class="nav-item">
                          <a href="about-us.html">About Us</a>
                        </li>
                        <li class="nav-item"><a href="faq.html">Faq</a></li>
                        <li class="nav-item"><a href="login.html">Login</a></li>
                        <li class="nav-item">
                          <a href="register.html">Register</a>
                        </li>
                        <li class="nav-item">
                          <a href="mail-success.html">Mail Success</a>
                        </li>
                        <li class="nav-item">
                          <a href="404.html">404 Error</a>
                        </li>
                      </ul> -->
                    </li>

                    <li class="nav-item">
                      <a
                        class="dd-menu collapsed"
                        href="javascript:void(0)"
                        data-bs-toggle="collapse"
                        data-bs-target="#submenu-1-3"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >커뮤니티</a
                      >
                      <ul class="sub-menu collapse" id="submenu-1-3">
                        <li class="nav-item">
                          <a href="/communityBoard">자유게시판</a>
                        </li>
                        <li class="nav-item">
                          <a href="/listBodyProfile">바디프로필</a>
                        </li>
                      </ul>
                    </li>

                    <li class="nav-item">
                      <a
                        class="dd-menu collapsed"
                        href="/jmMyPage"
                        data-bs-toggle="collapse"
                        data-bs-target="#submenu-1-4"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >내 정보</a
                      >
                      <ul class="sub-menu collapse" id="submenu-1-4">
                        <li class="nav-item">
                          <a href="/jmMyPage">마이페이지</a>
                        </li>
                        <li class="nav-item">
                          <a href="blog-grid-sidebar.html">작성글</a>
                        </li>
                        <li class="nav-item">
                          <a href="blog-single.html">결제</a>
                        </li>
                        <li class="nav-item">
                          <a href="/jmUpdateMemberForm">개인정보수정</a>
                        </li>
                      </ul>
                    </li>

                    <li class="nav-item">
                      <a href="contact.html" aria-label="Toggle navigation"
                        >고객센터</a
                      >
                      <!-- 공지사항, 일대일 문의 추가? -->
                    </li>
                  </ul>
                </div>
                <!-- navbar collapse -->
              </nav>
              <!-- 가운데 nav바 끝 -->
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- 마지막 헤더 -->
  </body>
</html>
