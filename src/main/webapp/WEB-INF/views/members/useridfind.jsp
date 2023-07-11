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
</head>
<body>
<div class="w3-content w3-container w3-margin-top" id="findId">
    <div class="w3-container w3-card-4">

        <div class="w3-center w3-large w3-margin-top">
            <h3>아이디 찾기</h3>
        </div>
        <div id="inputName">
            <div>
                <label>이름</label>
            </div>
            <div>
                <input class="form-control" type="text" id="name" name="name" placeholder="이름을 입력해주세요!" required>
            </div>


            <div class="mb-3">
                <div class="input-group">
                    <div>
                        <label>Email</label> <input class="form-control" type="email" id="inputEmail" name="email" placeholder="이메일을 입력해주세요!" required>
                        <button class="btn btn-outline-success" type="button" id="checkEmailBtn">인증하기</button>
                    </div>
                </div>
            </div>

            <!-- 인증번호 입력 칸 -->
            <div class="d-none" id="inputVerificationCode">
                <p class="input-group">
                    <input type="text" class="form-control" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요" />
                    <button class="btn btn-outline-success" type="button" id="verifyEmailBtn" style="display: none;">확인</button>
                </p>
            </div>

            <!-- 인증 완료 메시지 -->
            <div class="d-none form-text text-primary" id="verificationSuccessText">
                <i class="fa-solid fa-check"></i>이메일 인증이 완료되었습니다.
            </div>

            <div class="w3-center">
                <button disabled type="button" id='find_id' onclick="findId_click()" class="btn btn-outline-success">find</button>
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
