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
    <title>입사지원</title>

</head>
<body onload="defaultSet()">

<div class="container mt-5">
    <div class="row">
        <div class="col-sm-12">
            <h1><input type="text" class="form-control-plaintext" id="title" value="${posting.title} - ${application.applicationStatus}" readonly></h1>
            <input type="hidden" class="form-control" name="postingId" id="posting-id" value="${posting.postingId}" readonly>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-12">
            <label for="education" class="form-label">학력</label>
            <select class="form-select" name="education" id="education" data-val="${application.education}" disabled>
                <option value="고졸이상">고졸이상</option>
                <option value="초대졸이상">초대졸이상</option>
                <option value="대졸이상">대졸이상</option>
                <option value="대학원이상">대학원이상</option>
            </select>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-12">
            <label for="experience" class="form-label">경력</label>
            <select class="form-select" name="experience" id="experience" data-val="${application.experience}" disabled>
                <option value="1">신입</option>
                <option value="2">1년 미만</option>
                <option value="3">1년 이상 3년 미만</option>
                <option value="4">3년 이상 5년 미만</option>
                <option value="5">5년 이상</option>
            </select>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-12">
            <label for="age" class="form-label">연령대</label>
            <select class="form-select" name="age" id="age" data-val="${application.age}" disabled>
                <option value="20">20대</option>
                <option value="30">30대</option>
                <option value="40">40대</option>
                <option value="50">50대 이상</option>
            </select>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <label for="fileList" class="form-label">첨부 파일 목록</label>
                <ul id="fileList" class="list-group">
                    <c:forEach items="${fileNames}" var="fileName">
                        <a href="${bucketUrl}/jobApplication/${application.applicationId}/${fileName}">${fileName}</a>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-12 text-right">
            <button id="deleteBtn" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#cancelApplyConfirmModal">지원취소</button>
            <button id="close-btn" type="button" class="btn btn-outline-secondary"
            onclick="window.close()">닫기</button>
        </div>
    </div>
</div>


<%--삭제 모달--%>
<div class="d-none">
    <form action="/members/personal-page/apply/cancel" method="post"
          id="applyCancelForm">
        <input type="text" id="applyCancel" name="applicationId" value="${application.applicationId}"/>
        <input type="hidden" name="removeFiles" value="${fileNames}">
    </form>
</div>

<div class="modal fade" id="cancelApplyConfirmModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title fs-5" id="exampleModalLabel">취소 확인</h3>
                <button type="button" class="btn-outline-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">지원을 취소하시겠습니까??</div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-outline-danger"
                        form="applyCancelForm">삭제
                </button>
                <button type="button" class="btn btn-outline-secondary"
                        data-bs-dismiss="modal">닫기
                </button>
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

<script src="/js/member/user/apply/detail.js"></script>
</body>
</html>