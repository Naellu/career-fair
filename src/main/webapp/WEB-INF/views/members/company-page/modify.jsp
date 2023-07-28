<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-13
  Time: 오후 3:03
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


    <title>회원 정보 수정</title>

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
        #modifyForm{
            display: flex;
            flex-direction: column;
        }
        .sign-column{
            margin: 0px 0px 15px 0px;
        }
        .sign-input{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            margin-right: 30px;
            outline:none;
            width: 95%;
            padding: 0px 5px;
            transition: border-color 0.2s ease-in-out;
        }
        .sign-input:focus{
            border-color: #fee102;
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
            cursor: pointer;
        }
        .check-button:hover {
            background-color: #9B9B9B;
        }
        #totalphone-num{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            margin-right: 30px;
            outline:none;
            width: 84.7%;
            padding: 0px 5px;
            transition: border-color 0.2s ease-in-out;
        }
        #totalphone-num:focus{
            border-color: #fee102;
        }
        #totalemail{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            outline:none;
            width: 86%;
            padding: 0px 5px;
            margin-right: 20px;
            transition: border-color 0.2s ease-in-out;
        }
        #totalemail:focus{
            border-color: #fee102;
        }
        #zipcode{
            border: none;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            margin-right: 20px;
            outline:none;
            width: 30%;
            padding: 0px 5px;
            transition: border-color 0.2s ease-in-out;
        }
        #zipcode:focus {
            border-color: #fee102;
        }
        #verifyEmailBtn{
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 7px;
            background-color: rgba(0,0,0,0.2);
            border-radius: 5px;
            border: none;
            color: whitesmoke;
            transition: background-color 0.1s ease-in;
            cursor: pointer;
        }
        #verifyEmailBtn:hover {
            background-color: #9B9B9B;
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

<div>
    <div style="margin: 40px 0px 40px 0px; display: flex;justify-content: center;">
        <div style="border: 1px solid rgba(0,0,0,0.3); border-radius: 7px; margin-top: 30px; background-color: #fafafa; padding: 0px 30px;">
            <div style="display: flex; justify-content: center;">
            <div style="font-size: 13px; color: #4C84F3; margin: 40px 140px;">정보수정은 비밀번호 / Email / 주소 / 전화번호만 수정가능합니다.</div>
            </div>
            <form id="modifyForm" action="/members/company-page/modify" method="post">
                    <div class="sign-column">
                        <div>
                        <span style="margin-right: 70px;">아이디</span>
                        </div>
                        <input type="text" class="sign-input" id="input-id" name="id" value="${member.id}" maxlength="20" readonly>
                    </div>

                <c:if test="${empty members.oauth }">
                    <div class="sign-column">
                        <div>
                        <span style="margin-right: 35px;">새 비밀번호 * </span>
                        </div>
                        <input type="password" class="sign-input" id="input-password" name="password" placeholder="영문,숫자,특수문자 조합하여 8~16자리" maxlength="16">
                        <div id="pwdcheck-blank1"></div>
                    </div>
                    <div class="sign-column">
                        <div>
                        <span style="margin-right: 10px;">새 비밀번호 확인 * </span>
                        </div>
                        <input  type="password" class="sign-input" id="password-check" name="password-check" placeholder="위와 동일하게 입력해주세요">
                        <div id="pwdcheck-blank2"></div>
                    </div>
                </c:if>

                <div class="sign-column">
                    <div>
                    <span style="margin-right: 40px;">이메일 주소 *</span>
                    </div>
                    <input id="totalemail" class="sign-input" name="email" value="${member.email}" type="email">
                    <input type="button" class="check-button" id="search-email" value="중복확인">
                    <input style="display: none;" type="button" class="check-button" id="checkEmailBtn" value="인증하기">
                </div>
                    <div style="font-size: 13px;" >
                    <div class="d-none form-text text-primary" id="availableEmailMessage">
                        <i class="fa-solid fa-check" ><span>등록 가능한 이메일 입니다.</span></i>
                    </div>
                    </div>
                    <div style="font-size: 13px;">
                    <div class="d-none form-text text-danger" id="notAvailableEmailMessage" >
                        <i class="fa-solid fa-triangle-exclamation" style="font-size: 14px;"><span>이미 등록된 이메일 입니다.</span></i>
                    </div>
                    </div>


                <!-- 인증번호 입력 칸 -->
                <div  style="display: none;" id="inputVerificationCode">
                    <div class="input-group">
                        <input type="text" class="form-control" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요" />
                        <button type="button" id="verifyEmailBtn">확인</button>
                    </div>
                </div>

                <!-- 인증 완료 메시지 -->
                <div style="display: none; font-size: 15px; color: #4C84F3" id="verificationSuccessText">
                    <i class="fa-solid fa-check"></i>이메일 인증이 완료되었습니다.
                </div>

                <div class="sign-column">
                    <div>
                        <span style="margin-right: 15px;">우편번호</span>
                    </div>
                        <input class="sign-input" type="text" id="zipcode" name="zipCode" value="${member.zipCode}" readonly style="background-color: white;">
                        <input class="check-button" type="button" value="우편번호찾기" onclick="kakaoAddress()">

                    <div style="margin-top: 10px;">
                        <span>주 소</span>
                        </div>
                        <input class="sign-input" type="text" name="address" id="address" value="${member.address}" readonly style="background-color: white;">
                        <div class="form-text">변경하지 않을 시 기존의 주소로 설정됩니다.</div>
                </div>

                <div class="sign-column">
                    <span style="margin-right: 40px;">휴대폰번호 *</span>
                    <div>
                        <div class="form-text">'-' 제외하고 입력</div>
                        <input type="text" class="sign-input" id="totalphone-num" value="${member.phoneNumber}">
                        <input type="hidden" class="sign-input" id="phone-num" name="phoneNumber" value="${member.phoneNumber}">
                        <button disabled class="check-button" type="button" style="outline: none;" id="checkPhoneNumBtn">중복확인</button>
                    </div>
                    <div class="d-none form-text text-primary" id="availablePhoneNumMessage">
                        <i class="fa-solid fa-check"></i>등록 가능한 핸드폰 번호입니다.
                    </div>
                    <div class="d-none form-text text-danger" id="notAvailablePhoneNumMessage">
                        <i class="fa-solid fa-triangle-exclamation"></i>이미 등록된 핸드폰 번호입니다.
                    </div>
                </div>
                <div style="display: flex; justify-content: flex-end;">
                <button id="modify-Button" type="button" data-toggle="modal" data-target="#confirmModal" class="btn btn-primary">수정</button>
                <div>
                  <button type="button" onclick="history.go(-1);" style="margin-left: 40px;" class="btn btn-secondary">취소</button>
                </div>
                </div>
            </form>

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
                <button type="submit" form="modifyForm" class="btn btn-primary">확인</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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
