<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-11
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>
<my:font/>
<my:job-header-nav/>

<my:job-inner-banner>
    Q&A
</my:job-inner-banner>

<div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body"></div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>


<!-- Start blog-posts Area -->
<section class="blog-posts-area mt-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 post-list blog-post-list">
                <div class="d-flex">
                    <div class="me-auto">
                        <div class="d-none">
                            <h1>
                                <span id="questionIdText"> ${question.id}</span>
                            </h1>
                        </div>
                        <br>
                        <br>

                        <div class="d-flex justify-content-between">
                            <h3 id="titleInput">${question.title}</h3>
                            <p id="insertedInput">작성일 : ${question.created}</p>
                        </div>

                        <hr class="long-hr">

                        <div class="mb-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea id="content" style="background-color: white" class="form-control" cols="90"
                                      rows="10"
                                      readonly>${question.content}</textarea>
                        </div>

                        <div class="d-flex">
                            <a class="btn btn-primary me-1" href="/qna/QnaList">목록으로 가기</a>
                            <sec:authorize access="authentication.name eq #question.memberId">
                                <a class="btn btn-secondary me-1" href="/qna/modify/${question.id }">수정</a>
                                <button type="button" class="btn btn-danger" form="removeForm"
                                        data-bs-toggle="modal"
                                        data-bs-target="#deleteConfirmModal">삭제
                                </button>
                            </sec:authorize>
                        </div>
                        <!-- 삭제 -->
                        <div class="d-none">
                            <form action="/qna/remove" method="post" id="removeForm">
                                <input type="text" name="id" value="${question.id }"/>
                            </form>
                        </div>

                        <div class="modal fade" id="deleteConfirmModal" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">삭제 하시겠습니까?</div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기
                                        </button>
                                        <button type="submit" class="btn btn-danger" form="removeForm">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <sec:authorize
                                access="hasAuthority('admin') or hasAuthority('company') or hasAuthority('recruiter')">
                        <div id="answerContainer" class="mt-3">
                            <div class="mb-3" id="addAnswerContainer">
                                <div class="input-group">
                                    <div class="form-floating">
                                    <textarea style="height: 97px" placeholder="답변을 남겨주세요" class="form-control"
                                              id="answerTextArea"></textarea>
                                        <label for="answerTextArea">답변을 남겨주세요</label>
                                    </div>
                                    <button class="btn btn-outline-primary" id="sendAnswerBtn"><i
                                            class="fa-regular fa-paper-plane"></i></button>
                                </div>
                            </div>
                            </sec:authorize>

                            <ul class="list-group" id="answerListContainer">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 sidebar">
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
                                   class="justify-content-between align-items-center d-flex">
                                <h6>${notice.title}</h6>
                            </a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="container-lg">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
        </div>
    </div>
</div>


<sec:authorize access="hasAuthority('admin') or hasAuthority('company') or hasAuthority('recruiter')">
    <!-- 댓글 삭제 Modal -->
    <div class="modal fade" id="deleteAnswerConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">답변 삭제 확인</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">삭제 하시겠습니까?</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button id="deleteAnswerModalButton" data-bs-dismiss="modal" type="submit" class="btn btn-danger">
                        삭제
                    </button>
                </div>
            </div>
        </div>
    </div>

    <%-- 댓글 수정 모달 --%>
    <div class="modal fade" id="answerUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">답변 수정</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="updateAnswerContainer">
                        <input type="hidden" id="answerUpdateIdInput"/>
                        <textarea class="form-control" id="answerUpdateTextArea"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="updateAnswerBtn" data-bs-dismiss="modal">수정
                    </button>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>

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
<script src="/js/qna/answer.js"></script>


</body>
</html>