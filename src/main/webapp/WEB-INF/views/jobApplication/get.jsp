<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-19
  Time: 오후 12:29
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

</head>
<body>
<my:navBar/>

<table id="table" class="table table-bordered custom-div">
    <thead class="table-dark">
    <tr>
        <th style="width: 400px;">지원자 아이디</th>
        <th style="width: 400px;">지원자 이름</th>
        <th style="width: 400px;">지원자 성별</th>
        <th style="width: 400px;">지원자 전화번호</th>
        <th style="width: 400px;">지원자 주소</th>
        <th style="width: 400px;">지원자 첨부 파일 확인</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${memberDetail}" var="member" varStatus="memberStatus">
        <tr>
            <td>${member.id}</td>
            <td>${member.name}</td>
            <td>${member.gender}</td>
            <td>${member.phoneNumber}</td>
            <td>${member.address}</td>
            <td>
                <c:forEach items="${fileList}" var="file">
                        <a href="/jobApplication/fileDownload/${file.fileName}" target="_blank">다운로드</a>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
