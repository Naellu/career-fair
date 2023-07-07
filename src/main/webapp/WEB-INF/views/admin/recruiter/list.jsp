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
    <title>참여신청목록</title>
</head>
<body>
<my:navBar/>
<div class="container-lg">
    <nav class="navbar navbar-expand-lg bg-body-white">
        <div class="container-fluid bg-white">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul id="status-btn" class="navbar-nav me-auto mb-2 mb-lg-0 nav-tabs nav-pills">
                    <li class="nav-item ms-5">
                        <button value="all" class="nav-link">전체</button>
                    </li>
                    <li class="nav-item">
                        <button value="review" class="nav-link">심사중</button>
                    </li>
                    <li class="nav-item">
                        <button value="hold" class="nav-link">보류</button>
                    </li>
                    <li class="nav-item">
                        <button value="approved" class="nav-link">승인</button>
                    </li>
                    <li class="nav-item">
                        <button value="rejected" class="nav-link">반려</button>
                    </li>
                </ul>

                <div class="d-flex">
                    <div class="input-group">
                        <select id="type" class="form-select flex-grow-0" style="width: 120px;" name="type">
                            <option value="all">전체</option>
                            <option value="memberId">채용담당자</option>
                            <option value="companyName">회사명</option>
                            <option value="registrationNumber">사업자등록번호</option>
                        </select>
                        <input id="search" name="search" class="form-control" type="search" placeholder="Search"
                               aria-label="Search" value="${param.search }">
                        <button id="search-btn" class="btn btn-outline-success" type="submit">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
<div class="container-lg custom-div">
    <table id="recruiter-table" class="table">
        <thead>
        <tr>
            <th>회차</th>
            <th>채용담당자</th>
            <th>회사명</th>
            <th>사업자등록번호</th>
            <th>설립일</th>
            <th>대표자명</th>
            <th>상태</th>
            <th>상세페이지</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <div class="container-lg">
        <div class="row">
            <nav aria-label="Page navigation example">
                <ul id="page-ul" class="pagination justify-content-center">
                    1
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
<script src="/js/admin/recruiter/list.js"></script>
</body>
</html>