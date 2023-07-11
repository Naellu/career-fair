<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .mt-3 {
            margin-top: 1rem;
        }
    </style>

</head>
<body>
<sec:authentication property="name" var="userId"/>
<my:navBar/>
<my:font/>
<h1>채용공고 목록</h1>
<h3>${pageInfo}</h3>
<div class="mt-3">
    <table id="posting-table" class="table table-bordered custom-div">
        <caption class="caption-top">
            <button class="btn btn-outline-primary" onclick="location.href='/member/company/posting/add?userId=${userId}'">공고등록</button>
        </caption>
        <thead class="table-dark">
        <tr>
            <th style="width: 200px;">기간</th>
            <th>공고명</th>
            <th style="width: 100px;">고용형태</th>
            <th style="width: 100px;">경력</th>
            <th style="width: 100px;">학력</th>
            <th style="width: 100px;">채용인원</th>
            <th style="width: 100px;">지원자 수</th>
            <th style="width: 100px;">공고상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${postingList}" var="posting">
            <tr>
                <td>${posting.startDate} ~ ${posting.endDate}</td>
                <td>${posting.title} (${posting.postingId})</td>
                <td>${posting.employmentType}</td>
                <td>${posting.experienceLevel}</td>
                <td>${posting.educationLevel}</td>
                <td>${posting.hiringCount}</td>
                <td>${posting.applicationCount}</td>
                <td>${posting.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--페이지네이션--%>
<nav aria-label="...">
    <ul class="pagination justify-content-center">


        <c:if test="${pageInfo.begin != 1}">

            <%--맨앞으로--%>
            <c:url value="/member/company/posting/list" var="pageLink">
                <c:param name="page" value="1"></c:param>
                <c:param name="memberId" value="${userId}"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angles-left"></i></a>
            </li>

            <%-- 앞으로 --%>
            <c:url value="/member/company/posting/list" var="pageLink">
                <c:param name="page" value="${pageInfo.previous }"></c:param>
                <c:param name="memberId" value="${userId}"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angle-left"></i></a>
            </li>

        </c:if>

        <c:forEach begin="${pageInfo.begin}" end="${pageInfo.end}" var="pageNumber">
            <c:url value="/member/company/posting/list" var="pageLink">
                <c:param name="page" value="${pageNumber }"></c:param>
                <c:param name="memberId" value="${userId}"></c:param>
            </c:url>
            <c:choose>
                <c:when test="${param.page == null}">
                    <c:set var="page" value="1" />
                </c:when>
                <c:otherwise>
                    <c:set var="page" value="${param.page}" />
                </c:otherwise>
            </c:choose>
            <li class="page-item ${page eq pageNumber ? 'active' : ''}">
                <a class="page-link" href="${pageLink}">${pageNumber}</a>
            </li>
        </c:forEach>


        <c:if test="${pageInfo.end != pageInfo.last}">

            <%-- 뒤로--%>
            <c:url value="/member/company/posting/list" var="pageLink">
                <c:param name="page" value="${pageInfo.next }"></c:param>
                <c:param name="memberId" value="${userId}"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angle-right"></i></a>
            </li>

            <%--맨 뒤로--%>
            <c:url value="/member/company/posting/list" var="pageLink">
                <c:param name="page" value="${pageInfo.last }"></c:param>
                <c:param name="memberId" value="${userId}"></c:param>
            </c:url>

            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angles-right"></i></a>
            </li>

        </c:if>
    </ul>
</nav>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
