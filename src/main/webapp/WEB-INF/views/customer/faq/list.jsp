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
    <title>자주묻는질문</title>
</head>
<body>
<my:font/>
<my:job-header-nav/>

<my:job-inner-banner>
    자주묻는질문
</my:job-inner-banner>

<!-- Start blog-posts Area -->
<section class="blog-posts-area mt-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 post-list blog-post-list" id="noticeTable">
                <div>
                    <div id="list1">
                        <c:forEach items="${faq}" var="faq">
                            <div class="accordion">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse"
                                                data-bs-target="#collapse-${faq.faqId}" aria-expanded="false"
                                                aria-controls="collapse-${faq.faqId}">
                                            <h3>Q</h3> <br/>${faq.title}
                                        </button>
                                    </h2>
                                    <div id="collapse-${faq.faqId}" class="accordion-collapse collapse"
                                         aria-labelledby="heading-${faq.faqId}">
                                        <div class="accordion-body faq-content">${faq.content}</div>
                                            <%--                        <sec:authorize access="hasAuthority('admin')">--%>
                                            <%--                            <!-- 수정, 삭제 -->--%>
                                            <%--                            <a class="btn btn-secondary" href="/faq/modify/${faq.faqId }">수정</a>--%>
                                            <%--                            <button id="removeButton-${faq.faqId}" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">삭제</button>--%>
                                            <%--                        </sec:authorize>--%>
                                    </div>
                                </div>
                                    <%--                <!-- 삭제 -->--%>
                                    <%--                <div class="d-none">--%>
                                    <%--                    <form action="/faq/remove" method="post" id="removeForm-${faq.faqId}">--%>
                                    <%--                        <input type="text" name="id" value="${faq.faqId}" />--%>
                                    <%--                    </form>--%>
                                    <%--                </div>--%>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 sidebar">
                <sec:authorize access="hasAuthority('admin')">
                    <div class="d-flex">
                        <button type="button" class="btn btn-dark write-faq-btn" data-bs-toggle="modal"
                                data-bs-target="#faqWriteBtn">작성
                        </button>
                    </div>
                </sec:authorize>

                <div class="single-widget search-widget mt-3">
                    <div class="d-flex justify-content-end">
                        <div>
                            <form action="/faq" class="d-flex" role="search">
                                <div class="input-group">
                                    <select class="form-select flex-grow-0" style="width: 100px;" name="type" id="">
                                        <option value="all">전체</option>
                                        <option value="title" ${param.type eq 'title' ? 'selected' : '' }>제목
                                        </option>
                                        <option value="content" ${param.type eq 'content' ? 'selected' : '' }>본문
                                        </option>
                                    </select>

                                    <input value="${param.search }" name="search" class="form-control" type="search"
                                           placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="single-widget category-widget">
                    <h4 class="title">고객센터</h4>
                    <ul>
                        <li><a href="/qna/QnaList" class="justify-content-between align-items-center d-flex"><h6>
                            Q&A</h6></a></li>
                        <li><a href="/customer/notice/list"
                               class="justify-content-between align-items-center d-flex">
                            <h6>공지사항</h6></a></li>
                        <li><a href="/faq" class="justify-content-between align-items-center d-flex"><h6>FAQ</h6>
                        </a>
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

<!-- FAQ 작성을 위한 모달 -->
<div class="modal fade" id="faqWriteBtn" tabindex="-1" aria-labelledby="faqModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="faqModalLabel">FAQ 작성</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- FAQ 작성 폼 -->
                <form id="faqForm">
                    <div class="form-group">
                        <label for="faqTitle">제목</label>
                        <input type="text" class="form-control" id="faqTitle" required>
                    </div>
                    <div class="form-group">
                        <label for="faqContent">내용</label>
                        <textarea class="form-control" id="faqContent" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="submit" form="faqForm" class="btn btn-primary">등록</button>
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
<script src="/js/customer/faq/faq.js"></script>
</body>
</html>
