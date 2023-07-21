<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-19
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

    <style>
        .container-lg {
            margin-top: 80px;
        }
    </style>


</head>
<body>
<my:navBar/>


<div class="container-lg">
<table id="posting-table" class="table table-bordered custom-div">
    <thead class="table-dark">
    <tr>
        <th style="width: 400px;">지원자 목록</th>
        <th style="width: 400px;">지원자 상세보기</th>
        <th style="width: 400px;">지원자 상태 변경하기</th>
        <th style="width: 400px;">지원자 쪽지 보내기</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${postingList}" var="list" varStatus="status">
        <tr>
            <td>${list.memberId}</td>
            <td><button onclick="location.href='/company/job-application/get?memberId=${list.memberId}&applicationId=${list.applicationId}&postingId=${list.postingId}'">상세 보기</button></td>
            <td>
                <form id="updateForm${status.index}" action="/company/job-application/update" method="post">
                    <input type="hidden" name="memberId" value="${list.memberId}">
                    <input type="hidden" name="applicationId" value="${list.applicationId}">
                    <input type="hidden" name="postingId" value="${list.postingId}">
                    <select name="applicationStatus" class="form-select">
                        <option value="지원완료상태" ${list.applicationStatus == '지원완료상태' ? 'selected' : ''}>지원완료상태</option>
                        <option value="심사중" ${list.applicationStatus == '심사중' ? 'selected' : ''}>심사중</option>
                        <option value="면접" ${list.applicationStatus == '면접' ? 'selected' : ''}>면접</option>
                        <option value="합격" ${list.applicationStatus == '합격' ? 'selected' : ''}>합격</option>
                        <option value="불합격" ${list.applicationStatus == '불합격' ? 'selected' : ''}>불합격</option>
                    </select>
                    <button type="submit" form="updateForm${status.index}">변경</button>
                </form>
            </td>
            <sec:authentication property="name" var="userId" />
            <td>
                <button onclick="openNoteWindow('/note/write?senderId=${userId}&recipientId=${list.memberId}');" class="btn btn-primary">쪽지 쓰기</button>
            </td>


        </tr>
    </c:forEach>
    </tbody>
</table>

</div>

<script>
    function submitForm(index) {
        document.getElementById('updateForm' + index).submit();
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/js/note/list.js"></script>
</body>
</html>