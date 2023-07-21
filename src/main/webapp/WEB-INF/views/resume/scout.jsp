<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-17
  Time: 오후 4:37
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
    <link rel="stylesheet" href="/css/resume/scout.css">
    <my:font></my:font>
    <title>업종 별 이력서</title>

</head>
<body>
<my:navBar/>

<div class="container-lg mb-3 mt-5">
    <h2 class="mb-3">헤드헌트</h2>

    <form action="/resume/scout" method="get">

        <div class="accordion mb-3" id="accordionExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        업종 선택
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <c:forEach items="${industryList}" var="industry">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="${industry.industryId}" id="industry_${industry.industryId}" name="industry">
                                <label class="form-check-label" for="industry_${industry.industryId}">
                                        ${industry.industryName}
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <div id="selectedIndustry" class="mb-3"></div>

        <button type="submit" class="btn btn-primary">검색</button>
        <button type="button" id="resetButton" class="btn btn-white">조건 초기화</button>

    </form>


    <div class="list-group mx-auto mb-3">
        <c:forEach items="${resumeList}" var="resume">
            <div class="list-group-item">
                <a class="mb-1" href="/resume/${resume.resumeId}">${resume.title}</a>
                <p class="mb-1">${resume.memberId}</p>
            </div>
        </c:forEach>
    </div>

    <div class="container-lg">
        <div class="row">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">

                    <!-- 이전 버튼 -->
                    <c:if test="${pageInfo.currentPageNum gt 1 }">
                        <my:resumePageItem pageNum="${pageInfo.currentPageNum - 1 }">
                            <i class="fa-solid fa-angle-left"></i>
                        </my:resumePageItem>
                    </c:if>

                    <c:forEach begin="${pageInfo.leftPageNum }" end="${pageInfo.rightPageNum }" var="pageNum">
                        <my:resumePageItem pageNum="${pageNum }">
                            ${pageNum }
                        </my:resumePageItem>
                    </c:forEach>

                    <!-- 다음 버튼 -->
                    <c:if test="${pageInfo.currentPageNum lt pageInfo.lastPageNum }">
                        <%-- 페이지 번호 : ${pageInfo.currentPageNum + 1 } --%>
                        <my:resumePageItem pageNum="${pageInfo.currentPageNum + 1 }">
                            <i class="fa-solid fa-angle-right"></i>
                        </my:resumePageItem>

                    </c:if>

                </ul>
            </nav>
        </div>
    </div>

</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/resume/scout.js"></script>
</body>
</html>
