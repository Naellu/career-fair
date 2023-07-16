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
    <title>공지사항수정</title>

</head>
<body>
<my:navBar/>

<div class="container-lg">
    <!-- .row.justify-content-center>.col-12.col-md-8.col-lg-6 -->
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">

            <div class="me-auto">
                <h1>
                    ${noticeId}번 공지사항
                    <input type="hidden" id="bucketUrl" value="${bucketUrl}"/>
                </h1>
            </div>
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input id="title" name="title" type="text" class="form-control"/>
            </div>

            <div class="mb-3">
                <label for="writer" class="form-label">작성자</label>
                <input id="writer" type="text" class="form-control" readonly/>
            </div>

            <div class="mb-3">
                <label for="created" class="form-label">작성일</label>
                <input id="created" type="text" class="form-control" readonly/>
            </div>

            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea id="content" name="content" class="form-control" cols="90" rows="10"></textarea>
            </div>

            <div id="file-name" class="mb-3">
                <label class="form-label">첨부파일</label>
            </div>

            <div class="mb-3">
                <label for="formFile" class="form-label">첨부 파일</label>
                <input class="form-control" name="files" type="file" id="formFile" multiple>
                <div class="form-text">총 10MB, 하나의 파일을 1MB를 초과할 수 없습니다.</div>
            </div>

            <div>
                <div>
                    <%--  <input type="hidden" name="noticeId" value="${noticeId}">--%>
                    <%-- <input type="submit" class="btn btn-danger" value="수정">--%>
                    <button id="update-btn" class="btn btn-danger">수정</button>
                    <a class="btn btn-secondary" href="/customer/notice/list">목록으로 가기</a>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/customer/notice/modify.js"></script>
</body>
</html>