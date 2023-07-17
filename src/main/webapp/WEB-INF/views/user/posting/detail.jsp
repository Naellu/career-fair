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
    <title>채용공고</title>
</head>
<body>
<my:navBar/>

<!-- toast -->
<div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body"></div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <img src="/img/3.jpg" class="img-fluid rounded-circle mx-auto d-block" alt="회사 로고">
            <div id="company-name" class="text-center my-4">
                <h2>회사이름</h2>
                <a href="">회사 정보 상세 보기></a>
            </div>
            <hr>
            <div style="text-align: center">
                <h2 id="title" class="my-4">공고명 대충 길게</h2>
            </div>
            <h4 class="my-3"><i class="fa-solid fa-list"></i> 근무 조건</h4>
            <ul id="work-condition-ul">
                <li>근무지: 대충 주소</li>
                <li>근무형태: 정규직</li>
                <li>연봉: 100원</li>
            </ul>

            <h4 class="my-3"><i class="fa-solid fa-handshake"></i> 필요 인원</h4>
            <input style="resize: none" id="hiring_count" class="form-control-plaintext fs-5" value="00명" readonly/>

            <h4 class="my-3"><i class="fa-solid fa-industry"></i> 우리 회사의 업종입니다</h4>
            <input id="industry-id" class="form-control-plaintext fs-5" value="대충 it" readonly/>

            <h4 class="my-4"><i class="fa-solid fa-user-check"></i> 필요조건입니다</h4>
            <input id="level" class="form-control-plaintext" value="대졸이상 경력" readonly/>
            <textarea id="requirements" style="resize: none" class="form-control-plaintext" cols="30" rows="2" readonly>
            </textarea>

            <h4 class="my-4"><i class="fa-solid fa-user-plus"></i> 우대사항입니다</h4>
            <textarea id="preferences" style="resize: none; overflow: hidden" class="form-control-plaintext" cols="30"
                      rows="2" readonly>
            </textarea>

            <h4 class="my-4"><i class="fa-solid fa-hand-holding-heart"></i> 이런 복지가 있습니다</h4>
            <textarea id="benefits" style="resize: none" class="form-control-plaintext ta" cols="30" rows="2" readonly>
            </textarea>

            <h4 class="my-3"><i class="fa-regular fa-calendar-days"></i> 모집기간</h4>
            <input id="period" style="resize: none" class="form-control-plaintext fs-5" value="2023.07.14 ~ 2023.07.89"
                   readonly/>

            <div id="etc">
                <h4 class="my-4">기타 사항</h4>
                <textarea style="resize: none" class="form-control-plaintext" cols="30" readonly>
            </textarea>
            </div>

            <div style="text-align: center;" class="mb-5">
                <button id="application-btn" class="btn btn-outline-success"><i class="fa-regular fa-paper-plane"></i> 입사지원하기</button>
                <button id="wish-btn"></button>
                <button id="note-btn" class="btn btn-outline-primary"><i class="fa-regular fa-envelope"></i> 쪽지로 문의하기
                </button>
                <a href="/user/posting/list" class="btn btn-outline-secondary">목록으로가기</a>
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
<script src="/js/user/posting/detail.js"></script>
</body>
</html>