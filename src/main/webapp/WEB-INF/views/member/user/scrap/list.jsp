<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-19
  Time: 오전 9:28
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
    <title>Title</title>

</head>
<body>
<my:navBar/>
<div class="container">
    <br/>
    <h3>스크랩 목록</h3>
    <hr>
    <table id="posting-table" class="table table-bordered custom-div center-align">

        <thead class="table-dark">
        <tr>
            <th style="width: 200px;">회차정보</th>
            <th style="width: 200px;">회사명</th>
            <th style="width: 1000px">공고명</th>
            <th style="width: 500px">채용기간</th>
            <th style="width: 200px;">채용인원</th>
            <th style="width: 200px;">공고상태</th>
            <th style="width: 200px;">지원자 수</th>
            <th style="width: 250px;">스크랩 취소</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${scrapList}" var="scrap" varStatus="status">
            <tr>
                <td>${scrap.round}회차</td>
                <td>${scrap.companyName}</td>
                <td>
                    <a href="/user/posting/${postingList[status.index].postingId}">${scrap.title}</a>
                </td>
                <td>${scrap.startDate} ~ ${scrap.endDate}</td>
                <td>${scrap.hiringCount}</td>
                <td>${scrap.status}</td>
                <td>${scrap.applicationCount}</td>
                <td>
                    <button name="cancelBtn"
                            class="btn btn-outline-danger"
                            data-scrap-id="${scrap.scrapId}"
                            data-bs-toggle="modal"
                            data-bs-target="#cancelScrapConfirmModal"
                    >스크랩 취소</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--삭제 모달--%>
<div class="d-none">
    <form action="/member/user/scrap/cancel" method="post"
          id="scrapCancelForm">
        <input type="text" id="scrapId" name="scrapId" value=""/>

    </form>
</div>

<div class="modal fade" id="cancelScrapConfirmModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title fs-5" id="exampleModalLabel">취소 확인</h3>
                <button type="button" class="btn-outline-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">스크랩을 취소하시겠습니까??</div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-outline-danger"
                        form="scrapCancelForm">스크랩 취소
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
<script src="/js/member/user/scrap/list.js"></script>
</body>
</html>