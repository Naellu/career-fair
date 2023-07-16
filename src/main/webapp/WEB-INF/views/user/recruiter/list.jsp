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
    <title>참여현황</title>
    <style>
        .custom-div {
            max-width: 1000px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<my:navBar/>

<my:cheader>
    ${memberId}님의 참여 현황
</my:cheader>

<div class="container-lg d-flex mt-3">
    <nav class="navbar navbar-expand-lg bg-body-white ">
        <div class="container-fluid bg-white">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul id="round-btn" class="navbar-nav me-auto mb-2 mb-lg-0 nav-tabs nav-pills">
                    <li class="nav-item ms-5">
                        <button value="all" class="nav-link">전체</button>
                    </li>
                    <li class="nav-item">
                        <button value="now" class="nav-link">현재회차</button>
                    </li>
                    <li class="nav-item">
                        <button value="past" class="nav-link">지난회차</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div>
        <a class="btn btn-success" href="/user/recruiter/reg">참여신청하기</a>
    </div>
</div>
<div class="container-lg custom-div">
    <table id="recruiter-table" class="table table-bordered">
        <thead>
        <tr>
            <th style="text-align: center; width: 70px">회차</th>
            <th style="text-align: center">회사명</th>
            <th style="text-align: center; width: 150px">사업자등록번호</th>
            <th style="text-align: center; width: 100px">대표자명</th>
            <th style="text-align: center; width: 100px">상태</th>
            <th style="text-align: center; width: 150px">상세페이지</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/user/recruiter/list.js"></script>
</body>
</html>