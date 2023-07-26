<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-18
  Time: 오후 3:41
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
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"--%>
    <%--          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="--%>
    <%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
    <title>채용공고관리</title>

    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
    .div-cloumn{
        width: 1.5px;
        height: 20px;
        background-color: rgba(0,0,0,0.3);
        margin: 0px 15px;
    }
    .rec-column-top {
        align-items: center;
        display: flex;
    }
    .rectable-container{
        border-top: 2px solid rgba(0,0,0,0.5);
        border-bottom: 2px solid rgba(0,0,0,0.5);
        margin: 0px 120px;
    }
    .rectable-column{
        margin: 30px 60px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .rectable-column-div{

    }
</style>

</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner>
    채용공고 관리
</my:job-inner-banner>

    <div style="display: flex; justify-content: center; margin: 30px 0px 40px 0px;">
        <h3>채용공고 관리</h3>
    </div>
      <div style="display: flex; justify-content: space-between; align-items: center; margin: 20px 120px; ">
        <div class="rec-column-top">
          <span style="font-size: 20px; font-weight: 600;">게시한 공고 목록</span>
          <div class="div-cloumn"></div>


            <c:url value="/admin/management/recruitmanagement" var="roundLink">
                <c:param name="page" value="1" />
                <c:if test="${not empty param.search }">
                    <c:param name="search" value="${param.search }" />
                </c:if>
                <!-- 처음버튼 눌러도 검색값 변하지 않게 하기 -->
                <c:if test="${not empty param.type }">
                    <c:param name="type" value="${param.type }" />
                </c:if>
            </c:url>
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="${roundLink }&round=all">전체</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${roundLink }&round=now">현재회차</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${roundLink }&round=past">지난회차</a>
                </li>
            </ul>

        </div>
      <div class="rec-column-top">
        <div style="margin-left: 15px;">
        <button><a href="/admin/main">돌아가기</a></button>
        </div>
      </div>
    </div>
    <div class="rectable-container">
      <c:forEach items="${postList}" var="posting">
      <div style="margin:20px 0px; border-bottom: 1px solid rgba(0,0,0,0.2);">
          <div class="rectable-column">
            <div class="rectable-column-div">
              <div id="postingid-text" style="display: none;">${posting.postingId}</div>
              <div><h3><a href="/user/posting/${posting.postingId}">${posting.title}</a></h3></div>
                <div><span>기업명 ${posting.companyName}</span></div>
                <div><span>담당자 ${posting.memberId}</span></div>
          <div><span>${posting.educationLevel}</span> <span>${posting.address}</span><span> ${posting.employmentType}</span></div>
              <div>${posting.applicationCount}/${posting.hiringCount}</div>
            </div>
          <div class="rectable-column-div">
            <div>
                <button type="button" class="btn btn-danger removeButton" data-postingId="${posting.postingId}">삭제</button>
            </div>

              <c:if test="${posting.status ne '마감'}">
              <div>
                  <button type="button" class="btn btn-primary statusButton mt-2" data-postingId="${posting.postingId}">마감</button>
              </div>
              </c:if>

          </div>
        </div>
      </div>
      </c:forEach>
    </div>

<!-- pagenation -->
    <div class="container-lg" style="margin-top: 20px;">
        <div class="row">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <!-- 처음버튼 -->
                    <c:if test="${pageInfo.currentPageNum ne 1 }">
                    <c:url value="/admin/management/recruitmanagement" var="recpageLink">
                    <c:param name="page" value="${pageInfo.firstPageNum}" />
                    <c:if test="${not empty param.search }">
                    <c:param name="search" value="${param.search }" />
                    </c:if>
                    <!-- 처음버튼 눌러도 검색값 변하지 않게 하기 -->
                    <c:if test="${not empty param.type }">
                    <c:param name="type" value="${param.type }" />
                    </c:if>
                    <c:if test="${not empty param.round }">
                    <c:param name="round" value="${param.round }" />
                    </c:if>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${recpageLink }"> <i class="fa-solid fa-angles-left"></i>
                    </a></li>
                    </c:if>

                    <!-- 이전버튼 -->
                    <c:if test="${pageInfo.currentPageNum gt 1 }">
                    <!--1보다 클때 라고 해도 됨  -->
                    <!-- 이전버튼 : {pageInfo.currentPageNum -1 } -->
                    <my:recManagePageItem recPageNum="${pageInfo.currentPageNum -1}">
                    <i class="fa-solid fa-angle-left"></i>
                    </my:recManagePageItem>
                    </c:if>

                    <c:forEach begin="${pageInfo.leftPageNum }" end="${pageInfo.rightPageNum }" var="recPageNum">
                    <my:recManagePageItem recPageNum="${recPageNum }">
                    ${recPageNum }
                    </my:recManagePageItem>
                    </c:forEach>

                    <!-- 다음 버튼 -->
                    <c:if test="${pageInfo.currentPageNum lt pageInfo.lastPageNum }">
                    <!-- 페이지 번호 : ${pageInfo.currentPageNum + 1 } -->
                    <my:recManagePageItem recPageNum="${pageInfo.currentPageNum + 1}">

                    <i class="fa-solid fa-angle-right"></i>
                    </my:recManagePageItem>
                    </c:if>
                    <!-- 마지막 버튼 -->
                    <c:if test="${pageInfo.currentPageNum lt pageInfo.lastPageNum }">
                    <c:url value="/admin/management/recruitmanagement" var="recpageLink">
                    <c:param name="page" value="${pageInfo.lastPageNum}" />
                    <c:if test="${not empty param.search }">
                    <c:param name="search" value="${param.search }" />
                    </c:if>
                    <c:if test="${not empty param.type }">
                    <c:param name="type" value="${param.type }" />
                    </c:if>
                    <c:if test="${not empty param.round }">
                    <c:param name="boardCategory" value="${param.round }" />
                    </c:if>
                    </c:url>
                    <li class="page-item">
                      <a class="page-link" href="${recpageLink }"> <i class="fa-solid fa-angles-right"></i></a>
                    </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
<my:recmanageSearch></my:recmanageSearch>

<my:job-footer/>

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

<script src="/js/admin/manage/manage.js"></script>
</body>
</html>
