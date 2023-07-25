<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <title>참여신청</title>
</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner />

<div class="container-lg mt-50">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <h3>${round}회차 참여 신청</h3>
            <div class="mb-3">
                <label for="input-company-name" class="form-label">기업이름 *</label>
                <input id="input-company-name" type="text" class="form-control" name="company-name"
                       placeholder="기업이름을 입력해주세요."/>
            </div>

            <div class="mb-3">
                <label for="input-registration-number" class="form-label">사업자등록번호 *</label>
                <div class="form-text">- 포함 입력</div>
                <input id="input-registration-number" type="text" class="form-control" name="registration-number"
                       placeholder="사업자등록번호를 입력해주세요"/>
            </div>

            <div class="mb-3">
                <label for="input-number-of-employees" class="form-label">사원수 *</label>
                <input id="input-number-of-employees" type="number" class="form-control" name="number-of-employees"/>
            </div>

            <div class="mb-3">
                <label for="input-establishment-date" class="form-label">설립일 *</label>
                <input id="input-establishment-date" type="date" class="form-control" name="establishment-date"/>
            </div>

            <div class="mb-3">
                <label for="input-revenue" class="form-label">매출액 *</label>
                <input id="input-revenue" type="number" class="form-control" name="revenue"/>
            </div>

            <div class="mb-3">
                <label for="input-ceo-name" class="form-label">대표자명 *</label>
                <input id="input-ceo-name" type="text" class="form-control" name="ceo-name"/>
            </div>

            <div class="mb-3">
                <label for="input-industry-id" class="form-label">업종 *</label>
                <select name="input-industry-id" class="form-select" id="input-industry-id">
                </select>
            </div>

            <div class="mb-3">
                <label for="input-address" class="form-label">주소 *</label>
                <div class="col-sm-6 mb-1">
                    <div class="input-group">
                        <input type="text" id="post-code" class="form-control input-sm" placeholder="우편번호" readonly>
                        <button class="btn btn-outline-secondary" type="button" id="search-address-btn">주소검색</button>
                    </div>
                </div>
                <input id="input-address" type="text" class="form-control mb-1" readonly placeholder="도로명 주소"/>
                <input id="input-detail-address" type="text" class="form-control mb-1" placeholder="상세주소"/>
            </div>

            <div class="mb-3">
                <label for="form-file" class="form-label">첨부 파일 *</label>
                <input class="form-control" name="files" type="file" id="form-file" multiple>
                <div class="form-text">총 10MB, 하나의 파일을 1MB를 초과할 수 없습니다.</div>
                <div class="form-text">회사 로고는 logo.png로 입력해주세요</div>
            </div>

            <div>
                <div class="form-text">정보가 충분하지 않을 시 신청이 보류되거나 반려될 수 있습니다. <br>
                * 표시는 필수로 입력해야합니다.</div>
                <button id="submit-btn" class="btn btn-primary" disabled>신청</button>
            </div>
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


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/company/join/reg.js"></script>
</body>
</html>
