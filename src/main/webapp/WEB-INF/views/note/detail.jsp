<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${noteInfoInfo.title}</title>
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
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <h5 class="mb-3">${noteInfo.title}</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <label for="staticSender" class="form-label">보낸 사람</label>
                <input type="text" readonly class="form-control-plaintext" id="staticSender" value="${noteInfo.senderId}">
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label for="staticCreated" class="form-label">보낸 시간</label>
                <input type="text" readonly class="form-control-plaintext" id="staticCreated" value="${fn:replace(noteInfo.created, 'T', ' ')}">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-10">
            <div class="form-group">
                <textarea readonly class="form-control" id="staticContent" rows="5">${noteInfo.content}</textarea>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-10">
            <div class="text-right">
                <c:url value="/note/write" var="writeNoteURL">
                    <c:param name="senderId" value="${noteInfo.recipientId}"/>
                    <c:param name="recipientId" value="${noteInfo.senderId}" />
                </c:url>
                <button type="button" class="btn btn-outline-primary" onclick="writeNote('${writeNoteURL}')" >답장하기</button>
                <button type="button" class="btn btn-outline-secondary" onclick="window.close()">닫기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="/js/Note/list.js"></script>

</body>
</html>
