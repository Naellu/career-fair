<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-13
  Time: 오전 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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

    <title>채용공고</title>

</head>
<body onload="defaultSet()">
<my:font />
<my:job-header-nav />
<my:job-inner-banner>
    채용 공고 수정
</my:job-inner-banner>

<sec:authentication property="name" var="userId" />

<div class="container mt-5">
    <form id="modifyForm" action="/company/posting/modify" method="POST">
        <div class="mb-3">
            <input type="hidden" name="postingId" value="${post.postingId}">
            <input type="hidden" name="memberId" value="${userId}">
            <input type="hidden" class="form-control" id="round" name="round" value="${post.round}" required>
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${post.title}" required>
            <label for="status" class="form-label">공고 상태</label>
            <select class="form-control" id="status" name="status" data-val="${post.status}" required>
                <option value="채용중">채용중</option>
                <option value="마감">마감</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="industryId" class="form-label">산업 ID</label>
            <select class="form-control" id="industryId" name="industryId" data-val="${post.industryId}" required>
                <c:forEach items="${industryList}" var="industry" varStatus="status">
                    <option value="${industry.industryId}">
                            ${status.index+1}. ${industry.industryName}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="hiringCount" class="form-label">채용 인원 수</label>
            <input type="number" class="form-control" id="hiringCount" name="hiringCount" value="${post.hiringCount}" required>
        </div>
        <div class="mb-3">
            <label for="spareCount" class="form-label">예비 인원 수</label>
            <input type="number" class="form-control" id="spareCount" name="spareCount" value="${post.spareCount}" required>
        </div>
        <div class="mb-3">
            <label for="startDate" class="form-label">시작일</label>
            <input type="date" class="form-control" id="startDate" name="startDate" min="" value="${post.startDate}" readonly required>
        </div>
        <div class="mb-3">
            <label for="endDate" class="form-label">종료일</label>
            <input type="date" class="form-control" id="endDate" name="endDate" min="" value="${post.endDate}" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">주소</label>
            <input type="text" class="form-control" id="address" name="address"
                   value="${post.address}" required>
        </div>
        <div class="mb-3">
            <label for="salary" class="form-label">급여</label>
            <input type="text" class="form-control" id="salary" maxlength="12" name="salary" value="${post.salary}" required>
            <div id="salaryDetail" class="form-text"></div>
            <input id="inputSalary" type="hidden">
        </div>
        <div class="mb-3">
            <label for="preferences" class="form-label">우대사항</label>
            <textarea class="form-control" id="preferences" name="preference" rows="3" required>${post.preference}</textarea>
        </div>
        <div class="mb-3">
            <label for="benefits" class="form-label">혜택</label>
            <textarea class="form-control" id="benefits" name="benefit" rows="3" required>${post.benefit}</textarea>
        </div>
        <div class="mb-3">
            <label for="requirements" class="form-label">자격 요건</label>
            <textarea class="form-control" id="requirements" name="requirement" rows="3" required>${post.requirement}</textarea>
        </div>
        <div class="mb-3">
            <label for="etc" class="form-label">기타</label>
            <textarea class="form-control" id="etc" name="etc" rows="3" required>${post.etc}</textarea>
        </div>
        <div class="mb-3">
            <label for="employmentType" class="form-label">고용 형태</label>
            <select class="form-control" id="employmentType" name="employmentType" data-val="${post.employmentType}" required>
                <option value="정규직">정규직</option>
                <option value="계약직">계약직</option>
                <option value="인턴">인턴</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="experienceLevel" class="form-label">경력 요건</label>
            <select class="form-control" id="experienceLevel" name="experienceLevel" data-val="${post.experienceLevel}" required>
                <option value="경력무관">경력무관</option>
                <option value="신입">신입</option>
                <option value="경력">경력</option>
            </select>

        </div>
        <div class="mb-3">
            <label for="educationLevel" class="form-label">학력 요건</label>
            <select class="form-control" id="educationLevel" name="educationLevel" data-val="${post.educationLevel}"required>
                <option value="학력무관">학력무관</option>
                <option value="고졸이상">고졸이상</option>
                <option value="초대졸이상">초대졸이상</option>
                <option value="대졸이상">대졸이상</option>
                <option value="대학원이상">대학원이상</option>
            </select>
        </div>
    </form>
        <div class="row justify-content-end">
            <div class="col-md-6 text-right">
                <button type="submit" class="btn btn-outline-primary" form="modifyForm">수정</button>
                <button class="btn btn-outline-secondary"
                        onclick="location.href='/company/posting/detail?postingId=${post.postingId}'">취소
                </button>
            </div>
        </div>
        <br>
</div>

<my:job-footer />


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

<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"--%>
<%--        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="--%>
<%--        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>


<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"--%>
<%--        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="--%>
<%--        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

<script src="/js/posting/modify.js"></script>

</body>
</html>