<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
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
    <!-- Site Title -->
    <title>공지사항</title>

    <style>
        #noticeTable .single-post h1:hover {
            color: #00b6a1;
        }

        .badge {
            font-size: 15px;
        }
    </style>
</head>
<body>
<my:font/>
<my:job-header-nav/>

<my:job-inner-banner>
    공지사항
</my:job-inner-banner>

<!-- Start blog-posts Area -->
<section class="blog-posts-area mt-3">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 post-list blog-post-list" id="noticeTable">
                <div class="single-post">
                    <a href="blog-single.html">
                        <h1>
                            공지사항입니다
                        </h1>
                    </a>
                    <p>
                        <i class="fa-solid fa-pen"></i> 관리자
                    </p>
                    <div class="bottom-meta">
                        <div class="user-details row align-items-center">
                            <div class="comment-wrap col-lg-6">
                                <ul>
                                    <li><a href="#"><i class="fa-solid fa-check"></i> 조회수 100</a></li>
                                    <li><a href="#"><i class="fa-regular fa-calendar-days"></i> 2023-07-07</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 sidebar">
                <sec:authorize access="hasAuthority('admin')">
                    <div class="d-flex">
                        <a class="btn btn-success" href="/customer/notice/reg">글작성하기</a>
                    </div>
                </sec:authorize>
                <div class="single-widget mt-3">
                    <div class="d-flex justify-content-end ">
                        <div>
                            <div class="input-group">
                                <select id="type" class="form-select flex-grow-0" style="width: 90px;">
                                    <option value="all">전체</option>
                                    <option value="title">제목</option>
                                    <option value="writer">작성자</option>
                                    <option value="content">내용</option>
                                </select>
                                <input id="search" class="form-control" type="search" placeholder="Search"
                                       aria-label="Search">
                                <button id="search-btn" class="btn btn-outline-success" type="submit">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                                <div class="ms-3" id="cancel">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="single-widget category-widget">
                    <h4 class="title">고객센터</h4>
                    <ul>
                        <li><a href="/qna/QnaList" class="justify-content-between align-items-center d-flex"><h6>
                            Q&A</h6></a></li>
                        <li><a href="/customer/notice/list" class="justify-content-between align-items-center d-flex">
                            <h6>공지사항</h6></a></li>
                        <li><a href="/faq" class="justify-content-between align-items-center d-flex"><h6>FAQ</h6></a>
                        </li>
                    </ul>
                </div>

                <div class="single-widget category-widget">
                    <h4 class="title">중요 공지</h4>
                    <ul id="top-notice">
                        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>공지사항2</h6></li>
                    </ul>
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
        </div>
    </div>
</section>

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
<script src="/js/customer/notice/list.js"></script>
</body>
</html>