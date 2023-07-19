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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoMap}&libraries=services"></script>
    <my:font></my:font>
    <title>찾아오시는길</title>
</head>
<body>
<my:navBar/>
<my:cheader>
    찾아오시는길
</my:cheader>

<section>
    <div class="container-lg mt-5"></div>
    <div style="text-align: center">
        <h3>${exhibitionInfo.title} 개최 위치</h3>
    </div>
    <div class="mx-auto" style="width: 1000px; height: 400px; position: relative;">
        <div id="map" style="width: 1000px; height: 400px;"></div>
    </div>
</section>

<input type="hidden" id="location" value="${exhibitionInfo.location}">
<input type="hidden" id="title" value="${exhibitionInfo.title}">

<div class="container-lg text-center mt-5">
    <table class="table table-bordered border-dark">
        <tr style="text-align: center; vertical-align: middle">
            <th scope="row" class="fs-5" style="width: 200px;">주소</th>
            <td colspan="3">${exhibitionInfo.location}</td>
        </tr>
        <tr>
            <th style="text-align: center; vertical-align: middle" class="align-middle fs-5" scope="row" rowspan="2"
                colspan="1">교통편
            </th>
            <td style="text-align: center; vertical-align: middle; width: 200px">일반버스</td>
            <td>${exhibitionInfo.bus}</td>
        </tr>
        <tr>
            <td style="text-align: center; vertical-align: middle; width: 200px">지하철</td>
            <td>${exhibitionInfo.subway}</td>
        </tr>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/exhibitionInfo/location.js"></script>
</body>
</html>