<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-10
  Time: 오후 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.*" %>

<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>마이페이지</title>
<style>
    .mypage-container{
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 40px 0px;
    }
    .mypage-container-myinfo {
        justify-content: flex-end;
        margin-right: 135px;
    }
    .mypage-container-d{
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: center;
        margin: 0px 25px;
        background-color: #fafafa;
        width: 280px;
        height: 320px;
        border-radius: 5px;
        border: 0.5px solid rgba(0,0,0,0.1);
    }
    .mypage-column-t {
        margin-bottom: 80px;
    }
    .mypage-column-b{
        margin-bottom: 80px;
    }
</style>
</head>
<body>
<my:font></my:font>
<my:navBar/>

    <sec:authentication property="name" var="userId" />

    <div class="mypage-container">
      <h1>${members.name}님의 마이페이지</h1>
    </div>
    <div class="mypage-container mypage-container-myinfo">
      <sec:authorize access="isAuthenticated()">
        <a href="/members/personal-page/myinfo?id=<sec:authentication property="name" />">내 정보</a>
      </sec:authorize>
    </div>
    <div class="mypage-container">
      <div class="mypage-container-d">
        <div class="mypage-column mypage-column-t"><span>쪽지함</span></div>
        <div class="mypage-column mypage-column-b">
            <c:url value="/note/list/receive" var="noteListURL">
                <c:param name="memberId" value="${userId}"/>
            </c:url>
            <span onclick="location.href='${noteListURL}'" style="cursor: pointer; color: #4C84F3;">받은쪽지함</span>
            <c:url value="/note/list/send" var="noteListURL">
                <c:param name="memberId" value="${userId}"/>
            </c:url> <br>
            <span onclick="location.href='${noteListURL}'" style="cursor: pointer; color: #4C84F3;">보낸쪽지함</span>
            <c:url value="/note/list/unread" var="noteListURL">
                <c:param name="memberId" value="${userId}"/>
            </c:url> <br>
            <span onclick="location.href='${noteListURL}'" style="cursor: pointer; color: #4C84F3;">안읽은쪽지함[${unreadNote}]</span>
        </div>
      </div>
      <div class="mypage-container-d">
        <div class="mypage-column mypage-column-t">입사지원</div>
        <div class="mypage-column"><a href="/members/personal-page/apply/list">목록보기</a> </div>
        <div class="mypage-column mypage-column-b"></div>
      </div>
    <div class="mypage-container-d">
      <div class="mypage-column mypage-column-t">이력서</div>
      <div class="mypage-column"><a href="/resume/">내 이력서 보기</a></div>
        <br>
      <div class="mypage-column"><a href="/resume/write">이력서 작성하기</a></div>
      <div class="mypage-column mypage-column-b"></div>
    </div>
    <div class="mypage-container-d">
      <div class="mypage-column mypage-column-t">스크랩한 공고</div>
      <div class="mypage-column"><a href="/scrap/list">목록보기</a></div>
      <div class="mypage-column mypage-column-b"></div>
    </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>