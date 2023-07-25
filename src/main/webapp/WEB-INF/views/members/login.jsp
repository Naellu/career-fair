<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-06
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>
<html>
<head>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"--%>
<%--          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="--%>
<%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
    <%--    <my:font></my:font>--%>
    <title>Title</title>
    <style>
        .div-cloumn {
            width: 1.5px;
            height: 15px;
            background-color: rgba(0, 0, 0, 0.3);
            margin: 0px 7px;
        }

        a {
            text-decoration: none;
            color: black;
        }

        #find-id {
            cursor: pointer;
        }
    </style>

    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner />

<c:if test="${not empty message}">
    <div class="container-lg">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>

<div class="container-lg flex-grow-1 pt-50">
    <div class="row justify-content-center">
        <div class="col-8 col-md-8 col-lg-4">
            <h1 class="pb-30">로그인</h1>
            <form method="post">
                <div class="mb-3">
                    <label for="inputUsername" class="form-label"> 아이디</label> <input id="inputUsername"
                                                                                      class="form-control" type="text"
                                                                                      name="username"/>
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">암호</label> <input id="inputPassword"
                                                                                    class="form-control" type="password"
                                                                                    name="password"/>
                </div>
                <div class="col-lg-6">
                    <input class="btn btn-outline-dark loginbutton" type="submit" value="로그인"/>
                </div>
                <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                    <a href="/members/signup"><span>회원가입</span></a>
                    <div class="div-cloumn"></div>
                    <a href="/members/cosignup"><span>기업 회원가입</span></a>
                    <div class="div-cloumn"></div>
                    <span id="find-id" onclick="location.href='/members/useridfind'">아이디찾기</span>
                    <div class="div-cloumn"></div>
                    <span id="find-id" onclick="location.href='/members/sendPw'">비밀번호 찾기</span>
                </div>
            </form>
        </div>
    </div>
</div>

<my:job-footer />

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"--%>
<%--        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="--%>
<%--        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

<script src="/job-js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/job-js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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
