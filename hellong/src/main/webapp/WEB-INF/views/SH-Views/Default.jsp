<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
.post-title a {
  display: block; /* 또는 inline-block */
  white-space: nowrap; /* 텍스트를 한 줄로 만듭니다 */
  overflow: hidden; /* 초과하는 텍스트를 숨깁니다 */
  text-overflow: ellipsis; /* 숨겨진 텍스트를 '...'으로 표시합니다 */
  width: 100%; /* 또는 다른 고정 값, 텍스트 길이 제한을 위해 필요합니다 */
  max-width: 250px; /* 최대 너비를 설정하여 텍스트가 차지할 수 있는 공간을 제한합니다. 필요에 따라 조정하세요 */
}


.feed-desc {
  padding-top: 5px; /* 내용의 상단에 10px의 패딩을 추가하여 간격을 조정 */
}



</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>Insert title here</title>
</head>
<body>
	    <!-- Start Hero Area -->
    <section class="hero-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12 custom-padding-right">
                    <div class="slider-head">
                        <!-- Start Hero Slider -->
                        <div class="hero-slider">
                            <!-- Start Single Slider  헬스장 정보 가져오기=>ajax로 카카오맵으로 현재 위치받고  -->
                            <div class="single-slider" style="background-image: url(https://via.placeholder.com/800x500);">
                                <div class="content">
                                    <h2><span>득근득근! 신규 헬스장!</span>
                                        ${newGym.g_name}
                                    </h2>
                                    <p>${newGym.g_address}</p>
                                    <h3><span>1달기준 아무것도 안나오는이유 : 해당 g_id의 gs는 아직 없어서이다 문제는없다</span> ${newGymPrice.s_price}</h3>
                                    <div class="button">
                                        <a href="product-grids.html" class="btn">링크연결은 지훈님의 헬스장페이지 와 연관!</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                            <!-- Start Single Slider -->
                            <div class="single-slider"
                                style="background-image: url('<c:url value='/upload/${newGymPhoto.gbf_storedFileName}'/>');">
                                <div class="content bg-light p-3">
                                    <h2><span>그돈헬! 최저가 헬스장</span>
                                        ${cheapGym.g_name}
                                    </h2>
                                    <p>${cheapGym.g_address}</p>
                                    <h3><span>1달기준!</span> ${cheapGymPrice.s_price}</h3>
                                    <div class="button mt-2">
                                        <a href="product-grids.html" class="btn btn-light">자세히 알아보기</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                            <!-- Start Single Slider -->
                            <div class="single-slider"
                                style="background-image: url(https://via.placeholder.com/800x500);">
                                <div class="content">
                                    <h2><span>모두 헬롱! 최다인원 헬스장!</span>
                                        ${manyGym.g_name}
                                    </h2>
                                    <p>${manyGym.g_address}</p>
                                    <h3><span>최저가!</span> ${manyGymPrice.s_price}</h3>
                                    <div class="button">
                                        <a href="product-grids.html" class="btn">자세히 알아보기</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                            <!-- Start Single Slider -->
                            <div class="single-slider"
                                style="background-image: url(https://via.placeholder.com/800x500);">
                                <div class="content">
                                    <h2><span>별이빛나는 Gym에... 높은 별점</span>
                                        ${starGym.g_name}
                                    </h2>
                                    <p>${starGym.g_address}</p>
                                    <h3><span>최저가!</span> ${starGymPrice.s_price}</h3>
                                    <div class="button">
                                        <a href="product-grids.html" class="btn">자세히 알아보기</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                        </div>
                        <!-- End Hero Slider -->
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="row">
                        <div class="col-lg-12 col-md-6 col-12 md-custom-padding">
                            <!-- Start Small Banner -->
                            <div class="hero-small-banner"
                                style="background-color: #c2d6ed;">
                                <div class="content">
                                    <h2>
                                        
                                        <!-- Start Single Widget -->
                        <div class="widget popular-feeds">
                            <div class="popular-feed-loop">
                            <h6 class="widget-title">최신공지사항</h6>
                                <div class="single-popular-feed">
                                    <div class="feed-desc">
                                        <h5 class="post-title"><a href="blog-single-sidebar.html">${Notice.b_title}</a></h5>
                                    </div>
                                </div>
                                <hr>
                             <h6 class="widget-title">인기자유글</h6>
                                <div class="single-popular-feed">
                                    <div class="feed-desc">
                                        <h5 class="post-title"><a href="blog-single-sidebar.html">${Popular.b_title}</a></h5>
                                    </div>
                                </div>
                                 <hr>
                               <h6 class="widget-title">인기바디프로필</h6>
                                <div class="single-popular-feed">
                                    <div class="feed-desc">
                                        <h5 class="post-title"><a href="blog-single-sidebar.html">${bodyProfile.b_title}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                                        
                                    </h2>
                                </div>
                            </div>
                            <!-- End Small Banner -->
                        </div>
                        <div class="col-lg-12 col-md-6 col-12">
                            <!-- Start Small Banner -->
                            <div class="hero-small-banner style2">
                                <div class="content">
                                    <h2>주변헬스장 찾기!</h2>
                                    <p>당신의 건강을 향한 여정을 지원하는,                       가장 가까운 헬스장을 찾아드립니다</p>
                                    <div class="button">
                                        <a class="btn" href="/gymMap">찾아보기</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Small Banner -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Hero Area -->
</body>
  <!-- ========================= JS here ========================= -->
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/tiny-slider.js"></script>
    <script src="assets/js/glightbox.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script type="text/javascript">
        //========= Hero Slider 
        tns({
            container: '.hero-slider',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 0,
            items: 1,
            nav: false,
            controls: true,
            controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
        });

        //======== Brand Slider
        tns({
            container: '.brands-logo-carousel',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 15,
            nav: false,
            controls: false,
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 3,
                },
                768: {
                    items: 5,
                },
                992: {
                    items: 6,
                }
            }
        });

    </script>
</html>