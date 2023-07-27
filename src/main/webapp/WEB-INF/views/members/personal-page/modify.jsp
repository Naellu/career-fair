<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-11
  Time: 오후 12:23
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

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"--%>
<%--          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="--%>
<%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>

    <title>회원정보 수정</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function kakaoAddress () {
            new daum.Postcode({
                oncomplete: function(data) {
                    $("#zipcode").val(data.zonecode);
                    $("#address").val(data.address);
                }
            }).open();
        }
    </script>

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
            margin-right: 30px;
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
        #totalphone-num{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            margin-right: 30px;
            outline:none;
            width: 200px;
            padding: 0px 5px;
        }
        #totalemail{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            outline:none;
            width: 260px;
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
        #zipcode{
            margin-left: 63px;
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            margin-right: 30px;
            outline:none;
            width: 205px;
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
<my:job-inner-banner>
    회원 정보 수정
</my:job-inner-banner>

<div style="display: flex;justify-content: center;">
<div style="margin: 25px 0px;">
    <div class="row justify-content-center mt-3">
        <div>
            <div style="display: flex; justify-content: center;">
            </div>
            <div style="display: flex; justify-content: center;">
            <div style="font-size: 13px; color: #4C84F3; margin-bottom: 20px;">정보수정은 비밀번호/Email/주소/전화번호만 수정가능합니다.</div>
            </div>
            <form id="modifyForm" action="/members/personal-page/modify" method="post">
                <div style="display: flex; justify-content: center;">
                    <div class="sign-column">
                        <span style="margin-right: 80px;">아이디</span>
                        <input type="text" class="sign-input" id="input-id" name="id" value="${member.id}" maxlength="20" readonly>
                    </div>
                </div>

                <c:if test="${empty members.oauth }">
                <div style="display: flex; justify-content: center;">
                    <div class="sign-column">
                        <span style="margin-right: 35px;">새 비밀번호 * </span>
                        <input type="password" class="sign-input" id="input-password" name="password" placeholder="영문,숫자,특수문자 조합하여 8~16자리" maxlength="16">
                        <div style="margin-left: 120px;" id="pwdcheck-blank1"></div>
                    </div>
                </div>
                <div style="display: flex; justify-content: center;">
                    <div class="sign-column">
                        <span>새 비밀번호 확인 * </span>
                        <input  type="password" class="sign-input" id="password-check" name="password-check" placeholder="위와 동일하게 입력해주세요">
                        <div style="margin-left: 120px;" id="pwdcheck-blank2"></div>
                    </div>
                </div>
                </c:if>

                <div style="display: flex; justify-content: center;">
                <div class="sign-column">
                    <span style="margin-right: 30px;">이메일 주소 *</span>
                    <input id="totalemail" name="email" value="${member.email}">
                    <input type="button" class="check-button" id="search-email" value="중복확인">
                    <input style="display: none;" type="button" class="check-button" id="checkEmailBtn" value="인증하기">
                    <div class="d-none form-text text-primary" id="availableEmailMessage">
                        <i style="margin-left: 120px;" class="fa-solid fa-check"></i>등록 가능한 이메일 입니다.
                    </div>
                    <div class="d-none form-text text-danger" id="notAvailableEmailMessage">
                        <i style="margin-left: 120px;" class="fa-solid fa-triangle-exclamation"></i>이미 등록된 이메일 입니다.
                    </div>
                </div>
                </div>

                <!-- 인증번호 입력 칸 -->
                <div  style="display: none;" id="inputVerificationCode">
                    <div class="input-group">
                        <input type="text" class="form-control" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요" />
                        <button type="button" id="verifyEmailBtn" style="display: none;">확인</button>
                    </div>
                </div>

                <!-- 인증 완료 메시지 -->
                <div style="display: none; font-size: 15px; color: #4C84F3" id="verificationSuccessText">
                    <i class="fa-solid fa-check"></i>이메일 인증이 완료되었습니다.
                </div>


                <div style="margin: 10px 0px;">
                    <div style="display: flex; justify-content: center;">
                    <div style="display: flex; align-items: center">
                        <span>우편번호</span>
                        <input class="sign-input" type="text" id="zipcode" name="zipCode" value="${member.zipCode}">
                        <input class="check-button" type="button" value="우편번호찾기" onclick="kakaoAddress()">
                    </div>
                    </div>
                    <div style="display: flex; justify-content: center;">
                    <div style="margin-top: 10px;">
                        <span style="margin-right: 80px;">주 소</span>
                        <input class="sign-input" type="text" name="address" id="address" value="${member.address}">
                        <div class="form-text" style="margin-left: 110px;">변경하지 않을 시 기존의 주소로 설정됩니다.</div>
                    </div>
                    </div>
                </div>

                <div class="sign-column" style="margin-left: 5px;">
                    <span style="margin-right: 35px;">휴대폰번호 *</span>
                    <div>
                        <input type="text" maxlength="13" id="totalphone-num" name="phoneNumber" value="${member.phoneNumber}">
                        <button class="check-button" type="button" id="checkPhoneNumBtn">중복확인</button>
                    </div>
                    <div class="d-none form-text text-primary" id="availablePhoneNumMessage">
                        <i class="fa-solid fa-check"></i>등록 가능한 핸드폰 번호입니다.
                    </div>
                    <div class="d-none form-text text-danger" id="notAvailablePhoneNumMessage">
                        <i class="fa-solid fa-triangle-exclamation"></i>이미 등록된 핸드폰 번호입니다.
                    </div>
                </div>
                <div style="display: flex;justify-content: flex-end;">
                <button disabled id="modify-Button" type="button" data-toggle="modal" data-target="#confirmModal" class="btn btn-primary">수정</button>
                </div>
            </form>

        </div>
    </div>
</div>
</div>
<div class="modal fade" id="confirmModal" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="inputOldPassword" class="form-label">이전 암호</label>
                <input form="modifyForm" id="inputOldPassword" class="form-control" type="password" name="oldPassword" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="submit" form="modifyForm" class="btn btn-primary">확인</button>
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

<script src="/js/members/userModifyValidity.js"></script>
</body>
</html>