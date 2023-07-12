<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-12
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.*" %>

<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <my:font></my:font>
    <title>Title</title>

</head>
<body>
<my:navBar/>
${post}
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <img src="[회사 로고 경로]" class="img-fluid rounded-circle mx-auto d-block" alt="회사 로고">
            <h2 class="text-center my-4">${company.companyName}</h2>
            <p>[회사 소개]</p>

            <h4 class="my-4">${post.title}</h4>
            <h5 class="my-3">근무 조건:</h5>
            <ul>
                <li>근무지: ${company.address}</li>
                <li>근무형태: ${post.employmentType}</li>
                <li>급여: ${post.salary}</li>
                <li>근무시간: [근무시간 정보]</li>
            </ul>

            <h4 class="my-4">주요 업무:</h4>
            <ul>
                <li>[업무 내용 1]</li>
                <li>[업무 내용 2]</li>
                <li>[업무 내용 3]</li>
            </ul>

            <h4 class="my-4">자격 요건</h4>
            <ul>
                <input type="text" class="form-control-plaintext" value="${post.requirement}">
                    ${post.requirement}
            </ul>

            <h4 class="my-4">우대 사항:</h4>
            <ul>
                <li>[우대 사항 1]</li>
                <li>[우대 사항 2]</li>
                <li>[우대 사항 3]</li>
            </ul>

            <h4 class="my-4">지원 방법:</h4>
            <p>[지원 방법 설명]</p>

            <h4 class="my-4">기타 사항:</h4>
            <p>[기타 사항 설명]</p>
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