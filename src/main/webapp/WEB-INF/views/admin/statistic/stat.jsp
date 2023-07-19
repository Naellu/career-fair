<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-18
  Time: 오후 3:21
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
            integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="/css/statistic/stat.css">
    <my:font></my:font>

    <title>통계</title>

</head>
<body>
<my:navBar/>

<div>
    <div id="chart-container">
        <div class="chart-wrap">
            <div class="">
                <h3>마감기한 공고 개수</h3>
            </div>
            <canvas id="postingChart"></canvas>
        </div>

        <div class="chart-wrap">
            <div class="">
                <h3>산업 종류 당 나이별 지원자 수</h3>
                <select id="industrySelect">
                    <!-- 여기에 option들이 동적으로 채워질 것입니다. -->
                </select>
            </div>
            <canvas id="industryAgeGroupChart"></canvas>
        </div>

        <div class="chart-wrap">
            <div class="">
                <h3>산업 종류 별 채용공고 수</h3>
            </div>
            <canvas id="industryAllPostingChart"></canvas>
        </div>
    </div>

    <div class="memberCnt-chart-wrap">
        <div class="industry-member-graph">
            <h3>산업 종류 별 지원자 수</h3>
            <canvas id="industryAllMemberChart"></canvas>
        </div>
    </div>
</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.3.0/chart.umd.js" integrity="sha512-CMF3tQtjOoOJoOKlsS7/2loJlkyctwzSoDK/S40iAB+MqWSaf50uObGQSk5Ny/gfRhRCjNLvoxuCvdnERU4WGg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/admin/statistic/stat.js"></script>
</body>
</html>
