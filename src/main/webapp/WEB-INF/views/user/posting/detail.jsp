<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <title>채용공고</title>
    <style>
        #single-post ul {
            font-size: 20px;
        }
    </style>
</head>
<body>
<my:font/>

<my:job-header-nav/>

<my:job-inner-banner>
    채용공고
</my:job-inner-banner>

<!-- toast -->
<div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body"></div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

<!-- Start post Area -->
<section class="post-area section-gap">
    <div class="container">
        <div class="row justify-content-center d-flex">
            <div class="col-lg-8 post-list">
                <input id="bucket-url" type="hidden" value="${bucketUrl}">
                <div id="company-image">
                </div>
                <div id="company-name" class="text-center my-4">
                    <h2>회사이름</h2>
                    <a href="">회사 정보 상세 보기></a>
                </div>

                <hr>

                <div style="text-align: center">
                    <h2 id="title" class="my-4">공고명 대충 길게</h2>
                </div>

                <div class="single-post job-experience">
                    <h4 class="single-title"><i class="fa-solid fa-list"></i> 근무조건</h4>
                    <ul id="work-condition-ul">
                        <li>
                            <i class="fa-regular fa-square-check"></i>
                            <span>근무지: 대충 주소</span>
                        </li>
                        <li>
                            <i class="fa-regular fa-square-check"></i>
                            <span>근무형태: 정규직</span>
                        </li>
                        <li>
                            <i class="fa-regular fa-square-check"></i>
                            <span>연봉: 100원</span>
                        </li>
                    </ul>
                </div>

                <div class="single-post job-details mt-3">
                    <h4 class="my-3"><i class="fa-solid fa-handshake"></i> 필요 인원</h4>
                    <input style="resize: none" id="hiring_count" class="form-control-plaintext fs-5" value="00명"
                           readonly/>
                </div>

                <div class="single-post job-details mt-3">
                    <h4 class="my-4"><i class="fa-solid fa-user-check"></i> 필요조건입니다</h4>
                    <input id="level" style="font-size: 17px" class="form-control-plaintext" value="대졸이상 경력" readonly/>
                    <textarea id="requirements" style="resize: none; font-size: 17px; overflow: hidden" class="form-control-plaintext"
                              cols="30" rows="2"
                              readonly></textarea>
                </div>

                <div class="single-post job-details mt-3">
                    <h4 class="my-3"><i class="fa-solid fa-industry"></i> 우리 회사의 업종입니다</h4>
                    <input id="industry-id" style="font-size: 17px" class="form-control-plaintext" value="대충 it"
                           readonly/>
                </div>

                <div class="single-post job-details mt-3">
                    <h4 class="my-4"><i class="fa-solid fa-user-plus"></i> 우대사항입니다</h4>
                    <textarea id="preferences" style="resize: none; font-size: 17px; overflow: hidden"
                              class="form-control-plaintext"
                              cols="30"
                              rows="2" readonly></textarea>
                </div>

                <div class="single-post job-details mt-3">
                    <h4 class="my-4"><i class="fa-solid fa-hand-holding-heart"></i> 이런 복지가 있습니다</h4>
                    <textarea id="benefits" style="resize: none; font-size: 17px; overflow: hidden" class="form-control-plaintext ta"
                              cols="30" rows="2"
                              readonly></textarea>
                </div>

                <div class="single-post job-details mt-3">
                    <h4 class="my-3"><i class="fa-regular fa-calendar-days"></i> 모집기간</h4>
                    <input id="period" style="resize: none; font-size: 17px" class="form-control-plaintext fs-5"
                           value="2023.07.14 ~ 2023.07.89"
                           readonly/>
                </div>

                <div id="etc" class="single-post job-details mt-3">
                    <h4 class="my-4">기타 사항</h4>
                    <textarea style=" overflow: hidden; resize: none; font-size: 17px;" class="form-control-plaintext" cols="30" readonly></textarea>
                </div>

                <div style="text-align: center;" class="mb-5">
                    <button id="application-btn" class="btn btn-outline-success"><i
                            class="fa-regular fa-paper-plane"></i>
                        입사지원하기
                    </button>
                    <button id="wish-btn"></button>
                    <button id="note-btn" class="btn btn-outline-primary"><i class="fa-regular fa-envelope"></i> 쪽지로
                        문의하기
                    </button>
                    <a href="/user/posting/list" class="btn btn-outline-primary">목록으로가기</a>
                </div>
            </div>
            <div class="col-lg-4 sidebar">
                <div class="single-slidebar">
                    <h4>업종 별 공고 수</h4>
                    <ul id="industry-side" class="cat-list">
                        <li><a class="justify-content-between d-flex" href="#"><p>New York</p>
                            <span>37</span></a></li>
                    </ul>
                </div>

                <div class="single-slidebar">
                    <h4>지원자 수 많은 공고</h4>
                    <ul id="application-side" class="cat-list">
                        <li><a class="justify-content-between d-flex" href="#"><p>Technology</p>
                            <span>37</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End post Area -->

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
<script src="/js/user/posting/detail.js"></script>
</body>
</html>