<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"--%>
    <%--          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="--%>
    <%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
    <%--    <my:font></my:font>--%>

    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <title>회차 등록</title>
    <style>
        .field-error {
            border-color: #dc3545;
            color: #dc3545;
        }
    </style>
</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner>
    회차 관리
</my:job-inner-banner>

<c:if test="${not empty message }">
    <div class="container-lg">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                ${message }
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>

<div class="container-lg mt-3">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <h3>회차 등록 하기</h3>
            <form:form method="post" modelAttribute="exhibitionInfo" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="round" class="form-label">회차</label>
                    <form:input path="round" type="number" id="round" class="form-control"/>
                    <form:errors path="round" cssClass="field-error"/>
                </div>

                <div class="mb-3">
                    <label for="title" class="form-label">박람회 타이틀</label>
                    <form:input path="title" id="title" type="text" class="form-control"/>
                    <form:errors path="title" cssClass="field-error"/>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">담당자 이메일</label>
                    <form:input path="managerEmail" id="email" type="email" class="form-control"/>
                    <form:errors path="managerEmail" cssClass="field-error"/>
                </div>

                <div class="mb-3">
                    <label for="organizer" class="form-label">개최자</label>
                    <form:input path="organizer" type="text" class="form-control"/>
                    <form:errors path="organizer" cssClass="field-error"/>
                </div>

                <div class="mb-3">
                    <label for="start-date" class="form-label">개최일</label>
                    <form:input path="startDate" id="start-date" type="date" class="form-control"/>
                    <form:errors path="startDate" cssClass="field-error"/>
                </div>

                <div class="mb-3">
                    <label for="end-date" class="form-label">폐막일</label>
                    <form:input path="endDate" id="end-date" type="date" class="form-control"/>
                    <form:errors path="endDate" cssClass="field-error"/>
                </div>

                <div class="mb-3">
                    <label for="input-address" class="form-label">주소</label>
                    <div class="input-group">
                        <form:input path="location" id="input-address" type="text" class="form-control mb-1"
                                    readonly="true" placeholder="도로명 주소"/>
                        <button class="btn btn-outline-secondary" type="button" id="search-address-btn">주소검색</button>
                    </div>
                    <form:errors path="location" cssClass="field-error"/>
                </div>

                <div class="mb-3">
                    <label for="bus" class="form-label">버스</label>
                    <form:input path="bus" id="bus" type="text" class="form-control"/>
                    <form:errors path="bus" cssClass="field-error"/>
                    <div class="form-text">, 없이 띄어쓰기로 구분해서 넣어주세요</div>
                </div>

                <div class="mb-3">
                    <label for="subway" class="form-label">지하철</label>
                    <form:input path="subway" id="subway" type="text" class="form-control"/>
                    <form:errors path="subway" cssClass="field-error"/>
                    <div class="form-text">, 없이 띄어쓰기로 구분해서 넣어주세요</div>
                </div>

                <div class="mb-3">
                    <label for="etc" class="form-label">기타</label>
                    <form:textarea path="etc" type="text" class="form-control" rows="5" readonly=""/>
                    <form:errors path="etc" cssClass="field-error"/>
                </div>

                <div class="mb-3">
                    <label for="form-file" class="form-label">첨부 파일</label>
                    <input class="form-control" name="files" type="file" id="form-file" multiple>
                    <div class="form-text">총 10MB, 하나의 파일을 1MB를 초과할 수 없습니다.</div>
                    <div class="form-text">로고는 logo.png로 등록해주세요</div>
                </div>

                <div>
                    <button class="btn btn-primary" type="submit">등록</button>
                    <a href="/admin/round" class="btn btn-primary">현재 회차 정보 보기</a>
                </div>
            </form:form>
        </div>
    </div>
</div>

<my:job-footer/>

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
<script src="/js/admin/round/reg.js"></script>
</body>
</html>