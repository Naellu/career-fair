<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-05
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <my:font></my:font>
    <title>회원가입</title>

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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
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
</head>
<body>
<my:navBar />
    <div style="">
      <div style="display: flex; justify-content: center;">
        <div>
          <div style="margin: 40px 0px 40px 0px; display: flex; justify-content: center;">
            <h1 style="font-weight: 600;">회원가입</h1>
          </div>
          <form method="post" id="signup-form">
            <input type="text" name="authority" value="user" style="display: none;"> <!--기업은 company로-->
            <div>
            <div class="sign-column">
              <span style="margin-right: 50px;">아이디 *</span>
              <input type="text" class="sign-input" id="input-id" name="id" value="${members.id}" maxlength="20" placeholder="영문 또는 영문 숫자 조합으로 6~20자">
              <input class="check-button" type="button" id="id-Confirm" value="중복확인">
              <div style="margin-left: 120px;" id="idcheck-blank"></div>
            </div>
            </div>
            <div class="sign-column">
              <span style="margin-right: 35px;">비밀번호 * </span>
              <input type="password" class="sign-input" id="input-password" name="password" placeholder="영문,숫자,특수문자 조합하여 8~16자리" maxlength="16">
              <div style="margin-left: 120px;" id="pwdcheck-blank1"></div>
            </div>
            <div class="sign-column">
              <span>비밀번호 확인 * </span>
              <input  type="password" class="sign-input" id="password-check" name="password-check" placeholder="위와 동일하게 입력해주세요">
              <div style="margin-left: 120px;" id="pwdcheck-blank2"></div>
            </div>

            <div class="sign-column">
              <span style="margin-right: 65px;">이 름 * </span>
              <input type="text" class="sign-input" id="input-name" name="name" value="${members.name}" placeholder="한글 또는 영어로 입력해주세요" maxlength="20">
              <div style="margin-left: 120px;" id="namecheck-blank"></div>
            </div>
            <div class="sign-column">
              <span style="margin-right: 70px;">성 별 *</span>
              <input type="radio" id="input-gender-m" name="gender" value="남" placeholder="">
              <label for="input-gender-m">남성</label>
              <input type="radio" id="input-gender-w" name="gender" value="여" placeholder="">
              <label for="input-gender-w">여성</label>
            </div>
            <div class="sign-column">
              <span style="margin-right: 35px;">휴대폰번호 *</span>
              <div>
                  <select id="phoneNum1" class="signphone-input1">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                  </select>
                <span id="first-hyphen">-</span>
                <input type="number" class="signphone-input2" id="phoneNum2" maxlength="4" oninput="maxLengthCheck(this)">
                <span id="second-hyphen">-</span>
                <input type="number" class="signphone-input2" id="phoneNum3" maxlength="4" oninput="maxLengthCheck(this)">
                <input type="hidden" id="totalphone-num" name="phoneNumber" value="${members.phoneNumber}">
                <button class="check-button" type="button" id="checkPhoneNumBtn">중복확인</button>
              </div>
              <div class="d-none form-text text-primary" id="availablePhoneNumMessage">
                <i class="fa-solid fa-check"></i>등록 가능한 핸드폰 번호입니다.
              </div>
              <div class="d-none form-text text-danger" id="notAvailablePhoneNumMessage">
                <i class="fa-solid fa-triangle-exclamation"></i>이미 등록된 핸드폰 번호입니다.
              </div>
            </div>
            <div class="sign-column">
              <span style="margin-right: 20px;">이메일 주소 *</span>
              <input type="text" class="maile-sign-input1"  id="user-email">
                <span id="middle-email">@</span>
              <input type="text" class="maile-sign-input2" id="email_address" list="user-email-address">
              <datalist id="user-email-address">
                <option value="naver.com">naver.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="gmail.com">gmail.com</option>
                <option value="">직접입력</option>
              </datalist>
              <input type="hidden" id="totalemail" name="email" value="${members.email}">
              <input type="button" class="check-button" id="search-email" value="중복확인">
              <input style="display: none;" type="button" class="check-button" id="checkEmailBtn" value="인증하기">
              <div class="d-none form-text text-primary" id="availableEmailMessage">
                <i style="margin-left: 120px;" class="fa-solid fa-check"></i>등록 가능한 이메일 입니다.
              </div>
              <div class="d-none form-text text-danger" id="notAvailableEmailMessage">
                <i style="margin-left: 120px;" class="fa-solid fa-triangle-exclamation"></i>이미 등록된 이메일 입니다.
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

            <!--주소 등록-->
            <div class="sign-column">
              <div>
                <span style="margin-right: 53px;">우편번호</span>
                <input class="sign-input" type="text" id="zipcode" name="zipCode">
                <input class="check-button" type="button" value="우편번호찾기" onclick="kakaoAddress()">
              </div>
              <div style="margin-top: 10px; margin-right: 53px">
                <span style="margin-right: 80px;">주 소</span>
                <input class="sign-input" type="text" name="address" id="address">
              </div>
            </div>


              <div style="margin-bottom: 30px;">
                <div>
                <span>개인정보 수집 및 이용 동의</span>
                </div>
                <div class="sign-agree-check">
                <input type="checkbox" id="agree1" name="isActive" value="1"> [필수] 개인정보수집/이용에 동의
                <a style="color: rgba(0,0,0,0.4); cursor: pointer; margin-left: 8px;" onclick="agree1()">보기</a>
                </div>
              </div>

              <div style="display: flex; justify-content: center;">
                <span id="need-sign" style="color: red;">* 항목은 필수 사항입니다.</span>
              </div>
              <div class="member-sign-column">
                <input disabled  type="submit" id="signup-submit" value="회원가입">
              </div>

          </form>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="/js/members/validity.js"></script>
</body>
</html>

