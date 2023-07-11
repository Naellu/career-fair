<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-10
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>ID 찾기</title>
<style>
    body{
        top: 0;
        bottom: 0;
        padding: 60px;
    }
    .findid-column{
        display: flex;
        justify-content: center;
    }
    .findid-column-d{
        border:1px solid rgba(0,0,0,0.2);
        padding: 20px;
    }
    .findId-title{
        display: flex;
        justify-content: center;
    }
    .name_column{
        display: flex;
    }
    #checkEmailBtn{
        justify-content: center;
        align-items: center;
        background-color: #9c9c9c;
        padding: 5px;
        border: none;
        border-radius: 5px;
        color: black;
        font-width: 600;
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
</style>
</head>
<body>
<div class="findid-column" id="findId">
    <div class="findid-column-d">

        <div class="findId-title">
            <h2>아이디 찾기</h2>
        </div>
        <div id="inputName">
          <div class="name_column">
            <span style="margin-right: 12px;">이름</span>
            <div>
                <input class="check-name-input" type="text" id="name" name="name" placeholder="이름을 입력해주세요!" required>
            </div>
            </div>

            <div class="mb-3">
              <div class="input-group">
                <div>
                  <span>Email </span>
                  <input class="check-mail-input" type="email" id="inputEmail" name="email" placeholder="이메일을 입력해주세요!" required>
                  <button type="button" id="checkEmailBtn">인증하기</button>
                  <button style="display: none;" onclick="location.href='/members/useridfind'" type="button" id="recheck-EmailBtn">다시하기</button>
                </div>
              </div>
            </div>

            <!-- 인증번호 입력 칸 -->
            <div style="display: none;" id="inputVerificationCode">
              <p class="input-group">
                <input type="text" class="form-control" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요" />
                <button class="btn btn-outline-success" type="button" id="verifyEmailBtn">확인</button>
              </p>
            </div>

            <!-- 인증 완료 메시지 -->
            <div style="display: none;" id="verificationSuccessText">
              <i class="fa-solid fa-check"></i>이메일 인증이 완료되었습니다.
            </div>
            <div  id="find-div" style="display: none; border-top: 1px solid rgba(0,0,0,0.3); border-bottom: 1px solid rgba(0,0,0,0.3); margin:10px;">
              <div style="display: flex; justify-content: center;" id="id_value" style="margin: 5px 0px;"></div>
            </div>
            <div class="w3-center">
              <button disabled type="button" id='find_id' onclick="findId_click()" class="btn btn-outline-success">ID찾기</button>
              <button type="button" onclick="history.go(-1);" class="btn btn-outline-secondary">LOG IN</button>
            </div>
        </div>

    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="/js/members/findid.js"></script>
</body>
</html>
