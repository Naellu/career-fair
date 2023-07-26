<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-17
  Time: 오후 12:15
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

    <title>Title</title>

    <style>
        body{
            top: 0;
            bottom: 0;
        }
        .sign-column{
            margin: 0px 0px 15px 0px;
        }
        .sign-input{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            margin-right: 10px;
            outline:none;
            width: 300px;
            padding: 0px 5px;
        }
        .check-button{
            padding: 5px;
            border: none;
            background-color: #CDCDCD;
            border-radius: 5px;
            justify-content: center;
            align-items: center;
            color: white;
            transition: background-color 0.1s ease-in;
        }
        .check-button:hover {
            background-color: #9B9B9B;
        }
        .signphone-input1{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            margin-right: 30px;
            outline:none;
            width: 80px;
            padding: 0px 5px;
        }
        .signphone-input2{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            margin-right: 30px;
            outline:none;
            width: 150px;
            padding: 0px 5px;
        }
        .maile-sign-input1{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            outline:none;
            width: 170px;
            padding: 0px 5px;
        }
        .maile-sign-input2{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            outline:none;
            width: 150px;
            padding: 0px 5px;
            margin-right: 30px;
        }
        .sign-agree-check{
            display: flex;
            align-items: center;
        }

        .member-sign-column{
            display: flex;
            justify-content: center;
        }
        #signup-submit{
            padding: 5px;
            border: none;
            background-color: #9B9B9B;
            border-radius: 5px;
            justify-content: center;
            align-items: center;
            color: white;
            margin-top: 5px;
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

    <div style="margin: 70px 30px;">
      <div style="display: flex; justify-content: center;">
        <div style="border: 0.5px solid rgba(0,0,0,0.2); padding: 40px; border-radius: 8px;">
          <div style="margin: 10px 0px 40px 0px; display: flex; justify-content: center;">
            <h3 style="font-weight: 600;">임시 비밀번호 발급</h3>
          </div>
          <div id="inputName">
            <div class="sign-column">
              <div>
                <label style="margin-bottom: 10px;">아이디</label>
              </div>
              <div>
                <input class="sign-input" type="text" id="member-id" name="id" placeholder="아이디를 입력해주세요." required>
              </div>
            </div>

            <div class="mb-3">
                <label style="margin-bottom: 10px;">Email</label>
                <div class="" id="EmailBtn">
                    <input class="sign-input" type="email" id="inputEmail" name="email" placeholder="이메일을 입력해주세요." required>
                    <button class="check-button" type="button" id="checkEmailBtn">인증하기</button>
                </div>
            </div>


            <!-- 인증번호 입력 칸 -->
            <div style="display: none;" id="inputVerificationCode">
                <p class="">
                    <input type="text" class="sign-input" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력해주세요." />
                    <button class="check-button" type="button" id="verifyEmailBtn" style="display: none;">확인</button>
                </p>
            </div>

            <!-- 인증 완료 메시지 -->
            <div style="display: none;" id="verificationSuccessText">
                <i class="fa-solid fa-check"></i>이메일 인증이 완료되었습니다.
            </div>

            <div style="display: flex; justify-content: center;margin-top: 20px;">
                <div style="margin-right: 40px;">
                  <button disabled type="button" id='checkBtn' onclick="checkPwClick()" class="check-button">임시비밀번호 발급</button>
                </div>
                <div>
                  <button type="button" onclick="history.go(-1);" class="check-button">LOG IN</button>
                </div>
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

<script src="/js/members/sendPw.js"></script>
</body>
</html>
