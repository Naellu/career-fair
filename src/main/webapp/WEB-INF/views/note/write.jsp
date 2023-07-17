<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 쓰기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        body {
            padding: 20px;
        }
    </style>

</head>
<body onload="checkRecipientId()">
<my:font/>
<div class="container">
    <form action="/note/write" method="post">
        <div class="row">
            <div class="col-sm-12">
                <label for="recipientId" class="form-label">받는사람</label>
                <input type="text" class="form-control" name = "recipientId" id="recipientId" value="${note.recipientId}">
                <div id="checkRecipient" class="form-text d-none text-primary"><i class="fa-solid fa-check"></i> 발송가능한 ID입니다.</div>
                <div id="denyRecipient" class="form-text d-none text-warning"><i class="fa-solid fa-triangle-exclamation"></i> 존재하지않는 ID입니다.</div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" name = "title" id="title" value="${note.title}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label for="content" class="form-label">쪽지 내용</label>
                    <textarea class="form-control" name="content" id="content" rows="5">${note.content}</textarea>
                </div>
            </div>

            <input type="hidden" name="senderId" value="${note.senderId}">
        </div>
        <div class="row">
            <div class="col-sm-12 text-right">
                <button type="submit" id="sendBtn" class="btn btn-outline-primary">전송</button>
                <button type="button" class="btn btn-outline-secondary" onclick="window.close()">닫기</button>
            </div>
        </div>
    </form>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="/js/note/write.js"></script>

</body>
</html>
