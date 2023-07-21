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
    <title>참여기업목록</title>

</head>
<body>
<my:navBar/>

<my:cheader>
    참 여 목 록
</my:cheader>

<section class="mt-3">
    <div class="container-lg">
        <nav class="navbar navbar-expand-lg bg-body-white">
            <div class="container-fluid bg-white">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="round-ul" class="navbar-nav me-auto mb-2 mb-lg-0 nav-tabs nav-pills">
                    </ul>
                </div>
            </div>
        </nav>

        <div class="d-flex justify-content-end mt-3">
            <select id="industry-select" class="form-select flex-grow-0" style="width: 250px;" name="type">
            </select>
            <select id="type" class="form-select flex-grow-0" style="width: 120px;">
                <option value="all">전체</option>
                <option value="companyName">기업명</option>
                <option value="address">지역</option>
            </select>
            <input id="search" class="form-control" type="search" placeholder="Search"
                   aria-label="Search">
            <button id="search-btn" class="btn btn-outline-success" type="button">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>

        <div>
            <div class="container px-4 px-lg-5 mt-5">
                <div id="company-view"
                     class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"></div>
            </div>
        </div>
    </div>
    <div style="text-align: center">
        <button id="page-btn" class="btn" style="width: 500px; background-color: lightgray">
            목 록 더 보 기
        </button>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/company/list.js"></script>
</body>
</html>