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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <my:font></my:font>
    <title>Title</title>

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
<my:navBar/>
    <div style="display: flex; justify-content: center; margin: 30px 0px 50px 0px;">
        <h3>${recruitList.id}님의 채용공고관리</h3>
    </div>
      <div style="display: flex; justify-content: space-between; align-items: center; margin: 20px 120px; ">
        <div class="rec-column-top">
          <span style="font-size: 20px; font-weight: 600;">게시한 공고 목록</span>
          <div class="div-cloumn"></div>
          <span style="font-size: 14px;color: rgba(0,0,0,0.3);">지원자가 있는 경우 삭제가 불가능합니다</span>
        </div>
      <div class="rec-column-top">
        <div>
           <button onclick="location.href='/member/company/posting/add'">채용공고 등록</button>
        </div>
        <div style="margin-left: 15px;">
        <button onclick="history.go(-1);">돌아가기</button>
        </div>
      </div>
    </div>
    <div class="rectable-container">
      <c:forEach items="${postingList}" var="posting">
      <div style="margin:20px 0px; border-bottom: 1px solid rgba(0,0,0,0.2);">
          <div class="rectable-column">
            <div class="rectable-column-div">
              <div><h3>${posting.title}</h3></div>
          <div><span>${posting.educationLevel}</span> <span>${posting.address}</span><span>${posting.employmentType}</span></div>
              <div>업종구분 확인해보고 넣음</div>
              <div>${posting.hiringCount}/${posting.spareCount}</div>
            </div>
          <div class="rectable-column-div">
            <div>
              <button style="margin-bottom: 20px;">수정</button>
            </div>
            <div>
              <button>삭제</button>
            </div>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
