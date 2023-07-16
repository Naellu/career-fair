<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <my:font></my:font>
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
                <input id="title" type="text" class="form-control" readonly/>
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
                <textarea id="content" class="form-control" cols="90" rows="10" readonly></textarea>
            </div>

            <div id="file-name" class="mb-3">
                <label class="form-label">첨부파일</label>
            </div>

            <div class="mb-3">
                <a id="prev" class="btn btn-secondary">이전글로 가기</a>
                <a class="btn btn-secondary" href="/customer/notice/list">목록으로 가기</a>
                <a id="next" class="btn btn-secondary">다음글로 가기</a>
            </div>

            <sec:authorize access="hasAuthority('admin')">
            <div>
                <div>
                    <a class="btn btn-primary" href="/customer/notice/modify/${noticeId}">수정</a>
                    <button id="removeButton" class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#deleteConfirmModal">삭제
                    </button>
                </div>
            </div>
            </sec:authorize>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">공지를 삭제 하시겠습니까?</div>
            <div class="modal-footer">
                <button id="remove-btn" type="button" class="btn btn-danger" >삭제</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
<script src="/js/customer/notice/detail.js"></script>
</body>
</html>