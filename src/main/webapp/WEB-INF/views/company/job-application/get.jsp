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

    <style>
        .container-lg {
            margin-top: 80px;
        }
    </style>

    <style>
        .member-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>

</head>
<body>
<my:navBar/>


<div class="container-lg">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <c:forEach items="${memberDetail}" var="member" varStatus="memberStatus">
                <div class="card mb-4">
                    <div class="card-body d-flex justify-content-between">
                        <h2 class="card-title">지원자 정보</h2>
                        <button onclick="location.href='/company/job-application/list?postingId=${postingId}'" class="btn btn-primary">목록 가기</button>
                    </div>
                    <div class="card-body">
                        <hr>
                        <p class="card-text"><strong>지원자 아이디:</strong> ${member.id}</p>
                        <hr>
                        <p class="card-text"><strong>지원자 이름:</strong> ${member.name}</p>
                        <hr>
                        <p class="card-text"><strong>지원자 성별:</strong> ${member.gender}</p>
                        <hr>
                        <p class="card-text"><strong>지원자 전화번호:</strong> ${member.phoneNumber}</p>
                        <hr>
                        <p class="card-text"><strong>지원자 주소:</strong> ${member.address}</p>
                        <hr>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">지원자 첨부 파일:</h5>
                        <c:choose>
                            <c:when test="${not empty fileApplicationId}">
                                <c:forEach items="${fileName}" var="file">
                                    <p class="card-text">
                                        <a href="${bucketUrl}/jobApplication/${fileApplicationId}/${file}"
                                           target="_blank">${file}</a>
                                    </p>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="card-text">파일 없음</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


<%--<table id="table" class="table table-bordered custom-div">--%>
<%--    <thead class="table-dark">--%>
<%--    <tr>--%>
<%--        <th style="width: 400px;">지원자 아이디</th>--%>
<%--        <th style="width: 400px;">지원자 이름</th>--%>
<%--        <th style="width: 400px;">지원자 성별</th>--%>
<%--        <th style="width: 400px;">지원자 전화번호</th>--%>
<%--        <th style="width: 400px;">지원자 주소</th>--%>
<%--        <th style="width: 400px;">지원자 첨부 파일 확인</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach items="${memberDetail}" var="member" varStatus="memberStatus">--%>
<%--        <tr>--%>
<%--            <td>${member.id}</td>--%>
<%--            <td>${member.name}</td>--%>
<%--            <td>${member.gender}</td>--%>
<%--            <td>${member.phoneNumber}</td>--%>
<%--            <td>${member.address}</td>--%>
<%--    </c:forEach>--%>
<%--            <td>--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${not empty fileApplicationId}">--%>
<%--                        <c:forEach items="${fileName}" var="file">--%>
<%--                            <a href="${bucketUrl}/jobApplication/${fileApplicationId}/${file}">${file}</a>--%>
<%--                        </c:forEach>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <div>파일 없음</div>--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </tbody>--%>
<%--</table>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
