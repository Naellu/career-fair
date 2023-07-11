<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

</head>
<body>
<sec:authentication property="name" var="userId" />
<my:navBar/>
<my:font/>
<h1>${param.userId}채용공고 목록</h1>


<div class="mt-3">
    <table id="posting-table" class="table table-bordered custom-div">
        <caption class="caption-top">
            <h3>채용 공고</h3>
            <button onclick="location.href='/member/company/posting/add?userId=${userId}'">공고등록</button>
        </caption>
        <thead class="table-dark">
        <tr>
            <th style="width: 200px;">기간</th>
            <th>공고명</th>
            <th style="width: 100px;">채용인원</th>
            <th style="width: 100px;">고용형태</th>
            <th style="width: 100px;">경력</th>
            <th style="width: 100px;">학력</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>2023.07.11 ~ 2023.07.12</td>
            <td>노예구함</td>
            <td>500명</td>
            <td>노예</td>
            <td>10년</td>
            <td>학력</td>
        </tr>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
