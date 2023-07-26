<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoMap}&libraries=services"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
    <link rel="stylesheet" href="/css/company.css">
    <title>기업정보</title>
</head>
<body>
<my:font/>

<my:job-header-nav/>

<my:job-inner-banner>
    기업정보
</my:job-inner-banner>

<div class="container-lg">
    <div class="mt-5">
        <table id="company-table" class="table table-bordered">
            <caption class="caption-top"><h3>기업 상세 정보</h3></caption>
            <tbody>
            </tbody>
        </table>
    </div>

    <section>
        <div class="container-lg mt-3"></div>
        <div style="text-align: center">
            <h3>기업 위치</h3>
        </div>
        <div class="mx-auto" style="width: 1000px; height: 400px; position: relative;">
            <div id="map" style="width: 1000px; height: 400px;"></div>
        </div>
    </section>

    <%-- 현재 공고 --%>
    <div class="mt-3">
        <table id="posting-table" class="table table-bordered custom-div">
            <caption class="caption-top"><h3>채용 공고</h3></caption>
            <thead class="table-dark">
            <tr>
                <th style="width: 250px;">기간</th>
                <th>공고명</th>
                <th style="width: 100px;">채용인원</th>
                <th style="width: 100px;">고용형태</th>
                <th style="width: 100px;">경력</th>
                <th style="width: 100px;">학력</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="row mt-2">
            <nav aria-label="Page navigation example">
                <ul id="page-ul-now" class="pagination justify-content-center">
                </ul>
            </nav>
        </div>
    </div>

    <%-- 지난 공고 --%>
    <div class="mt-3">
        <table id="past-posting-table" class="table table-bordered custom-div">
            <caption class="caption-top"><h3>지난 공고</h3></caption>
            <thead class="table-dark">
            <tr>
                <th style="width: 250px;">기간</th>
                <th>공고명</th>
                <th style="width: 100px;">채용인원</th>
                <th style="width: 100px;">고용형태</th>
                <th style="width: 100px;">경력</th>
                <th style="width: 100px;">학력</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="row mt-2">
            <nav aria-label="Page navigation example">
                <ul id="page-ul" class="pagination justify-content-center">
                </ul>
            </nav>
        </div>
    </div>
</div>
<my:job-footer/>

<script src="/job-js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="/job-js/vendor/bootstrap.min.js"></script>
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
<script src="/js/user/join/detail.js"></script>
</body>
</html>