<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/css/notice.css">
    <my:font></my:font>
    <title>공지사항</title>
</head>
<body>
<my:navBar/>

<my:cheader>
    공지사항
</my:cheader>

<div class="container-lg mt-3 custom-div">
    <div class="d-flex justify-content-end">
        <div>
            <div class="input-group">
                <select id="type" class="form-select flex-grow-0" style="width: 120px;">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="writer">작성자</option>
                    <option value="content">내용</option>
                </select>
                <input id="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
                <button id="search-btn" class="btn btn-outline-success" type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </div>
        <sec:authorize access="hasAuthority('admin')">
            <div class="ms-5">
                <a class="btn btn-primary" href="/customer/notice/reg">글작성하기</a>
            </div>
        </sec:authorize>
    </div>

    <table id="noticeTable" class="table table-bordered ">
        <thead>
        <tr>
            <th>번호</th>
            <th style="text-align: center">제목</th>
            <th style="text-align: center">작성자</th>
            <th style="text-align: center">조회수</th>
            <th style="text-align: center">작성일</th>
        </tr>
        </thead>
        <tbody class="table-group-divider">
        </tbody>
    </table>

    <div class="container-lg">
        <div class="row">
            <nav aria-label="Page navigation example">
                <ul id="page-ul" class="pagination justify-content-center">
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
<script src="/js/customer/notice/list.js"></script>
</body>
</html>