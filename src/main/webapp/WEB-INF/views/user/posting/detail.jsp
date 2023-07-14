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

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <img src="/img/3.jpg" class="img-fluid rounded-circle mx-auto d-block" alt="회사 로고">
            <h2 class="text-center my-4">회사이름</h2>

            <h4 class="my-4">공고명 대충 길게</h4>
            <h5 class="my-3">근무 조건</h5>
            <ul>
                <li>근무지: 대충 주소</li>
                <li>근무형태: 정규직</li>
                <li>급여: 100원</li>
            </ul>

            <h4 class="my-4">주요 산업</h4>
            <input style="resize: none" class="form-control-plaintext fs-5" cols="30" rows="5" value="대충 it" readonly/>

            <h4 class="my-4">이런 사람들이 필요해요!</h4>
            <input style="resize: none" class="form-control-plaintext" cols="30" rows="5" readonly/>

            <h4 class="my-4">우대 사항</h4>
            <textarea style="resize: none" class="form-control-plaintext" cols="30" rows="5" readonly>${post.preference}
            </textarea>
            <h4 class="my-4">기타 사항</h4>
            <textarea style="resize: none" class="form-control-plaintext" cols="30" rows="5" readonly>${post.etc}
            </textarea>
            <div style="text-align: right;">
                <button class="btn btn-outline-success">수정</button>
                <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deletePosting">삭제
                </button>
                <button class="btn btn-outline-secondary"
                        onclick="location.href='/member/company/posting/list?memberId=${post.memberId}'">목록
                </button>
            </div>
            <br>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>