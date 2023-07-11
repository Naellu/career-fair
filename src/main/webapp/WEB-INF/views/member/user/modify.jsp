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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <my:font></my:font>
    <title>Title</title>

</head>
<body>
<my:navBar/>
<div class="container-lg">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <h1>회원 정보 수정</h1>

            <form id="modifyForm" action="/member/modify" method="post">
                <div class="mb-3">
                    <label class="form-label" for="inputId"> 아이디 </label>
                    <input id="inputId" class="form-control" type="text" name="id" value="${member.id }" readonly />
                </div>

                <c:if test="${empty members.oauth }">
                    <div class="mb-3">
                        <label class="form-label" for="inputPassword"> New Password </label>
                        <input id="inputPassword" class="form-control" type="text" name="password" value="" />
                        <div class="form-text">변경하지 않을 시 기존의 패스워드로 설정됩니다.</div>
                    </div>
                </c:if>

                <div class="mb-3">
                    <label class="form-label" for="inputEmail"> 이메일 </label>
                    <input id="inputEmail" class="form-control" type="email" name="email" value="${member.email }" />
                </div>

                <div class="mb-3">
                    <label for="inputAddress" class="form-label">주소</label>
                    <div class="col-sm-6 mb-1">
                        <div class="input-group">
                            <input type="text" id="postCode" class="form-control input-sm" placeholder="우편번호" readonly>
                            <button class="btn btn-outline-secondary" type="button" id="searchAddress">주소검색</button>
                        </div>
                    </div>
                    <input id="inputAddress" type="text" class="form-control mb-1" readonly placeholder="도로명 주소" />
                    <input id="detailAddress" type="text" class="form-control mb-1" placeholder="상세주소" />
                    <div class="form-text">변경하지 않을 시 기존의 주소로 설정됩니다.</div>
                    <input type="hidden" class="form-control" id="address" name="address" value="${member.address}" />
                </div>

                <div class="mb-3">
                    <label class="form-label" for="inputEmail"> 번호수정 </label>
                    <div class="form-text">'-' 제외하고 입력</div>
                    <input id="inputPhoneNumber" type="text" class="form-control" value="${member.phoneNumber}" />
                    <input id="phoneNumber" name="phoneNumber" type="hidden" value="${member.phoneNumber}" />

                    <div id="phoneNumSuccessText" class="d-none form-text text-primary">
                        <i class="fa-solid fa-check"></i>
                        확인되었습니다.
                    </div>

                    <div id="phoneNumFailText" class="d-none form-text text-danger">
                        <i class="fa-solid fa-triangle-exclamation"></i>
                        전화번호를 확인해주세요.
                    </div>
                </div>

                <button id="modifyButton" type="button" data-bs-toggle="modal" data-bs-target="#confirmModal" class="btn btn-primary">수정</button>
            </form>

        </div>
    </div>
</div>

<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="inputOldPassword" class="form-label">이전 암호</label>
                <input form="modifyForm" id="inputOldPassword" class="form-control" type="text" name="oldPassword" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" form="modifyForm" class="btn btn-primary">확인</button>
            </div>
        </div>
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