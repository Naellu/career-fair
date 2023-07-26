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
    <title>Q&A</title>
    <style>
        .container-lg {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<my:font/>
<my:job-header-nav/>

<my:job-inner-banner>
    Q&A
</my:job-inner-banner>

<!-- Start blog-posts Area -->
<section class="blog-posts-area mt-3">
    <div class="container">
        <div class="row mt-3">
            <div class="col-lg-8 post-list blog-post-list">
                <c:forEach items="${question}" var="question">
                    <div class="single-post">
                        <a href="/qna/id/${question.id}">
                            <h1>
                                    ${question.title}
                            </h1>
                        </a>
                        <p>
                            <i class="fa-solid fa-pen"></i> ${question.memberId}
                        </p>
                        <div class="bottom-meta">
                            <div class="user-details row align-items-center">
                                <div class="comment-wrap col-lg-6">
                                    <ul>
                                        <li>댓글 개수: ${question.answerCount}개</a></li>
                                        <li>답변 여부: ${question.isAnswered ? '답변 완료' : '미답변'}</li>
                                        <li>작성일: ${question.created}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="col-lg-4 sidebar">
                <sec:authorize access="isAuthenticated()">
                <div class="single-widget search-widget">
                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-success" onclick="location.href='/qna/add'">Q&A 작성
                            </button>
                        </div>
                </div>
                </sec:authorize>

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
                    <ul>
                        <c:forEach items="${topNoticeList}" var="notice">
                            <li><a href="/customer/notice/${notice.noticeId}"
                                   class="justify-content-between align-items-center d-flex"><h6>${notice.title}</h6>
                            </a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <%-- 페이징 부분 --%>
            <div class="container-lg">
                <div class="row">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <c:if test="${pageInfo.currentPageNum gt 1}">
                                <my:questionPageInfo pageNum="${pageInfo.currentPageNum - 1}">
                                    <i class="fa-solid fa-angle-left"></i>
                                </my:questionPageInfo>
                            </c:if>

                            <c:forEach begin="${pageInfo.leftPageNum}" end="${pageInfo.rightPageNum}" var="pageNum">
                                <my:questionPageInfo pageNum="${pageNum}">
                                    ${pageNum}
                                </my:questionPageInfo>
                            </c:forEach>

                            <!-- 다음 버튼 -->
                            <c:if test="${pageInfo.currentPageNum lt pageInfo.lastPageNum}">

                                <my:questionPageInfo pageNum="${pageInfo.currentPageNum + 1}">
                                    <i class="fa-solid fa-angle-right"></i>
                                </my:questionPageInfo>

                            </c:if>
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
</body>
</html>