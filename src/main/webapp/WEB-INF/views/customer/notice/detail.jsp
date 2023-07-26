<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    </style>
</head>
<body>
<my:font/>
<my:job-header-nav/>

<my:job-inner-banner>
    공지사항
</my:job-inner-banner>

<!-- Start post Area -->
<section class="post-area section-gap">
    <div class="container">
        <div class="row justify-content-center d-flex">
            <div class="col-lg-8 post-list">
                <input id="bucket-url" type="hidden" value="${bucketUrl}">
                <div style="text-align: center">
                    <h2 id="title" class="my-4">공지사항제목</h2>
                </div>

                <div class="single-post job-experience">
                    <ul id="notice-ul">
                        <li>
                            <i class="fa-regular fa-square-check"></i>
                            <span>작성자 : admin</span>
                        </li>
                        <li>
                            <i class="fa-regular fa-square-check"></i>
                            <span>작성일 : 2023-07-26</span>
                        </li>
                    </ul>
                </div>

                <div class="single-post job-details mt-3">
                    <h4 class="my-4">내용</h4>
                    <textarea id="content" style="resize: none; font-size: 17px" class="form-control-plaintext"
                              cols="30" readonly></textarea>
                </div>

                <div id="file-name" class="single-post job-details mt-3">
                    <h4 class="my-4">첨부파일</h4>
                </div>

                <div class="justify-content-center d-flex">
                    <div class="mb-3">
                        <a id="prev" class="btn btn-outline-primary">이전글로 가기</a>
                        <a class="btn btn-outline-primary" href="/customer/notice/list">목록으로 가기</a>
                        <a id="next" class="btn btn-outline-primary">다음글로 가기</a>
                    </div>
                </div>
                <sec:authorize access="hasAuthority('admin')">
                    <div class="justify-content-center d-flex">
                        <div>
                            <div>
                                <a class="btn btn-primary" href="/customer/notice/modify/${noticeId}">수정</a>
                                <button id="removeButton" class="btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#deleteConfirmModal">삭제
                                </button>
                            </div>
                        </div>
                    </div>
                </sec:authorize>
            </div>
            <div class="col-lg-4 sidebar">
                <div class="single-widget category-widget">
                    <h4 class="title">고객센터</h4>
                    <ul>
                        <li><a href="/qna/QnaList" class="justify-content-between align-items-center d-flex"><h6>
                            QNA</h6></li>
                        <li><a href="/customer/notice/list" class="justify-content-between align-items-center d-flex">
                            <h6>공지사항</h6></li>
                        <li><a href="/faq" class="justify-content-between align-items-center d-flex"><h6>FAQ</h6></li>
                    </ul>
                </div>

                <div class="single-widget category-widget">
                    <h4 class="title">중요 공지</h4>
                    <ul id="top-notice">
                        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>공지사항2</h6></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End post Area -->

<!-- Modal -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="color: black;">공지를 삭제 하시겠습니까?</div>
            <div class="modal-footer">
                <button id="remove-btn" type="button" class="btn btn-danger">삭제</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


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
<script src="/js/customer/notice/detail.js"></script>
</body>
</html>