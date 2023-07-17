<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-11
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body"></div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

<div class="container-lg">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <div class="d-flex">
                <div class="me-auto">
                    <div class="d-none">
                        <h1>
                            <span id="questionIdText"> ${question.id}</span>
                        </h1>
                    </div>
                    <br>
                    <br>

                    <div class="d-flex justify-content-between">
                        <h3 id="titleInput">${question.title}</h3>
                        <p id="insertedInput">작성일 : ${question.created}</p>
                    </div>

                    <hr class="long-hr">

                    <div class="mb-3">
                        <label for="content" class="form-label">내용</label>
                        <textarea id="content" class="form-control" cols="90" rows="10" readonly>${question.content}</textarea>
                    </div>
                    <a class="btn btn-secondary" href="/qna/modify/${question.id }">수정</a>
                    <button type="button" class="btn btn-danger" form="removeForm" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">삭제</button>

                    <!-- 삭제 -->
                    <div class="d-none">
                        <form action="/qna/remove" method="post" id="removeForm">
                            <input type="text" name="id" value="${question.id }" />
                        </form>
                    </div>

                    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">삭제 하시겠습니까?</div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="submit" class="btn btn-danger" form="removeForm">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="answerContainer">
                        <div class="mb-3" id="addAnswerContainer">
                            <div class="input-group">
                                <div class="form-floating">
                                    <textarea style="height: 97px" placeholder="답변을 남겨주세요" class="form-control" id="answerTextArea"></textarea>
                                    <label for="answerTextArea">답변을 남겨주세요</label>
                                </div>
                                <button class="btn btn-outline-primary" id="sendAnswerBtn"><i class="fa-regular fa-paper-plane"></i></button>
                            </div>
                        </div>

                        <ul class="list-group" id="answerListContainer">

                        </ul>
                    </div>

                </div>
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

<script src="/js/qna/answer.js"></script>



</body>
</html>