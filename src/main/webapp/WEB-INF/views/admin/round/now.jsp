<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>

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

    <title>회차관리</title>

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

<div class="container-lg mt-30">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <h3>현재 회차 정보</h3>
            <div class="mb-3">
                <label for="round" class="form-label">회차</label>
                <input id="round" type="number" class="form-control" value="${exhibitionInfo.round}" readonly/>
            </div>

            <div class="mb-3">
                <label for="title" class="form-label">박람회 타이틀</label>
                <input id="title" type="text" class="form-control" value="${exhibitionInfo.title}" readonly/>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">담당자 이메일</label>
                <input id="email" type="email" class="form-control" value="${exhibitionInfo.managerEmail}"/>
            </div>

            <div class="mb-3">
                <label for="organizer" class="form-label">개최자</label>
                <input id="organizer" type="text" class="form-control" value="${exhibitionInfo.organizer}"/>
            </div>

            <div class="mb-3">
                <label for="start-date" class="form-label">개최기간</label>
                <input id="start-date" type="text" class="form-control"
                       value="${exhibitionInfo.startDate} ~ ${exhibitionInfo.endDate}"/>
            </div>

            <div class="mb-3">
                <label for="input-address" class="form-label">주소</label>
                <input id="input-address" type="text" class="form-control mb-1" value="${exhibitionInfo.location}"
                       readonly placeholder="도로명 주소"/>
            </div>

            <div class="mb-3">
                <label for="bus" class="form-label">버스</label>
                <input id="bus" type="text" class="form-control" value="${exhibitionInfo.bus}"/>
            </div>

            <div class="mb-3">
                <label for="subway" class="form-label">지하철</label>
                <input id="subway" type="text" class="form-control" value="${exhibitionInfo.subway}"/>
            </div>

            <div class="mb-3">
                <label for="etc" class="form-label">기타</label>
                <textarea id="etc" rows="5" class="form-control">${exhibitionInfo.etc}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">파일목록</label>
                <c:forEach items="${exhibitionInfo.fileName}" var="fileName">
                    <a class="form-control" href="${bucketUrl}/exhibitionInfo/${exhibitionInfo.round}/${fileName}"
                       download="${fileName}">${fileName}</a>
                </c:forEach>
            </div>

            <div>
                <a href="/admin/round/update" class="btn btn-primary">현재 회차 수정</a>
                <a href="/admin/round/reg" class="btn btn-danger">새 회차 등록</a>
                <%--<button id="send-mail-btn" type="button" class="btn btn-success">메일보내기</button>--%>
            </div>
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

<script src="/js/admin/round/now.js"></script>
</body>
</html>