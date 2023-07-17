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
    <h1>입 사 지 원</h1>
    <div class="row">
        <div class="col-sm-12">
            <label for="title" class="form-label">공고명 ${application}</label>
            <input type="text" class="form-control" id="title" value="${posting.title}" readonly>
            <input type="hidden" class="form-control" name="postingId" id="posting-id" value="${posting.postingId}">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <label for="education" class="form-label">학력</label>
            <select class="form-select" name="education" id="education" data-val="${application.education}">
                <option value="고졸이상">고졸이상</option>
                <option value="초대졸이상">초대졸이상</option>
                <option value="대졸이상">대졸이상</option>
                <option value="대학원이상">대학원이상</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <label for="experience" class="form-label">경력</label>
            <select class="form-select" name="experience" id="experience" data-val="${application.experience}">
                <option value="1">신입</option>
                <option value="2">1년 미만</option>
                <option value="3">1년 이상 3년 미만</option>
                <option value="4">3년 이상 5년 미만</option>
                <option value="5">5년 이상</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <label for="age" class="form-label">연령대</label>
            <select class="form-select" name="age" id="age" data-val="${application.age}">
                <option value="20">20대</option>
                <option value="30">30대</option>
                <option value="40">40대</option>
                <option value="50">50대 이상</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <label for="form-file" class="form-label">이력서 자기소개 첨부</label>
                <input class="form-control" name="files" type="file" id="form-file" multiple>
                <div class="form-text">총 10MB, 하나의 파일을 1MB를 초과할 수 없습니다.</div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 text-right">
            <button id="modifyBtn" type="button" class="btn btn-outline-primary">수정</button>
            <button id="deleteBtn" type="button" class="btn btn-outline-danger">삭제</button>
            <button id="close-btn" type="button" class="btn btn-outline-secondary"
            onclick="location.href='/member/user/apply/list'">목록으로</button>
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