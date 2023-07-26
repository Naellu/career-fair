<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-07
  Time: 오전 8:33
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

    <title>학점 계산기</title>

</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner />

    <div class="row justify-content-center mt-5 ml-50">
        <div class="col-10">
            <div class="container-md mx-auto">

                <my:toolsHeader />

                <h3 class="hd mt-30 mb-30">학점 계산기</h3>
                <div class="row">
                    <div class="col-md-7">
                        <div class="form-group">
                            <label for="dev-grade-perfect-score-code">최고 기준 점수</label>
                            <select name="selPoint" id="dev-grade-perfect-score-code" class="form-control">
                                <option value="4.5">4.5 만점</option>
                                <option value="4.3">4.3 만점</option>
                            </select>
                        </div>
<%--                        <div class="form-check">--%>
<%--                            <input class="form-check-input" type="checkbox" value="" id="dev-exist-f-grade" checked>--%>
<%--                            <label class="form-check-label" for="dev-exist-f-grade">F학점 포함</label>--%>
<%--                        </div>--%>
                        <table id="dataInputTable" class="table">
                            <thead>
                            <tr>
                                <th scope="col">과목명</th>
                                <th scope="col">이수 학점</th>
                                <th scope="col">성적</th>
                                <th scope="col">전공</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="text" class="form-control dev-subject" name="subject" maxlength="100"
                                           title="과목명"></td>
                                <td><input type="text" class="form-control dev-credit dev-two-decimal-places"
                                           name="credit" maxlength="4" title="학점"></td>
                                <td>
                                    <select class="form-control dev-grade dev-select" name="selPoint" id="grade_0">
                                        <option value="">선택</option>
                                        <option value="4.5">A+</option>
                                        <option value="4">A</option>
                                        <option value="3.5">B+</option>
                                        <option value="3">B</option>
                                        <option value="2.5">C+</option>
                                        <option value="2">C</option>
                                        <option value="1.5">D+</option>
                                        <option value="1">D</option>
                                        <option value="0">F</option>
                                    </select>
                                </td>
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input dev-major" type="checkbox" value="" id="major_0">
                                        <label class="form-check-label" for="major_0"></label>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger dev-delete-item">삭제</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <button type="button" class="btn btn-primary" id="dev-add-item"><i></i>과목 추가</button>
                        <button type="button" class="btn btn-primary" id="dev-calculate"><span>계산하기</span></button>
                        <button type="button" class="btn btn-primary" id="resetBtn"><i class="toolBtnIco"></i>초기화</button>
                    </div>
                    <div class="col-md-3">
                        <h3 class="tit">총 평점</h3>
                        <h4><i id="dev-total-grade">0</i>점</h4>
                        <table class="table mt-10">
                            <tbody>
                            <tr>
                                <td>전공 평점</td>
                                <td><i id="dev-major-grade">0</i>점</td>
                            </tr>
                            <tr>
                                <td>총 이수학점</td>
                                <td><i id="dev-total-credit">0</i>점</td>
                            </tr>
                            <tr>
                                <td>전공 이수학점</td>
                                <td><i id="dev-total-major-credit">0</i>점</td>
                            </tr>
                            </tbody>
                        </table>
<%--                        <button class="btn btn-primary" id="dev-grade-copy-result"><span>결과 복사하기</span></button>--%>
                    </div>
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

<script src="/js/tools/grade.js"></script>
</body>
</html>
