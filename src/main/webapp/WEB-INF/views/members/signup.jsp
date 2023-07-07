<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-05
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
    <div style="">
      <div style="display: flex; justify-content: center;">
        <div>
          <div><h1>회원가입</h1></div>
          <form method="post" id="signup-form">
            <input type="text" name="member_type" value="user" style="display: none;"> <!--기업은 company로-->
            <div>아이디
              <input type="text" id="input-id" name="member_id" value="${members.member_id}" maxlength="20" placeholder="영문 또는 영문 숫자 조합으로 8~20자">
            </div>
            <div id="idcheck_blank"></div>
            <div>
              <input type="button" id="id_Confirm" value="중복확인">
            </div>
            <div>비밀번호
              <input type="password" id="input-password" name="password" placeholder="영문,숫자,특수문자 조합하여 8~16자리" maxlength="16">
            </div>
            <div id="pwdcheck-blank1"></div>
            <div>비밀번호 확인
              <input type="password" id="password-check" name="password-check" placeholder="위와 동일하게 입력해주세요">
            </div>
            <div id="pwdcheck-blank2"></div>
            <div>이름
              <input type="text" id="input-name" name="name" value="${members.name}" placeholder="한글 또는 영어로 입력해주세요" maxlength="20">
            </div>
            <div id="namecheck-blank"></div>
            <div>성별
              <input type="radio" id="input-gender-m" name="gender" value="남" placeholder="">
              <label for="input-gender-m">남성</label>
              <input type="radio" id="input-gender-w" name="gender" value="여" placeholder="">
              <label for="input-gender-w">여성</label>
            </div>
            <div>휴대폰번호
                <input type="text" id="input-phone" name="phone_number" value="${members.phone_number}" placeholder="">
            </div>
            <div>이메일 주소
              <input type="text" id="user-email">
                <span id="middle-email">@</span>
              <input type="text" id="email_address" list="user-email-address">
              <datalist id="user-email-address">
                <option value="naver.com">naver.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="google.com">google.com</option>
                <option value="">직접입력</option>
              </datalist>
              <input type="hidden" id="totalemail" name="email" value="${members.email}">
                <button>인증번호 발송</button>
            </div>

              <!-- 인증번호 입력 칸 -->
              <div class="mb-3 d-none" id="inputVerificationCode">
                <div class="input-group">
                  <input type="text" class="form-control" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요" />
                    <button class="btn btn-outline-success" type="button" id="verifyEmailBtn" style="display: none;">확인</button>
                </div>
              </div>

              <!-- 인증 완료 메시지 -->
                <div class="d-none form-text text-primary" id="verificationSuccessText">
                  <i class="fa-solid fa-check"></i>이메일 인증이 완료되었습니다.
                </div>

              <div>
                <div>
                <span>개인정보 수집 및 이용 동의</span>
                  <div>
                    <span>개인정보 수집목적, 이용기간, 수집항목 , 파기등등</span>
                  </div>
                </div>
                <input type="radio" id="signup-select-a" name="is_active" value="0">
                <label for="signup-select-a">동의합니다</label>

                <input type="radio" id="signup-select-d" name="is_active" value="1">
                <label for="signup-select-a">동의하지 않습니다</label>
              </div>

              <div>
                <input type="submit" id="signup-submit" value="회원가입">
              </div>

          </form>
        </div>
      </div>
    </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="/js/members/validity.js"></script>
    <script>

      //이메일 주소 합치기
      $("#user-email").blur(function (){
          email();
      });

      $("#email_address").change(function (){
          email();
      });

      function email() {
        const email = $("#user-email").val();
        const middle = $("#middle-email").text();
        const address = $("#email_address").val();
        if(email != "" && address != "") {
              $("#totalemail").val(email+middle+address);
        }
      };
  </script>
</body>
</html>
