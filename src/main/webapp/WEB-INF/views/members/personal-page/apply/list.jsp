<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-17
  Time: 오후 2:45
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

    <title>지원 공고 목록</title>

</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner />


<div class="container mt-50">
    <div class="row justify-content-center d-flex">
        <div class="col-lg-9">
            <table class="table">
                <thead>
                <tr>
                    <th>회차정보</th>
                    <th>지원공고명</th>
                    <th>회사명</th>
                    <th>공고상태</th>
                    <th>지원일자</th>
                    <th>지원상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${applyList}" var="apply" varStatus="status">
                    <tr>
                        <td>${post[status.index].round}회차</td>
                        <td><a href="#"
                               onclick="window.open('/members/personal-page/apply/detail?applicationId=${apply.applicationId}','_blank', 'width=800,height=700' )">
                                ${post[status.index].title}</a></td>
                        <td>${company[status.index].companyName}</td>
                        <td>${post[status.index].status}</td>
                        <td>${apply.applicationDate}</td>
                        <td>${apply.applicationStatus}${apply.applicationId}</td>

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

<%--페이지네이션--%>
<nav aria-label="...">
    <ul class="pagination justify-content-center">


        <c:if test="${pageInfo.begin != 1}">

            <%--맨앞으로--%>
            <c:url value="/members/personal-page/apply/list" var="pageLink">
                <c:param name="page" value="1"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angles-left"></i></a>
            </li>

            <%-- 앞으로 --%>
            <c:url value="/members/personal-page/apply/list" var="pageLink">
                <c:param name="page" value="${pageInfo.previous }"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angle-left"></i></a>
            </li>

        </c:if>

        <c:forEach begin="${pageInfo.begin}" end="${pageInfo.end}" var="pageNumber">
            <c:url value="/members/personal-page/apply/list" var="pageLink">
                <c:param name="page" value="${pageNumber }"></c:param>
            </c:url>
            <c:choose>
                <c:when test="${param.page == null}">
                    <c:set var="page" value="1"/>
                </c:when>
                <c:otherwise>
                    <c:set var="page" value="${param.page}"/>
                </c:otherwise>
            </c:choose>
            <li class="page-item ${page eq pageNumber ? 'active' : ''}">
                <a class="page-link" href="${pageLink}">${pageNumber}</a>
            </li>
        </c:forEach>


        <c:if test="${pageInfo.end != pageInfo.last}">

            <%-- 뒤로--%>
            <c:url value="/members/personal-page/apply/list" var="pageLink">
                <c:param name="page" value="${pageInfo.next }"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angle-right"></i></a>
            </li>

            <%--맨 뒤로--%>
            <c:url value="/members/personal-page/apply/list" var="pageLink">
                <c:param name="page" value="${pageInfo.last }"></c:param>
            </c:url>

            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angles-right"></i></a>
            </li>

        </c:if>
    </ul>
</nav>

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

</body>
</html>