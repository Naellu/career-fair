<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채용공고</title>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
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


</head>
<body onload="defaultSet()">
<sec:authentication property="name" var="userId" />

<my:font />
<my:job-header-nav />
<my:job-inner-banner>
    채용 공고 등록
</my:job-inner-banner>

<div class="container mt-5">
    <form action="/company/posting/add" method="POST">
        <div class="mb-3">
            <input type="hidden" class="form-control" id="companyId" name="companyId" value="${companyList[0].companyId}" required>
            <input type="hidden" name="memberId" value="${userId}">
            <input type="hidden" class="form-control" id="round" name="round" value="${companyList[0].round}" required>
            <input type="hidden" class="form-control" id="status" name="status" value="채용중" required>

            <label for="companyName" class="form-label">회사 선택</label>
            <select class="form-control" name="companyName" id="companyName">
                <c:forEach items="${companyList}" var="company" varStatus="status">
                    <option value="${company.companyName}"
                            data-company-id="${company.companyId}"
                            data-round="${company.round}"
                            data-industry-id="${company.industryId}"
                            data-address="${company.address}, ${company.detailAddress}"
                    >${status.index + 1}. ${company.companyName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="mb-3">
            <label for="industryId" class="form-label">산업 ID</label>
            <select class="form-control" id="industryId" name="industryId" required>
                <c:forEach items="${industryList}" var="industry" varStatus="status">
                    <option value="${industry.industryId}">
                            ${status.index+1}. ${industry.industryName}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="hiringCount" class="form-label">채용 인원 수</label>
            <input type="number" class="form-control" id="hiringCount" name="hiringCount" required>
        </div>
        <div class="mb-3">
            <label for="spareCount" class="form-label">예비 인원 수</label>
            <input type="number" class="form-control" id="spareCount" name="spareCount" required>
        </div>
        <div class="mb-3">
            <label for="startDate" class="form-label">시작일</label>
            <input type="date" class="form-control" id="startDate" name="startDate" min="" required>
        </div>
        <div class="mb-3">
            <label for="endDate" class="form-label">종료일</label>
            <input type="date" class="form-control" id="endDate" name="endDate" min="" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">주소</label>
            <input type="text" class="form-control" id="address" name="address"
                   value="${companyList[0].address}, ${companyList[0].detailAddress}" required>
        </div>
        <div class="mb-3">
            <label for="salary" class="form-label">급여</label>
            <input type="text" class="form-control" id="salary" maxlength="12" name="salary" required>
                <div id="salaryDetail" class="form-text"></div>
        </div>
        <div class="mb-3">
            <label for="preferences" class="form-label">우대사항</label>
            <textarea class="form-control" id="preferences" name="preference" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="benefits" class="form-label">혜택</label>
            <textarea class="form-control" id="benefits" name="benefit" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="requirements" class="form-label">자격 요건</label>
            <textarea class="form-control" id="requirements" name="requirement" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="etc" class="form-label">기타</label>
            <textarea class="form-control" id="etc" name="etc" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="employmentType" class="form-label">고용 형태</label>
            <select class="form-control" id="employmentType" name="employmentType" required>
                <option value="정규직" selected>정규직</option>
                <option value="계약직">계약직</option>
                <option value="인턴">인턴</option>
            </select>

        </div>
        <div class="mb-3">
            <label for="experienceLevel" class="form-label">경력 요건</label>
            <select class="form-control" id="experienceLevel"name="experienceLevel" required>
                <option value="무관" selected>경력무관</option>
                <option value="신입">신입</option>
                <option value="경력">경력</option>
            </select>

        </div>
        <div class="mb-3">
            <label for="educationLevel" class="form-label">학력 요건</label>
            <select class="form-control" id="educationLevel" name="educationLevel" required>
                <option value="무관" selected>학력무관</option>
                <option value="고졸이상">고졸이상</option>
                <option value="초대졸이상">초대졸이상</option>
                <option value="대졸이상">대졸이상</option>
                <option value="대학원이상">대학원이상</option>
            </select>
        </div>
        <div class="row justify-content-end">
            <div class="col-md-6 text-right">
                <button type="submit" class="btn btn-outline-primary">등록</button>
                <button class="btn btn-outline-secondary" onclick="location.href='/company/posting/list?userId=${userId}'">취소</button>
            </div>
        </div>
        <br>
    </form>
</div>

<my:job-footer />

<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"--%>
<%--        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="--%>
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

<script src="/js/posting/add.js"></script>

</body>
</html>
