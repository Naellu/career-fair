<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
    <!-- Site Title -->
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

    <title>참여기업목록</title>

    <style>
        #round-ul .nav-link {
            font-size: 17px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<my:font/>

<my:job-header-nav/>

<my:job-inner-banner>
    참여기업
</my:job-inner-banner>

<section class="service-area mt-3" id="service">
    <div class="container">
        <div class="row d-flex">
            <div class="col-md-8 pb-40 header-text">
                <nav class="navbar navbar-expand-lg bg-body-white">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul id="round-ul" class="navbar-nav me-auto mb-lg-0 nav-tabs nav-pills">
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <div class="d-flex justify-content-end">
            <select id="industry-select" class="form-select flex-grow-0" style="width: 250px;" name="type">
            </select>
            <select id="type" class="form-select flex-grow-0" style="width: 120px;">
                <option value="all">전체</option>
                <option value="companyName">기업명</option>
                <option value="address">지역</option>
            </select>
            <input id="search" class="form-control" type="search" placeholder="Search"
                   aria-label="Search">
            <button id="search-btn" class="btn btn-outline-success" type="button">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>

        <div id="company-view" class="row mt-2">
            <div class="col-lg-3 col-md-6">
                <div class="single-service">
                    <h4><span class="lnr lnr-user"></span>기업ㅁㅁㅁㅁ</h4>
                    <p>
                        사원수 : 4564
                        <br>
                        설립일 : 2023-07-14
                        <br>
                        업종 : 컨설팅 및 전략
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div style="text-align: center">
        <button id="page-btn" class="btn" style="width: 500px; background-color: lightgray">
            목 록 더 보 기
        </button>
    </div>
</section>
<!-- End service Area -->

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>
<script src="/js/user/join/list.js"></script>
</body>
</html>