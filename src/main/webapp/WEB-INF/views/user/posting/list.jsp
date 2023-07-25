<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
    <!-- Site Title -->
    <title>채용공고</title>
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
    <style>
        .single-post .title h4:hover {
            color: #00b6a1;
        }
    </style>
</head>
<body>
<my:font/>
<my:job-header-nav/>

<my:job-inner-banner/>
<!-- Start post Area -->
<section class="post-area mt-3">
    <div class="container">
        <form id="filter-form" method="GET">
            <div class="container-lg mt-3">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne"
                                    aria-expanded="true"
                                    aria-controls="collapseOne">
                                필터링하기
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="row">
                                    <div class="col border-secondary border-end">
                                        <h5>업종</h5>
                                        <div id="industry-container"></div>
                                    </div>
                                    <div class="col border-secondary border-end">
                                        <h5>경력</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" name="experienceLevels" type="checkbox"
                                                   value="신입">
                                            <label class="form-check-label">
                                                신입
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="experienceLevels" type="checkbox"
                                                   value="경력">
                                            <label class="form-check-label">
                                                경력
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="experienceLevels" type="checkbox"
                                                   value="경력무관">
                                            <label class="form-check-label">
                                                경력무관
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col border-secondary border-end">
                                        <h5>학력</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox"
                                                   value="대학원이상">
                                            <label class="form-check-label">
                                                대학원이상
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox"
                                                   value="대졸이상">
                                            <label class="form-check-label">
                                                대졸이상
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox"
                                                   value="초대졸이상">
                                            <label class="form-check-label">
                                                초대졸이상
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox"
                                                   value="고졸이상">
                                            <label class="form-check-label">
                                                고졸이상
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox"
                                                   value="학력무관">
                                            <label class="form-check-label">
                                                학력무관
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <h5>채용형태</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" name="employmentTypes" type="checkbox"
                                                   value="정규직">
                                            <label class="form-check-label">
                                                정규직
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="employmentTypes" type="checkbox"
                                                   value="계약직">
                                            <label class="form-check-label">
                                                계약직
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="employmentTypes" type="checkbox"
                                                   value="인턴">
                                            <label class="form-check-label">
                                                인턴
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-2 d-flex justify-content-end">
                <div class="input-group d-flex">
                    <div class="flex-grow-0 custom-select-container ml-auto">
                        <select name="type" class="form-select custom-select">
                            <option value="all">전체</option>
                            <option ${param.type eq 'companyName'? 'selected' : ''} value="companyName">기업명</option>
                            <option ${param.type eq 'title'? 'selected' : ''} value="title">공고명</option>
                            <option ${param.type eq 'address'? 'selected' : ''} value="address">지역</option>
                        </select>
                    </div>
                    <input name="search" value="${param.search}" style="max-width: 300px;"
                           class="form-control flex-grow-1" type="search" placeholder="Search" aria-label="Search">
                    <button id="search-btn" class="btn btn-outline-success" type="submit">
                        검색
                    </button>
                    <c:if test="${not empty param}">
                        <div class="ms-3">
                            <button class="btn btn-outline-danger" type="button" id="cancel-search-btn">
                                <i class="fa-solid fa-x"></i>
                            </button>
                        </div>
                    </c:if>
                </div>
            </div>
        </form>

        <div class="row justify-content-center d-flex mt-3">
            <div class="col-lg-12 mb-3">
                <div id="count-div" style="background-color: beige; height: 50px; align-items: center"
                     class="d-flex justify-content-center ">
                </div>
            </div>
            <div class="col-lg-8 post-list">
                <input id="bucket-url" type="hidden" value="${bucketUrl}">
                <div id="posting-container">
                    <div class="single-post d-flex flex-row">
                        <div class="thumb me-5">
                            <div class="d-flex justify-content-center">
                                <img src="/img/job-img/post.png" alt="">
                            </div>
                            <ul class="tags">
                                <li>
                                    <a href="#">회사이름 대충 졸라게 긴거</a>
                                </li>
                            </ul>
                        </div>
                        <div class="details">
                            <div class="title d-flex flex-row justify-content-between">
                                <div class="titles posting-title">
                                    <a id="posting-link" href="single.html"><h4>공고명 대충 졸라게 긴거</h4></a>
                                    <h6>IT 및 소프트웨어 개발</h6>
                                </div>
                            </div>
                            <p>
                                경기도 고양시 어쩌구 저쩌구 어디어디 어디입니다.
                            </p>
                            <h5>정규직 대졸이상 경력무관</h5>
                            <p>2023-08-31</p>
                        </div>
                    </div>
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
    <div class="container-lg">
        <div class="row">
            <nav aria-label="Page navigation example">
                <ul id="page-ul" class="pagination justify-content-center">
                </ul>
            </nav>
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
<script src="/js/user/posting/list.js"></script>
</body>
</html>