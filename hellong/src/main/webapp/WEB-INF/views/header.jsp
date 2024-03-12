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
                    <form id="dyTotalSearch" action="dyTotalSearch" method="get">
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
      <div class="container"></div>
    </header>
    <!-- 마지막 헤더 -->
  </body>
</html>
