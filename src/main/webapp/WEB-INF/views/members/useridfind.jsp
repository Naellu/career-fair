<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-10
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<html>
<head>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />--%>
    <title>ID 찾기</title>
<style>
    body{
        top: 0;
        bottom: 0;
        margin: 0;
    }
    .findid-column{
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 75vh;
    }
    .findid-column-d{
        border:2px solid rgba(0,0,0,0.2);
        padding: 40px 40px 50px 40px;
        border-radius: 7px;
    }
    .findId-title{
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    .name_column{
        display: flex;
    }
    #checkEmailBtn{
        justify-content: center;
        align-items: center;
        background-color: rgba(0,0,0,0.2);
        padding: 5px;
        border: none;
        border-radius: 5px;
        color: black;
        font-weight: 600;
        cursor: pointer;
    }
    #recheck-EmailBtn{
        justify-content: center;
        align-items: center;
        background-color: #ACC0D2;
        padding: 5px;
        border: none;
        border-radius: 5px;
        color: black;
        font-width: 600;
        cursor: pointer;
    }
    .check-name-input{
        border: none;
        border-bottom: 1px solid rgba(0,0,0,0.2);
        margin-right: 30px;
        outline:none;
        width: 200px;
        padding: 0px 5px;
    }
    .check-mail-input{
        border: none;
        border-bottom: 1px solid rgba(0,0,0,0.2);
        margin-right: 10px;
        outline:none;
        width: 260px;
        padding: 0px 5px;
    }
    .name_column{
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    .id-box-column{
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 35px;
    }
    #find_id{
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        padding: 5px;
        border-radius: 5px;
        border: 0.5px solid;
    }
    #find-login-button{
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        padding: 5px;
        border-radius: 5px;
        border: 0.5px solid;
    }
    .div-cloumn{
        width: 1.4px;
        height: 20px;
        background-color: rgba(0,0,0,0.3);
        margin: 0px 22px;
    }
    #verificationSuccessText{
        color: #4C84F3;
        font-size: 13px;
        font-weight: 600;
        margin-left: 40px;
    }
    #verifyEmailBtn{
        font-weight: 600;
        cursor: pointer;
        padding: 5px 7px;
        border-radius: 5px;
        border: 0.5px solid;
    }
    .check-code-input{
        border: none;
        border-bottom: 1px solid rgba(0,0,0,0.2);
        margin-right: 30px;
        outline:none;
        width: 200px;
        padding: 0px 5px;
    }
</style>

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

<div class="findid-column" id="findId">
    <div class="findid-column-d">

        <div class="findId-title">
            <h2>아이디 찾기</h2>
        </div>
        <div id="inputName">
          <div class="name_column">
            <span style="margin-right: 12px;">이름</span>
              <div>
              <input class="check-name-input" type="text" id="name" name="name" placeholder="이름을 입력해주세요." required>
              </div>
            </div>

            <div class="mb-3">
              <div class="input-group">
                <div>
                  <span>Email </span>
                  <input class="check-mail-input" type="email" id="inputEmail" name="email" placeholder="이메일을 입력해주세요." required>
                  <button type="button" id="checkEmailBtn">인증하기</button>
                  <button style="display: none;" onclick="location.href='/members/useridfind'" type="button" id="recheck-EmailBtn">다시하기</button>
                </div>
              </div>
                <!-- 인증 완료 메시지 -->
                <div style="display: none;" id="verificationSuccessText">
                    <i class="fa-solid fa-check"></i>이메일 인증이 완료되었습니다.
                </div>
            </div>

            <!-- 인증번호 입력 칸 -->
            <div style="display: none;" id="inputVerificationCode">
              <p class="input-group">
                <span>인증번호</span>
                <input type="text" class="check-code-input" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요" />
                <button class="btn btn-outline-success" type="button" id="verifyEmailBtn">확 인</button>
              </p>
            </div>


            <div  id="find-div" style="display: none; border-top: 1px solid rgba(0,0,0,0.3); border-bottom: 1px solid rgba(0,0,0,0.3); margin:10px;">
              <div style="display: flex; justify-content: center; margin: 10px 0px;" id="id_value" ></div>
            </div>
            <div class="id-box-column">
              <div>
                <button disabled type="button" id='find_id' onclick="findId_click()" >ID찾기</button>
              </div>
                <div class="div-cloumn"></div>
              <div>
                <button type="button" onclick="history.go(-1);" id="find-login-button">LOG IN</button>
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

    <script src="/js/members/findid.js"></script>
</body>
</html>
