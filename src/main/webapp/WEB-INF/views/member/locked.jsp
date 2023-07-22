<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-17
  Time: 오전 1:00
  To change this template use File | Settings | File Templates.
--%>
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
    <title>계정 복구</title>

</head>
<body>
<my:navBar/>
<c:if test="${not empty message}">
    <div class="container-lg">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>

<div class="container-lg mt-5">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <div style="text-align: center">
                <h3>비활성화 된 아이디입니다 <br>
                    이메일 인증이 필요합니다.</h3>
            </div>

            <div class="form-group email-form">
                <label for="member-id-input">아이디 입력</label>
                <div class="mb-3">
                    <div class="d-flex">
                        <input type="text" class="form-control" id="member-id-input" placeholder="아이디를 입력해주세요">
                        <button type="button" class="btn btn-primary" style="width: 150px" id="mail-check-btn">
                            이메일보내기
                        </button>
                    </div>
                    <div id="email-text" class="form-text d-none"></div>
                </div>
                <div class="mail-check-box mb-3">
                    <label>인증번호확인</label>
                    <div class="d-flex">
                        <input class="form-control mail-check-input" placeholder="인증번호를 입력해주세요!" maxlength="6"
                               id="mail-confirm">
                        <button type="button" class="btn btn-primary" style="width: 150px" id="auth-code-check">
                            인증하기
                        </button>
                    </div>
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
<script src="/js/member/locked.js"></script>
</body>
</html>
