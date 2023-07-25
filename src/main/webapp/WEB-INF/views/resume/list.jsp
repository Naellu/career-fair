<%--
  Created by IntelliJ IDEA.
  User: KJJ
  Date: 2023-07-09
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
  <title>이력서 목록</title>

<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">--%>
<%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />--%>
    <link rel="stylesheet" href="/css/resume/list.css">

    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner />
  <br>

  <div class="container-lg">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8">
          <div class="contWrap ResumeMngCont">

              <div class="form-head">
                  <div class="hdWrap">
                      <h2 class="hd_1">이력서 목록</h2>
                      <%--              <a class="hd_side" href="/User/ResumeMng/File">첨부파일 관리</a>--%>
                  </div>

                  <div class="btnBx">
                      <a id="resumeWrittenBtn" href="/resume/write" class="btn btnBl mtuSpImgBefore wrBtn">
                          <span>이력서 등록</span>
                      </a>
                  </div>
              </div>

              <div class="tableList">
                  <div clas="">
                      <div class="listSortArea">
                          <div class="col col01">이력서 제목</div>
                          <div class="col col02">이력서 관리</div>
                      </div>
                      <div class="mtuList">
                        <c:forEach items="${resumeList}" var="resume">
                          <ul>
                              <li class="chk">
                                  <div class="col col01">
                                      <div class="tit">
                                          <a href="/resume/${resume.resumeId}">${resume.title}</a>
                                      </div>
<%--                                      <div class="date">2023-553215</div>--%>
                                      <div class="date">
                                          <c:choose>
                                              <c:when test="${not empty resume.lastUpdated}">
                                                  ${resume.lastUpdated}
                                              </c:when>
                                              <c:otherwise>
                                                  ${resume.created}
                                              </c:otherwise>
                                          </c:choose>
                                      </div>

                                      <div class="positionOffer">
<%--                                          <button type="button" class="btnPositionOffer dev-btn-open-setting" aria-haspopup="dialog" title="포지션 제안 설정">--%>
<%--                                              <span>포지션 제안 받지 않는 중 (2023.07.02 16:40~)</span>--%>
<%--                                          </button>--%>
                                      </div>
                                  </div>
                                  <div class="col col02">

                                      <div class="btnCell"><a class="btn btnTopBooth" href="/resume/${resume.resumeId}/update">수정</a></div>

                                      <div class="btnCell"><a class="btn deleteBtn" id="delete_${resume.resumeId}" href="#">삭제</a></div>

                                  </div>
                              </li>
                          </ul>
                        </c:forEach>
                      </div>
                  </div>

              </div>
            </div>
        </div>
    </div>
  </div>

<my:job-footer />

<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

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


    <script src="/js/resume/list.js"></script>
</body>
</html>
