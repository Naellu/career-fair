<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .table thead th {
            text-align: left;
        }

        .table tbody td {
            text-align: left;
        }

        .table tbody p {
            text-align: left;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .custom-div {
            max-width: 800px; /* 원하는 크기로 조절합니다. */
            margin: 0 auto; /* 가운데 정렬을 위해 사용합니다. */
        }

    </style>
</head>
<body>
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
        <div class="ms-5">
            <a class="btn btn-primary" href="#">글작성하기</a>
        </div>
    </div>

    <table id="noticeTable" class="table table-bordered ">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>작성자</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody class="table-group-divider">
        </tbody>
    </table>

    <div class="container-lg">
        <div class="row">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">

                    <li class="page-item">
                        <a class="page-link" href="#">
                            <i class="fa-solid fa-angle-left"></i>
                        </a>
                    </li>

                    <c:forEach begin="1" end="10" var="pageNum">
                        <li class="page-item">
                            <a class="page-link page-num" href="#" data-page="${pageNum}">${pageNum}</a>
                        </li>
                    </c:forEach>

                    <li class=" page-item">
                        <a class="page-link" href="#">
                            <i class="fa-solid fa-angle-right"></i>
                        </a>
                    </li>
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