<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>

<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <my:font></my:font>
    <title>기업정보</title>
</head>
<body>
<my:navBar/>

<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 id="c-header" class="display-4 fw-bolder">
            </h1>
            <p class="lead fw-normal text-white-50 mb-0"></p>
        </div>
    </div>
</header>

<div class="container-lg">
    <div class="mt-5">
        <table id="company-table" class="table table-bordered">
            <caption class="caption-top"><h3>기업 상세 정보</h3></caption>
            <tbody>
            </tbody>
        </table>
    </div>

    <div class="mt-3">
        다 음 지 도
    </div>

    <%-- 현재 공고 --%>
    <div class="mt-3">
        <table id="posting-table" class="table table-bordered custom-div">
            <caption class="caption-top"><h3>채용 공고</h3></caption>
            <thead class="table-dark">
            <tr>
                <th style="width: 200px;">기간</th>
                <th>공고명</th>
                <th style="width: 100px;">채용인원</th>
                <th style="width: 100px;">고용형태</th>
                <th style="width: 100px;">경력</th>
                <th style="width: 100px;">학력</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>2023.07.11 ~ 2023.07.12</td>
                <td>노예구함</td>
                <td>500명</td>
                <td>노예</td>
                <td>10년</td>
                <td>학력</td>
            </tr>
            <tr>
                <td>2023-1203</td>
                <td>노예구함</td>
                <td>500명</td>
                <td>노예</td>
                <td>10년</td>
                <td>학력</td>
            </tr>
            <tr>
                <td>2023-1203</td>
                <td>노예구함</td>
                <td>500명</td>
                <td>노예</td>
                <td>10년</td>
                <td>학력</td>
            </tr>
            </tbody>
        </table>
    </div>

    <%-- 지난 공고 --%>
    <div class="mt-3">
        <table id="past-posting-table" class="table table-bordered custom-div">
            <caption class="caption-top"><h3>지난 공고</h3></caption>
            <thead class="table-dark">
            <tr>
                <th style="width: 200px;">기간</th>
                <th>공고명</th>
                <th style="width: 100px;">채용인원</th>
                <th style="width: 100px;">고용형태</th>
                <th style="width: 100px;">경력</th>
                <th style="width: 100px;">학력</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>2023.07.11 ~ 2023.07.12</td>
                <td>노예구함</td>
                <td>500명</td>
                <td>노예</td>
                <td>10년</td>
                <td>학력</td>
            </tr>
            </tbody>
        </table>
        <div class="row mt-2">
            <nav aria-label="Page navigation example">
                <ul id="page-ul" class="pagination justify-content-center">
                    <li>fsd</li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/company/detail.js"></script>
</body>
</html>