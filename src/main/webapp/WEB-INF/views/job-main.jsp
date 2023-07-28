<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/img/job-img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>채용박람회</title>

    <%--    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">--%>
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<my:font/>
<my:job-header-nav/>
<my:job-banner/>


<!-- Start features Area -->
<section class="features-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <a href="/user/join/list">
                        <h4>참여기업</h4>
                        <p>
                            박람회에 참여한 모든 기업들을<br>
                            살펴볼 수 있습니다
                        </p>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <a href="/user/posting/list">
                        <h4>채용공고</h4>
                        <p>
                            박람회에서 열린 공고들을<br>
                            한눈에 볼 수 있습니다
                        </p>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <a href="/tools/grade">
                        <h4>취업성공툴</h4>
                        <p>
                            다양한 도구를 <br>
                            사용할 수 있습니다
                        </p>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <a href="/customer/notice/list">
                        <h4>고객센터</h4>
                        <p>
                            공지사항, Q&A <br>
                            자주묻는질문
                        </p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End features Area -->

<!-- Start popular-post Area -->
<%--<section class="popular-post-area pt-100">--%>
<%--    <div class="container">--%>
<%--        <div class="row align-items-center">--%>
<%--            <div class="active-popular-post-carusel">--%>
<%--                <div class="single-popular-post d-flex flex-row">--%>
<%--                    <div class="thumb">--%>
<%--                        <img class="img-fluid" src="/img/job-img/p1.png" alt="">--%>
<%--                        <a class="btns text-uppercase" href="#">view job post</a>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <a href="#"><h4>Creative Designer</h4></a>--%>
<%--                        <h6>Los Angeles</h6>--%>
<%--                        <p>--%>
<%--                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt--%>
<%--                            ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="single-popular-post d-flex flex-row">--%>
<%--                    <div class="thumb">--%>
<%--                        <img src="/img/job-img/p2.png" alt="">--%>
<%--                        <a class="btns text-uppercase" href="#">view job post</a>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <a href="#"><h4>Creative Designer</h4></a>--%>
<%--                        <h6>Los Angeles</h6>--%>
<%--                        <p>--%>
<%--                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt--%>
<%--                            ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="single-popular-post d-flex flex-row">--%>
<%--                    <div class="thumb">--%>
<%--                        <img src="/img/job-img/p1.png" alt="">--%>
<%--                        <a class="btns text-uppercase" href="#">view job post</a>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <a href="#"><h4>Creative Designer</h4></a>--%>
<%--                        <h6>Los Angeles</h6>--%>
<%--                        <p>--%>
<%--                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt--%>
<%--                            ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="single-popular-post d-flex flex-row">--%>
<%--                    <div class="thumb">--%>
<%--                        <img src="/img/job-img/p2.png" alt="">--%>
<%--                        <a class="btns text-uppercase" href="#">view job post</a>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <a href="#"><h4>Creative Designer</h4></a>--%>
<%--                        <h6>Los Angeles</h6>--%>
<%--                        <p>--%>
<%--                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt--%>
<%--                            ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="single-popular-post d-flex flex-row">--%>
<%--                    <div class="thumb">--%>
<%--                        <img src="/img/job-img/p1.png" alt="">--%>
<%--                        <a class="btns text-uppercase" href="#">view job post</a>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <a href="#"><h4>Creative Designer</h4></a>--%>
<%--                        <h6>Los Angeles</h6>--%>
<%--                        <p>--%>
<%--                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt--%>
<%--                            ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="single-popular-post d-flex flex-row">--%>
<%--                    <div class="thumb">--%>
<%--                        <img src="/img/job-img/p2.png" alt="">--%>
<%--                        <a class="btns text-uppercase" href="#">view job post</a>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <a href="#"><h4>Creative Designer</h4></a>--%>
<%--                        <h6>Los Angeles</h6>--%>
<%--                        <p>--%>
<%--                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt--%>
<%--                            ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- End popular-post Area -->

<!-- Start download Area -->
<section class="download-area section-gap" id="app">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <h1 class="mb-10">박람회 소개</h1>
        </div>
        <div class="row">
            <div class="col-lg-6 download-left">
                <img class="img-fluid" src="${bucketUrl}/exhibitionInfo/${exhibitionInfo.round}/info.png" alt="">
            </div>
            <div class="col-lg-6 download-right">
                <p class="subs">
                    ${exhibitionInfo.etc}
                </p>
                <div class="d-flex flex-row">
                    <div class="buttons">
                        <a href="/location">

                            <div class="desc">
                                <p>
                                    <span>찾아오시는 길</span>
                                </p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End download Area -->

<!-- Start feature-cat Area -->
<section class="feature-cat-area pt-100 pb-100" id="category">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-10">
                <div class="title text-center">
                    <h1 class="mb-10">관심있는 산업</h1>
                    <p>구직자 여러분들의 관심있는 산업을 볼 수 있습니다</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="/user/posting/list?industrIds=1">
                        <img src="/img/job-img/o1.png" alt="">
                        <p>IT 및 소프트웨어 개발</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="/user/posting/list?industrIds=4">
                        <img src="/img/job-img/o2.png" alt="">
                        <p>텔레커뮤니케이션</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="/user/posting/list?industrIds=15">
                        <img src="/img/job-img/o3.png" alt="">
                        <p>건설 및 부동산</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="/user/posting/list?industrIds=7">
                        <img src="/img/job-img/o4.png" alt="">
                        <p>컨설팅 및 전략</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="/user/posting/list?industrIds=9">
                        <img src="/img/job-img/o5.png" alt="">
                        <p>의료 및 보건</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="/user/posting/list?industrIds=11">
                        <img src="/img/job-img/o6.png" alt="">
                        <p>엔터테인먼트</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End feature-cat Area -->

<!-- Start callto-action Area -->
<section class="callto-action-area section-gap" id="join">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content col-lg-9">
                <div class="title text-center">
                    <h1 class="mb-10 text-white">박람회에 참여하세요</h1>
                    <p class="text-white">구직자가 되어 기업에 입사지원을 하거나, 구인기업이 되어 유능한 인재들을 만나보세요</p>
                    <a class="primary-btn" href="/members/signup">구직자 회원가입</a>
                    <a class="primary-btn" href="/members/cosignup">기업 회원가입</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End calto-action Area -->



<my:job-footer/>

<script src="/job-js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="/job-js/vendor/bootstrap.min.js"></script>
<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="/job-js/easing.min.js"></script>
<script src="/job-js/hoverIntent.js"></script>
<script src="/job-js/superfish.min.js"></script>
<script src="/job-js/jquery.ajaxchimp.min.js"></script>
<script src="/job-js/jquery.magnific-popup.min.js"></script>
<script src="/job-js/owl.carousel.min.js"></script>
<script src="/job-js/jquery.sticky.js"></script>
<script src="/job-js/jquery.nice-select.min.js"></script>
<script src="/job-js/parallax.min.js"></script>
<script src="/job-js/mail-script.js"></script>
<script src="/job-js/main.js"></script>
</body>
</html>



