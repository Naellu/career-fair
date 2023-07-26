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

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"--%>
<%--          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="--%>
<%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>

    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>스크랩한 공고</title>

</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner />


<div class="container mt-50">
    <div class="row justify-content-center d-flex">

        <div class="col-lg-9 post-list">
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

        <div class="col-lg-3 sidebar mt-20">
            <div class="single-slidebar">
                <h4>마이페이지</h4>
                <ul class="cat-list">
                    <li><a class="justify-content-between d-flex" href="/scrap/list"><p>스크랩 공고</p></a></li>
                    <li><a class="justify-content-between d-flex" href="/resume/"><p>이력서</p></a></li>
                    <li><a class="justify-content-between d-flex" href="/members/personal-page/apply/list"><p>입사지원</p></a></li>
                    <li><a class="justify-content-between d-flex" href="/note/list/receive"><p>쪽지함</p></a></li>
                    <%--                    <li><a class="justify-content-between d-flex" href="category.html"><p>Florida</p><span>47</span></a></li>--%>
                    <%--                    <li><a class="justify-content-between d-flex" href="category.html"><p>Rocky Beach</p><span>27</span></a></li>--%>
                    <%--                    <li><a class="justify-content-between d-flex" href="category.html"><p>Chicago</p><span>17</span></a></li>--%>
                </ul>
            </div>
        </div>
    </div>


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

<my:job-footer />

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"--%>
<%--        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="--%>
<%--        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

<script src="/job-js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/job-js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="/job-js/easing.min.js"></script>
<script src="/job-js/hoverIntent.js"></script>
<script src="/job-js/superfish.min.js"></script>
<script src="/job-js/jquery.ajaxchimp.min.js"></script>
<script src="/job-js/jquery.magnific-popup.min.js"></script>
<script src="/job-js/owl.carousel.min.js"></script>
<script src="/job-js/jquery.sticky.js"></script>
<script src="/job-js/jquery.nice-select.min.js"></script>
<script src="/job-js/parallax.min.js"></script>
<script src="/job-js/mail-script.js"></script>
<script src="/job-js/main.js"></script>

<script src="/js/members/user/scrap/list.js"></script>
</body>
</html>