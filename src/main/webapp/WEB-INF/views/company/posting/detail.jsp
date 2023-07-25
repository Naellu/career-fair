<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-12
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Title</title>

</head>
<body onload="changeSalary(${post.salary})">

<my:font />
<my:job-header-nav />
<my:job-inner-banner />

<c:if test="${not empty message}">
    <script>alert('${message}')</script>
</c:if>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <img src="[회사 로고 경로]" class="img-fluid rounded-circle mx-auto d-block" alt="회사 로고">
            <h2 class="text-center my-4">${company.companyName}</h2>


            <h4 class="my-4">${post.title} (${post.status})</h4>
            <h5 class="my-3">모집기간 : ${post.startDate} ~ ${post.endDate}</h5>
            <h5 class="my-3">채용인원 : ${post.hiringCount}</h5>
            <h5 class="my-3">요구학력 : ${post.educationLevel}</h5>
            <h5 class="my-3">요구경력 : ${post.experienceLevel}</h5>
            <h5 class="my-3">근무 조건</h5>
            <ul>
                <li>근무지: ${company.address}</li>
                <li>근무형태: ${post.employmentType}</li>
                <li id="salary">급여: </li>
            </ul>

            <h4 class="my-4">복리후생</h4>
            <textarea style="resize: none" class="form-control-plaintext" cols="30" rows="5" readonly>${post.benefit}
            </textarea>


            <h4 class="my-4">주요 산업</h4>
            <textarea style="resize: none" class="form-control-plaintext" cols="30" rows="5" readonly>${industry}
            </textarea>


            <h4 class="my-4">자격 요건</h4>
            <textarea style="resize: none" class="form-control-plaintext" cols="30" rows="5" readonly>${post.requirement}
            </textarea>


            <h4 class="my-4">우대 사항</h4>
            <textarea style="resize: none" class="form-control-plaintext" cols="30" rows="5" readonly>${post.preference}
            </textarea>
            <h4 class="my-4">기타 사항</h4>
                <textarea style="resize: none" class="form-control-plaintext" cols="30" rows="5" readonly>${post.etc}
                </textarea>
            <div style="text-align: right;">
                <button class="btn btn-outline-success"
                        onclick="location.href='/company/posting/modify?postingId=${post.postingId}'">
                    수정</button>
                <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deletePosting">삭제</button>
                <button class="btn btn-outline-secondary"
                        onclick="location.href='/company/posting/list?memberId=${post.memberId}'">
                    목록</button>
            </div>
            <br>
        </div>
    </div>
</div>

<%--삭제 모달--%>
<div class="d-none">
    <form action="/company/posting/delete" method="post" id="deletePostingForm">
        <input type="number" name="postingId" value="${post.postingId}">
        <input type="number" name="applicationCount" value="${post.applicationCount}">
        <input type="text" name="status" value="${post.status}">
        <input type="text" name="memberId" value="${post.memberId}">
    </form>
</div>
<div class="modal fade" id="deletePosting" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deletePostingLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="deletePostingLabel">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                해당공고를 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-outline-danger" form="deletePostingForm">삭제</button>
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<my:job-footer />


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

<script src="/js/posting/detail.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>