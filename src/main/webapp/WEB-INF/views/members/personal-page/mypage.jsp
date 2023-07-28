<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-10
  Time: 오후 2:02
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

    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">--%>
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"--%>
    <%--          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="--%>
    <%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
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

    <title>마이페이지</title>
    <style>
        .single-price li {
            font-size: 17px;
            color: black;
        }

        .single-price li:hover {
            color: blue;
        }

        .single-price a {
            color: black;
        }

        .single-price a:hover {
            color: blue;
        }
    </style>
</head>
<body>
<my:font/>
<my:job-header-nav/>
<my:job-inner-banner>
    ${members.name}님의 마이페이지
</my:job-inner-banner>

<sec:authentication property="name" var="userId"/>

<section class="price-area mt-5" id="price">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="single-price no-padding">
                    <div class="price-top">
                        <h4>쪽지함</h4>
                    </div>
                    <ul class="lists">
                        <c:url value="/note/list/receive" var="noteListURL">
                            <c:param name="memberId" value="${userId}"/>
                        </c:url>
                        <li><span onclick="location.href='${noteListURL}'" style="cursor: pointer;">받은쪽지함</span></li>
                        <c:url value="/note/list/send" var="noteListURL">
                            <c:param name="memberId" value="${userId}"/>
                        </c:url>
                        <li><span onclick="location.href='${noteListURL}'" style="cursor: pointer;">보낸쪽지함</span></li>
                        <c:url value="/note/list/unread" var="noteListURL">
                            <c:param name="memberId" value="${userId}"/>
                        </c:url>
                        <li><span onclick="location.href='${noteListURL}'" style="cursor: pointer;">안읽은쪽지함[${unreadNote}]</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="single-price no-padding">
                    <div class="price-top">
                        <h4>입사지원</h4>
                    </div>
                    <ul class="lists">
                        <li><a href="/members/personal-page/apply/list">목록보기</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="single-price no-padding">
                    <div class="price-top">
                        <h4>이력서</h4>
                    </div>
                    <ul class="lists">
                        <li><a href="/resume/">내 이력서 보기</a></li>
                        <li><a href="/resume/write">이력서 작성하기</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="single-price no-padding">
                    <div class="price-top">
                        <h4>스크랩 공고</h4>
                    </div>
                    <ul class="lists">
                        <li><a href="/scrap/list">목록보기</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="single-price no-padding">
                    <div class="price-top">
                        <h4>내정보보기</h4>
                    </div>
                    <ul class="lists">
                        <li><a href="/members/personal-page/myinfo?id=<sec:authentication property="name" />">내 정보</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</section>

<my:job-footer/>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"--%>
<%--        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="--%>
<%--        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

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